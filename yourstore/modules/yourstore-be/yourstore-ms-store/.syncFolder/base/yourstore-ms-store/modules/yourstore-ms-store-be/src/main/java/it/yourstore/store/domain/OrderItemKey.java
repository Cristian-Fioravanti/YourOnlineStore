package it.yourstore.store.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;
import lombok.ToString;
import it.micegroup.voila2runtime.utils.EntityUtils;
import javax.validation.constraints.NotNull;

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

	@Override
	public int hashCode() {
		int result = 0;
		result = result + (theOrder != null ? theOrder.hashCode() : 0);
		result = result + (theProduct != null ? theProduct.hashCode() : 0);
		result = 31 * result;
		return result;
	}

	// PARENT OBJECT KEY/TITLE
	/**
	 * Return the object key of theOrder.
	 * 
	 * @return the object key of theOrder.
	 */
	public String getTheOrderObjectKey() {
		return getTheOrder() != null ? getTheOrder().getObjectKey() : null;
	}

	/**
	 * Return the object title of theOrder.
	 * 
	 * @return the object title of theOrder.
	 */
	public String getTheOrderObjectTitle() {
		return getTheOrder() != null ? getTheOrder().getObjectTitle() : null;
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
	 * Return the object title of theProduct.
	 * 
	 * @return the object title of theProduct.
	 */
	public String getTheProductObjectTitle() {
		return getTheProduct() != null ? getTheProduct().getObjectTitle() : null;
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

}
