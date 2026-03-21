package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Entity
@Table(name = "contract_appendix")
@Getter
@Setter
public class ContractAppendixEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "contract_id", nullable = false)
    private ContractEntity contract;

    @Column(name = "appendix_no", nullable = false, length = 100, unique = true)
    private String appendixNo;

    @Column(name = "sign_date", nullable = false)
    private LocalDate signDate;

    @Column(name = "effective_date")
    private LocalDate effectiveDate;

    @Column(name = "note", length = 200)
    private String note;
}