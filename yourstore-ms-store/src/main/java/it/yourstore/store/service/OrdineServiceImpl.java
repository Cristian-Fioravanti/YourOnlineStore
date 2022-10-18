package it.yourstore.store.service;

import java.time.LocalDate;
import java.util.List;

import java.util.Optional;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import org.springframework.stereotype.Service;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;

import it.yourstore.store.domain.Ordine;
import it.yourstore.store.domain.Product;
import it.yourstore.store.domain.Utente;
import it.yourstore.store.exception.DisponibilityException;
import it.yourstore.store.jmsClient.ToDatabaseJMSProducer;
import it.yourstore.store.repository.OrdineRepository;

import lombok.RequiredArgsConstructor;

import java.util.stream.Collectors;

import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.GenericEntity;

@RequiredArgsConstructor
@Service
public class OrdineServiceImpl implements OrdineService {

	private final OrdineRepository ordineRepository;
	// CHILD SERVICES
	private final OrderItemService orderItemService;
	@Autowired
	private ToDatabaseJMSProducer producer;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(OrdineServiceImpl.class);

	@Override
	public Page<Ordine> findAll(Pageable pageable) {
		return ordineRepository.findAll(pageable);
	}

	@Override
	public List<Ordine> findAll() {
		return ordineRepository.findAll();
	}

	@Override
	public Optional<Ordine> findByObjectKey(String objectKey) {
		Ordine ordine = new Ordine(objectKey);
		return ordineRepository.findByOrdineId(ordine.getOrdineId());
	}

	@Override
	public boolean exists(Integer id) {
		return ordineRepository.existsById(id);
	}

	@Override
	public Ordine insert(@Valid Ordine entity) {
		return ordineRepository.save(entity);
	}

	@Override
	public Ordine update(@Valid Ordine entity) {
		return ordineRepository.save(entity);
	}

	@Override
	public Optional<Ordine> delete(String objectKey) {
		return findByObjectKey(objectKey).map(ordine -> {
			ordineRepository.delete(ordine);
			return Optional.of(ordine);
		}).orElseGet(Optional::empty);
	}

	@Override
	public Page<Ordine> search(Specification<Ordine> specification, Pageable pageable) {
		return ordineRepository.findAll(specification, pageable);
	}

	@Override
	public void deleteById(Integer id) {
		ordineRepository.deleteById(id);
	}

	@Override
	public Ordine bulkUpdate(Ordine ordine) {
		if (ordine.getTheOrderItem() != null) {
			List<OrderItem> updateTheOrderItem = ordine.getTheOrderItem().stream()
					.filter(child -> !child.isDeletedEntityState()).collect(Collectors.toList());
			List<OrderItem> deleteTheOrderItem = ordine.getTheOrderItem().stream()
					.filter(GenericEntity::isDeletedEntityState).collect(Collectors.toList());
			ordine.setTheOrderItem(updateTheOrderItem);
			deleteTheOrderItem.forEach(child -> orderItemService.deleteById(child.getTheOrderItemKey()));
		}
		Ordine update = this.update(ordine);
		return update;
	}

	@Override
	public Page<Ordine> findByTheUtente(Utente parentEntity, Pageable pageable) {
		return ordineRepository.findByTheUtente(parentEntity, pageable);
	}

	public Ordine buy(Ordine entity) {
		entity.setDate(LocalDate.now());
		Ordine update = this.bulkUpdate(entity);
		List<OrderItem> orderItems = orderItemService.findTheOrderItemListByTheOrdine(entity);
		for(OrderItem oi : orderItems) {
			producer.sendPurchasedProductNotification(oi.getProductId(), oi.getAmount());
		}
		return update;
	}

	@Override
	public void checkDisponibility(Ordine entity) {
		List<OrderItem> orderItems = orderItemService.findTheOrderItemListByTheOrdine(entity);
		for(OrderItem oi : orderItems) {
			try {
				producer.sendCheckProductAvailabilityRequest(oi.getProductId(), oi.getAmount());
			} catch(Exception e) {
				throw new DisponibilityException(oi.getTheProductObjectKey(), oi.getAmount().toString());
			}
		}
	}
	
	@Override
	public void updateOrdineCost(OrderItem entity) {
		Ordine ordine = entity.getTheOrdine();
		Product product = entity.getTheProduct();
		Integer amount = entity.getAmount();
		Float oldCost = ordine.getTotalCost();
		try(CloseableHttpClient closeableHttpclient = HttpClients.createDefault()) { 
	        HttpGet httpGet = new HttpGet("http://localhost:8080/database/product/" + product.getProductId());
	        CloseableHttpResponse httpResponse = closeableHttpclient.execute(httpGet);
	        if (httpResponse.getStatusLine().getStatusCode() == 200) {
	        	JSONObject result = new JSONObject(EntityUtils.toString(httpResponse.getEntity()));
	        	Float cost = result.getFloat("cost");
	        	Float tmpCost = cost*amount;
	        	ordine.setTotalCost(oldCost + tmpCost);
	        	update(ordine);
	        } else {
	            return;
	        }
		} catch (Exception e) {
		}
	}

}
