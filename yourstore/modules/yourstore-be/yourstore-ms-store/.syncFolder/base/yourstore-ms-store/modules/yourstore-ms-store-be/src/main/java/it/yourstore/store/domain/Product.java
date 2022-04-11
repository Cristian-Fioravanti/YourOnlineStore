package it.yourstore.store.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
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
@Table(name = "product")
public class Product extends BaseEntity implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3964889677L;

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LogManager.getLogger(Product.class);

	// ATTRIBUTES
	@Id

	@Column(name = "product_id", columnDefinition = "INTEGER")
	private Integer productId;

	// IMPORTED PARENTS

	// CONSTRUCTORS
	public Product(String objectKey) {
		super();
		setObjectKey(objectKey);
	}

	// CHILDREN
	@OneToMany(mappedBy = "orderItemKey.theProduct", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ToString.Exclude
	private Collection<OrderItem> theOrderItem = new ArrayList<>();

	// PARENTS

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
		return getObjectKeyById(getProductId());
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

		setProductId(getIntegerCheckedAgainstNullContent(array[ctr]));
	}

	// OBJECT TITLE
	public String getObjectTitle() {
		StringBuilder output = new StringBuilder();
		output.append(getObjectKey());
		return output.toString();
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

	@Override
	public int hashCode() {
		return Objects.hash(productId);
	}
}
