package it.yourstore.gateway.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	@RequestMapping("/login")
    public String prova() {
		return "login";
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
