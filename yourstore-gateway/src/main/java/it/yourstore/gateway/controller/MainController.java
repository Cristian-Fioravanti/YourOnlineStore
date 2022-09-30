package it.yourstore.gateway.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class MainController {
	
	@RequestMapping("/prova")
    public String prova() {
		return "prova";
    } 
	
	@RequestMapping("/home")
    public String getHome() {
		return "home";
    } 
	
	@RequestMapping("/cart")
    public String getCarello() {
		return "cart";
    } 
	
	@RequestMapping("/product")
    public String getProdotto() {
		return "product";
    } 
	
	@RequestMapping("/shipping")
    public String getShipping() {
		return "shipping";
    } 
	
	@RequestMapping("/listprod")
    public String getListProduct() {
		return "listProduct";
    } 
	
//	@PostMapping("/addPoduct")
//	   public String saveProduct(@RequestParam("file") MultipartFile file,
//	   		@RequestParam("pname") String name,
//	   		@RequestParam("price") int price,
//	   		@RequestParam("desc") String desc)
//	   {
//	   	productService.saveProductToDB(file, name, desc, price);
//	   	return "redirect:/home";
//	   }
	
}
