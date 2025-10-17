package com.example.demo.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.demo.domain.Product;
import com.example.demo.domain.Product_;

import jakarta.persistence.criteria.Predicate;

@Service
public class ProductSpecService {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
        };
    }

    public static Specification<Product> minPrice(double price) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.ge(root.get(Product_.PRICE), price);
        };
    }

    public static Specification<Product> maxPrice(double price) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.le(root.get(Product_.PRICE), price);
        };
    }

    public static Specification<Product> nameTarget(String target) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.equal(root.get(Product_.TARGET), target);
        };
    }

    public static Specification<Product> matchListTarget(List<String> target) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
        };
    }

    public static Specification<Product> matchListName(List<String> names) {
        return (root, query, cb) -> {
            Predicate[] predicates = names.stream()
                    .map(name -> cb.like(root.get(Product_.NAME), "%" + name + "%"))
                    .toArray(Predicate[]::new);

            return cb.or(predicates);
        };
    }

    public static Specification<Product> matchPrice(double min, double max) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.and(
                    criteriaBuilder.gt(root.get(Product_.PRICE), min),
                    criteriaBuilder.le(root.get(Product_.PRICE), max));
        };
    }

    public static Specification<Product> matchMultiplePrice(double min, double max) {
        return (root, query, criteriaBuilder) -> {
            return criteriaBuilder.between(
                    root.get(Product_.PRICE), min, max);
        };
    }

    public static Specification<Product> sortByPriceAsc() {
        return (root, query, criteriaBuilder) -> {
            query.orderBy(criteriaBuilder.asc(root.get(Product_.PRICE)));
            return criteriaBuilder.conjunction(); // trả về điều kiện "true"
        };
    }

    public static Specification<Product> sortByPriceDesc() {
        return (root, query, criteriaBuilder) -> {
            query.orderBy(criteriaBuilder.desc(root.get(Product_.PRICE)));
            return criteriaBuilder.conjunction(); // trả về điều kiện "true"
        };
    }

}
