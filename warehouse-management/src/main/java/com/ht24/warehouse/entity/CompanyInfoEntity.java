package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Entity
@Table(name = "companyinfo")
@Getter
@Setter
public class CompanyInfoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "company_name", nullable = false, length = 100)
    private String companyName;
    @Column(name = "company_name_en", length = 100)
    private String companyNameEn;
    @Column(name = "taxcode", nullable = false, length = 15, unique = true)
    private String taxCode;
    @Column(name = "address", nullable = false, length = 100)
    private String address;
    @Column(name = "email", length = 100)
    private String email;
    @Column(name = "phone_number", length = 15)
    private String phoneNumber;
    @Column(name = "legal_representive", length = 100)
    private String legalRepresentive;
    @Column(name = "bank_acc_no", nullable = false, length = 50, unique = true)
    private String bankAccNo;
    @Column(name = "bank_name", length = 100)
    private String bankName;
    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;
}