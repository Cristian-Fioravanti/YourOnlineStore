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
import it.yourstore.store.domain.User;
import it.yourstore.store.exception.ResourceNotFoundException;
import it.yourstore.store.service.OrderService;
import it.yourstore.store.service.UserService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/user", produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {
	/// ENTITY SERVICE
	@Autowired
	private UserService userService;
	// CHILD SERVICES
	@Autowired
	private OrderService orderService;

	// API
	/**
	 * {@code GET /user} : Get all user.
	 * 
	 * @param pageable
	 * @return Page of all User.
	 */
	@GetMapping
	@Operation(summary = "Get all User")
	public ResponseEntity<Page<User>> findAll(Pageable pageable) {
		Page<User> collModel = userService.findAll(pageable);
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
	public ResponseEntity<?> insert(@RequestBody @Valid User requestBody) {
		User user = userService.insert(requestBody);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(user.getUserId())
				.toUri();
		return ResponseEntity.created(location).body(user);
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
	public ResponseEntity<User> read(@PathVariable Integer objectKey) {
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
	public ResponseEntity<?> update(@RequestBody @Valid User requestBody) {
		return ResponseEntity.ok(userService.bulkUpdate(requestBody));
	}

	/**
	 * {@code DELETE  /user/:objectKey} : Delete the user with given objectKey.
	 *
	 * @param objectKey the objectKey of the User to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the User with given objectKey")
	public ResponseEntity<?> delete(@PathVariable Integer objectKey) {
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
	public ResponseEntity<?> search(@Filter Specification<User> specification, Pageable page) {
		Page<User> collModel = userService.search(specification, page);
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
	public ResponseEntity<Page<Order>> getTheOrderByObjectKey(@PathVariable Integer objectKey,
			Pageable pageable) {
		User user = new User();
		user.setUserId(objectKey);
		Page<Order> collModel = orderService.findByTheUser(user, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<User> toResponseEntity(Optional<User> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse.map(response -> new ResponseEntity<>(response, header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<T> toResponseEntityPaged(T collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
