package it.yourstore.store.domain;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Hibernate;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name = "order_item")
public class OrderItem implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 612176311L;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(OrderItem.class);

	// ATTRIBUTES
	@NotNull
	@Column(name = "amount", columnDefinition = "INTEGER")
	private Integer amount;

	// CONSTRUCTORS
	public OrderItem() {
		super();
	}

	public OrderItem(OrderItemKey orderItemKey, Integer amount) {
		super();

		this.orderItemKey = orderItemKey;

		this.amount = amount;
	}
	
	// PARENT GETTER/SETTER

	/**
	 * @return the Order
	 */
	public Ordine getTheOrdine() {
		return orderItemKey != null ? orderItemKey.getTheOrdine() : null;
	}

	/**
	 * @param aOrder to set
	 */
	public void setTheOrdine(Ordine aOrder) {
		if (orderItemKey == null) {
			orderItemKey = new OrderItemKey();
		}
		orderItemKey.setTheOrdine(aOrder);
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

	// Equals
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		OrderItem that = (OrderItem) o;
		return orderItemKey != null && Objects.equals(orderItemKey, that.orderItemKey);
	}
}
