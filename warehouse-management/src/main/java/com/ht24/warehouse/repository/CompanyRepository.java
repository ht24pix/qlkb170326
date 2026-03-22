package com.ht24.warehouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ht24.warehouse.entity.CompanyInfoEntity;

public interface CompanyRepository extends JpaRepository<CompanyInfoEntity, Long> {

}
