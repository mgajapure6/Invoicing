package com.mgsoft.invoicing.beans;

import java.util.ArrayList;
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
public class INV {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column
    private String inum;
    @Column
    private String idt;         
    @Column
    private String val;       
    @Column
    private String pos;    
    @Column
    private String rchrg;  
    @Column
    private String etin;  
    @Column
    private String inv_typ;     
    @Column
    private String diff_percent;
    
    @ManyToOne
    @JsonIgnore
    private B2B b2b;
    
    
    @OneToMany(cascade = { CascadeType.ALL })
    @JoinColumn(name="inv_id")
//    @JoinTable(name = "gspinv_item", joinColumns = {
//	    @JoinColumn(name = "inv_id") }, inverseJoinColumns = { @JoinColumn(name = "item_id") })
    private List<ITEM> itms = new ArrayList<>();
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getInum() {
        return inum;
    }
    public void setInum(String inum) {
        this.inum = inum;
    }
    public String getIdt() {
        return idt;
    }
    public void setIdt(String idt) {
        this.idt = idt;
    }
    public String getVal() {
        return val;
    }
    public void setVal(String val) {
        this.val = val;
    }
    public String getPos() {
        return pos;
    }
    public void setPos(String pos) {
        this.pos = pos;
    }
    public String getRchrg() {
        return rchrg;
    }
    public void setRchrg(String rchrg) {
        this.rchrg = rchrg;
    }
    public String getEtin() {
        return etin;
    }
    public void setEtin(String etin) {
        this.etin = etin;
    }
    public String getInv_typ() {
        return inv_typ;
    }
    public void setInv_typ(String inv_typ) {
        this.inv_typ = inv_typ;
    }
    public String getDiff_percent() {
        return diff_percent;
    }
    public void setDiff_percent(String diff_percent) {
        this.diff_percent = diff_percent;
    }
    public List<ITEM> getItms() {
        return itms;
    }
    public void setItms(List<ITEM> itms) {
        this.itms = itms;
    }
    public B2B getB2b() {
        return b2b;
    }
    public void setB2b(B2B b2b) {
        this.b2b = b2b;
    }
    
    

}
