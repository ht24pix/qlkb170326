package com.ht24.warehouse.repository;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ht24.warehouse.entity.CustomerEntity;


@Repository
public interface CustomerRepository extends JpaRepository<CustomerEntity, Long>{
	
	// 1. Tìm chính xác 1 khách hàng bằng Mã khách hàng (Tương đương: SELECT * FROM customer WHERE customer_code = ?)
    Optional<CustomerEntity> findByTaxCode(String taxCode);

    // 2. Tìm kiếm gần đúng theo Tên khách hàng (Tương đương: SELECT * FROM customer WHERE customer_name LIKE %?%)
    // Chữ IgnoreCase giúp tìm kiếm không phân biệt chữ hoa chữ thường
    List<CustomerEntity> findByFullNameContainingIgnoreCase(String fullName);

}
