package it.yourstore.store.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Hibernate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@Entity
@Table(name = "product")
public class Product implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3964889677L;

	// ATTRIBUTES
	@Id
	@Column(name = "product_id", columnDefinition = "INTEGER")
	private Integer productId;

	// CONSTRUCTORS
	public Product() {
		super();
	}

	// CHILDREN
	@OneToMany(mappedBy = "orderItemKey.theProduct", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ToString.Exclude
	private Collection<OrderItem> theOrderItem = new ArrayList<>();

	// CHILD GETTER/SETTER
	/**
	 * @return the OrderItem
	 */
	public Collection<OrderItem> getTheOrderItem() {
		return theOrderItem;
	}

	/**
	 * @param aOrderItemList to set
	 */
	public void setTheOrderItem(Collection<OrderItem> aOrderItemList) {
		theOrderItem = aOrderItemList;
	}

	// ADD CHILD
	public void addOrderItem(OrderItem orderItem) {
		theOrderItem.add(orderItem);
	}
	
	// Equals / HashCode
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		Product that = (Product) o;
		return productId != null && Objects.equals(productId, that.productId);
	}
}
