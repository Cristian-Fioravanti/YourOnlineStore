package it.yourstore.gateway.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainController {
	private static final Logger LOGGER = LogManager.getLogger(MainController.class);
	@GetMapping("/login")
	public String prova() {
		return "login";
	}

	@GetMapping("/home")
	public String getHome() {
		return "home";
	}

	@GetMapping("/cart")
	public String getCarello() {
		return "cart";
	}

	@GetMapping("/product/{id:.+}")
	public String getProdotto(@PathVariable String id) {
		return "product";
	}

	@GetMapping("/shipping")
	public String getShipping() {
		return "shipping";
	}
	
	@GetMapping("/addProduct")
	public String getAddProduct() {
		return "addProduct";
	}

}
