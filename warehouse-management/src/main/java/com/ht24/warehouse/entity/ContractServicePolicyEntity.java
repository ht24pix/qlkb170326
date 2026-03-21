package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Entity
@Table(name = "contract_service_policy")
@Getter
@Setter
public class ContractServicePolicyEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "contract_id", nullable = false)
    private ContractEntity contract;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "appendix_id", nullable = false)
    private ContractAppendixEntity appendix;

    @Column(name = "service_type", length = 100)
    private String serviceType;

    @Column(name = "surcharge_percent")
    private Byte surchargePercent;

    @Column(name = "valid_from")
    private LocalDate validFrom;

    @Column(name = "valid_to")
    private LocalDate validTo;

    @Column(name = "note", length = 200)
    private String note;
}