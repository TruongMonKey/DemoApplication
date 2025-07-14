package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.Product;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Product save(Product product);

    // Optional<Product> findById(long id);

    // void deleteById(long id);

    List<Product> findTop4ByIdNot(Long id);

}
