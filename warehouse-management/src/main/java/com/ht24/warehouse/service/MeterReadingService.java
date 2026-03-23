package com.ht24.warehouse.service;

import com.ht24.warehouse.dto.MeterReadingDTOs;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MeterReadingService {

    // Khai báo các Repository tương ứng của bạn (MeterRepository, MeterReadingRepository...)
    // private final MeterReadingRepository readingRepository;
    // private final MeterRepository meterRepository;

    @Transactional // Đảm bảo nếu tính toán lỗi giữa chừng, DB sẽ tự động rollback không lưu rác
    public MeterReadingDTOs.Response calculateAndSaveReading(MeterReadingDTOs.Create dto) {
        
        // 1. Tìm đồng hồ trong DB xem có tồn tại không
        /* MeterEntity meter = meterRepository.findById(dto.getMeterId())
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy đồng hồ này!")); */

        // 2. Tìm CHỈ SỐ CŨ (Lấy record chốt số gần nhất của đồng hồ này)
        // Double oldIndex = readingRepository.findLatestIndexByMeterId(dto.getMeterId());
        // Giả lập dữ liệu để bạn dễ hình dung:
        Double oldIndex = 1500.0; // Tháng trước chốt ở mức 1500
        String meterType = "ELECTRICITY"; // Loại đồng hồ

        // 3. KIỂM TRA LOGIC CHẶT CHẼ
        if (dto.getNewIndex() < oldIndex) {
            throw new IllegalArgumentException("Lỗi: Chỉ số mới (" + dto.getNewIndex() + 
                    ") không được nhỏ hơn chỉ số cũ (" + oldIndex + ")");
        }

        // 4. TÍNH TOÁN
        Double usageAmount = dto.getNewIndex() - oldIndex;
        
        // Giả sử gọi DB lấy đơn giá điện hiện tại là 3,500 VNĐ / kWh
        Double currentPrice = 3500.0; 
        Double totalCost = usageAmount * currentPrice;

        // 5. LƯU XUỐNG DATABASE (Tạo Entity mới và Save)
        /* MeterReadingEntity newReading = new MeterReadingEntity();
           newReading.setMeter(meter);
           newReading.setOldIndex(oldIndex);
           newReading.setNewIndex(dto.getNewIndex());
           newReading.setReadingDate(dto.getReadingDate());
           newReading.setTotalCost(totalCost);
           readingRepository.save(newReading); 
        */

        System.out.println("💧/⚡ Tính toán thành công: Tiêu thụ " + usageAmount + " khối/kWh. Thành tiền: " + totalCost);

        // 6. TRẢ VỀ KẾT QUẢ CHO KẾ TOÁN XEM
        MeterReadingDTOs.Response response = new MeterReadingDTOs.Response();
        response.setMeterId(dto.getMeterId());
        response.setMeterType(meterType);
        response.setOldIndex(oldIndex);
        response.setNewIndex(dto.getNewIndex());
        response.setUsageAmount(usageAmount);
        response.setCurrentPrice(currentPrice);
        response.setTotalCost(totalCost);

        return response;
    }
}