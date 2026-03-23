package com.ht24.warehouse.controller;

import com.ht24.warehouse.dto.MeterReadingDTOs;
import com.ht24.warehouse.service.MeterReadingService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/meter-readings")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class MeterReadingController {

    private final MeterReadingService meterReadingService;

    // API để kế toán chốt số điện/nước hàng tháng
    @PostMapping("/record")
    public ResponseEntity<?> recordMonthlyReading(@Valid @RequestBody MeterReadingDTOs.Create request) {
        MeterReadingDTOs.Response result = meterReadingService.calculateAndSaveReading(request);
        return ResponseEntity.ok(result);
    }
}