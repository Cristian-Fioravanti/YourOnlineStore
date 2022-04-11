package it.yourstore.store.repository;

import it.micegroup.voila2runtime.repository.GenericRepository;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * Generic class for repository
 *
 */
@NoRepositoryBean
public interface BaseRepository<T, I> extends GenericRepository<T, I> {
}
