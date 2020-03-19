package com.mgsoft.invoicing.module.giravi.beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class PartyAccount implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;

	@Column
	String partyName;

	@Column
	String partyAddr1;

	@Column
	String partyAddr2;

	@Column
	String partyCity;

	@Column
	String partyState;

	@Column
	String partyPincode;

	@Column
	String partyMobile1;

	@Column
	String partyMobile2;

	@Column
	String partyEmail1;

	@Column
	String partyEmail2;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "partyaccount_loan", joinColumns = { @JoinColumn(name = "party_id") }, inverseJoinColumns = {
			@JoinColumn(name = "loan_id") })
	Collection<Loan> loans;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public String getPartyAddr1() {
		return partyAddr1;
	}

	public void setPartyAddr1(String partyAddr1) {
		this.partyAddr1 = partyAddr1;
	}

	public String getPartyAddr2() {
		return partyAddr2;
	}

	public void setPartyAddr2(String partyAddr2) {
		this.partyAddr2 = partyAddr2;
	}

	public String getPartyCity() {
		return partyCity;
	}

	public void setPartyCity(String partyCity) {
		this.partyCity = partyCity;
	}

	public String getPartyState() {
		return partyState;
	}

	public void setPartyState(String partyState) {
		this.partyState = partyState;
	}

	public String getPartyPincode() {
		return partyPincode;
	}

	public void setPartyPincode(String partyPincode) {
		this.partyPincode = partyPincode;
	}

	public String getPartyMobile1() {
		return partyMobile1;
	}

	public void setPartyMobile1(String partyMobile1) {
		this.partyMobile1 = partyMobile1;
	}

	public String getPartyMobile2() {
		return partyMobile2;
	}

	public void setPartyMobile2(String partyMobile2) {
		this.partyMobile2 = partyMobile2;
	}

	public String getPartyEmail1() {
		return partyEmail1;
	}

	public void setPartyEmail1(String partyEmail1) {
		this.partyEmail1 = partyEmail1;
	}

	public String getPartyEmail2() {
		return partyEmail2;
	}

	public void setPartyEmail2(String partyEmail2) {
		this.partyEmail2 = partyEmail2;
	}

	public Collection<Loan> getLoans() {
		return loans;
	}

	public void setLoans(List<Loan> loans) {
		this.loans = loans;
	}

	public PartyAccount(Integer id, String partyName, String partyAddr1, String partyAddr2, String partyCity,
			String partyState, String partyPincode, String partyMobile1, String partyMobile2, String partyEmail1,
			String partyEmail2) {
		super();
		this.id = id;
		this.partyName = partyName;
		this.partyAddr1 = partyAddr1;
		this.partyAddr2 = partyAddr2;
		this.partyCity = partyCity;
		this.partyState = partyState;
		this.partyPincode = partyPincode;
		this.partyMobile1 = partyMobile1;
		this.partyMobile2 = partyMobile2;
		this.partyEmail1 = partyEmail1;
		this.partyEmail2 = partyEmail2;
	}

	public PartyAccount() {
		super();
	}

	@Override
	public String toString() {
		return "PartyAccount [id=" + id + ", partyName=" + partyName + ", partyAddr1=" + partyAddr1 + ", partyAddr2="
				+ partyAddr2 + ", partyCity=" + partyCity + ", partyState=" + partyState + ", partyPincode="
				+ partyPincode + ", partyMobile1=" + partyMobile1 + ", partyMobile2=" + partyMobile2 + ", partyEmail1="
				+ partyEmail1 + ", partyEmail2=" + partyEmail2 + ", loans=" + loans + "]";
	}

}
