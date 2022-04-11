package it.yourstore.store.actuator;

import io.micrometer.core.instrument.MeterRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class YourstoreMsStoreInterceptor implements HandlerInterceptor {

	private static Logger log = LoggerFactory.getLogger(YourstoreMsStoreInterceptor.class);

	private MeterRegistry registry;
	private String URI, pathKey, METHOD;

	public YourstoreMsStoreInterceptor(MeterRegistry registry) {
		this.registry = registry;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		URI = request.getRequestURI();
		METHOD = request.getMethod();
		if (!URI.contains("prometheus")) {
			log.info(" >> PATH: {}", URI);
			log.info(" >> METHOD: {}", METHOD);

			pathKey = "api_".concat(METHOD.toLowerCase()).concat(URI.replaceAll("/", "_").toLowerCase());
			this.registry.counter(pathKey).increment();
		}
	}
}
