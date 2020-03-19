package com.mgsoft.invoicing.module.giravi.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.module.giravi.beans.PartyAccount;

@Repository
@Transactional
public interface PartyAccountRepository
		extends CrudRepository<PartyAccount, Integer>, JpaRepository<PartyAccount, Integer> {

}
