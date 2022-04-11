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
import org.springframework.security.access.prepost.PreAuthorize;
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
import it.yourstore.store.domain.Order;
import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.OrderItemKey;
import it.yourstore.store.domain.Product;
import it.yourstore.store.exception.ResourceNotFoundException;
import it.yourstore.store.service.OrderItemService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/order-item", produces = MediaType.APPLICATION_JSON_VALUE)
public class OrderItemController{
	/// ENTITY SERVICE
	@Autowired
	private OrderItemService orderItemService;
	// API
	/**
	 * {@code GET /order-item} : Get all order-item.
	 * 
	 * @param pageable
	 * @return Page of all OrderItem.
	 */
	@GetMapping
	@Operation(summary = "Get all OrderItem")
	public ResponseEntity<Page<OrderItem>> findAll(Pageable pageable) {
		Page<OrderItem> collModel = orderItemService.findAll(pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * {@code POST  /order-item} : Create a new OrderItem.
	 *
	 * @param requestBody the OrderItem to create.
	 * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with
	 *         body the new OrderItem, or with status {@code 400 (Bad Request)} if
	 *         the requestBody is invalid.
	 * @throws URISyntaxException if the Location URI syntax is incorrect.
	 */
	@PostMapping
	@Operation(summary = "Create a new OrderItem")
	public ResponseEntity<?> insert(@RequestBody @Valid OrderItem requestBody) {
		OrderItem orderItem = orderItemService.insert(requestBody);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
				.buildAndExpand(orderItem.getOrderItemKey()).toUri();
		return ResponseEntity.created(location).body(orderItem);
	}

	/**
	 * {@code GET  /order-item/:objectKey} : Get the order-item with given
	 * objectKey.
	 *
	 * @param objectKey the objectKey of the order-item to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the order-item, or with status {@code 404 (Not Found)}.
	 */
	@GetMapping("/{objectKey:.+}")
	@Operation(summary = "Get the OrderItem with given objectKey")
	public ResponseEntity<OrderItem> read(@PathVariable OrderItemKey objectKey) {
		Optional<OrderItem> opt = Optional.of(orderItemService.findByObjectKey(objectKey)
				.orElseThrow(() -> new ResourceNotFoundException(0)));
		return toResponseEntity(opt, null, HttpStatus.OK);
	}

	/**
	 * {@code PUT  /order-item} : Updates an existing OrderItem.
	 *
	 * @param requestBody the OrderItem to update.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the updated OrderItem, or with status {@code 400 (Bad Request)} if
	 *         the requestBody is not valid, or with status
	 *         {@code 500 (Internal Server Error)} if the OrderItem couldn't be
	 *         updated.
	 */
	@PutMapping
	@Operation(summary = "Update an existing OrderItem")
	public ResponseEntity<?> update(@RequestBody @Valid OrderItem requestBody) {
		return ResponseEntity.ok(orderItemService.bulkUpdate(requestBody));
	}

	/**
	 * {@code DELETE  /order-item/:objectKey} : Delete the order-item with given
	 * objectKey.
	 *
	 * @param objectKey the objectKey of the OrderItem to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the OrderItem with given objectKey")
	public ResponseEntity<?> delete(@PathVariable OrderItemKey objectKey) {
		return orderItemService.delete(objectKey).map(ResponseEntity::ok)
				.orElseThrow(() -> new ResourceNotFoundException(0));
	}

	/**
	 * {@code GET  /order-item/search?filter=:query} : Get the order-item filtered
	 * by given query.
	 *
	 * @param query the query to execute filtering the OrderItem to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the order-item.
	 */
	@GetMapping("/search")
	@Operation(summary = "Get the OrderItem filtered by given query")
	public ResponseEntity<?> search(@Filter Specification<OrderItem> specification, Pageable page) {
		Page<OrderItem> collModel = orderItemService.search(specification, page);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /findByTheOrder/orderObjectKey: Search all OrderItem for the given Order
	 * (parent)
	 * 
	 * @param orderObjectKey of Order
	 * @param pageable
	 * @return Page of OrderItem for the given Order (parent)
	 */
	@GetMapping("/findByTheOrder/{orderObjectKey:.+}")
	@Operation(summary = "Get all OrderItem for the given Order (parent)")
	public ResponseEntity<Page<OrderItem>> findByOrder(@PathVariable Integer orderObjectKey,
			Pageable pageable) {
		Order key = new Order();
		key.setOrderId(orderObjectKey);
		Page<OrderItem> collModel = orderItemService.findByTheOrder(key, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /findByTheProduct/productObjectKey: Search all OrderItem for the given
	 * Product (parent)
	 * 
	 * @param productObjectKey of Product
	 * @param pageable
	 * @return Page of OrderItem for the given Product (parent)
	 */
	@GetMapping("/findByTheProduct/{productObjectKey:.+}")
	@Operation(summary = "Get all OrderItem for the given Product (parent)")
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_FIND_BY_PRODUCT.toString())")
	public ResponseEntity<Page<OrderItem>> findByProduct(@PathVariable Integer productObjectKey,
			Pageable pageable) {
		Product key = new Product();
		key.setProductId(productObjectKey);
		Page<OrderItem> collModel = orderItemService.findByTheProduct(key, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<OrderItem> toResponseEntity(Optional<OrderItem> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse
				.map(response -> new ResponseEntity<>(response, header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<Page<T>> toResponseEntityPaged(Page<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
