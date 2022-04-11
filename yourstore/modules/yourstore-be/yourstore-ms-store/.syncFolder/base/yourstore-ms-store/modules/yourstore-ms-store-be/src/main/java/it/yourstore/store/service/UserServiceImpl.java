package it.yourstore.store.service;

import java.util.List;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import it.yourstore.store.domain.User;

import it.yourstore.store.repository.UserRepository;
import lombok.RequiredArgsConstructor;

import java.util.stream.Collectors;

import it.yourstore.store.domain.Order;
import it.micegroup.voila2runtime.entity.GenericEntity;

@RequiredArgsConstructor
@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl implements UserService {

	private final UserRepository userRepository;

	// CHILD SERVICES
	private final OrderService orderService;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(UserServiceImpl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll(org.
	 * springframework.data.domain.Pageable)
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<User> findAll(Pageable pageable) {
		return userRepository.findAll(pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#findAll()
	 */
	@Override
	@Transactional(readOnly = true)
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Optional<User> findByObjectKey(String objectKey) {
		User user = new User(objectKey);
		return userRepository.findByUserId(user.getUserId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#exists(java.lang.
	 * Object)
	 */
	@Override
	public boolean exists(Integer id) {
		return userRepository.existsById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#insert(java.
	 * lang.Object)
	 */
	@Override
	@Transactional
	public User insert(@Valid User entity) {
		return userRepository.save(entity);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#update(java.
	 * lang.Object)
	 */
	@Override
	public User update(@Valid User entity) {
		return userRepository.save(entity);
	}

	@Override
	@Transactional
	public Optional<User> delete(String objectKey) {
		return findByObjectKey(objectKey).map(user -> {
			userRepository.delete(user);
			return Optional.of(user);
		}).orElseGet(Optional::empty);
	}

	@Override
	public Page<User> search(Specification<User> specification, Pageable pageable) {
		return userRepository.findAll(specification, pageable);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see it.yourstore.store.service.GenericEntityService#deleteById(java.lang.
	 * Object)
	 */
	@Override
	public void deleteById(Integer id) {
		userRepository.deleteById(id);
	}

	@Override
	@Transactional()
	public User bulkUpdate(User user) {
		if (user.getTheOrder() != null) {
			List<Order> updateTheOrder = user.getTheOrder().stream().filter(child -> !child.isDeletedEntityState())
					.collect(Collectors.toList());
			List<Order> deleteTheOrder = user.getTheOrder().stream().filter(GenericEntity::isDeletedEntityState)
					.collect(Collectors.toList());
			user.setTheOrder(updateTheOrder);
			deleteTheOrder.forEach(child -> orderService.deleteById(child.getOrderId()));
		}
		User update = this.update(user);
		return update;
	}

}
