package it.yourstore.store;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({ "it.yourstore", "it.micegroup.voila2runtime" })
public class YourstoreMsStore {
	public static void main(String[] args) {
		SpringApplication.run(YourstoreMsStore.class, args);
	}
}
