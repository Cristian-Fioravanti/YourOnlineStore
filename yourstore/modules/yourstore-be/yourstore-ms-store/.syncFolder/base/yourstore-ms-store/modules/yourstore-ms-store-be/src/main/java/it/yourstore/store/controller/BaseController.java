package it.yourstore.store.controller;

import it.micegroup.voila2runtime.controller.GenericController;

import org.springframework.http.ResponseEntity;

/**
 * Generic class for controllers
 *
 */
public class BaseController extends GenericController {
	/**
	 * Authority constant
	 */
	protected static final String AUTH = "hasPrivilege";

	/**
	 * Application name
	 */
	protected static final String APPLICATION_NAME = "yourstore-ms-store";

}
