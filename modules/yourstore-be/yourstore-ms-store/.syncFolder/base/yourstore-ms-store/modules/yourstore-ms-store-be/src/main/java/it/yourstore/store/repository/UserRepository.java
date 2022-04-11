package it.yourstore.store.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import it.yourstore.store.domain.User;

@Repository
@EnableJpaRepositories
public interface UserRepository extends BaseRepository<User, Integer>, JpaSpecificationExecutor<User> {

	Optional<User> findByUserId(Integer id);

	@Query("DELETE FROM User WHERE userId IN ?1")
	void deleteByIdIn(Collection<Integer> ids);
}
