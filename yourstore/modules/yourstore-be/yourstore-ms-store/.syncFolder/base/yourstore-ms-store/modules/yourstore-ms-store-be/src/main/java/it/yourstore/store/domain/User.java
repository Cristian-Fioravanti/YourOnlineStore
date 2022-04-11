package it.yourstore.store.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import java.util.Collection;
import java.util.ArrayList;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;
import lombok.ToString;

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
@Table(name = "user")
public class User extends BaseEntity implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3181774896L;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(User.class);

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

	// IMPORTED PARENTS

	// CONSTRUCTORS
	public User(String objectKey) {
		super();
		setObjectKey(objectKey);
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

	// PARENTS

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

	// PARENT GETTER/SETTER

	// PARENT ID GETTER/SETTER

	// PARENT OBJECT TITLE

	// PARENT OBJECT KEY

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
		return getObjectKeyById(getUserId());
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

		setUserId(getIntegerCheckedAgainstNullContent(array[ctr]));
	}

	// OBJECT TITLE
	public String getObjectTitle() {
		StringBuilder output = new StringBuilder();
		output.append(getName());
		return output.toString();
	}

	// Equals / HashCode
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		User that = (User) o;
		return userId != null && Objects.equals(userId, that.userId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(userId);
	}
}
