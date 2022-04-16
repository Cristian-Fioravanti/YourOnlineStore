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
import it.yourstore.store.domain.Ordine;
import it.yourstore.store.domain.Utente;
import it.yourstore.store.exception.ResourceNotFoundException;
import it.yourstore.store.service.OrderItemService;
import it.yourstore.store.service.OrdineService;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor
@RestController
@RequestMapping(value = "/ordine", produces = MediaType.APPLICATION_JSON_VALUE)
public class OrdineController{
	/// ENTITY SERVICE
	@Autowired
	OrdineService ordineService;
	// CHILD SERVICES
	@Autowired
	OrderItemService orderItemService;
	
	// API
	/**
	 * {@code GET /ordine} : Get all ordine.
	 * 
	 * @param pageable
	 * @return Page of all Ordine.
	 */
	@GetMapping
	@Operation(summary = "Get all Ordine")
	public ResponseEntity<Page<Ordine>> findAll(Pageable pageable) {
		Page<Ordine> collModel = ordineService.findAll(pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * {@code POST  /ordine} : Create a new Ordine.
	 *
	 * @param requestBody the Ordine to create.
	 * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with
	 *         body the new Ordine, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is invalid.
	 * @throws URISyntaxException if the Location URI syntax is incorrect.
	 */
	@PostMapping
	@Operation(summary = "Create a new Ordine")
	public ResponseEntity<?> insert(@RequestBody @Valid Ordine requestBody) {
		Ordine ordine = ordineService.insert(requestBody);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(ordine.getOrdineId())
				.toUri();
		return ResponseEntity.created(location).body(ordine);
	}

	/**
	 * {@code GET  /ordine/:objectKey} : Get the ordine with given objectKey.
	 *
	 * @param objectKey the objectKey of the ordine to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the ordine, or with status {@code 404 (Not Found)}.
	 */
	@GetMapping("/{objectKey:.+}")
	@Operation(summary = "Get the Ordine with given objectKey")
	public ResponseEntity<Ordine> read(@PathVariable Integer objectKey) {
		Optional<Ordine> opt = Optional.of(
				ordineService.findByObjectKey(objectKey).orElseThrow(() -> new ResourceNotFoundException(objectKey)));
		return toResponseEntity(opt, null, HttpStatus.OK);
	}

	/**
	 * {@code PUT  /ordine} : Updates an existing Ordine.
	 *
	 * @param requestBody the Ordine to update.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the updated Ordine, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is not valid, or with status
	 *         {@code 500 (Internal Server Error)} if the Ordine couldn't be updated.
	 */
	@PutMapping
	@Operation(summary = "Update an existing Ordine")
	public ResponseEntity<?> update(@RequestBody @Valid Ordine requestBody) {
		return ResponseEntity.ok(ordineService.bulkUpdate(requestBody));
	}

	/**
	 * {@code DELETE  /ordine/:objectKey} : Delete the ordine with given objectKey.
	 *
	 * @param objectKey the objectKey of the Ordine to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the Ordine with given objectKey")
	public ResponseEntity<?> delete(@PathVariable Integer objectKey) {
		return ordineService.delete(objectKey).map(ResponseEntity::ok)
				.orElseThrow(() -> new ResourceNotFoundException(objectKey));
	}

	/**
	 * {@code GET  /ordine/search?filter=:query} : Get the ordine filtered by given
	 * query.
	 *
	 * @param query the query to execute filtering the Ordine to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the ordine.
	 */
	@GetMapping("/search")
	@Operation(summary = "Get the Ordine filtered by given query")
	public ResponseEntity<?> search(@Filter Specification<Ordine> specification, Pageable page) {
		Page<Ordine> collModel = ordineService.search(specification, page);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /{objectKey:.+}/ordine-item: Get all OrdineItem (childs) for the given
	 * Ordine by objectKey
	 * 
	 * @param objectKey ObjectKey of Ordine
	 * @param pageable
	 * @return Page of all OrdineItem for the given Ordine
	 */
	@GetMapping("/{objectKey:.+}/ordine-item")
	@Operation(summary = "Get all OrdineItem (childs) for the given Ordine by objectKey")
	public ResponseEntity<Page<OrderItem>> getTheOrderItemByObjectKey(@PathVariable Integer objectKey,
			Pageable pageable) {
		Ordine ordine = new Ordine();
		ordine.setOrdineId(objectKey);
		Page<OrderItem> collModel = orderItemService.findByTheOrdine(ordine, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /findByTheUtente/utenteObjectKey: Search all Ordine for the given Utente
	 * (parent)
	 * 
	 * @param utenteObjectKey of Utente
	 * @param pageable
	 * @return Page of Ordine for the given Utente (parent)
	 */
	@GetMapping("/findByTheUtente/{utenteObjectKey:.+}")
	@Operation(summary = "Get all Ordine for the given Utente (parent)")
	public ResponseEntity<Page<Ordine>> findByUtente(@PathVariable Integer utenteObjectKey, Pageable pageable) {
		Utente key = new Utente();
		key.setUtenteId(utenteObjectKey);
		Page<Ordine> collModel = ordineService.findByTheUtente(key, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<Ordine> toResponseEntity(Optional<Ordine> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse
				.map(response -> new ResponseEntity<>(response, header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<Page<T>> toResponseEntityPaged(Page<T> collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
