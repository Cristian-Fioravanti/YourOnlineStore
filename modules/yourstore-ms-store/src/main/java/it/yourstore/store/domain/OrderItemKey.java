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
	@JoinColumn(name = "ordine_id", referencedColumnName = "ordine_id", nullable = false, insertable = false, updatable = false)
	private Ordine theOrdine;
	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false, insertable = false, updatable = false)
	private Product theProduct;

	// GETTER/SETTER
	/**
	 * Return the ordineId from theOrdine.
	 * 
	 * @return ordineId from theOrdine.
	 */
	public Integer getOrdineId() {
		// If the parent entity object is null, then return null
		if (getTheOrdine() == null) {
			return null;
		}
		// Return requested attribute
		return theOrdine.getOrdineId();
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
	 * Imposta il valore dell'attributo ordineId, appartenente all'oggetto theOrdine,
	 * nell'entity corrente.
	 * 
	 * @param aOrdineId
	 *
	 */
	public void setOrdineId(Integer aOrdineId) {
		// If the parent entity object is null, then create a new one
		if (theOrdine == null) {
			theOrdine = new Ordine();
		}
		// Set value to the attribute
		theOrdine.setOrdineId(aOrdineId);
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
	public OrderItemKey(Integer ordineId, Integer productId) {
		this.setOrdineId(ordineId);
		this.setProductId(productId);
	}

	// OF CONSTRUCTOR
	public static OrderItemKey of(Integer ordineId, Integer productId) {
		return new OrderItemKey(ordineId, productId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		OrderItemKey that = (OrderItemKey) obj;
		if (!Objects.equals(theOrdine, that.theOrdine))
			return false;
		if (!Objects.equals(theProduct, that.theProduct))
			return false;
		return true;
	}
}
