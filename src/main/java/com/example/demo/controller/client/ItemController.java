package com.example.demo.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.service.UserService;

import com.example.demo.domain.User;

@Controller
public class ItemController {

    private final UserService userService;

    public ItemController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        User users = this.userService.getUsersById(id);
        model.addAttribute("users", users);
        return "client/product/detail";
    }
}
