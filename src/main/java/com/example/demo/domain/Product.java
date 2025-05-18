package com.example.demo.domain;

import java.util.List;
import java.util.concurrent.LinkedTransferQueue;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull(message = "Tên sản phẩm không được để trống")
    @Size(min = 2, max = 100, message = "Tên sản phẩm phải từ 2 đến 100 ký tự")
    private String name;

    @Min(value = 1, message = "Giá sản phẩm phải lớn hơn 0")
    private double price;

    private String image;

    @NotNull(message = "Mô tả chi tiết không được để trống")
    @Size(min = 10, message = "Mô tả chi tiết phải có ít nhất 10 ký tự")
    private String detailDesc;

    @Size(max = 255, message = "Mô tả ngắn không được vượt quá 255 ký tự")
    private String shortDesc;

    @Min(value = 0, message = "Số lượng không được âm")
    private long quantity;

    @Min(value = 0, message = "Số lượng đã bán không được âm")
    private long sold;

    @Size(max = 100, message = "Tên nhà sản xuất không được vượt quá 100 ký tự")
    private String factory;

    @Size(max = 100, message = "Đối tượng sử dụng không được vượt quá 100 ký tự")
    private String target;

    // Không cần thiết
    // @OneToMany(mappedBy = "product")
    // List<Product> products;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Order [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", quantity=" + quantity + ", sold=" + sold + ", factory="
                + factory + ", target=" + target + "]";
    }
}
