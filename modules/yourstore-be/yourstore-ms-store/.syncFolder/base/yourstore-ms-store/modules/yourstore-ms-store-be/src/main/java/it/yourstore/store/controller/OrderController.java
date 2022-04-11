package it.yourstore.store.controller;

import lombok.RequiredArgsConstructor;
import it.yourstore.store.domain.Order;
import it.yourstore.store.assembler.OrderModelAssembler;
import it.yourstore.store.assembler.OrderItemModelAssembler;
import it.yourstore.store.service.OrderService;
import it.yourstore.store.service.OrderItemService;
import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.domain.User;

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
import it.yourstore.store.dto.NewOrderDto;
import it.yourstore.store.dto.EditOrderDto;
import it.yourstore.store.dto.ViewOrderDto;
import it.yourstore.store.mapper.OrderMappers;
import it.yourstore.store.dto.ViewOrderItemDto;
import com.turkraft.springfilter.boot.Filter;
import io.swagger.v3.oas.annotations.Operation;

@RequiredArgsConstructor
@RestController
@RequestMapping(value = "/order", produces = MediaType.APPLICATION_JSON_VALUE)
public class OrderController extends BaseController {
	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(OrderController.class);

	/// ENTITY SERVICE
	private final OrderService orderService;
	private final OrderModelAssembler orderModelAssembler;
	private final PagedResourcesAssembler<Order> pagedOrderAssembler;

	private final OrderMappers orderMappers;
	// CHILD SERVICES
	private final OrderItemService orderItemService;
	// CHILD ASSEMBLER
	private final OrderItemModelAssembler orderItemModelAssembler;
	private final PagedResourcesAssembler<OrderItem> pagedOrderItemAssembler;

	// API
	/**
	 * {@code GET /order} : Get all order.
	 * 
	 * @param pageable
	 * @return Page of all Order.
	 */
	@GetMapping
	@Operation(summary = "Get all Order")
	@PreAuthorize("hasRole(@permissionHolder.ORDER_SEARCH.toString())")
	public ResponseEntity<PagedModel<ViewOrderDto>> findAll(Pageable pageable) {
		PagedModel<ViewOrderDto> collModel = pagedOrderAssembler.toModel(orderService.findAll(pageable),
				orderModelAssembler);
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_CREATE.toString())")
	public ResponseEntity<?> insert(@RequestBody @Valid NewOrderDto requestBody) {
		Order order = orderService.insert(orderMappers.map(requestBody));
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(order.getOrderId())
				.toUri();
		return ResponseEntity.created(location).body(orderMappers.map(order));
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_READ.toString())")
	public ResponseEntity<ViewOrderDto> read(@PathVariable String objectKey) {
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_UPDATE.toString())")
	public ResponseEntity<?> update(@RequestBody @Valid EditOrderDto requestBody) {
		return ResponseEntity.ok(orderMappers.map(orderService.bulkUpdate(orderMappers.map(requestBody))));
	}

	/**
	 * {@code DELETE  /order/:objectKey} : Delete the order with given objectKey.
	 *
	 * @param objectKey the objectKey of the Order to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the Order with given objectKey")
	@PreAuthorize("hasRole(@permissionHolder.ORDER_DELETE.toString())")
	public ResponseEntity<?> delete(@PathVariable String objectKey) {
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_SEARCH.toString())")
	public ResponseEntity<?> search(@Filter Specification<Order> specification, Pageable page) {
		PagedModel<ViewOrderDto> collModel = pagedOrderAssembler.toModel(orderService.search(specification, page),
				orderModelAssembler);
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_FIND_BY_THE_ORDER_ITEM_OBJECT_KEY.toString())")
	public ResponseEntity<PagedModel<ViewOrderItemDto>> getTheOrderItemByObjectKey(@PathVariable String objectKey,
			Pageable pageable) {
		Order order = new Order();
		order.setObjectKey(objectKey);
		PagedModel<ViewOrderItemDto> collModel = pagedOrderItemAssembler
				.toModel(orderItemService.findByTheOrder(order, pageable), orderItemModelAssembler);
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_FIND_BY_USER.toString())")
	public ResponseEntity<PagedModel<ViewOrderDto>> findByUser(@PathVariable String userObjectKey, Pageable pageable) {
		User key = new User(userObjectKey);
		PagedModel<ViewOrderDto> collModel = pagedOrderAssembler.toModel(orderService.findByTheUser(key, pageable),
				orderModelAssembler);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<ViewOrderDto> toResponseEntity(Optional<Order> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse
				.map(response -> new ResponseEntity<>(orderModelAssembler.toModel(response), header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<PagedModel<T>> toResponseEntityPaged(PagedModel<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
