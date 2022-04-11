package it.yourstore.store.domain;

import java.io.Serializable;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.FetchType;
import java.util.Collection;
import java.util.ArrayList;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;
import lombok.ToString;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

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

@Getter
@Setter
@Entity
@Table(name = "order")
public class Order extends BaseEntity implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 1625209308L;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(Order.class);

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

	// IMPORTED PARENTS

	// CONSTRUCTORS
	public Order(String objectKey) {
		super();
		setObjectKey(objectKey);
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

	// PARENT OBJECT TITLE
	/**
	 * Return the object title of theUser.
	 * 
	 * @return the object title of theUser.
	 */
	public String getTheUserObjectTitle() {
		return getTheUser() != null ? getTheUser().getObjectTitle() : null;
	}

	// PARENT OBJECT KEY
	/**
	 * Return the object key of theUser.
	 * 
	 * @return the object key of theUser.
	 */
	public String getTheUserObjectKey() {
		return getTheUser() != null ? getTheUser().getObjectKey() : null;
	}

	/**
	 * Set object key of theUser.
	 * 
	 */
	public void setTheUserObjectKey(String objectKey) {
		if (EntityUtils.isValueChanged(getTheUserObjectKey(), objectKey, false)) {
			User user = new User();
			user.setObjectKey(objectKey);
			setTheUser(user);
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
		return getObjectKeyById(getOrderId());
	}

	public String getObjectKeyById(Integer identification) {
		if (identification == null) {
			return null;
		}
		StringBuilder output = new StringBuilder();
		output.append(identification);
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

		setOrderId(getIntegerCheckedAgainstNullContent(array[ctr]));
	}

	// OBJECT TITLE
	public String getObjectTitle() {
		StringBuilder output = new StringBuilder();
		output.append(getAddress());
		return output.toString();
	}

	// Equals / HashCode
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		Order that = (Order) o;
		return orderId != null && Objects.equals(orderId, that.orderId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(orderId);
	}
}
