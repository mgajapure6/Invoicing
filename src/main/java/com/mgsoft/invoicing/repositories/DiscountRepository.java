package com.mgsoft.invoicing.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.beans.Discount;

@Repository
public interface DiscountRepository extends CrudRepository<Discount, Long>, JpaRepository<Discount, Long> {
	
	List<Discount> findAllByStatus(String status);
}
