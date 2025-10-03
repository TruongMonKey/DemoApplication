package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        model.addAttribute("countUser", this.userService.countCustomers());
        model.addAttribute("countOrder", this.userService.countSales());
        model.addAttribute("totalPrice", this.userService.getTotalPrice());
        return "admin/dashboard/show";
    }
}
