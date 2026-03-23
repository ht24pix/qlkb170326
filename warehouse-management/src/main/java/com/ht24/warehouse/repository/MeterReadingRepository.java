package com.ht24.warehouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ht24.warehouse.entity.MeterReadingEntity;

public interface MeterReadingRepository extends JpaRepository<MeterReadingEntity, Long> {

}
