package it.yourstore.store.service;

import it.yourstore.store.domain.Utente;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

import javax.validation.Valid;

public interface UtenteService {

	// PARENT-SPECIFIC SERVICES

	Utente bulkUpdate(Utente utente);

	Utente update(Utente utente);

	Optional<Utente> delete(Integer objectKey);

	Page<Utente> search(Specification<Utente> specification, Pageable pageable);

	Utente insert(@Valid Utente requestBody);

	Page<Utente> findAll(Pageable pageable);

	Optional<Utente> findByObjectKey(Integer objectKey);
}
