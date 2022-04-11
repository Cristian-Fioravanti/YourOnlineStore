package it.yourstore.store.service;

import java.util.List;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import it.yourstore.store.domain.Product;

import it.yourstore.store.repository.ProductRepository;
import lombok.RequiredArgsConstructor;

import java.util.stream.Collectors;

import it.yourstore.store.domain.OrderItem;
import it.micegroup.voila2runtime.entity.GenericEntity;

@RequiredArgsConstructor
@Service
@Transactional
public class ProductServiceImpl extends BaseServiceImpl implements ProductService {

	private final ProductRepository productRepository;

	// CHILD SERVICES
	private final OrderItemService orderItemService;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(ProductServiceImpl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll(org.
	 * springframework.data.domain.Pageable)
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<Product> findAll(Pageable pageable) {
		return productRepository.findAll(pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll()
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Optional<Product> findByObjectKey(String objectKey) {
		Product product = new Product(objectKey);
		return productRepository.findByProductId(product.getProductId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#exists(java.lang.
	 * Object)
	 */
	@Override
	public boolean exists(Integer id) {
		return productRepository.existsById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#insert(java.
	 * lang.Object)
	 */
	@Override
	@Transactional
	public Product insert(@Valid Product entity) {
		return productRepository.save(entity);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#update(java.
	 * lang.Object)
	 */
	@Override
	public Product update(@Valid Product entity) {
		return productRepository.save(entity);
	}

	@Override
	@Transactional
	public Optional<Product> delete(String objectKey) {
		return findByObjectKey(objectKey).map(product -> {
			productRepository.delete(product);
			return Optional.of(product);
		}).orElseGet(Optional::empty);
	}

	@Override
	public Page<Product> search(Specification<Product> specification, Pageable pageable) {
		return productRepository.findAll(specification, pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#deleteById(java.lang.
	 * Object)
	 */
	@Override
	public void deleteById(Integer id) {
		productRepository.deleteById(id);
	}

	@Override
	@Transactional()
	public Product bulkUpdate(Product product) {
		if (product.getTheOrderItem() != null) {
			List<OrderItem> updateTheOrderItem = product.getTheOrderItem().stream()
					.filter(child -> !child.isDeletedEntityState()).collect(Collectors.toList());
			List<OrderItem> deleteTheOrderItem = product.getTheOrderItem().stream()
					.filter(GenericEntity::isDeletedEntityState).collect(Collectors.toList());
			product.setTheOrderItem(updateTheOrderItem);
			deleteTheOrderItem.forEach(child -> orderItemService.deleteById(child.getOrderItemKey()));
		}
		Product update = this.update(product);
		return update;
	}

}
