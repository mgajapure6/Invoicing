package com.mgsoft.invoicing.module.giravi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.module.giravi.beans.Loan;

@Repository
public interface GiraviMasterRepository extends CrudRepository<Loan, Integer>, JpaRepository<Loan, Integer> {

}
