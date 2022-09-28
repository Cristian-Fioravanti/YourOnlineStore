package it.yourstore.store.service;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.yourstore.store.domain.Ordine;
import it.yourstore.store.domain.Utente;
import it.yourstore.store.repository.OrdineRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class OrdineServiceImpl implements OrdineService {

	private final OrdineRepository ordineRepository;

	@Transactional(readOnly = true)
	public Page<Ordine> findAll(Pageable pageable) {
		return ordineRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public List<Ordine> findAll() {
		return ordineRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Optional<Ordine> findByObjectKey(Integer objectKey) {
		Ordine ordine = new Ordine();
		ordine.setOrdineId(objectKey);
		return ordineRepository.findByOrdineId(ordine.getOrdineId());
	}

	public boolean exists(Integer id) {
		return ordineRepository.existsById(id);
	}

	@Transactional
	public Ordine insert(@Valid Ordine entity) {
		return ordineRepository.save(entity);
	}

	public Ordine update(@Valid Ordine entity) {
		return ordineRepository.save(entity);
	}

	
	@Transactional
	public Optional<Ordine> delete(Integer objectKey) {
		return findByObjectKey(objectKey).map(ordine -> {
			ordineRepository.delete(ordine);
			return Optional.of(ordine);
		}).orElseGet(Optional::empty);
	}

	public Page<Ordine> search(Specification<Ordine> specification, Pageable pageable) {
		return ordineRepository.findAll(specification, pageable);
	}

	public void deleteById(Integer id) {
		ordineRepository.deleteById(id);
	}

	@Transactional()
	public Ordine bulkUpdate(Ordine ordine) {
		Ordine update = this.update(ordine);
		return update;
	}

	public Page<Ordine> findByTheUtente(Utente parentEntity, Pageable pageable) {
		return ordineRepository.findByTheUtente(parentEntity, pageable);
	}

}
