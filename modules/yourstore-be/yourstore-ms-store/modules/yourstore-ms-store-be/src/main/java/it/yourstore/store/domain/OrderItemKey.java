package it.yourstore.store.domain;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Embeddable
@NoArgsConstructor
public class OrderItemKey implements Serializable {

	// Generated SERIAL UID
	private static final long serialVersionUID = 612176311L;

	// ATTRIBUTES
	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false, insertable = false, updatable = false)
	private Order theOrder;
	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false, insertable = false, updatable = false)
	private Product theProduct;

	// GETTER/SETTER
	/**
	 * Return the orderId from theOrder.
	 * 
	 * @return orderId from theOrder.
	 */
	public Integer getOrderId() {
		// If the parent entity object is null, then return null
		if (getTheOrder() == null) {
			return null;
		}
		// Return requested attribute
		return theOrder.getOrderId();
	}

	/**
	 * Return the productId from theProduct.
	 * 
	 * @return productId from theProduct.
	 */
	public Integer getProductId() {
		// If the parent entity object is null, then return null
		if (getTheProduct() == null) {
			return null;
		}
		// Return requested attribute
		return theProduct.getProductId();
	}

	/**
	 * Imposta il valore dell'attributo orderId, appartenente all'oggetto theOrder,
	 * nell'entity corrente.
	 * 
	 * @param aOrderId
	 *
	 */
	public void setOrderId(Integer aOrderId) {
		// If the parent entity object is null, then create a new one
		if (theOrder == null) {
			theOrder = new Order();
		}
		// Set value to the attribute
		theOrder.setOrderId(aOrderId);
	}

	/**
	 * Imposta il valore dell'attributo productId, appartenente all'oggetto
	 * theProduct, nell'entity corrente.
	 * 
	 * @param aProductId
	 *
	 */
	public void setProductId(Integer aProductId) {
		// If the parent entity object is null, then create a new one
		if (theProduct == null) {
			theProduct = new Product();
		}
		// Set value to the attribute
		theProduct.setProductId(aProductId);
	}

	// FIELD CONSTRUCTOR
	public OrderItemKey(Integer orderId, Integer productId) {
		this.setOrderId(orderId);
		this.setProductId(productId);
	}

	// OF CONSTRUCTOR
	public static OrderItemKey of(Integer orderId, Integer productId) {
		return new OrderItemKey(orderId, productId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		OrderItemKey that = (OrderItemKey) obj;
		if (!Objects.equals(theOrder, that.theOrder))
			return false;
		if (!Objects.equals(theProduct, that.theProduct))
			return false;
		return true;
	}
}
