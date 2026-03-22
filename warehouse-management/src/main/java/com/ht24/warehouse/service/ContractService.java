package com.ht24.warehouse.service;

import com.ht24.warehouse.dto.ContractCreateDTO;
import com.ht24.warehouse.entity.CompanyInfoEntity;
import com.ht24.warehouse.entity.ContractEntity;
import com.ht24.warehouse.entity.CustomerEntity;
import com.ht24.warehouse.repository.CompanyRepository;
import com.ht24.warehouse.repository.ContractRepository;
import com.ht24.warehouse.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ContractService {

    private final ContractRepository contractRepository;
    private final CompanyRepository companyRepository;
    private final CustomerRepository customerRepository;

    @Transactional // Đảm bảo nếu lỗi ở bất kỳ bước nào, Database sẽ tự động Rollback
    public ContractEntity createNewContract(ContractCreateDTO dto) {

        // 1. KIỂM TRA CHÉO MÔI TRƯỜNG (Service Validation)
        CompanyInfoEntity company = companyRepository.findById(dto.getCompanyId())
                .orElseThrow(() -> new IllegalArgumentException("Lỗi: Không tìm thấy Công ty với ID " + dto.getCompanyId()));

        CustomerEntity customer = customerRepository.findById(dto.getCustomerId())
                .orElseThrow(() -> new IllegalArgumentException("Lỗi: Không tìm thấy Khách hàng với ID " + dto.getCustomerId()));

        // Kiểm tra chéo nghiệp vụ: Khách hàng này có thuộc về Công ty kia không?
        if (!customer.getCompany().getId().equals(company.getId())) {
            throw new IllegalArgumentException("Lỗi Logic: Khách hàng này không thuộc quản lý của Công ty đã chọn!");
        }

        // 2. CHUYỂN DỮ LIỆU TỪ DTO SANG ENTITY
        ContractEntity newContract = new ContractEntity();
        newContract.setCompany(company);
        newContract.setCustomer(customer);
        newContract.setContractCode(dto.getContractCode());
        newContract.setDateStart(dto.getDateStart());
        newContract.setDateEnd(dto.getDateEnd());
        newContract.setNote(dto.getNote());
        newContract.setStatus("ACTIVE");

        // 3. LƯU XUỐNG DB (Lúc này @PrePersist của Entity sẽ tự động được gọi để check Ngày)
        return contractRepository.save(newContract);
    }
}