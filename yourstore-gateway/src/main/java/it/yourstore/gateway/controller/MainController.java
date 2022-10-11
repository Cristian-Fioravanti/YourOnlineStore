package it.yourstore.gateway.controller;

import javax.jms.JMSException;
import javax.naming.NamingException;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.websocket.server.PathParam;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.yourstore.gateway.dto.EditProductDto;
import it.yourstore.gateway.jms.ToDatabaseJMSProducer;
import it.yourstore.gateway.service.ProductService;

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

	@PostMapping("/addProduct")
	public String saveProduct(@ModelAttribute EditProductDto requestBody) { //@RequestParam("cost") Integer cost) {
		LOGGER.info("ricevuti i parametri: ");
		LOGGER.info("productName: "+ requestBody.getProductName());
		//LOGGER.info("cost: "+ cost);
		LOGGER.info("disp: "+ requestBody.getDisponibility());
		LOGGER.info("desc: "+ requestBody.getDescription());
		LOGGER.info("image: "+ requestBody.getImage());
		ToDatabaseJMSProducer tDbJmsProducer = new ToDatabaseJMSProducer();
		try {
			tDbJmsProducer.startSendProductToDataBase(requestBody);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home";
	}

}
