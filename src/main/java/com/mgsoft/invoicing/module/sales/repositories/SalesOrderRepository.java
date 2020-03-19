package com.mgsoft.invoicing.module.sales.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.beans.Customer;
import com.mgsoft.invoicing.module.sales.beans.SalesInvoice;


@Repository
public interface SalesOrderRepository extends CrudRepository<SalesInvoice, Long>, JpaRepository<SalesInvoice, Long> {

    @Query("SELECT T FROM SalesInvoice T WHERE T.id = ?1 AND T.customer = ?2")
    public SalesInvoice findByInvoiceIdAndCustomerId(Long id, Customer customer);
}
