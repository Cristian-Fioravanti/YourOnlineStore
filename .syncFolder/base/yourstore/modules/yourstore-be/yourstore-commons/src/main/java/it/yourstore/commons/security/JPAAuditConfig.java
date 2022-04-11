package it.yourstore.commons.security;

import java.util.Optional;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;

@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class JPAAuditConfig {

	@Bean
	public AuditorAware<String> auditorProvider() {
		return new AuditorAware<String>() {
			@Override
			public Optional<String> getCurrentAuditor() {
				if (SecurityContextHolder.getContext().getAuthentication() != null) {
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
					Jwt token = (Jwt) auth.getPrincipal();
					String subscriber = (String) token.getClaims().get("sub");
					return Optional.of(subscriber);
				}
				return Optional.of("Unknown");
			}
		};
	}
}
