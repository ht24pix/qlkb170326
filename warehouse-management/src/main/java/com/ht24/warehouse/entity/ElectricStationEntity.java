package com.ht24.warehouse.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "electric_station")
@Getter
@Setter
public class ElectricStationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "station_name", nullable = false, length = 100)
    private String stationName;

    @Column(name = "location", length = 100)
    private String location;
}