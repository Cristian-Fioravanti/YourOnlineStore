/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.yourstore.gateway.jms;

import javax.jms.*;
import javax.naming.*;

import java.util.*;
import java.util.logging.Logger;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import it.yourstore.gateway.dto.EditProductDto;

@Service
public class ToDatabaseJMSProducer {

	private static final org.slf4j.Logger LOG = LoggerFactory.getLogger(ToDatabaseJMSProducer.class);

	Context jndiContext = null;
	ActiveMQConnectionFactory connectionFactory = null;
	Connection connection = null;
	Session session = null;
	Destination queue = null;
	Destination productInfoDest = null;
	MessageProducer producer = null;
	String destinationName = "GatewayToDatabase";
	MessageConsumer responseConsumer = null;

	public void startSendProductToDataBase(EditProductDto product) throws NamingException, JMSException, InterruptedException {
		connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
        connection = connectionFactory.createConnection();
		connection.start();
		session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		queue = session.createQueue(destinationName);

		producer = session.createProducer(queue);
		producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
	
		sendProductToDataBase(product);
	}

	
	public void sendProductToDataBase(EditProductDto product) {
		try {
			
			TextMessage message = session.createTextMessage();
			message.setStringProperty("State", "newProduct");
			message.setStringProperty("description", product.getDescription());
			message.setIntProperty("cost", product.getCost());
			message.setStringProperty("image", product.getImage());
			message.setStringProperty("productName", product.getProductName());
			message.setIntProperty("disponibility", product.getDisponibility());
			try {
				producer.send(message);
				
			} catch (Exception err) {
				err.printStackTrace();
			}
			LOG.info("Inviato al Database il nuovo prodotto");
		} catch (JMSException e) {
			LOG.error("Exception occurred: " + e);
		}
	}

}
