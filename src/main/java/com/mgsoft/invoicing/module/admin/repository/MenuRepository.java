package com.mgsoft.invoicing.module.admin.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.module.admin.beans.Menu;
import com.mgsoft.invoicing.module.admin.beans.Module;

@Repository
public interface MenuRepository extends CrudRepository<Menu, Long> {

	List<Menu> findAllByModule(Module module);
}
