package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.OrderDetail;
import com.example.demo.domain.dto.BestSellerDTO;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

    @Query("""
        SELECT new com.example.demo.domain.dto.BestSellerDTO(
            p.id, p.name, p.image, SUM(od.quantity)
        )
        FROM OrderDetail od
        JOIN od.order o
        JOIN od.product p
        WHERE o.status IN ('Shipped', 'Completed')
        GROUP BY p.id, p.name, p.image
        ORDER BY SUM(od.quantity) DESC
        """)
    List<BestSellerDTO> findBestSellingProduct();
}
