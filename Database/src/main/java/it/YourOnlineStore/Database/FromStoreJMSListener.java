package it.YourOnlineStore.Database;

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
import javax.jms.TopicSession;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;


public class FromStoreJMSListener implements MessageListener {
	private static final org.slf4j.Logger LOG = LoggerFactory.getLogger(FromStoreJMSListener.class);
	@Autowired
	public ProductService productService;

	private Connection connection;
	private TopicSession topicSession = null;
	private Session session;
	private Destination queue = null;
	private MessageProducer producer = null;
	ActiveMQConnectionFactory connectionFactory = null;

	/**
	 * Chiude la ricezione dei messaggi sulla topic quotazioni
	 */
	public void stop() {
		try {
			connection.stop();
		} catch (JMSException err) {
			err.printStackTrace();
		}
	}

	/**
	 * Apre la ricezione dei messaggi sulla topic quotazioni
	 */
	public void start() {
		try {
			connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
			connection = connectionFactory.createConnection();
			connection.start();
			this.session = connection.createSession(false,Session.AUTO_ACKNOWLEDGE);
			queue = this.session.createQueue("StoreToStock");

			this.producer = this.session.createProducer(null);
			this.producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);

			MessageConsumer consumer = this.session.createConsumer(queue);
			consumer.setMessageListener(this);
		} catch (JMSException err) {
			err.printStackTrace();
		}
	}

	public void onMessage(Message mex) {
		try {
			String state = mex.getStringProperty("State");
			switch (state) {
			case "ProductInfo":
				TextMessage messageProduct = null;
				messageProduct = this.session.createTextMessage();
				Integer productId = mex.getIntProperty("ProductId");
				LOG.info("Getting info product with ID: " + productId);
//				if(productService.exists(productId)) {
//					Product product = productService.findByObjectKey(productId).get();
//					messageProduct.setIntProperty("Disponibility", product.getDisponibility());
//					messageProduct.setIntProperty("Cost", product.getCost());
					messageProduct.setIntProperty("Disponibility", 10);
					messageProduct.setIntProperty("Cost", 20);
					messageProduct.setJMSCorrelationID(mex.getJMSCorrelationID());

		            //Send the response to the Destination specified by the JMSReplyTo field of the received message,
		            //this is presumably a temporary queue created by the client
		            this.producer.send(mex.getJMSReplyTo(), messageProduct);
//				}
//				else {
//					messageProduct.setText("ERROE, PRODUCT DOESN'T EXISTS");
//				}
				break;
			case "PurchasedProduct":
				Integer prodId = mex.getIntProperty("ProductId");
				Integer amount = mex.getIntProperty("Amount");
				LOG.info("Got Message ProdottoAcquistato with: ( Amount: " + amount + ", prodId: "
						+ prodId + " )");
				// UPDATE di db
				break;
			default:
				break;
			}
		} catch (JMSException err) {
			err.printStackTrace();
		}
	}

}
