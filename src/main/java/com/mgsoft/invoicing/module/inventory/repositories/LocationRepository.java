package com.mgsoft.invoicing.module.inventory.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.module.inventory.beans.Location;

@Repository
public interface LocationRepository extends CrudRepository<Location, Long>, JpaRepository<Location, Long> {
	
	List<Location> findAllByStatus(String status);
}
