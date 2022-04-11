package it.yourstore.store.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import it.yourstore.store.domain.Order;

import it.yourstore.store.domain.User;

@Repository
@EnableJpaRepositories
public interface OrderRepository extends BaseRepository<Order, Integer>, JpaSpecificationExecutor<Order> {

	@EntityGraph(attributePaths = { "theUser" }, type = EntityGraphType.FETCH)

	Optional<Order> findByOrderId(Integer id);

	@EntityGraph(attributePaths = { "theUser" }, type = EntityGraphType.FETCH)

	Page<Order> findByTheUser(User parentEntity, Pageable pageable);

	@Query("DELETE FROM Order WHERE orderId IN ?1")
	void deleteByIdIn(Collection<Integer> ids);
}
