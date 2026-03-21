package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Entity
@Table(name = "customer")
@Getter
@Setter
public class CustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", nullable = false)
    private CompanyInfoEntity company;

    @Column(name = "customer_type", nullable = false)
    private String customerType; // DOANHNGHIEP, CANHAN, HOKINHDOANH, HOPTACXA

    @Column(name = "fullname", nullable = false, length = 100)
    private String fullName;

    @Column(name = "taxcode", length = 50, unique = true)
    private String taxCode;

    @Column(name = "id_card", length = 50, unique = true)
    private String idCard;

    @Column(name = "address", length = 150)
    private String address;

    @Column(name = "email", length = 100)
    private String email;

    @Column(name = "phonenumber", length = 15)
    private String phoneNumber;

    @Column(name = "legal_representive", length = 100)
    private String legalRepresentive;

    @Column(name = "bank_acc_no", length = 100)
    private String bankAccNo;

    @Column(name = "bank_name", length = 100)
    private String bankName;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;
}