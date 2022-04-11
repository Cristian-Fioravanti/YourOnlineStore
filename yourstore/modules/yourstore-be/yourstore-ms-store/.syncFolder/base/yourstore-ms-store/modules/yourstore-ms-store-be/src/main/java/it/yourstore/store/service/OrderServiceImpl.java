package it.yourstore.store.service;

import java.util.List;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import it.yourstore.store.domain.Order;

import it.yourstore.store.domain.User;

import it.yourstore.store.repository.OrderRepository;
import lombok.RequiredArgsConstructor;

import java.util.stream.Collectors;

import it.yourstore.store.domain.OrderItem;
import it.micegroup.voila2runtime.entity.GenericEntity;

@RequiredArgsConstructor
@Service
@Transactional
public class OrderServiceImpl extends BaseServiceImpl implements OrderService {

	private final OrderRepository orderRepository;

	// CHILD SERVICES
	private final OrderItemService orderItemService;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(OrderServiceImpl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll(org.
	 * springframework.data.domain.Pageable)
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<Order> findAll(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll()
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Optional<Order> findByObjectKey(String objectKey) {
		Order order = new Order(objectKey);
		return orderRepository.findByOrderId(order.getOrderId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#exists(java.lang.
	 * Object)
	 */
	@Override
	public boolean exists(Integer id) {
		return orderRepository.existsById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#insert(java.
	 * lang.Object)
	 */
	@Override
	@Transactional
	public Order insert(@Valid Order entity) {
		return orderRepository.save(entity);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#update(java.
	 * lang.Object)
	 */
	@Override
	public Order update(@Valid Order entity) {
		return orderRepository.save(entity);
	}

	@Override
	@Transactional
	public Optional<Order> delete(String objectKey) {
		return findByObjectKey(objectKey).map(order -> {
			orderRepository.delete(order);
			return Optional.of(order);
		}).orElseGet(Optional::empty);
	}

	@Override
	public Page<Order> search(Specification<Order> specification, Pageable pageable) {
		return orderRepository.findAll(specification, pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#deleteById(java.lang.
	 * Object)
	 */
	@Override
	public void deleteById(Integer id) {
		orderRepository.deleteById(id);
	}

	@Override
	@Transactional()
	public Order bulkUpdate(Order order) {
		if (order.getTheOrderItem() != null) {
			List<OrderItem> updateTheOrderItem = order.getTheOrderItem().stream()
					.filter(child -> !child.isDeletedEntityState()).collect(Collectors.toList());
			List<OrderItem> deleteTheOrderItem = order.getTheOrderItem().stream()
					.filter(GenericEntity::isDeletedEntityState).collect(Collectors.toList());
			order.setTheOrderItem(updateTheOrderItem);
			deleteTheOrderItem.forEach(child -> orderItemService.deleteById(child.getOrderItemKey()));
		}
		Order update = this.update(order);
		return update;
	}

	@Override
	public Page<Order> findByTheUser(User parentEntity, Pageable pageable) {
		return orderRepository.findByTheUser(parentEntity, pageable);
	}

}
