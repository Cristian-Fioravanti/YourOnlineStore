package it.yourstore.store;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({ "it.yourstore.store"})
public class YourstoreMsStore {
	public static void main(String[] args) {
		SpringApplication.run(YourstoreMsStore.class, args);
	}
}
