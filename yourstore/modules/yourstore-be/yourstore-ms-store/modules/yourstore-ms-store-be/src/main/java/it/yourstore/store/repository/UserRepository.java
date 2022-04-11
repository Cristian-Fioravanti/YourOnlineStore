package it.yourstore.store.repository;

import java.util.Collection;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import it.yourstore.store.domain.User;

@Repository
@EnableJpaRepositories
public interface UserRepository extends JpaRepository<User, Integer>, JpaSpecificationExecutor<User> {

	Optional<User> findByUserId(Integer id);

	@Query("DELETE FROM User WHERE userId IN ?1")
	void deleteByIdIn(Collection<Integer> ids);
}
