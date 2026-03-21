package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "electric_price_history")
@Getter
@Setter
public class ElectricPriceHistoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "station_id", nullable = false)
    private ElectricStationEntity station;

    @Column(name = "price_peak")
    private Double pricePeak;

    @Column(name = "price_normal")
    private Double priceNormal;

    @Column(name = "price_offpeak")
    private Double priceOffpeak;

    @Column(name = "vat_percent", length = 10)
    private String vatPercent;

    @Column(name = "valid_from")
    private LocalDate validFrom;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;
}