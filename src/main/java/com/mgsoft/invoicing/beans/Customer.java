package com.mgsoft.invoicing.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

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
public class Customer implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String cusName;
    @Column
    private String cusAddrL1;
    @Column
    private String cusAddrL2;
    @Column
    private String state;
    @Column
    private String city;
    @Column
    private String pincode;
    @Column
    private String mobile;
    @Column
    private String email;
    
    @OneToMany(cascade = { CascadeType.ALL })
    @JoinTable(name = "customer_salesInvoice", joinColumns = {
	    @JoinColumn(name = "customer_id") }, inverseJoinColumns = { @JoinColumn(name = "salesInvoice_id") })
    private Collection<SalesInvoice> salesInvoices = new ArrayList<SalesInvoice>();

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getCusName() {
	return cusName;
    }

    public void setCusName(String cusName) {
	this.cusName = cusName;
    }

    public String getCusAddrL1() {
	return cusAddrL1;
    }

    public void setCusAddrL1(String cusAddrL1) {
	this.cusAddrL1 = cusAddrL1;
    }

    public String getCusAddrL2() {
	return cusAddrL2;
    }

    public void setCusAddrL2(String cusAddrL2) {
	this.cusAddrL2 = cusAddrL2;
    }

    public String getState() {
	return state;
    }

    public void setState(String state) {
	this.state = state;
    }

    public String getCity() {
	return city;
    }

    public void setCity(String city) {
	this.city = city;
    }

    public String getPincode() {
	return pincode;
    }

    public void setPincode(String pincode) {
	this.pincode = pincode;
    }

    public String getMobile() {
	return mobile;
    }

    public void setMobile(String mobile) {
	this.mobile = mobile;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public Collection<SalesInvoice> getSalesInvoices() {
        return salesInvoices;
    }

    public void setSalesInvoices(Collection<SalesInvoice> salesInvoices) {
        this.salesInvoices = salesInvoices;
    }

}
