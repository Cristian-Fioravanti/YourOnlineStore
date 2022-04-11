package it.yourstore.store.service;

import it.yourstore.store.domain.User;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

public interface UserService extends BaseEntityService<User, Integer> {

	// PARENT-SPECIFIC SERVICES

	User bulkUpdate(User user);

	User update(User user);

	Optional<User> delete(String objectKey);

	Page<User> search(Specification<User> specification, Pageable pageable);
}
