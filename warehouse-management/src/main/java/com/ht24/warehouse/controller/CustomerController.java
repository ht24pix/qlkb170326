package com.ht24.warehouse.controller;

import com.ht24.warehouse.entity.CustomerEntity;
import com.ht24.warehouse.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // Khai báo đây là một API Controller trả về JSON
@RequestMapping("/api/customers") // Đường dẫn gốc cho tất cả API trong class này
@CrossOrigin(origins = "*") // Tạm thời cho phép mọi Frontend gọi vào để dễ test
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerRepository customerRepository;

    // 1. API Lấy danh sách toàn bộ khách hàng (GET)
    @GetMapping
    public ResponseEntity<List<CustomerEntity>> getAllCustomers() {
        // Gọi xuống Database lấy dữ liệu
        List<CustomerEntity> customers = customerRepository.findAll();
        
        // Trả về dữ liệu kèm mã trạng thái 200 (Thành công)
        return ResponseEntity.ok(customers);
    }

    // 2. API Thêm mới một khách hàng (POST)
    @PostMapping
    public ResponseEntity<CustomerEntity> createCustomer(@RequestBody CustomerEntity newCustomer) {
        // @RequestBody sẽ tự động bắt cục JSON mà Angular gửi lên và biến thành CustomerEntity
        CustomerEntity savedCustomer = customerRepository.save(newCustomer);
        
        // Trả về dữ liệu vừa tạo kèm mã 200
        return ResponseEntity.ok(savedCustomer);
    }
}