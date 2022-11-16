package it.yourstore.store.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.headers().frameOptions().sameOrigin().and().csrf().disable()
        .authorizeRequests()
        .antMatchers("/ordine/**", "/order-item/**","/product/**","/utente/**", "/error").permitAll()
         .anyRequest().authenticated()
         .and()
         .oauth2Login()
         .defaultSuccessUrl("/loginSuccess")
         .failureUrl("/loginFailure")
         ;
        return http.build();
    }
}
