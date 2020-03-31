package com.mgsoft.invoicing.module.setting.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Discount implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String discType;
    @Column
    private String discountRateInPercent;
    @Column
    private String disCode;
    @Column
    private String status;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getDiscType() {
	return discType;
    }

    public void setDiscType(String discType) {
	this.discType = discType;
    }

    public String getDiscountRateInPercent() {
        return discountRateInPercent;
    }

    public void setDiscountRateInPercent(String discountRateInPercent) {
        this.discountRateInPercent = discountRateInPercent;
    }

    public String getDisCode() {
	return disCode;
    }

    public void setDisCode(String disCode) {
	this.disCode = disCode;
    }

    public String getStatus() {
	return status;
    }

    public void setStatus(String status) {
	this.status = status;
    }

}
