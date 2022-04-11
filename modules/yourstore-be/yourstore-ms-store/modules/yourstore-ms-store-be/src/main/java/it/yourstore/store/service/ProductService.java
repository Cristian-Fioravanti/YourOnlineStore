package it.yourstore.store.service;

import it.yourstore.store.domain.Product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

import javax.validation.Valid;

public interface ProductService {

	// PARENT-SPECIFIC SERVICES

	Product bulkUpdate(Product product);

	Product update(Product product);

	Optional<Product> delete(Integer objectKey);

	Page<Product> search(Specification<Product> specification, Pageable pageable);

	Page<Product> findAll(Pageable pageable);

	Product insert(@Valid Product requestBody);

	Optional<Product> findByObjectKey(Integer objectKey);
}
