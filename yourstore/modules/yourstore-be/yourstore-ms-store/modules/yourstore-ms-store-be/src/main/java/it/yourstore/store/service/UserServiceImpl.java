package it.yourstore.store.service;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.yourstore.store.domain.User;
import it.yourstore.store.repository.UserRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class UserServiceImpl implements UserService {

	private final UserRepository userRepository;

	@Transactional(readOnly = true)
	public Page<User> findAll(Pageable pageable) {
		return userRepository.findAll(pageable);
	}

	@Transactional(readOnly = true)
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Optional<User> findByObjectKey(Integer objectKey) {
		User user = new User();
		user.setUserId(objectKey);
		return userRepository.findByUserId(user.getUserId());
	}

	public boolean exists(Integer id) {
		return userRepository.existsById(id);
	}

	public User insert(@Valid User entity) {
		return userRepository.save(entity);
	}

	public User update(@Valid User entity) {
		return userRepository.save(entity);
	}

	@Transactional
	public Optional<User> delete(Integer objectKey) {
		return findByObjectKey(objectKey).map(user -> {
			userRepository.delete(user);
			return Optional.of(user);
		}).orElseGet(Optional::empty);
	}

	public Page<User> search(Specification<User> specification, Pageable pageable) {
		return userRepository.findAll(specification, pageable);
	}

	public void deleteById(Integer id) {
		userRepository.deleteById(id);
	}

	@Transactional()
	public User bulkUpdate(User user) {
		User update = this.update(user);
		return update;
	}

}
