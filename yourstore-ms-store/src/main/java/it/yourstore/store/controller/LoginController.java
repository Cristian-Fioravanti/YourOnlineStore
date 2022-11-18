package it.yourstore.store.controller;

import java.util.Collections;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

import it.yourstore.store.domain.Utente;
import it.yourstore.store.repository.UtenteRepository;
import it.yourstore.store.service.UtenteService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class LoginController {
	@Autowired
	private OAuth2AuthorizedClientService authorizedClientService;
	
	@Autowired
	private UtenteRepository utenteRepository;
	
	@Autowired
	private UtenteService utenteService;

	@GetMapping("/user")
    public Map<String, Object> user(@AuthenticationPrincipal OAuth2User principal) {
        return Collections.singletonMap("name", principal.getAttribute("name"));
    }

	
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public RedirectView loginSuccess(Model model, OAuth2AuthenticationToken authentication) {
	    OAuth2AuthorizedClient client = authorizedClientService
	    	      .loadAuthorizedClient(
	    	        authentication.getAuthorizedClientRegistrationId(), 
	    	          authentication.getName());
	    String oauthId = client.getPrincipalName();
	    String name = authentication.getPrincipal().getAttribute("given_name");
	    String surname = authentication.getPrincipal().getAttribute("family_name");
	    String email = authentication.getPrincipal().getAttribute("email");
	    Utente utente = null;
	    if(!utenteRepository.findByOauthId(oauthId).isPresent()) {
	    	utente = new Utente();
	    	utente.setEmail(email);
	    	utente.setOauthId(oauthId);
	    	utente.setName(name);
	    	utente.setSurname(surname);
	    	utente.setIsAdmin(false);
	    	utenteService.insert(utente);
	    } else {
	    	utente = utenteRepository.findByOauthId(oauthId).get();
	    }
	    
	    RedirectView redirectView = new RedirectView();
	    redirectView.setUrl("http://localhost:8080/home/"+ utente.getUtenteId());
	    return redirectView;
	}
	
}
