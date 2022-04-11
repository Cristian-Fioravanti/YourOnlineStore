package it.yourstore.store.service;

import it.yourstore.store.domain.User;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

import javax.validation.Valid;

public interface UserService {

	// PARENT-SPECIFIC SERVICES

	User bulkUpdate(User user);

	User update(User user);

	Optional<User> delete(Integer objectKey);

	Page<User> search(Specification<User> specification, Pageable pageable);

	User insert(@Valid User requestBody);

	Page<User> findAll(Pageable pageable);

	Optional<User> findByObjectKey(Integer objectKey);
}
