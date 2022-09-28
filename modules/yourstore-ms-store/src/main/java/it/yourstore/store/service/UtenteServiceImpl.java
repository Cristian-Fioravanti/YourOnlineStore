package it.yourstore.store.service;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.yourstore.store.domain.Utente;
import it.yourstore.store.repository.UtenteRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class UtenteServiceImpl implements UtenteService {

	private final UtenteRepository utenteRepository;

	@Transactional(readOnly = true)
	public Page<Utente> findAll(Pageable pageable) {
		return utenteRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public List<Utente> findAll() {
		return utenteRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Optional<Utente> findByObjectKey(Integer objectKey) {
		Utente utente = new Utente();
		utente.setUtenteId(objectKey);
		return utenteRepository.findByUtenteId(utente.getUtenteId());
	}

	public boolean exists(Integer id) {
		return utenteRepository.existsById(id);
	}

	public Utente insert(@Valid Utente entity) {
		return utenteRepository.save(entity);
	}

	public Utente update(@Valid Utente entity) {
		return utenteRepository.save(entity);
	}

	@Transactional
	public Optional<Utente> delete(Integer objectKey) {
		return findByObjectKey(objectKey).map(utente -> {
			utenteRepository.delete(utente);
			return Optional.of(utente);
		}).orElseGet(Optional::empty);
	}

	public Page<Utente> search(Specification<Utente> specification, Pageable pageable) {
		return utenteRepository.findAll(specification, pageable);
	}

	public void deleteById(Integer id) {
		utenteRepository.deleteById(id);
	}

	@Transactional()
	public Utente bulkUpdate(Utente utente) {
		Utente update = this.update(utente);
		return update;
	}

}
