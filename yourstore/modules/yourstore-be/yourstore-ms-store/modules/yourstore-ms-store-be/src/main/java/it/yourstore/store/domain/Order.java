package it.yourstore.store.domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.Hibernate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table(name = "ordine")
public class Order implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 1625209308L;

	// ATTRIBUTES
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "order_id", columnDefinition = "INTEGER")
	private Integer orderId;
	@Column(name = "date", columnDefinition = "DATE")
	private LocalDate date;
	@Column(name = "total_cost", columnDefinition = "INTEGER")
	private Integer totalCost;
	@Column(name = "address", columnDefinition = "VARCHAR(80)")
	private String address;

	// CONSTRUCTORS
	public Order() {
		super();
	}

	public Order(LocalDate date, Integer totalCost, String address, Integer orderId) {
		super();
		this.date = date;
		this.totalCost = totalCost;
		this.address = address;
		this.orderId = orderId;
	}

	// CHILDREN
	@OneToMany(mappedBy = "orderItemKey.theOrder", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ToString.Exclude
	private Collection<OrderItem> theOrderItem = new ArrayList<>();

	// PARENTS
	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
	private User theUser;

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

	// PARENT GETTER/SETTER
	/**
	 * @return the User
	 */
	public User getTheUser() {
		return theUser;
	}

	/**
	 * @param aUserList to set
	 */
	public void setTheUser(User aUser) {
		theUser = aUser;
	}

	// PARENT ID GETTER/SETTER
	/**
	 * Return the userId from theUser.
	 * 
	 * @return userId from theUser.
	 */
	public Integer getUserId() {
		// If the parent entity object is null, then return null
		if (getTheUser() == null) {
			return null;
		}
		// Return requested attribute
		return theUser.getUserId();
	}
	
	// Equals
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		Order that = (Order) o;
		return orderId != null && Objects.equals(orderId, that.orderId);
	}

}
