package it.yourstore.store;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import it.yourstore.store.jmsClient.FromDatabaseJMSListener;
import it.yourstore.store.jmsClient.ToDatabaseJMSProducer;

@SpringBootApplication
@ComponentScan({ "it.yourstore.store"})
public class YourstoreMsStore {
	public static void main(String[] args) {
		SpringApplication.run(YourstoreMsStore.class, args);
		FromDatabaseJMSListener listener = new FromDatabaseJMSListener();
		ToDatabaseJMSProducer producer = new ToDatabaseJMSProducer();
		listener.start();
		producer.start();
	}
}