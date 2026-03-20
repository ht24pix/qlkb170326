package com.ht24.warehouse.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ht24.warehouse.entity.ContractEntity;

public interface ContractRepository extends JpaRepository<ContractEntity, Long>{
	
	@Query("SELECT c FROM ContractEntity c WHERE c.status = 'ACTIVE' AND c.endDate <= :checkDate")
	List<ContractEntity> findExpirationContract(@Param("checkDate") LocalDate Date);
}
