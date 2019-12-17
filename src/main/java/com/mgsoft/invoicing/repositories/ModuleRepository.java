package com.mgsoft.invoicing.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.beans.Module;

@Repository
public interface ModuleRepository extends CrudRepository<Module, Long> {
	

}
