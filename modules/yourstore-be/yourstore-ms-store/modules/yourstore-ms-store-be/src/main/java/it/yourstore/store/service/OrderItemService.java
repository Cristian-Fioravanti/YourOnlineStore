package it.yourstore.store.service;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.OrderItemKey;
import it.yourstore.store.domain.Ordine;
import it.yourstore.store.domain.Product;


public interface OrderItemService {

	// PARENT-SPECIFIC SERVICES
	Page<OrderItem> findByTheOrdine(Ordine parentEntity, Pageable pageable);

	Page<OrderItem> findByTheProduct(Product parentEntity, Pageable pageable);

	Page<Ordine> findTheOrdineByTheProduct(Product product, Pageable pageable);

	Page<Product> findTheProductByTheOrdine(Ordine order, Pageable pageable);

	OrderItem bulkUpdate(OrderItem orderItem);

	OrderItem update(OrderItem orderItem);

	Optional<OrderItem> delete(OrderItemKey objectKey);

	Page<OrderItem> search(Specification<OrderItem> specification, Pageable pageable);

	Page<OrderItem> findAll(Pageable pageable);

	OrderItem insert(@Valid OrderItem requestBody);

	Optional<OrderItem> findByObjectKey(OrderItemKey objectKey);
	
}
