package com.mgsoft.invoicing.beans;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table
public class ITEM {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @ManyToOne
    @JsonIgnore
    private INV inv;
    
    @Column
    private String num;
    
    @OneToOne(cascade = CascadeType.ALL,mappedBy = "itm")
    private ITM_DET itm_det;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public INV getInv() {
        return inv;
    }

    public void setInv(INV inv) {
        this.inv = inv;
    }

    public ITM_DET getItm_det() {
        return itm_det;
    }

    public void setItm_det(ITM_DET itm_det) {
        this.itm_det = itm_det;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }
    
    

}
