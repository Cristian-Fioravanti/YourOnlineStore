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
public class Ordine implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 1625209308L;

	// ATTRIBUTES
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "ordine_id", columnDefinition = "INTEGER")
	private Integer ordineId;
	@Column(name = "date", columnDefinition = "DATE")
	private LocalDate date;
	@Column(name = "total_cost", columnDefinition = "INTEGER")
	private Integer totalCost;
	@Column(name = "address", columnDefinition = "VARCHAR(80)")
	private String address;

	// CONSTRUCTORS
	public Ordine() {
		super();
	}

	public Ordine(LocalDate date, Integer totalCost, String address, Integer ordineId) {
		super();
		this.date = date;
		this.totalCost = totalCost;
		this.address = address;
		this.ordineId = ordineId;
	}

	// CHILDREN
	@OneToMany(mappedBy = "orderItemKey.theOrdine", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ToString.Exclude
	private Collection<OrderItem> theOrderItem = new ArrayList<>();

	// PARENTS
	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "utente_id", referencedColumnName = "utente_id", nullable = false)
	private Utente theUtente;

	// CHILD GETTER/SETTER
	/**
	 * @return the OrdineItem
	 */
	public Collection<OrderItem> getTheOrderItem() {
		return theOrderItem;
	}

	/**
	 * @param aOrdineItemList to set
	 */
	public void setTheOrdineerItem(Collection<OrderItem> aOrdineItemList) {
		theOrderItem = aOrdineItemList;
	}

	// ADD CHILD
	public void addOrderItem(OrderItem ordineItem) {
		theOrderItem.add(ordineItem);
	}

	// PARENT GETTER/SETTER
	/**
	 * @return the Utente
	 */
	public Utente getTheUtente() {
		return theUtente;
	}

	/**
	 * @param aUtenteList to set
	 */
	public void setTheUtente(Utente aUtente) {
		theUtente = aUtente;
	}

	// PARENT ID GETTER/SETTER
	/**
	 * Return the utenteId from theUtente.
	 * 
	 * @return utenteId from theUtente.
	 */
	public Integer getUtenteId() {
		// If the parent entity object is null, then return null
		if (getTheUtente() == null) {
			return null;
		}
		// Return requested attribute
		return theUtente.getUtenteId();
	}
	
	// Equals
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		Ordine that = (Ordine) o;
		return ordineId != null && Objects.equals(ordineId, that.ordineId);
	}

}
