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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table
public class Loan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;

	@Column
	Float loanAmount;

	@Column
	Float intrestRate;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name="loan_giraviitem", joinColumns = {@JoinColumn(name="loan_id")}, inverseJoinColumns = {@JoinColumn(name="giraviitem_id")})
	Collection<GiraviItem> giraviItems;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name="loan_loantransaction", joinColumns = {@JoinColumn(name="loan_id")}, inverseJoinColumns = {@JoinColumn(name="tran_id")})
	Collection<LoanTransaction> loanTransactions;

	@ManyToOne
	@JsonIgnore
	PartyAccount partyAccount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Float getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(Float loanAmount) {
		this.loanAmount = loanAmount;
	}

	public Float getIntrestRate() {
		return intrestRate;
	}

	public void setIntrestRate(Float intrestRate) {
		this.intrestRate = intrestRate;
	}

	public Collection<GiraviItem> getGiraviItems() {
		return giraviItems;
	}

	public void setGiraviItems(List<GiraviItem> giraviItems) {
		this.giraviItems = giraviItems;
	}

	public Collection<LoanTransaction> getLoanTransactions() {
		return loanTransactions;
	}

	public void setLoanTransactions(List<LoanTransaction> loanTransactions) {
		this.loanTransactions = loanTransactions;
	}

	public PartyAccount getPartyAccount() {
		return partyAccount;
	}

	public void setPartyAccount(PartyAccount partyAccount) {
		this.partyAccount = partyAccount;
	}

	public Loan(Integer id, Float loanAmount, Float intrestRate, List<GiraviItem> giraviItems,
			Collection<LoanTransaction> loanTransactions, PartyAccount partyAccount) {
		super();
		this.id = id;
		this.loanAmount = loanAmount;
		this.intrestRate = intrestRate;
		this.giraviItems = giraviItems;
		this.loanTransactions = loanTransactions;
		this.partyAccount = partyAccount;
	}

	public Loan() {
		super();
	}

	@Override
	public String toString() {
		return "Loan [id=" + id + ", loanAmount=" + loanAmount + ", intrestRate=" + intrestRate + ", giraviItems="
				+ giraviItems + ", loanTransactions=" + loanTransactions + "]";
	}

}