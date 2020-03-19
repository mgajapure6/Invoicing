package com.mgsoft.invoicing.module.admin.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.module.admin.beans.Module;

@Repository
public interface ModuleRepository extends CrudRepository<Module, Long> {

}
