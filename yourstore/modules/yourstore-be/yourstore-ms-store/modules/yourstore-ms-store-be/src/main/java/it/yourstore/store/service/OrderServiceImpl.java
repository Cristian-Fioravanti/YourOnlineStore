package it.yourstore.store.service;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.yourstore.store.domain.Order;
import it.yourstore.store.domain.User;
import it.yourstore.store.repository.OrderRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	private final OrderRepository orderRepository;

	@Transactional(readOnly = true)
	public Page<Order> findAll(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Optional<Order> findByObjectKey(Integer objectKey) {
		Order order = new Order();
		order.setOrderId(objectKey);
		return orderRepository.findByOrderId(order.getOrderId());
	}

	public boolean exists(Integer id) {
		return orderRepository.existsById(id);
	}

	@Transactional
	public Order insert(@Valid Order entity) {
		return orderRepository.save(entity);
	}

	public Order update(@Valid Order entity) {
		return orderRepository.save(entity);
	}

	
	@Transactional
	public Optional<Order> delete(Integer objectKey) {
		return findByObjectKey(objectKey).map(order -> {
			orderRepository.delete(order);
			return Optional.of(order);
		}).orElseGet(Optional::empty);
	}

	public Page<Order> search(Specification<Order> specification, Pageable pageable) {
		return orderRepository.findAll(specification, pageable);
	}

	public void deleteById(Integer id) {
		orderRepository.deleteById(id);
	}

	@Transactional()
	public Order bulkUpdate(Order order) {
		Order update = this.update(order);
		return update;
	}

	public Page<Order> findByTheUser(User parentEntity, Pageable pageable) {
		return orderRepository.findByTheUser(parentEntity, pageable);
	}

}
