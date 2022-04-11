package it.yourstore.store.config;

import it.yourstore.store.actuator.YourstoreMsStoreInterceptor;
import it.yourstore.store.actuator.YourstoreMsStoreProperties;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.MappedInterceptor;

@EnableConfigurationProperties(YourstoreMsStoreProperties.class)
@Configuration
public class YourstoreMsStoreConfig {
	@Bean
	public MappedInterceptor metricInterceptor(MeterRegistry registry) {
		return new MappedInterceptor(new String[] { "/**" }, new YourstoreMsStoreInterceptor(registry));
	}
}
