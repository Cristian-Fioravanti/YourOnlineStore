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
import it.yourstore.store.domain.Order;
import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.User;
import it.yourstore.store.exception.ResourceNotFoundException;
import it.yourstore.store.service.OrderItemService;
import it.yourstore.store.service.OrderService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/order", produces = MediaType.APPLICATION_JSON_VALUE)
public class OrderController{
	/// ENTITY SERVICE
	@Autowired
	OrderService orderService;
	// CHILD SERVICES
	@Autowired
	OrderItemService orderItemService;
	
	// API
	/**
	 * {@code GET /order} : Get all order.
	 * 
	 * @param pageable
	 * @return Page of all Order.
	 */
	@GetMapping
	@Operation(summary = "Get all Order")
	public ResponseEntity<Page<Order>> findAll(Pageable pageable) {
		Page<Order> collModel = orderService.findAll(pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * {@code POST  /order} : Create a new Order.
	 *
	 * @param requestBody the Order to create.
	 * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with
	 *         body the new Order, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is invalid.
	 * @throws URISyntaxException if the Location URI syntax is incorrect.
	 */
	@PostMapping
	@Operation(summary = "Create a new Order")
	public ResponseEntity<?> insert(@RequestBody @Valid Order requestBody) {
		Order order = orderService.insert(requestBody);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(order.getOrderId())
				.toUri();
		return ResponseEntity.created(location).body(order);
	}

	/**
	 * {@code GET  /order/:objectKey} : Get the order with given objectKey.
	 *
	 * @param objectKey the objectKey of the order to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the order, or with status {@code 404 (Not Found)}.
	 */
	@GetMapping("/{objectKey:.+}")
	@Operation(summary = "Get the Order with given objectKey")
	public ResponseEntity<Order> read(@PathVariable Integer objectKey) {
		Optional<Order> opt = Optional.of(
				orderService.findByObjectKey(objectKey).orElseThrow(() -> new ResourceNotFoundException(objectKey)));
		return toResponseEntity(opt, null, HttpStatus.OK);
	}

	/**
	 * {@code PUT  /order} : Updates an existing Order.
	 *
	 * @param requestBody the Order to update.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the updated Order, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is not valid, or with status
	 *         {@code 500 (Internal Server Error)} if the Order couldn't be updated.
	 */
	@PutMapping
	@Operation(summary = "Update an existing Order")
	public ResponseEntity<?> update(@RequestBody @Valid Order requestBody) {
		return ResponseEntity.ok(orderService.bulkUpdate(requestBody));
	}

	/**
	 * {@code DELETE  /order/:objectKey} : Delete the order with given objectKey.
	 *
	 * @param objectKey the objectKey of the Order to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the Order with given objectKey")
	public ResponseEntity<?> delete(@PathVariable Integer objectKey) {
		return orderService.delete(objectKey).map(ResponseEntity::ok)
				.orElseThrow(() -> new ResourceNotFoundException(objectKey));
	}

	/**
	 * {@code GET  /order/search?filter=:query} : Get the order filtered by given
	 * query.
	 *
	 * @param query the query to execute filtering the Order to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the order.
	 */
	@GetMapping("/search")
	@Operation(summary = "Get the Order filtered by given query")
	public ResponseEntity<?> search(@Filter Specification<Order> specification, Pageable page) {
		Page<Order> collModel = orderService.search(specification, page);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /{objectKey:.+}/order-item: Get all OrderItem (childs) for the given
	 * Order by objectKey
	 * 
	 * @param objectKey ObjectKey of Order
	 * @param pageable
	 * @return Page of all OrderItem for the given Order
	 */
	@GetMapping("/{objectKey:.+}/order-item")
	@Operation(summary = "Get all OrderItem (childs) for the given Order by objectKey")
	public ResponseEntity<Page<OrderItem>> getTheOrderItemByObjectKey(@PathVariable Integer objectKey,
			Pageable pageable) {
		Order order = new Order();
		order.setOrderId(objectKey);
		Page<OrderItem> collModel = orderItemService.findByTheOrder(order, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /findByTheUser/userObjectKey: Search all Order for the given User
	 * (parent)
	 * 
	 * @param userObjectKey of User
	 * @param pageable
	 * @return Page of Order for the given User (parent)
	 */
	@GetMapping("/findByTheUser/{userObjectKey:.+}")
	@Operation(summary = "Get all Order for the given User (parent)")
	public ResponseEntity<Page<Order>> findByUser(@PathVariable Integer userObjectKey, Pageable pageable) {
		User key = new User();
		key.setUserId(userObjectKey);
		Page<Order> collModel = orderService.findByTheUser(key, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<Order> toResponseEntity(Optional<Order> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse
				.map(response -> new ResponseEntity<>(response, header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<Page<T>> toResponseEntityPaged(Page<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
