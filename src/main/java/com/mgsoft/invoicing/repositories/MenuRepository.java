package com.mgsoft.invoicing.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.beans.Menu;

@Repository
public interface MenuRepository extends CrudRepository<Menu, Long> {
	
	List<Menu> findAllByModuleId(Long id);
	
	List<Menu> findAllByModuleIdAndParentMenuId(Long moid,Long pid);
	
	List<Menu> findAllByParentMenuId(Long id);
	
}
