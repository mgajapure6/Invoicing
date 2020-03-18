package com.mgsoft.invoicing.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.beans.Menu;
import com.mgsoft.invoicing.beans.Module;

@Repository
public interface MenuRepository extends CrudRepository<Menu, Long> {
	
	List<Menu> findAllByModule(Module module);
}
