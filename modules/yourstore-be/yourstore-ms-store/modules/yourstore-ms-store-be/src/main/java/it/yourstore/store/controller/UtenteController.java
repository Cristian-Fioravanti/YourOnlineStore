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
import it.yourstore.store.domain.Ordine;
import it.yourstore.store.domain.Utente;
import it.yourstore.store.exception.ResourceNotFoundException;
import it.yourstore.store.service.OrdineService;
import it.yourstore.store.service.UtenteService;
import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor
@RestController
@RequestMapping(value = "/utente", produces = MediaType.APPLICATION_JSON_VALUE)
public class UtenteController {
	/// ENTITY SERVICE
	@Autowired
	UtenteService utenteService;
	// CHILD SERVICES
	@Autowired
	OrdineService ordineService;

	// API
	/**
	 * {@code GET /utente} : Get all utente.
	 * 
	 * @param pageable
	 * @return Page of all Utente.
	 */
	@GetMapping
	@Operation(summary = "Get all Utente")
	public ResponseEntity<Page<Utente>> findAll(Pageable pageable) {
		Page<Utente> collModel = utenteService.findAll(pageable);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * {@code POST  /utente} : Create a new Utente.
	 *
	 * @param requestBody the Utente to create.
	 * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with
	 *         body the new Utente, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is invalid.
	 * @throws URISyntaxException if the Location URI syntax is incorrect.
	 */
	@PostMapping
	@Operation(summary = "Create a new Utente")
	public ResponseEntity<?> insert(@RequestBody @Valid Utente requestBody) {
		Utente utente = utenteService.insert(requestBody);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(utente.getUtenteId())
				.toUri();
		return ResponseEntity.created(location).body(utente);
	}

	/**
	 * {@code GET  /utente/:objectKey} : Get the utente with given objectKey.
	 *
	 * @param objectKey the objectKey of the utente to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the utente, or with status {@code 404 (Not Found)}.
	 */
	@GetMapping("/{objectKey:.+}")
	@Operation(summary = "Get the Utente with given objectKey")
	public ResponseEntity<Utente> read(@PathVariable Integer objectKey) {
		Optional<Utente> opt = Optional
				.of(utenteService.findByObjectKey(objectKey).orElseThrow(() -> new ResourceNotFoundException(objectKey)));
		return toResponseEntity(opt, null, HttpStatus.OK);
	}

	/**
	 * {@code PUT  /utente} : Updates an existing Utente.
	 *
	 * @param requestBody the Utente to update.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the updated Utente, or with status {@code 400 (Bad Request)} if the
	 *         requestBody is not valid, or with status
	 *         {@code 500 (Internal Server Error)} if the Utente couldn't be updated.
	 */
	@PutMapping
	@Operation(summary = "Update an existing Utente")
	public ResponseEntity<?> update(@RequestBody @Valid Utente requestBody) {
		return ResponseEntity.ok(utenteService.bulkUpdate(requestBody));
	}

	/**
	 * {@code DELETE  /utente/:objectKey} : Delete the utente with given objectKey.
	 *
	 * @param objectKey the objectKey of the Utente to delete.
	 * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
	 */
	@DeleteMapping("/{objectKey:.+}")
	@Operation(summary = "Delete the Utente with given objectKey")
	public ResponseEntity<?> delete(@PathVariable Integer objectKey) {
		return utenteService.delete(objectKey).map(ResponseEntity::ok)
				.orElseThrow(() -> new ResourceNotFoundException(objectKey));
	}

	/**
	 * {@code GET  /utente/search?filter=:query} : Get the utente filtered by given
	 * query.
	 *
	 * @param query the query to execute filtering the Utente to retrieve.
	 * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body
	 *         the utente.
	 */
	@GetMapping("/search")
	@Operation(summary = "Get the Utente filtered by given query")
	public ResponseEntity<?> search(@Filter Specification<Utente> specification, Pageable page) {
		Page<Utente> collModel = utenteService.search(specification, page);
		return toResponseEntityPaged(collModel, null);
	}

	/**
	 * GET /{objectKey:.+}/ordine: Get all Ordine (childs) for the given Utente by
	 * objectKey
	 * 
	 * @param objectKey ObjectKey of Utente
	 * @param pageable
	 * @return Page of all Ordine for the given Utente
	 */
	@GetMapping("/{objectKey:.+}/ordine")
	@Operation(summary = "Get all Ordine (childs) for the given Utente by objectKey")
	public ResponseEntity<Page<Ordine>> getTheOrdineByObjectKey(@PathVariable Integer objectKey,
			Pageable pageable) {
		Utente utente = new Utente();
		utente.setUtenteId(objectKey);
		Page<Ordine> collModel = ordineService.findByTheUtente(utente, pageable);
		return toResponseEntityPaged(collModel, null);
	}

	private ResponseEntity<Utente> toResponseEntity(Optional<Utente> maybeResponse, HttpHeaders header,
			HttpStatus status) {
		return maybeResponse.map(response -> new ResponseEntity<>(response, header, status))
				.orElseGet(() -> ResponseEntity.notFound().build());
	}

	private <T> ResponseEntity<T> toResponseEntityPaged(T collModel, HttpHeaders header) {
		return ResponseEntity.ok().headers(header).body(collModel);
	}
}
