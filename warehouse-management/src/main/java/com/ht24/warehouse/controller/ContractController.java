package com.ht24.warehouse.controller;

import com.ht24.warehouse.dto.ContractCreateDTO;
import com.ht24.warehouse.entity.ContractEntity;
import com.ht24.warehouse.service.ContractService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/contracts")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class ContractController {

    private final ContractService contractService;

    @PostMapping
    // @Valid LÀ CHÌA KHÓA: Nó kích hoạt anh bảo vệ DTO trước khi chạy vào hàm
    public ResponseEntity<?> createContract(@Valid @RequestBody ContractCreateDTO requestDTO) {
        try {
            // Ném DTO cho Service xử lý
            ContractEntity savedContract = contractService.createNewContract(requestDTO);
            
            // Trả về đối tượng vừa lưu thành công
            return ResponseEntity.ok(savedContract);
            
        } catch (IllegalArgumentException | IllegalStateException e) {
            // Hứng các lỗi logic từ Service hoặc Entity và trả về mã 400 (Bad Request)
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}