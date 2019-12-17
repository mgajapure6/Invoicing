package com.mgsoft.invoicing.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mgsoft.invoicing.beans.B2B;


public interface B2BRepository extends CrudRepository<B2B, Long>, JpaRepository<B2B, Long>{

}
