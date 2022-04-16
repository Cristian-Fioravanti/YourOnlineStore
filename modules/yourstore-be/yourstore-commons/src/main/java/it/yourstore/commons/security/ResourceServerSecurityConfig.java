package it.yourstore.commons.security;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(jsr250Enabled = true, prePostEnabled = true) // Commentare questa per disattivare sicurezza
																			// da keycloak
public class ResourceServerSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		enabledSecurity(http); // ABILITA LA SICUREZZA
		//disabledSecurity(http);
	}

	private void enabledSecurity(HttpSecurity http) throws Exception {
		// http.cors().configurationSource(request -> new
		// CorsConfiguration().applyPermitDefaultValues()).and().authorizeRequests(a ->
		// a.anyRequest().authenticated()).oauth2ResourceServer(
		// httpSecurityOAuth2ResourceServerConfigurer ->
		// httpSecurityOAuth2ResourceServerConfigurer
		// .jwt(jwtConfigurer ->
		// jwtConfigurer.jwtAuthenticationConverter(jwtAuthenticationConverter())));

//		http.csrf().disable().cors()
//				.configurationSource(request -> corsConfigurationSource().getCorsConfiguration(request)).and()
//				.authorizeRequests(a -> {
//					try {
//						a.antMatchers("/h2-console/*").anonymous().anyRequest().permitAll().and().authorizeRequests()
//
//								.anyRequest().authenticated();
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//				}).oauth2ResourceServer(
//						httpSecurityOAuth2ResourceServerConfigurer -> httpSecurityOAuth2ResourceServerConfigurer
//								.jwt(jwtConfigurer -> jwtConfigurer
//										.jwtAuthenticationConverter(jwtAuthenticationConverter())));
		http.csrf().disable();
		http.headers().frameOptions().disable();
	}

//	private void disabledSecurity(HttpSecurity http) throws Exception {
//		http.headers().frameOptions().sameOrigin().and().csrf().disable().cors()
//				.configurationSource(request -> corsConfigurationSource().getCorsConfiguration(request)).and()
//				.authorizeRequests().anyRequest().permitAll();
//
//	}
//
//	@Bean
//	CorsConfigurationSource corsConfigurationSource() {
//		CorsConfiguration configuration = new CorsConfiguration();
//		configuration.setAllowedOrigins(Arrays.asList("*"));
//		configuration.addAllowedHeader("*");
//		configuration.setAllowedMethods(Arrays.asList("HEAD", "GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"));
//		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//		source.registerCorsConfiguration("/**", configuration);
//		return source;
//	}
}
