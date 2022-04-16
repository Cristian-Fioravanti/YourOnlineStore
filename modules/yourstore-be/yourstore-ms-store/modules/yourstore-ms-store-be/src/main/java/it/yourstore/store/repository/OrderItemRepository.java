package it.yourstore.store.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.OrderItemKey;

import it.yourstore.store.domain.Ordine;
import it.yourstore.store.domain.Product;

@Repository
@EnableJpaRepositories
public interface OrderItemRepository extends JpaRepository<OrderItem, OrderItemKey>,  JpaSpecificationExecutor<OrderItem> {

	@EntityGraph(attributePaths = { "orderItemKey.theOrdine", "orderItemKey.theProduct" }, type = EntityGraphType.FETCH)

	Optional<OrderItem> findByOrderItemKey(OrderItemKey id);

	@EntityGraph(attributePaths = { "orderItemKey.theOrdine", "orderItemKey.theProduct" }, type = EntityGraphType.FETCH)

	Page<OrderItem> findByOrderItemKeyTheOrdine(Ordine parentEntity, Pageable pageable);

	@EntityGraph(attributePaths = { "orderItemKey.theOrdine", "orderItemKey.theProduct" }, type = EntityGraphType.FETCH)

	Page<OrderItem> findByOrderItemKeyTheProduct(Product parentEntity, Pageable pageable);

	@Query("DELETE FROM OrderItem WHERE orderItemKey IN ?1")
	void deleteByIdIn(Collection<OrderItemKey> ids);
}
