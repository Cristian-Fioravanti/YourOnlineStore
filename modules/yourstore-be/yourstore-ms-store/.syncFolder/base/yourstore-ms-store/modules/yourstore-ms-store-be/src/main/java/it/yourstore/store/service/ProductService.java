package it.yourstore.store.service;

import it.yourstore.store.domain.Product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

public interface ProductService extends BaseEntityService<Product, Integer> {

	// PARENT-SPECIFIC SERVICES

	Product bulkUpdate(Product product);

	Product update(Product product);

	Optional<Product> delete(String objectKey);

	Page<Product> search(Specification<Product> specification, Pageable pageable);
}
