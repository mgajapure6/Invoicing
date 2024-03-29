package com.mgsoft.invoicing.module.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mgsoft.invoicing.module.admin.beans.UserMaster;

@Repository
public interface UserRepository extends CrudRepository<UserMaster, Long>, JpaRepository<UserMaster, Long> {
	UserMaster findByLoginNameAndLoginPassword(String loginName,String loginPassword);
}
