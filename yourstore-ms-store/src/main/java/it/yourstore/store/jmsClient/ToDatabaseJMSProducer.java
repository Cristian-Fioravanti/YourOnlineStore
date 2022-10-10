/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package it.yourstore.store.jmsClient;

import java.util.Random;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.NamingException;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class ToDatabaseJMSProducer implements MessageListener{

	private static final org.slf4j.Logger LOG = LoggerFactory.getLogger(ToDatabaseJMSProducer.class);

	Context jndiContext = null;
	ActiveMQConnectionFactory connectionFactory = null;
	Connection connection = null;
	Session session = null;
	Destination queue = null;
	Destination productInfoDest = null;
	MessageProducer producer = null;
	String destinationName = "StoreToStock";
	MessageConsumer responseConsumer = null;

	public void start()  {
		connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
        try {
			connection = connectionFactory.createConnection();
			connection.start();
			session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			queue = session.createQueue(destinationName);

			producer = session.createProducer(queue);
			producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
//			int i = 0;
//			int j = 1;
//			while(true) {
//				
			sendInfoProdottoRequest(1);
//			i+=2;
//			j+=2;
//			Thread.sleep(10000);
//			}
			Thread.sleep(10000);
			sendPurchasedProductNotification(1,1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	public void sendInfoProdottoRequest(Integer productId) {
		try {
			Destination tempDest = session.createTemporaryQueue();
			MessageConsumer responseConsumer = session.createConsumer(tempDest);
            responseConsumer.setMessageListener(this);
            
            TextMessage message = session.createTextMessage();
			message.setJMSReplyTo(tempDest);
			String correlationId = this.createRandomString();
            message.setJMSCorrelationID(correlationId);
			
			message.setStringProperty("State", "ProductInfo");
			message.setIntProperty("ProductId", productId);
			
			LOG.info("Send product info request to Database... Product id: " + productId);
			try {
				producer.send(message);
			} catch (Exception err) {
				err.printStackTrace();
			}
		} catch (JMSException e) {
			LOG.error("Exception occurred: " + e);
		}
	}
	
	public void sendPurchasedProductNotification(Integer productId, Integer amount) {
		try {
			TextMessage message = session.createTextMessage();

			message.setStringProperty("State", "PurchasedProduct");
			message.setIntProperty("ProductId", productId);
			message.setIntProperty("Amount", amount);
			LOG.info("Send purchased product notification to Database... Product id and amount: " + productId + ", " + amount);
			try {
				producer.send(message);
			} catch (Exception err) {
				err.printStackTrace();
			}
		} catch (JMSException e) {
			LOG.error("Exception occurred: " + e);
		}
	}

	@Override
	public void onMessage(Message message) {
		Integer disp;
		Integer cost;
        try {
            if (message instanceof TextMessage) {
                TextMessage textMessage = (TextMessage) message;
                cost = textMessage.getIntProperty("Cost");
                disp = textMessage.getIntProperty("Disponibility");
                LOG.info("Disponibilita = " + disp);
                LOG.info("Costo = " + cost);
            }
        } catch (JMSException e) {
            //Handle the exception appropriately
        }		
	}
	
	private String createRandomString() {
        Random random = new Random(System.currentTimeMillis());
        long randomLong = random.nextLong();
        return Long.toHexString(randomLong);
    }
}
