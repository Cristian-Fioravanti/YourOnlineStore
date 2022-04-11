package it.yourstore.store.exception;

public class ResourceNotFoundException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ResourceNotFoundException(String id) {
		super(String.format("Resource with id <%s> not found", id));
	}
}

