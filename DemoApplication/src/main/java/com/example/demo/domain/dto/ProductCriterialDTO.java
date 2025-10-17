package com.example.demo.domain.dto;

import java.util.List;
import java.util.Optional;

public class ProductCriterialDTO {
    private Optional<String> page = Optional.empty();
    private Optional<List<String>> name = Optional.empty();
    private Optional<List<String>> target = Optional.empty();
    private Optional<List<String>> price = Optional.empty();
    private Optional<String> sort = Optional.empty();

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<List<String>> getName() {
        return name;
    }

    public void setName(Optional<List<String>> name) {
        this.name = name;
    }

    public Optional<List<String>> getTarget() {
        return target;
    }

    public void setTarget(Optional<List<String>> target) {
        this.target = target;
    }

    public Optional<List<String>> getPrice() {
        return price;
    }

    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }
}
