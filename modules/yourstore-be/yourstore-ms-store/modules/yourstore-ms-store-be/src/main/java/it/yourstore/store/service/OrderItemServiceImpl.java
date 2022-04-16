package it.yourstore.store.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.OrderItemKey;
import it.yourstore.store.domain.Ordine;
import it.yourstore.store.domain.Product;
import it.yourstore.store.repository.OrderItemRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class OrderItemServiceImpl implements OrderItemService{

	private final OrderItemRepository orderItemRepository;

	@Transactional(readOnly = true)
	public Page<OrderItem> findAll(Pageable pageable) {
		return orderItemRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public List<OrderItem> findAll() {
		return orderItemRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Optional<OrderItem> findByObjectKey(OrderItemKey objectKey) {
		OrderItem orderItem = new OrderItem();
		orderItem.setOrderItemKey(objectKey);
		return orderItemRepository.findByOrderItemKey(orderItem.getOrderItemKey());
	}

	public boolean exists(OrderItemKey id) {
		return orderItemRepository.existsById(id);
	}

	@Transactional
	public OrderItem insert(@Valid OrderItem entity) {
		return orderItemRepository.save(entity);
	}

	public OrderItem update(@Valid OrderItem entity) {
		return orderItemRepository.save(entity);
	}

	@Transactional
	public Optional<OrderItem> delete(OrderItemKey objectKey) {
		return findByObjectKey(objectKey).map(orderItem -> {
			orderItemRepository.delete(orderItem);
			return Optional.of(orderItem);
		}).orElseGet(Optional::empty);
	}

	public Page<OrderItem> search(Specification<OrderItem> specification, Pageable pageable) {
		return orderItemRepository.findAll(specification, pageable);
	}

	public void deleteById(OrderItemKey id) {
		orderItemRepository.deleteById(id);
	}

	@Transactional()
	public OrderItem bulkUpdate(OrderItem orderItem) {
		OrderItem update = this.update(orderItem);
		return update;
	}

	public Page<OrderItem> findByTheOrdine(Ordine parentEntity, Pageable pageable) {
		return orderItemRepository.findByOrderItemKeyTheOrdine(parentEntity, pageable);
	}

	public Page<OrderItem> findByTheProduct(Product parentEntity, Pageable pageable) {
		return orderItemRepository.findByOrderItemKeyTheProduct(parentEntity, pageable);
	}

	@Transactional(readOnly = true)
	public Page<Ordine> findTheOrdineByTheProduct(Product product, Pageable pageable) {
		Page<OrderItem> orderItemPage = orderItemRepository.findByOrderItemKeyTheProduct(product, pageable);
		List<Ordine> content = orderItemPage.getContent().stream().map(OrderItem::getTheOrdine)
				.collect(Collectors.toList());
		Page<Ordine> result = new PageImpl<Ordine>(content, pageable, orderItemPage.getTotalElements());
		return result;
	}

	@Transactional(readOnly = true)
	public Page<Product> findTheProductByTheOrdine(Ordine order, Pageable pageable) {
		Page<OrderItem> orderItemPage = orderItemRepository.findByOrderItemKeyTheOrdine(order, pageable);
		List<Product> content = orderItemPage.getContent().stream().map(OrderItem::getTheProduct)
				.collect(Collectors.toList());
		Page<Product> result = new PageImpl<Product>(content, pageable, orderItemPage.getTotalElements());
		return result;
	}

}
