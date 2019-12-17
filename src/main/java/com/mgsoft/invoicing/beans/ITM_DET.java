package com.mgsoft.invoicing.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table
public class ITM_DET {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column
    private String rt    ;
    @Column
    private String txval ;
    @Column
    private String iamt  ;
    @Column
    private String camt  ;
    @Column
    private String samt  ;
    @Column
    private String csamt ;
    
    @OneToOne
    @JsonIgnore
    private ITEM itm;
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRt() {
        return rt;
    }

    public void setRt(String rt) {
        this.rt = rt;
    }

    public String getTxval() {
        return txval;
    }

    public void setTxval(String txval) {
        this.txval = txval;
    }

    public String getIamt() {
        return iamt;
    }

    public void setIamt(String iamt) {
        this.iamt = iamt;
    }

    public String getCamt() {
        return camt;
    }

    public void setCamt(String camt) {
        this.camt = camt;
    }

    public String getSamt() {
        return samt;
    }

    public void setSamt(String samt) {
        this.samt = samt;
    }

    public String getCsamt() {
        return csamt;
    }

    public void setCsamt(String csamt) {
        this.csamt = csamt;
    }

   

}
