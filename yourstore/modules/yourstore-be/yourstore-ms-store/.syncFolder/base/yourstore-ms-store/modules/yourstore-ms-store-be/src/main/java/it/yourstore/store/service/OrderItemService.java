package it.yourstore.store.service;

import it.yourstore.store.domain.OrderItem;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import it.yourstore.store.domain.OrderItemKey;

import it.yourstore.store.domain.Order;
import it.yourstore.store.domain.Product;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

public interface OrderItemService extends BaseEntityService<OrderItem, OrderItemKey> {

	// PARENT-SPECIFIC SERVICES
	Page<OrderItem> findByTheOrder(Order parentEntity, Pageable pageable);

	Page<OrderItem> findByTheProduct(Product parentEntity, Pageable pageable);

	/**
	 * Return a list of Order from all OrderItem with given theOrder
	 *
	 * @param product
	 * @param pageable
	 * @return list of Order from all OrderItem with given TheOrder
	 */
	Page<Order> findTheOrderByTheProduct(Product product, Pageable pageable);

	/**
	 * Return a list of Product from all OrderItem with given theProduct
	 *
	 * @param order
	 * @param pageable
	 * @return list of Product from all OrderItem with given TheProduct
	 */
	Page<Product> findTheProductByTheOrder(Order order, Pageable pageable);

	OrderItem bulkUpdate(OrderItem orderItem);

	OrderItem update(OrderItem orderItem);

	Optional<OrderItem> delete(String objectKey);

	Page<OrderItem> search(Specification<OrderItem> specification, Pageable pageable);
}
