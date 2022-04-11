package it.yourstore.store.domain;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.FetchType;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.Getter;

import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Hibernate;
import java.util.Objects;

import it.micegroup.voila2runtime.utils.EntityUtils;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "order_item")
public class OrderItem extends BaseEntity implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 612176311L;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(OrderItem.class);

	// ATTRIBUTES
	@NotNull
	@Column(name = "amount", columnDefinition = "INTEGER")
	private Integer amount;

	// IMPORTED PARENTS

	// CONSTRUCTORS
	public OrderItem(String objectKey) {
		super();
		setObjectKey(objectKey);
	}

	public OrderItem(OrderItemKey orderItemKey, Integer amount) {
		super();

		this.orderItemKey = orderItemKey;

		this.amount = amount;
	}

	// CHILDREN

	// PARENTS

	// CHILD GETTER/SETTER

	// ADD CHILD

	// PARENT GETTER/SETTER

	/**
	 * @return the Order
	 */
	public Order getTheOrder() {
		return orderItemKey != null ? orderItemKey.getTheOrder() : null;
	}

	/**
	 * @param aOrder to set
	 */
	public void setTheOrder(Order aOrder) {
		if (orderItemKey == null) {
			orderItemKey = new OrderItemKey();
		}
		orderItemKey.setTheOrder(aOrder);
	}

	/**
	 * @return the Product
	 */
	public Product getTheProduct() {
		return orderItemKey != null ? orderItemKey.getTheProduct() : null;
	}

	/**
	 * @param aProduct to set
	 */
	public void setTheProduct(Product aProduct) {
		if (orderItemKey == null) {
			orderItemKey = new OrderItemKey();
		}
		orderItemKey.setTheProduct(aProduct);
	}

	// PARENT ID GETTER/SETTER

	// PARENT OBJECT TITLE
	/**
	 * Return the object title of theOrder.
	 * 
	 * @return the object title of theOrder.
	 */
	public String getTheOrderObjectTitle() {
		return getTheOrder() != null ? getTheOrder().getObjectTitle() : null;
	}

	/**
	 * Return the object title of theProduct.
	 * 
	 * @return the object title of theProduct.
	 */
	public String getTheProductObjectTitle() {
		return getTheProduct() != null ? getTheProduct().getObjectTitle() : null;
	}

	// PARENT OBJECT KEY
	/**
	 * Return the object key of theOrder.
	 * 
	 * @return the object key of theOrder.
	 */
	public String getTheOrderObjectKey() {
		return getTheOrder() != null ? getTheOrder().getObjectKey() : null;
	}

	/**
	 * Set object key of theOrder.
	 * 
	 */
	public void setTheOrderObjectKey(String objectKey) {
		if (EntityUtils.isValueChanged(getTheOrderObjectKey(), objectKey, false)) {
			Order order = new Order();
			order.setObjectKey(objectKey);
			setTheOrder(order);
		}
	}

	/**
	 * Return the object key of theProduct.
	 * 
	 * @return the object key of theProduct.
	 */
	public String getTheProductObjectKey() {
		return getTheProduct() != null ? getTheProduct().getObjectKey() : null;
	}

	/**
	 * Set object key of theProduct.
	 * 
	 */
	public void setTheProductObjectKey(String objectKey) {
		if (EntityUtils.isValueChanged(getTheProductObjectKey(), objectKey, false)) {
			Product product = new Product();
			product.setObjectKey(objectKey);
			setTheProduct(product);
		}
	}

	// IMPORTED PARENT OBJECT KEY

	// OPERATIONS

	// OBJECT KEY
	/**
	 * Restituisce l'identificativo della chiave in formato stringa. Ritorna
	 * conveniente nelle selezioni da lista.
	 * 
	 * @return L'identificativo della chiave in formato pk1||pk2||pk3...
	 */
	public String getObjectKey() {
		return getObjectKeyById(getOrderItemKey());
	}

	public String getObjectKeyById(OrderItemKey identification) {
		if (identification == null) {
			return null;
		}
		StringBuilder output = new StringBuilder();
		output.append(identification.getOrderId());
		output.append(getRowIdFieldDelimiter());
		output.append(identification.getProductId());
		return output.toString();
	}

	/**
	 * Inizializza la parte identificativa del bean in base alla stringa tokenizzata
	 * da "||" fornita in input.
	 * 
	 * @param key L'identificativo della chiave in formato pk1||pk2||pk3...
	 */
	public void setObjectKey(String key) {
		if (key == null || key.trim().length() == 0) {
			return;
		}
		String[] array = StringUtils.splitByWholeSeparatorPreserveAllTokens(key, getRowIdFieldDelimiter());
		int ctr = 0;

		orderItemKey = new OrderItemKey();
		orderItemKey.setOrderId(getIntegerCheckedAgainstNullContent(array[ctr]));
		ctr++;
		orderItemKey.setProductId(getIntegerCheckedAgainstNullContent(array[ctr]));
	}

	// OBJECT TITLE
	public String getObjectTitle() {
		StringBuilder output = new StringBuilder();
		output.append(getObjectKey());
		return output.toString();
	}

	// COMPOSITE PRIMARY KEY
	@EmbeddedId
	private OrderItemKey orderItemKey;

	// GETTER/SETTER CK
	/**
	 * @return the orderItemKey
	 */
	public OrderItemKey getOrderItemKey() {
		return this.orderItemKey;
	}

	/**
	 * @param orderItemKey to set
	 */
	public void setOrderItemKey(OrderItemKey orderItemKey) {
		this.orderItemKey = orderItemKey;
	}

	// COMPOSITE KEY CLASS

	// Equals / HashCode
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		OrderItem that = (OrderItem) o;
		return orderItemKey != null && Objects.equals(orderItemKey, that.orderItemKey);
	}

	@Override
	public int hashCode() {
		return Objects.hash(orderItemKey);
	}
}
