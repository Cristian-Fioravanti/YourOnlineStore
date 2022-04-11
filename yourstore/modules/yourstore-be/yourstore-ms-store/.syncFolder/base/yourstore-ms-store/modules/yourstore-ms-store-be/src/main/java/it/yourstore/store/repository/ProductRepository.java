package it.yourstore.store.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import it.yourstore.store.domain.Product;

@Repository
@EnableJpaRepositories
public interface ProductRepository extends BaseRepository<Product, Integer>, JpaSpecificationExecutor<Product> {

	Optional<Product> findByProductId(Integer id);

	@Query("DELETE FROM Product WHERE productId IN ?1")
	void deleteByIdIn(Collection<Integer> ids);
}
