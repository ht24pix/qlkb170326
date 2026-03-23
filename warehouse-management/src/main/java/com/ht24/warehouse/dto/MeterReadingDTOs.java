package com.ht24.warehouse.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.Data;
import java.time.LocalDate;

public class MeterReadingDTOs {

    @Data
    public static class Create {
        @NotNull(message = "ID Đồng hồ không được để trống")
        private Long meterId;

        @NotNull(message = "Chỉ số mới không được để trống")
        @PositiveOrZero(message = "Chỉ số đồng hồ không được là số âm")
        private Double newIndex;

        @NotNull(message = "Ngày chốt số không được để trống")
        private LocalDate readingDate;
    }

    @Data
    public static class Response {
        private Long readingId;
        private Long meterId;
        private String meterType; // "ELECTRICITY" hoặc "WATER"
        private Double oldIndex;
        private Double newIndex;
        private Double usageAmount; // Lượng tiêu thụ
        private Double currentPrice; // Đơn giá áp dụng
        private Double totalCost; // Thành tiền
    }
}