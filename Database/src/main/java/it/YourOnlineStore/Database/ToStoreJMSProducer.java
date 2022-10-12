/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.YourOnlineStore.Database;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageConsumer;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.NamingException;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class ToStoreJMSProducer {

	private static final org.slf4j.Logger LOG = LoggerFactory.getLogger(ToStoreJMSProducer.class);
	
	Context jndiContext = null;
	ActiveMQConnectionFactory connectionFactory = null;
	Connection connection = null;
	Session session = null;
	Destination queue = null;
	Destination productInfoDest = null;
	MessageProducer producer = null;
	String destinationName = "StockToStore";
	MessageConsumer responseConsumer = null;
	
	public void start() {
		connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
        try {
			connection = connectionFactory.createConnection();
			connection.start();
			session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			queue = session.createQueue(destinationName);

			producer = session.createProducer(queue);
			producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
			
//			Product product = new Product();
//			product.setProductId(1);
//			sendInsert(product);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void sendInsert(Product product) throws NamingException, JMSException, InterruptedException {
		TextMessage message = null;
		message = session.createTextMessage();
		Integer productId = product.getProductId();
		String state = "NewProduct";
		try {
			message.setStringProperty("State", state);
			message.setIntProperty("ProductId", productId);
			LOG.info("Invio idProdotto: " + productId);

			producer.send(message);
		} catch (Exception err) {
			err.printStackTrace();
		}
	}

//	private Integer rmID() {
//		Random randomGen = new Random();
//		Integer val = randomGen.nextInt();
//		return val;
//	}

}
