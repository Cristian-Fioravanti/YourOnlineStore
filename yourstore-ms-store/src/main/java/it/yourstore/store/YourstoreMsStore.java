package it.yourstore.store;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import it.yourstore.store.jmsClient.FromDatabaseJMSListener;
import it.yourstore.store.jmsClient.ToDatabaseJMSProducer;

@SpringBootApplication
@ComponentScan({ "it.yourstore.store"})
public class YourstoreMsStore {
	public static void main(String[] args) {
		SpringApplication.run(YourstoreMsStore.class, args);
		
	}
	
	@Bean
	public FromDatabaseJMSListener listener() {
		FromDatabaseJMSListener listener = new FromDatabaseJMSListener();
		listener.start();
		return listener;
	}
	
	@Bean
	public ToDatabaseJMSProducer producer() {
		ToDatabaseJMSProducer producer = new ToDatabaseJMSProducer();
		producer.start();
		return producer;
	}
}