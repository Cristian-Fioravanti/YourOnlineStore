package it.yourstore.store.service;

import it.yourstore.store.domain.Ordine;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import it.yourstore.store.domain.Utente;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

import javax.validation.Valid;

public interface OrdineService {

	// PARENT-SPECIFIC SERVICES
	Page<Ordine> findByTheUtente(Utente parentEntity, Pageable pageable);

	Ordine bulkUpdate(Ordine ordine);

	Ordine update(Ordine ordine);

	Optional<Ordine> delete(Integer objectKey);

	Page<Ordine> search(Specification<Ordine> specification, Pageable pageable);

	Page<Ordine> findAll(Pageable pageable);

	Ordine insert(@Valid Ordine requestBody);

	Optional<Ordine> findByObjectKey(Integer objectKey);
}
