package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Entity
@Table(name = "invoice")
@Getter
@Setter
public class InvoiceEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "contract_id", nullable = false)
    private ContractEntity contract;

    @Column(name = "billing_month")
    private Integer billingMonth;

    @Column(name = "billing_year")
    private Integer billingYear;

    @Column(name = "rent_fee")
    private Double rentFee;

    @Column(name = "electric_fee")
    private Double electricFee;

    @Column(name = "water_fee")
    private Double waterFee;

    @Column(name = "other_fee")
    private Double otherFee;

    @Column(name = "total_fee")
    private Double totalFee;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;
}