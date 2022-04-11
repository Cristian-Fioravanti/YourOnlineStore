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

import it.yourstore.store.domain.OrderItem;

import it.yourstore.store.domain.OrderItemKey;

import it.yourstore.store.domain.Order;
import it.yourstore.store.domain.Product;

import it.yourstore.store.repository.OrderItemRepository;

import org.springframework.data.domain.PageImpl;
import lombok.RequiredArgsConstructor;

import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Transactional
public class OrderItemServiceImpl extends BaseServiceImpl implements OrderItemService {

	private final OrderItemRepository orderItemRepository;

	// CHILD SERVICES

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(OrderItemServiceImpl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll(org.
	 * springframework.data.domain.Pageable)
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<OrderItem> findAll(Pageable pageable) {
		return orderItemRepository.findAll(pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll()
	 */
	@Override
	@Transactional(readOnly = true)
	public List<OrderItem> findAll() {
		return orderItemRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Optional<OrderItem> findByObjectKey(String objectKey) {
		OrderItem orderItem = new OrderItem(objectKey);
		return orderItemRepository.findByOrderItemKey(orderItem.getOrderItemKey());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#exists(java.lang.
	 * Object)
	 */
	@Override
	public boolean exists(OrderItemKey id) {
		return orderItemRepository.existsById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#insert(java.
	 * lang.Object)
	 */
	@Override
	@Transactional
	public OrderItem insert(@Valid OrderItem entity) {
		return orderItemRepository.save(entity);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#update(java.
	 * lang.Object)
	 */
	@Override
	public OrderItem update(@Valid OrderItem entity) {
		return orderItemRepository.save(entity);
	}

	@Override
	@Transactional
	public Optional<OrderItem> delete(String objectKey) {
		return findByObjectKey(objectKey).map(orderItem -> {
			orderItemRepository.delete(orderItem);
			return Optional.of(orderItem);
		}).orElseGet(Optional::empty);
	}

	@Override
	public Page<OrderItem> search(Specification<OrderItem> specification, Pageable pageable) {
		return orderItemRepository.findAll(specification, pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#deleteById(java.lang.
	 * Object)
	 */
	@Override
	public void deleteById(OrderItemKey id) {
		orderItemRepository.deleteById(id);
	}

	@Override
	@Transactional()
	public OrderItem bulkUpdate(OrderItem orderItem) {
		OrderItem update = this.update(orderItem);
		return update;
	}

	@Override
	public Page<OrderItem> findByTheOrder(Order parentEntity, Pageable pageable) {
		return orderItemRepository.findByOrderItemKeyTheOrder(parentEntity, pageable);
	}

	@Override
	public Page<OrderItem> findByTheProduct(Product parentEntity, Pageable pageable) {
		return orderItemRepository.findByOrderItemKeyTheProduct(parentEntity, pageable);
	}

	/*
	 * 
	 * @see it.yourstore.store.service.OrderItemService#findOrderBytheProduct(it.
	 * yourstore.store.entity.Product, org.springframework.data.domain.Pageable)
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<Order> findTheOrderByTheProduct(Product product, Pageable pageable) {
		Page<OrderItem> orderItemPage = orderItemRepository.findByOrderItemKeyTheProduct(product, pageable);
		List<Order> content = orderItemPage.getContent().stream().map(OrderItem::getTheOrder)
				.collect(Collectors.toList());
		Page<Order> result = new PageImpl<Order>(content, pageable, orderItemPage.getTotalElements());
		return result;
	}

	/*
	 * 
	 * @see it.yourstore.store.service.OrderItemService#findProductBytheOrder(it.
	 * yourstore.store.entity.Order, org.springframework.data.domain.Pageable)
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<Product> findTheProductByTheOrder(Order order, Pageable pageable) {
		Page<OrderItem> orderItemPage = orderItemRepository.findByOrderItemKeyTheOrder(order, pageable);
		List<Product> content = orderItemPage.getContent().stream().map(OrderItem::getTheProduct)
				.collect(Collectors.toList());
		Page<Product> result = new PageImpl<Product>(content, pageable, orderItemPage.getTotalElements());
		return result;
	}

}
