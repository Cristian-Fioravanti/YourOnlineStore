package it.yourstore.store.controller;

import lombok.RequiredArgsConstructor;
import it.yourstore.store.domain.OrderItem;
import it.yourstore.store.assembler.OrderItemModelAssembler;
import it.yourstore.store.service.OrderItemService;

import it.yourstore.store.domain.Order;
import it.yourstore.store.domain.Product;

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
import it.yourstore.store.dto.NewOrderItemDto;
import it.yourstore.store.dto.EditOrderItemDto;
import it.yourstore.store.dto.ViewOrderItemDto;
import it.yourstore.store.mapper.OrderItemMappers;

import com.turkraft.springfilter.boot.Filter;
import io.swagger.v3.oas.annotations.Operation;

@RequiredArgsConstructor
@RestController
@RequestMapping(value = "/order-item", produces = MediaType.APPLICATION_JSON_VALUE)
public class OrderItemController extends BaseController {
	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(OrderItemController.class);

	/// ENTITY SERVICE
	private final OrderItemService orderItemService;
	private final OrderItemModelAssembler orderItemModelAssembler;
	private final PagedResourcesAssembler<OrderItem> pagedOrderItemAssembler;

	private final OrderItemMappers orderItemMappers;
	// CHILD SERVICES

	// CHILD ASSEMBLER

	// API
	/**
	 * {@code GET /order-item} : Get all order-item.
	 * 
	 * @param pageable
	 * @return Page of all OrderItem.
	 */
	@GetMapping
	@Operation(summary = "Get all OrderItem")
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_SEARCH.toString())")
	public ResponseEntity<PagedModel<ViewOrderItemDto>> findAll(Pageable pageable) {
		PagedModel<ViewOrderItemDto> collModel = pagedOrderItemAssembler.toModel(orderItemService.findAll(pageable),
				orderItemModelAssembler);
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_CREATE.toString())")
	public ResponseEntity<?> insert(@RequestBody @Valid NewOrderItemDto requestBody) {
		OrderItem orderItem = orderItemService.insert(orderItemMappers.map(requestBody));
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
				.buildAndExpand(orderItem.getOrderItemKey()).toUri();
		return ResponseEntity.created(location).body(orderItemMappers.map(orderItem));
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_READ.toString())")
	public ResponseEntity<ViewOrderItemDto> read(@PathVariable String objectKey) {
		Optional<OrderItem> opt = Optional.of(orderItemService.findByObjectKey(objectKey)
				.orElseThrow(() -> new ResourceNotFoundException(objectKey)));
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_UPDATE.toString())")
	public ResponseEntity<?> update(@RequestBody @Valid EditOrderItemDto requestBody) {
		return ResponseEntity.ok(orderItemMappers.map(orderItemService.bulkUpdate(orderItemMappers.map(requestBody))));
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_DELETE.toString())")
	public ResponseEntity<?> delete(@PathVariable String objectKey) {
		return orderItemService.delete(objectKey).map(ResponseEntity::ok)
				.orElseThrow(() -> new ResourceNotFoundException(objectKey));
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_SEARCH.toString())")
	public ResponseEntity<?> search(@Filter Specification<OrderItem> specification, Pageable page) {
		PagedModel<ViewOrderItemDto> collModel = pagedOrderItemAssembler
				.toModel(orderItemService.search(specification, page), orderItemModelAssembler);
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
	@PreAuthorize("hasRole(@permissionHolder.ORDER_ITEM_FIND_BY_ORDER.toString())")
	public ResponseEntity<PagedModel<ViewOrderItemDto>> findByOrder(@PathVariable String orderObjectKey,
			Pageable pageable) {
		Order key = new Order(orderObjectKey);
		PagedModel<ViewOrderItemDto> collModel = pagedOrderItemAssembler
				.toModel(orderItemService.findByTheOrder(key, pageable), orderItemModelAssembler);
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
	public ResponseEntity<PagedModel<ViewOrderItemDto>> findByProduct(@PathVariable String productObjectKey,
			Pageable pageable) {
		Product key = new Product(productObjectKey);
		PagedModel<ViewOrderItemDto> collModel = pagedOrderItemAssembler
				.toModel(orderItemService.findByTheProduct(key, pageable), orderItemModelAssembler);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<ViewOrderItemDto> toResponseEntity(Optional<OrderItem> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse
				.map(response -> new ResponseEntity<>(orderItemModelAssembler.toModel(response), header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<PagedModel<T>> toResponseEntityPaged(PagedModel<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
