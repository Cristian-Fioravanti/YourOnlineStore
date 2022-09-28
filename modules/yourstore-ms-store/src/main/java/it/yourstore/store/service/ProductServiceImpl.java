package it.yourstore.store.service;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.yourstore.store.domain.Product;
import it.yourstore.store.repository.ProductRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	private final ProductRepository productRepository;

	@Transactional(readOnly = true)
	public Page<Product> findAll(Pageable pageable) {
		return productRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	
	@Transactional(readOnly = true)
	public Optional<Product> findByObjectKey(Integer objectKey) {
		Product product = new Product();
		product.setProductId(objectKey);
		return productRepository.findByProductId(product.getProductId());
	}
	
	public boolean exists(Integer id) {
		return productRepository.existsById(id);
	}

	@Transactional
	public Product insert(@Valid Product entity) {
		return productRepository.save(entity);
	}

	public Product update(@Valid Product entity) {
		return productRepository.save(entity);
	}

	
	@Transactional
	public Optional<Product> delete(Integer objectKey) {
		return findByObjectKey(objectKey).map(product -> {
			productRepository.delete(product);
			return Optional.of(product);
		}).orElseGet(Optional::empty);
	}

	
	public Page<Product> search(Specification<Product> specification, Pageable pageable) {
		return productRepository.findAll(specification, pageable);
	}
	
	public void deleteById(Integer id) {
		productRepository.deleteById(id);
	}
	
	@Transactional()
	public Product bulkUpdate(Product product) {
		Product update = this.update(product);
		return update;
	}

}
