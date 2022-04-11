package it.yourstore.store.controller;

import lombok.RequiredArgsConstructor;
import it.yourstore.store.domain.Product;
import it.yourstore.store.assembler.ProductModelAssembler;
import it.yourstore.store.assembler.OrderItemModelAssembler;
import it.yourstore.store.service.ProductService;
import it.yourstore.store.service.OrderItemService;
import it.yourstore.store.domain.OrderItem;

import it.yourstore.store.exception.ResourceNotFoundException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedModel;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.net.URI;

import java.util.Optional;
import it.yourstore.store.dto.NewProductDto;
import it.yourstore.store.dto.EditProductDto;
import it.yourstore.store.dto.ViewProductDto;
import it.yourstore.store.mapper.ProductMappers;
import it.yourstore.store.dto.ViewOrderItemDto;
import com.turkraft.springfilter.boot.Filter;
import io.swagger.v3.oas.annotations.Operation;

@RequiredArgsConstructor
@RestController
@RequestMapping(value = "/product", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProductController extends BaseController {
	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(ProductController.class);

	/// ENTITY SERVICE
	private final ProductService productService;
	private final ProductModelAssembler productModelAssembler;
	private final PagedResourcesAssembler<Product> pagedProductAssembler;

	private final ProductMappers productMappers;
	// CHILD SERVICES
	private final OrderItemService orderItemService;
	// CHILD ASSEMBLER
	private final OrderItemModelAssembler orderItemModelAssembler;
	private final PagedResourcesAssembler<OrderItem> pagedOrderItemAssembler;

	// API
	/**
	 * {@code GET /product} : Get all product.
	 * 
	 * @param pageable
	 * @return Page of all Product.
	 */
	@GetMapping
	@Operation(summary = "Get all Product")
	@PreAuthorize("hasRole(@permissionHolder.PRODUCT_SEARCH.toString())")
	public ResponseEntity<PagedModel<ViewProductDto>> findAll(Pageable pageable) {
		PagedModel<ViewProductDto> collModel = pagedProductAssembler.toModel(productService.findAll(pageable),
				productModelAssembler);
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
	@PreAuthorize("hasRole(@permissionHolder.PRODUCT_CREATE.toString())")
	public ResponseEntity<?> insert(@RequestBody @Valid NewProductDto requestBody) {
		Product product = productService.insert(productMappers.map(requestBody));
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
				.buildAndExpand(product.getProductId()).toUri();
		return ResponseEntity.created(location).body(productMappers.map(product));
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
	@PreAuthorize("hasRole(@permissionHolder.PRODUCT_READ.toString())")
	public ResponseEntity<ViewProductDto> read(@PathVariable String objectKey) {
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
	@PreAuthorize("hasRole(@permissionHolder.PRODUCT_UPDATE.toString())")
	public ResponseEntity<?> update(@RequestBody @Valid EditProductDto requestBody) {
		return ResponseEntity.ok(productMappers.map(productService.bulkUpdate(productMappers.map(requestBody))));
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
	@PreAuthorize("hasRole(@permissionHolder.PRODUCT_DELETE.toString())")
	public ResponseEntity<?> delete(@PathVariable String objectKey) {
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
	@PreAuthorize("hasRole(@permissionHolder.PRODUCT_SEARCH.toString())")
	public ResponseEntity<?> search(@Filter Specification<Product> specification, Pageable page) {
		PagedModel<ViewProductDto> collModel = pagedProductAssembler.toModel(productService.search(specification, page),
				productModelAssembler);
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
	@PreAuthorize("hasRole(@permissionHolder.PRODUCT_FIND_BY_THE_ORDER_ITEM_OBJECT_KEY.toString())")
	public ResponseEntity<PagedModel<ViewOrderItemDto>> getTheOrderItemByObjectKey(@PathVariable String objectKey,
			Pageable pageable) {
		Product product = new Product();
		product.setObjectKey(objectKey);
		PagedModel<ViewOrderItemDto> collModel = pagedOrderItemAssembler
				.toModel(orderItemService.findByTheProduct(product, pageable), orderItemModelAssembler);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<ViewProductDto> toResponseEntity(Optional<Product> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse
				.map(response -> new ResponseEntity<>(productModelAssembler.toModel(response), header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<PagedModel<T>> toResponseEntityPaged(PagedModel<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
