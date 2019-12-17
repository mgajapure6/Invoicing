package com.mgsoft.invoicing.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.beans.ItemCategory;

@Repository
public interface ItemCategoryRepository extends CrudRepository<ItemCategory, Long>, JpaRepository<ItemCategory, Long> {
	
	List<ItemCategory> findAllByStatus(String status);
}
