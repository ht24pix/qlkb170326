package com.ht24.warehouse.dto;

import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class ContractCreateDTO {

    @NotNull(message = "ID Công ty không được để trống")
    private Long companyId;

    @NotNull(message = "ID Khách hàng không được để trống")
    private Long customerId;

    @NotBlank(message = "Mã hợp đồng không được để trống")
    @Size(max = 100, message = "Mã hợp đồng tối đa 100 ký tự")
    private String contractCode;

    @NotNull(message = "Ngày bắt đầu không được để trống")
    private LocalDate dateStart;

    @NotNull(message = "Ngày kết thúc không được để trống")
    @FutureOrPresent(message = "Ngày kết thúc phải ở hiện tại hoặc tương lai")
    private LocalDate dateEnd;

    private String note;
}