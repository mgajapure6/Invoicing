package com.mgsoft.invoicing.beans;

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
public class B2B {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String ctin;

    @OneToMany(cascade = { CascadeType.ALL })
    @JoinColumn(name="b2b_id")
//    @JoinTable(name = "b2b_gspinv", joinColumns = {
//	    @JoinColumn(name = "b2b_id") }, inverseJoinColumns = { @JoinColumn(name = "inv_id") })
    
    private Collection<INV> inv ;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getCtin() {
	return ctin;
    }

    public void setCtin(String ctin) {
	this.ctin = ctin;
    }

    public Collection<INV> getInv() {
        return inv;
    }

    public void setInv(Collection<INV> inv) {
        this.inv = inv;
    }
}
