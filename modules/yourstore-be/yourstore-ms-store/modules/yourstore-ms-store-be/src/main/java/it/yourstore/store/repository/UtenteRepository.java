package it.yourstore.store.repository;

import java.util.Collection;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import it.yourstore.store.domain.Utente;

@Repository
@EnableJpaRepositories
public interface UtenteRepository extends JpaRepository<Utente, Integer>, JpaSpecificationExecutor<Utente> {

	Optional<Utente> findByUtenteId(Integer id);

	@Query("DELETE FROM Utente WHERE utenteId IN ?1")
	void deleteByIdIn(Collection<Integer> ids);
}
