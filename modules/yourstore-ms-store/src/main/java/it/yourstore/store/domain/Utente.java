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
public class Utente implements Serializable {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3181774896L;

	// ATTRIBUTES
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "utente_id", columnDefinition = "INTEGER")
	private Integer utenteId;
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
	public Utente() {
		super();
	}

	public Utente(Integer oauthId, String name, String surname, String email, Boolean isAdmin, Integer utenteId) {
		super();
		this.oauthId = oauthId;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.isAdmin = isAdmin;
		this.utenteId = utenteId;
	}

	// CHILDREN
	@OneToMany(mappedBy = "theUtente", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ToString.Exclude
	private Collection<Ordine> theOrdine = new ArrayList<>();

	// CHILD GETTER/SETTER
	/**
	 * @return the Ordine
	 */
	public Collection<Ordine> getTheOrdine() {
		return theOrdine;
	}

	/**
	 * @param aOrdineList to set
	 */
	public void setTheOrdine(Collection<Ordine> aOrdineList) {
		theOrdine = aOrdineList;
	}

	// ADD CHILD
	public void addOrdine(Ordine ordine) {
		theOrdine.add(ordine);
	}

	// Equals
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
			return false;
		Utente that = (Utente) o;
		return utenteId != null && Objects.equals(utenteId, that.utenteId);
	}}
