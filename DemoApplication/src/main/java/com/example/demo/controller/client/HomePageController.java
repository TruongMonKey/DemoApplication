package com.example.demo.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.domain.Order;
import com.example.demo.domain.Product;
import com.example.demo.domain.User;
import com.example.demo.domain.dto.BestSellerDTO;
import com.example.demo.domain.dto.RegisterDTO;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> prs = this.productService.getAllProducts(pageable);
        List<Product> products = prs.getContent();
        List<BestSellerDTO> bestSellers = productService.getTopBestSellers(6);
        BestSellerDTO bestSeller = (bestSellers != null && !bestSellers.isEmpty()) ? bestSellers.get(0) : null;

        model.addAttribute("products", products);
        model.addAttribute("bestSeller", bestSeller);
        model.addAttribute("bestSellers", bestSellers);

        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        if (!model.containsAttribute("registerUser")) {
            model.addAttribute("registerUser", new RegisterDTO());
        }
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        try {
            if (userService.existsByEmail(registerDTO.getEmail())) {
                bindingResult.rejectValue("email", "error.email", "Email đã tồn tại");
                return "client/auth/register";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Không thể kiểm tra email ngay bây giờ. Vui lòng thử lại.");
            return "client/auth/register";
        }

        try {
            User user = this.userService.registerDTOtoUser(registerDTO);
            String hashPassword = this.passwordEncoder.encode(user.getPassword());

            user.setPassword(hashPassword);
            user.setRole(this.userService.getRoleByName("USER"));
            this.userService.handleSaveUser(user);
            redirectAttributes.addFlashAttribute("successMessage", "Đăng ký thành công. Vui lòng đăng nhập.");
            return "redirect:/login";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Có lỗi xảy ra khi tạo tài khoản. Vui lòng thử lại.");
            return "client/auth/register";
        }
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/access-deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }

    @GetMapping("/shop-details")
    public String getShopDetails(Model model) {
        return "client/contact/shop_details";
    }

    @GetMapping("/shop-contacts")
    public String getShopContact(Model model) {
        return "client/contact/shop_contacts";
    }
}
