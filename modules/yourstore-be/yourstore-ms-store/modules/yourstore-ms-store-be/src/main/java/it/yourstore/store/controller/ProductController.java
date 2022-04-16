package it.yourstore.store.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.turkraft.springfilter.boot.Filter;

import io.swagger.v3.oas.annotations.Operation;
import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.Product;
import it.yourstore.store.exception.ResourceNotFoundException;
import it.yourstore.store.service.OrderItemService;
import it.yourstore.store.service.ProductService;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor
@RestController
@RequestMapping(value = "/product", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProductController {
	/// ENTITY SERVICE
	@Autowired
	ProductService productService;

	// CHILD SERVICES
	@Autowired
	OrderItemService orderItemService;

	// API
	/**
	 * {@code GET /product} : Get all product.
	 * 
	 * @param pageable
	 * @return Page of all Product.
	 */
	@GetMapping
	@Operation(summary = "Get all Product")
	public ResponseEntity<Page<Product>> findAll(Pageable pageable) {
		Page<Product> collModel = productService.findAll(pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * {@code POST  /product} : Create a new Product.
	 *
	 * @param requestBody the Product to create.
	 * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with
	 *         body the new Product, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is invalid.
	 * @throws URISyntaxException if the Location URI syntax is incorrect.
	 */
	@PostMapping
	@Operation(summary = "Create a new Product")
	public ResponseEntity<?> insert(@RequestBody @Valid Product requestBody) {
		Product product = productService.insert(requestBody);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
				.buildAndExpand(product.getProductId()).toUri();
		return ResponseEntity.created(location).body(product);
	}

	/**
	 * {@code GET  /product/:objectKey} : Get the product with given objectKey.
	 *
	 * @param objectKey the objectKey of the product to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the product, or with status {@code 404 (Not Found)}.
	 */
	@GetMapping("/{objectKey:.+}")
	@Operation(summary = "Get the Product with given objectKey")
	public ResponseEntity<Product> read(@PathVariable Integer objectKey) {
		Optional<Product> opt = Optional.of(
				productService.findByObjectKey(objectKey).orElseThrow(() -> new ResourceNotFoundException(objectKey)));
		return toResponseEntity(opt, null, HttpStatus.OK);
	}

	/**
	 * {@code PUT  /product} : Updates an existing Product.
	 *
	 * @param requestBody the Product to update.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the updated Product, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is not valid, or with status
	 *         {@code 500 (Internal Server Error)} if the Product couldn't be
	 *         updated.
	 */
	@PutMapping
	@Operation(summary = "Update an existing Product")
	public ResponseEntity<?> update(@RequestBody @Valid Product requestBody) {
		return ResponseEntity.ok(productService.bulkUpdate(requestBody));
	}

	/**
	 * {@code DELETE  /product/:objectKey} : Delete the product with given
	 * objectKey.
	 *
	 * @param objectKey the objectKey of the Product to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the Product with given objectKey")
	public ResponseEntity<?> delete(@PathVariable Integer objectKey) {
		return productService.delete(objectKey).map(ResponseEntity::ok)
				.orElseThrow(() -> new ResourceNotFoundException(objectKey));
	}

	/**
	 * {@code GET  /product/search?filter=:query} : Get the product filtered by
	 * given query.
	 *
	 * @param query the query to execute filtering the Product to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the product.
	 */
	@GetMapping("/search")
	@Operation(summary = "Get the Product filtered by given query")
	public ResponseEntity<?> search(@Filter Specification<Product> specification, Pageable page) {
		Page<Product> collModel = productService.search(specification, page);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /{objectKey:.+}/order-item: Get all OrderItem (childs) for the given
	 * Product by objectKey
	 * 
	 * @param objectKey ObjectKey of Product
	 * @param pageable
	 * @return Page of all OrderItem for the given Product
	 */
	@GetMapping("/{objectKey:.+}/order-item")
	@Operation(summary = "Get all OrderItem (childs) for the given Product by objectKey")
	public ResponseEntity<Page<OrderItem>> getTheOrderItemByObjectKey(@PathVariable Integer objectKey,
			Pageable pageable) {
		Product product = new Product();
		product.setProductId(objectKey);
		Page<OrderItem> collModel = orderItemService.findByTheProduct(product, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<Product> toResponseEntity(Optional<Product> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse
				.map(response -> new ResponseEntity<>(response, header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<Page<T>> toResponseEntityPaged(Page<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
