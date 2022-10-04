package it.yourstore.store.jmsClient;

import java.util.Observable;
import java.util.Properties;

import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicSession;
import javax.jms.TopicSubscriber;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.springframework.jms.annotation.JmsListener;
import org.slf4j.LoggerFactory;


public class AzioniJMSListener extends Observable implements MessageListener {
	private static final org.slf4j.Logger LOG = LoggerFactory.getLogger(AzioniJMSListener.class);
	
    private TopicConnection topicConnection;
    private TopicSession topicSession = null;
    private Destination destination = null;
    private MessageProducer producer = null;
                

	public AzioniJMSListener() {
		
		
                Context jndiContext = null;
                ConnectionFactory topicConnectionFactory = null;
                
                String destinationName = "dynamicTopics/Quotazioni";
                
		try {
			
                    Properties props = new Properties();
        
props.setProperty(Context.INITIAL_CONTEXT_FACTORY,"org.apache.activemq.jndi.ActiveMQInitialContextFactory");
props.setProperty(Context.PROVIDER_URL,"tcp://localhost:61616");
jndiContext = new InitialContext(props);   
                    
                    
                    		
			
			topicConnectionFactory = (ConnectionFactory)jndiContext.lookup("ConnectionFactory");
                        destination = (Destination)jndiContext.lookup(destinationName);
			topicConnection = (TopicConnection)topicConnectionFactory.createConnection();
                        topicSession = (TopicSession)topicConnection.createSession(false, Session.AUTO_ACKNOWLEDGE);
                        
                        TopicSubscriber topicSubscriber =  
				topicSession.createSubscriber((Topic)destination);
			
			topicSubscriber.setMessageListener(this);
		} catch (JMSException err) {
			err.printStackTrace();
		} catch (NamingException err) {
			err.printStackTrace();
                }
	}

	/**
	 * Chiude la ricezione dei messaggi sulla topic quotazioni
	 */
	public void stop() {
		try {
			topicConnection.stop();
		} catch (JMSException err) {
			err.printStackTrace();
		}
	}

	/**
	 * Apre la ricezione dei messaggi sulla topic quotazioni
	 */
	public void start() {
		try {
			topicConnection.start();
		} catch (JMSException err) {
			err.printStackTrace();
		}
	}
	
	public void onMessage(Message mex) {
		try {
			Integer quantita = mex.getIntProperty("Quantita");
			LOG.info("Ricevuta quantita: "+ quantita);
//			Quotazione quotazione = new Quotazione(nome, valore);

//			super.setChanged();	// rende attivo il cambiamento di stato
//			super.notifyObservers(quotazione);
		} catch (JMSException err) {
			err.printStackTrace();
		}
	}
	@JmsListener(destination = "")
	public void zizze(Message mex) {}

}
