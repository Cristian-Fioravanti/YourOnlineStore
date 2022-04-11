package it.yourstore.store.domain;

import it.yourstore.commons.utilities.Constants;
import it.micegroup.voila2runtime.entity.GenericEntity;

/**
 * Generic class for entities
 *
 */
public abstract class BaseEntity extends GenericEntity {

	protected String getRowIdFieldDelimiter() {
		return Constants.ROWIDFIELDDELIMITER;
	}
}
