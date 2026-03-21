package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "meter_reading")
@Getter
@Setter
public class MeterReadingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "meter_id", nullable = false)
    private MeterEntity meter;

    @Column(name = "period_month")
    private Integer periodMonth;

    @Column(name = "period_year")
    private Integer periodYear;

    @Column(name = "date_from", nullable = false)
    private LocalDate dateFrom;

    @Column(name = "date_to", nullable = false)
    private LocalDate dateTo;

    @Column(name = "old_peak") private Double oldPeak;
    @Column(name = "new_peak") private Double newPeak;
    @Column(name = "old_normal") private Double oldNormal;
    @Column(name = "new_normal") private Double newNormal;
    @Column(name = "old_offpeak") private Double oldOffpeak;
    @Column(name = "new_offpeak") private Double newOffpeak;

    @Column(name = "old_water") private Double oldWater;
    @Column(name = "new_water") private Double newWater;

    @Column(name = "create_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;
}