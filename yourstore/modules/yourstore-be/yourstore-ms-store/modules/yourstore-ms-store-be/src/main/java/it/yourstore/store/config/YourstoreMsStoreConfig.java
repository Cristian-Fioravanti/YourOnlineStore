package it.yourstore.store.config;

import it.yourstore.store.actuator.YourstoreMsStoreInterceptor;
import it.yourstore.store.actuator.YourstoreMsStoreProperties;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.servlet.handler.MappedInterceptor;

@EnableConfigurationProperties(YourstoreMsStoreProperties.class)
@Configuration
public class YourstoreMsStoreConfig extends WebSecurityConfigurerAdapter {
	@Bean
	public MappedInterceptor metricInterceptor(MeterRegistry registry) {
		return new MappedInterceptor(new String[] { "/**" }, new YourstoreMsStoreInterceptor(registry));
	}
	
	@Override
	  protected void configure(HttpSecurity http) throws Exception {
//	    http
//	      .authorizeRequests(authorize -> authorize.mvcMatchers("/h2/**").permitAll()
//	        .anyRequest().authenticated());
		http.headers().frameOptions().disable();
	  }
}
