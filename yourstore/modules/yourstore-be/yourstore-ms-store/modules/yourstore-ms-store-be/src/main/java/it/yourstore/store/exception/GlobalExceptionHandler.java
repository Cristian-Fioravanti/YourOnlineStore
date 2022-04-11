package it.yourstore.store.exception;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ValidationException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.security.access.AccessDeniedException;

@RestControllerAdvice
public class GlobalExceptionHandler {

	private final Logger logger = LogManager.getLogger();

	@ExceptionHandler(ResourceNotFoundException.class)
	public ResponseEntity<ApiCallError> handleNotFoundException(HttpServletRequest request,
			ResourceNotFoundException ex) {
		logger.error("ResourceNotFoundException {}\n", request.getRequestURI(), ex);

		return ResponseEntity.status(HttpStatus.NOT_FOUND)
				.body(new ApiCallError("Not found exception", ex.getMessage()));
	}

	@ExceptionHandler(ValidationException.class)
	public ResponseEntity<ApiCallError> handleValidationException(HttpServletRequest request, ValidationException ex) {
		logger.error("ValidationException {}\n", request.getRequestURI(), ex);

		return ResponseEntity.badRequest().body(new ApiCallError("Validation exception", ex.getMessage()));
	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public ResponseEntity<ApiCallError> handleMissingServletRequestParameterException(HttpServletRequest request,
			MissingServletRequestParameterException ex) {
		logger.error("handleMissingServletRequestParameterException {}\n", request.getRequestURI(), ex);

		return ResponseEntity.badRequest().body(new ApiCallError("Missing request parameter", ex.getMessage()));
	}

	@ExceptionHandler(Exception.class)
	public ResponseEntity<ApiCallError> handleInternalServerError(HttpServletRequest request, Exception ex) {
		logger.error("handleInternalServerError {}\n", request.getRequestURI(), ex);

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
				.body(new ApiCallError("Internal server error", ex.getMessage()));
	}
	
	@ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<ApiCallError> handleAccessDeniedException(HttpServletRequest request, AccessDeniedException ex) {
        logger.error("handleAccessDeniedException {}\n", request.getRequestURI(), ex);
  
        return ResponseEntity
                .status(HttpStatus.FORBIDDEN)
                .body(new ApiCallError("Access denied!", ex.getMessage()));
    }
}
