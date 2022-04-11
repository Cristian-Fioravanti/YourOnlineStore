package it.yourstore.store.controller;

import lombok.RequiredArgsConstructor;
import it.yourstore.store.domain.User;
import it.yourstore.store.assembler.UserModelAssembler;
import it.yourstore.store.assembler.OrderModelAssembler;
import it.yourstore.store.service.UserService;
import it.yourstore.store.service.OrderService;
import it.yourstore.store.domain.Order;

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
import it.yourstore.store.dto.NewUserDto;
import it.yourstore.store.dto.EditUserDto;
import it.yourstore.store.dto.ViewUserDto;
import it.yourstore.store.mapper.UserMappers;
import it.yourstore.store.dto.ViewOrderDto;
import com.turkraft.springfilter.boot.Filter;
import io.swagger.v3.oas.annotations.Operation;

@RequiredArgsConstructor
@RestController
@RequestMapping(value = "/user", produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController extends BaseController {
	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(UserController.class);

	/// ENTITY SERVICE
	private final UserService userService;
	private final UserModelAssembler userModelAssembler;
	private final PagedResourcesAssembler<User> pagedUserAssembler;

	private final UserMappers userMappers;
	// CHILD SERVICES
	private final OrderService orderService;
	// CHILD ASSEMBLER
	private final OrderModelAssembler orderModelAssembler;
	private final PagedResourcesAssembler<Order> pagedOrderAssembler;

	// API
	/**
	 * {@code GET /user} : Get all user.
	 * 
	 * @param pageable
	 * @return Page of all User.
	 */
	@GetMapping
	@Operation(summary = "Get all User")
	@PreAuthorize("hasRole(@permissionHolder.USER_SEARCH.toString())")
	public ResponseEntity<PagedModel<ViewUserDto>> findAll(Pageable pageable) {
		PagedModel<ViewUserDto> collModel = pagedUserAssembler.toModel(userService.findAll(pageable),
				userModelAssembler);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * {@code POST  /user} : Create a new User.
	 *
	 * @param requestBody the User to create.
	 * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with
	 *         body the new User, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is invalid.
	 * @throws URISyntaxException if the Location URI syntax is incorrect.
	 */
	@PostMapping
	@Operation(summary = "Create a new User")
	@PreAuthorize("hasRole(@permissionHolder.USER_CREATE.toString())")
	public ResponseEntity<?> insert(@RequestBody @Valid NewUserDto requestBody) {
		User user = userService.insert(userMappers.map(requestBody));
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(user.getUserId())
				.toUri();
		return ResponseEntity.created(location).body(userMappers.map(user));
	}

	/**
	 * {@code GET  /user/:objectKey} : Get the user with given objectKey.
	 *
	 * @param objectKey the objectKey of the user to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the user, or with status {@code 404 (Not Found)}.
	 */
	@GetMapping("/{objectKey:.+}")
	@Operation(summary = "Get the User with given objectKey")
	@PreAuthorize("hasRole(@permissionHolder.USER_READ.toString())")
	public ResponseEntity<ViewUserDto> read(@PathVariable String objectKey) {
		Optional<User> opt = Optional
				.of(userService.findByObjectKey(objectKey).orElseThrow(() -> new ResourceNotFoundException(objectKey)));
		return toResponseEntity(opt, null, HttpStatus.OK);
	}

	/**
	 * {@code PUT  /user} : Updates an existing User.
	 *
	 * @param requestBody the User to update.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the updated User, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is not valid, or with status
	 *         {@code 500 (Internal Server Error)} if the User couldn't be updated.
	 */
	@PutMapping
	@Operation(summary = "Update an existing User")
	@PreAuthorize("hasRole(@permissionHolder.USER_UPDATE.toString())")
	public ResponseEntity<?> update(@RequestBody @Valid EditUserDto requestBody) {
		return ResponseEntity.ok(userMappers.map(userService.bulkUpdate(userMappers.map(requestBody))));
	}

	/**
	 * {@code DELETE  /user/:objectKey} : Delete the user with given objectKey.
	 *
	 * @param objectKey the objectKey of the User to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the User with given objectKey")
	@PreAuthorize("hasRole(@permissionHolder.USER_DELETE.toString())")
	public ResponseEntity<?> delete(@PathVariable String objectKey) {
		return userService.delete(objectKey).map(ResponseEntity::ok)
				.orElseThrow(() -> new ResourceNotFoundException(objectKey));
	}

	/**
	 * {@code GET  /user/search?filter=:query} : Get the user filtered by given
	 * query.
	 *
	 * @param query the query to execute filtering the User to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the user.
	 */
	@GetMapping("/search")
	@Operation(summary = "Get the User filtered by given query")
	@PreAuthorize("hasRole(@permissionHolder.USER_SEARCH.toString())")
	public ResponseEntity<?> search(@Filter Specification<User> specification, Pageable page) {
		PagedModel<ViewUserDto> collModel = pagedUserAssembler.toModel(userService.search(specification, page),
				userModelAssembler);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /{objectKey:.+}/order: Get all Order (childs) for the given User by
	 * objectKey
	 * 
	 * @param objectKey ObjectKey of User
	 * @param pageable
	 * @return Page of all Order for the given User
	 */
	@GetMapping("/{objectKey:.+}/order")
	@Operation(summary = "Get all Order (childs) for the given User by objectKey")
	@PreAuthorize("hasRole(@permissionHolder.USER_FIND_BY_THE_ORDER_OBJECT_KEY.toString())")
	public ResponseEntity<PagedModel<ViewOrderDto>> getTheOrderByObjectKey(@PathVariable String objectKey,
			Pageable pageable) {
		User user = new User();
		user.setObjectKey(objectKey);
		PagedModel<ViewOrderDto> collModel = pagedOrderAssembler.toModel(orderService.findByTheUser(user, pageable),
				orderModelAssembler);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<ViewUserDto> toResponseEntity(Optional<User> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse.map(response -> new ResponseEntity<>(userModelAssembler.toModel(response), header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<PagedModel<T>> toResponseEntityPaged(PagedModel<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
