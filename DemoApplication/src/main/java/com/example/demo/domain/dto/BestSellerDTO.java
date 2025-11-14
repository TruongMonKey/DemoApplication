package com.example.demo.domain.dto;

public class BestSellerDTO {
    private Long productId;
    private String productName;
    private String image;
    private Long totalSold;

    public BestSellerDTO(Long productId, String productName, String image, Long totalSold) {
        this.productId = productId;
        this.productName = productName;
        this.image = image;
        this.totalSold = totalSold;
    }

    public Long getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getImage() {
        return image;
    }

    public Long getTotalSold() {
        return totalSold;
    }

}

