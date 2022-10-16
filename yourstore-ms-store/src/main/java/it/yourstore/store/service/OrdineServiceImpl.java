package it.yourstore.store.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import org.springframework.stereotype.Service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import it.yourstore.store.domain.Ordine;

import it.yourstore.store.domain.Utente;
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll(org.
	 * springframework.data.domain.Pageable)
	 */
	@Override
	public Page<Ordine> findAll(Pageable pageable) {
		return ordineRepository.findAll(pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll()
	 */
	@Override
	public List<Ordine> findAll() {
		return ordineRepository.findAll();
	}

	@Override
	public Optional<Ordine> findByObjectKey(String objectKey) {
		Ordine ordine = new Ordine(objectKey);
		return ordineRepository.findByOrdineId(ordine.getOrdineId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#exists(java.lang.
	 * Object)
	 */
	@Override
	public boolean exists(Integer id) {
		return ordineRepository.existsById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#insert(java.
	 * lang.Object)
	 */
	@Override
	public Ordine insert(@Valid Ordine entity) {
		return ordineRepository.save(entity);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#update(java.
	 * lang.Object)
	 */
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * it.yourstore.store.service.GenericEntityService#deleteById(java.lang.
	 * Object)
	 */
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
		Ordine update = this.bulkUpdate(entity);
		List<OrderItem> orderItems = orderItemService.findTheOrderItemListByTheOrdine(entity);
		for(OrderItem oi : orderItems) {
		//	producer.sendPurchasedProductNotification(oi.getProductId(), oi.getAmount());
		}
		return update;
	}

}
