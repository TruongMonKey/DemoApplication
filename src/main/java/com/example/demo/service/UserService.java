package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.domain.User;

@Service
public class UserService {
    public String handleHello() {
        return "Hello from service";
    }

    public User getCurrentUser() {
        return new User(
                1L,
                "monkey@gmail.com",
                "123456",
                "123 Banana Street",
                "0123456789");
    }

}
