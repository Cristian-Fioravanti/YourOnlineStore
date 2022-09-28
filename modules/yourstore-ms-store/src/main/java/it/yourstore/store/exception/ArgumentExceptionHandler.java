package it.yourstore.store.exception;

import static java.util.Optional.ofNullable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@RestControllerAdvice
public class ArgumentExceptionHandler {

	private final Logger logger = LogManager.getLogger();

	@ExceptionHandler(MethodArgumentTypeMismatchException.class)
	public ResponseEntity<ApiCallError> handleMethodArgumentTypeMismatchException(HttpServletRequest request,
			MethodArgumentTypeMismatchException ex) {
		logger.error("handleMethodArgumentTypeMismatchException {}\n", request.getRequestURI(), ex);

		Map<String, String> details = new HashMap<>();
		details.put("paramName", ex.getName());
		details.put("paramValue", ofNullable(ex.getValue()).map(Object::toString).orElse(""));
		details.put("errorMessage", ex.getMessage());

		return ResponseEntity.badRequest().body(new ApiCallError("Method argument type mismatch", details));
	}

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ApiCallError> handleMethodArgumentNotValidException(HttpServletRequest request,
			MethodArgumentNotValidException ex) {
		logger.error("handleMethodArgumentNotValidException {}\n", request.getRequestURI(), ex);

		List<Map<String, String>> details = new ArrayList<>();
		ex.getBindingResult().getFieldErrors().forEach(fieldError -> {
			Map<String, String> detail = new HashMap<>();
			detail.put("objectName", fieldError.getObjectName());
			detail.put("field", fieldError.getField());
			detail.put("rejectedValue", "" + fieldError.getRejectedValue());
			detail.put("errorMessage", fieldError.getDefaultMessage());
			details.add(detail);
		});

		return ResponseEntity.badRequest().body(new ApiCallError("Method argument validation failed", details));
	}

}
