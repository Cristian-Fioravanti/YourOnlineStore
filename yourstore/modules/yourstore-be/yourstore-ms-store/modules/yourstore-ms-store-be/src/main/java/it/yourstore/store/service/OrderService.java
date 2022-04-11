package it.yourstore.store.service;

import it.yourstore.store.domain.Order;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import it.yourstore.store.domain.User;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

import javax.validation.Valid;

public interface OrderService {

	// PARENT-SPECIFIC SERVICES
	Page<Order> findByTheUser(User parentEntity, Pageable pageable);

	Order bulkUpdate(Order order);

	Order update(Order order);

	Optional<Order> delete(Integer objectKey);

	Page<Order> search(Specification<Order> specification, Pageable pageable);

	Page<Order> findAll(Pageable pageable);

	Order insert(@Valid Order requestBody);

	Optional<Order> findByObjectKey(Integer objectKey);
}
