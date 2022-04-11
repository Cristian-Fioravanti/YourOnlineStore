package it.yourstore.store.domain;

import java.io.Serializable;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Hibernate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table(name = "utente")
public class User implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3181774896L;

	// ATTRIBUTES
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id", columnDefinition = "INTEGER")
	private Integer userId;
	@Column(name = "oauth_id", columnDefinition = "INTEGER")
	private Integer oauthId;
	@Column(name = "name", columnDefinition = "VARCHAR(80)")
	private String name;
	@Column(name = "surname", columnDefinition = "VARCHAR(80)")
	private String surname;
	@Column(name = "email", columnDefinition = "VARCHAR(80)")
	private String email;
	@Column(name = "is_admin", columnDefinition = "BOOLEAN")
	private Boolean isAdmin;

	// CONSTRUCTORS
	public User() {
		super();
	}

	public User(Integer oauthId, String name, String surname, String email, Boolean isAdmin, Integer userId) {
		super();
		this.oauthId = oauthId;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.isAdmin = isAdmin;
		this.userId = userId;
	}

	// CHILDREN
	@OneToMany(mappedBy = "theUser", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ToString.Exclude
	private Collection<Order> theOrder = new ArrayList<>();

	// CHILD GETTER/SETTER
	/**
	 * @return the Order
	 */
	public Collection<Order> getTheOrder() {
		return theOrder;
	}

	/**
	 * @param aOrderList to set
	 */
	public void setTheOrder(Collection<Order> aOrderList) {
		theOrder = aOrderList;
	}

	// ADD CHILD
	public void addOrder(Order order) {
		theOrder.add(order);
	}

	// Equals
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		User that = (User) o;
		return userId != null && Objects.equals(userId, that.userId);
	}}
