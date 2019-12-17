package com.mgsoft.invoicing.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.beans.Tax;

@Repository
public interface TaxRepository extends CrudRepository<Tax, Long>, JpaRepository<Tax, Long> {
	
	List<Tax> findAllByStatus(String status);
}
