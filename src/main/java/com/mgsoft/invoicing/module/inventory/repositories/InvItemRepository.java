package com.mgsoft.invoicing.module.inventory.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.module.inventory.beans.InvItem;

@Repository
public interface InvItemRepository extends CrudRepository<InvItem, Long>, JpaRepository<InvItem, Long> {

}
