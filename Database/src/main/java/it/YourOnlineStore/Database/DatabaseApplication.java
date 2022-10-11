package it.YourOnlineStore.Database;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DatabaseApplication {

	public static void main(String[] args) {
		SpringApplication.run(DatabaseApplication.class, args);
		FromStoreJMSListener listenerStore = new FromStoreJMSListener();
		ToStoreJMSProducer producer = new ToStoreJMSProducer();
		listenerStore.start();
		producer.start();
	}

}
