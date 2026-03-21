package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "meter")
@Getter
@Setter
public class MeterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "warehouse_id", nullable = false)
    private WarehouseEntity warehouse;

    @Column(name = "meter_code", nullable = false, length = 50, unique = true)
    private String meterCode;

    @Column(name = "meter_type", length = 100)
    private String meterType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "station_id", nullable = false)
    private ElectricStationEntity station;

    @Column(name = "note", columnDefinition = "TEXT")
    private String note;
}