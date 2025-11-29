<!-- Navbar start -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
    :root {
        --primary-color: rgba(15, 195, 149, 0.95);
        --primary-dark: rgba(12, 156, 119, 1);
        --primary-light: rgba(15, 195, 149, 0.1);
    }

    /* Header Container */
    .header-modern {
        background: white;
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.08);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        transition: all 0.3s ease;
    }

    .header-modern.scrolled {
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.12);
    }

    /* Top Bar */
    .top-bar {
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
        color: white;
        padding: 8px 0;
        font-size: 0.85rem;
    }

    .top-bar a {
        color: white;
        text-decoration: none;
        transition: opacity 0.3s;
    }

    .top-bar a:hover {
        opacity: 0.8;
    }

    .top-bar i {
        margin-right: 6px;
    }

    /* Main Navbar */
    .navbar-modern {
        padding: 15px 0;
    }

    /* Brand Logo */
    .navbar-brand-modern {
        display: flex;
        align-items: center;
        gap: 12px;
        text-decoration: none;
        transition: transform 0.3s;
    }

    .navbar-brand-modern:hover {
        transform: translateY(-2px);
    }

    .logo-icon {
        width: 45px;
        height: 45px;
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 1.5rem;
        font-weight: 700;
        box-shadow: 0 4px 12px rgba(15, 195, 149, 0.3);
    }

    .brand-text h1 {
        margin: 0;
        font-size: 1.8rem;
        font-weight: 700;
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .brand-text small {
        font-size: 0.75rem;
        color: #718096;
        font-style: italic;
    }

    /* Navigation Links */
    .nav-link-modern {
        color: #4a5568;
        font-weight: 500;
        font-size: 1rem;
        padding: 10px 18px;
        margin: 0 4px;
        border-radius: 8px;
        transition: all 0.3s ease;
        position: relative;
        text-decoration: none;
        display: inline-block;
    }

    .nav-link-modern::before {
        content: '';
        position: absolute;
        bottom: 8px;
        left: 18px;
        right: 18px;
        height: 2px;
        background: var(--primary-color);
        transform: scaleX(0);
        transition: transform 0.3s ease;
    }

    .nav-link-modern:hover,
    .nav-link-modern.active {
        color: var(--primary-dark);
        background: var(--primary-light);
    }

    .nav-link-modern:hover::before,
    .nav-link-modern.active::before {
        transform: scaleX(1);
    }

    /* Cart Button */
    .cart-btn {
        position: relative;
        width: 45px;
        height: 45px;
        background: var(--primary-light);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--primary-dark);
        text-decoration: none;
        transition: all 0.3s ease;
        margin-right: 12px;
    }

    .cart-btn:hover {
        background: var(--primary-color);
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(15, 195, 149, 0.3);
    }

    .cart-btn i {
        font-size: 1.2rem;
    }

    .cart-badge {
        position: absolute;
        top: -6px;
        right: -6px;
        background: #ef4444;
        color: white;
        font-size: 0.7rem;
        font-weight: 700;
        min-width: 20px;
        height: 20px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0 6px;
        border: 2px solid white;
        box-shadow: 0 2px 8px rgba(239, 68, 68, 0.4);
    }

    /* User Dropdown */
    .user-btn {
        width: 45px;
        height: 45px;
        background: var(--primary-light);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--primary-dark);
        cursor: pointer;
        transition: all 0.3s ease;
        border: 2px solid transparent;
    }

    .user-btn:hover {
        background: var(--primary-color);
        color: white;
        border-color: var(--primary-dark);
        transform: scale(1.05);
    }

    .user-btn i {
        font-size: 1.2rem;
    }

    /* Dropdown Menu */
    .dropdown-menu-modern {
        min-width: 280px;
        border: none;
        border-radius: 16px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
        padding: 0;
        margin-top: 12px;
        overflow: hidden;
    }

    .dropdown-header-modern {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        color: white;
        padding: 20px;
        text-align: center;
    }

    .dropdown-avatar {
        width: 70px;
        height: 70px;
        border-radius: 50%;
        border: 3px solid white;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        margin-bottom: 12px;
        object-fit: cover;
    }

    .dropdown-username {
        font-weight: 600;
        font-size: 1.1rem;
        margin-bottom: 4px;
    }

    .dropdown-email {
        font-size: 0.85rem;
        opacity: 0.9;
    }

    .dropdown-item-modern {
        padding: 12px 20px;
        color: #4a5568;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        gap: 12px;
        text-decoration: none;
        border: none;
        background: none;
        width: 100%;
        text-align: left;
    }

    .dropdown-item-modern i {
        width: 24px;
        font-size: 1.1rem;
        color: var(--primary-color);
        transition: transform 0.3s;
    }

    .dropdown-item-modern:hover {
        background: var(--primary-light);
        color: var(--primary-dark);
    }

    .dropdown-item-modern:hover i {
        transform: translateX(3px);
    }

    .dropdown-item-modern.logout {
        color: #ef4444;
        border-top: 1px solid #e2e8f0;
        margin-top: 8px;
    }

    .dropdown-item-modern.logout i {
        color: #ef4444;
    }

    .dropdown-item-modern.logout:hover {
        background: #fee;
    }

    /* Auth Buttons */
    .auth-buttons {
        display: flex;
        gap: 12px;
    }

    .btn-auth {
        padding: 10px 24px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 0.95rem;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s ease;
        text-decoration: none;
        border: 2px solid;
        white-space: nowrap;
    }

    .btn-login {
        background: white;
        color: var(--primary-dark);
        border-color: var(--primary-color);
    }

    .btn-login:hover {
        background: var(--primary-light);
        color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(15, 195, 149, 0.2);
    }

    .btn-register {
        background: var(--primary-color);
        color: white;
        border-color: var(--primary-color);
    }

    .btn-register:hover {
        background: var(--primary-dark);
        border-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(15, 195, 149, 0.3);
    }

    /* Mobile Toggle */
    .navbar-toggler-modern {
        width: 45px;
        height: 45px;
        border: 2px solid var(--primary-color);
        border-radius: 10px;
        background: var(--primary-light);
        color: var(--primary-dark);
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }

    .navbar-toggler-modern:hover {
        background: var(--primary-color);
        color: white;
    }

    .navbar-toggler-modern i {
        font-size: 1.3rem;
    }

    /* Responsive */
    @media (max-width: 1199px) {
        .nav-link-modern {
            margin: 4px 0;
        }

        .navbar-collapse {
            background: white;
            padding: 20px;
            border-radius: 12px;
            margin-top: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .auth-buttons {
            flex-direction: column;
            margin-top: 15px;
        }

        .btn-auth {
            width: 100%;
            justify-content: center;
        }
    }

    @media (max-width: 768px) {
        .brand-text h1 {
            font-size: 1.4rem;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            font-size: 1.3rem;
        }

        .top-bar {
            font-size: 0.75rem;
        }
    }

    /* Animation */
    @keyframes slideDown {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .dropdown-menu-modern.show {
        animation: slideDown 0.3s ease;
    }
</style>

<!-- Top Bar -->
<div class="top-bar">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <small>
                    <i class="fas fa-phone-alt"></i> Hotline: 
                    <a href="tel:0763339999">076 333 9999</a>
                </small>
                <span class="mx-2">|</span>
                <small>
                    <i class="fas fa-envelope"></i>
                    <a href="mailto:contact@mactb.com">contact@mactb.com</a>
                </small>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <small>
                    <i class="fas fa-shipping-fast"></i> Miễn phí vận chuyển đơn hàng từ 5 triệu
                </small>
            </div>
        </div>
    </div>
</div>

<!-- Main Header -->
<div class="header-modern" id="mainHeader">
    <div class="container">
        <nav class="navbar navbar-expand-xl navbar-modern p-0">
            <!-- Brand Logo -->
            <a href="/" class="navbar-brand-modern">
                <div class="logo-icon">
                    <i class="fas fa-laptop"></i>
                </div>
                <div class="brand-text">
                    <h1>MacT&B</h1>
                    <small>Premium Apple Store</small>
                </div>
            </a>

            <!-- Mobile Toggle -->
            <button class="navbar-toggler-modern d-xl-none" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Navigation -->
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <!-- Nav Links -->
                <div class="navbar-nav mx-auto">
                    <a href="/" class="nav-link-modern active">
                        <i class="fas fa-home me-1"></i> Trang chủ
                    </a>
                    <a href="/products" class="nav-link-modern">
                        <i class="fas fa-box-open me-1"></i> Sản phẩm
                    </a>
                    <a href="/shop-details" class="nav-link-modern">
                        <i class="fas fa-store me-1"></i> Cửa hàng
                    </a>
                    <a href="/shop-contacts" class="nav-link-modern">
                        <i class="fas fa-phone me-1"></i> Liên hệ
                    </a>
                </div>

                <!-- Right Side Actions -->
                <div class="d-flex align-items-center">
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <!-- Shopping Cart -->
                        <a href="/cart" class="cart-btn">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="cart-badge">${sessionScope.sum}</span>
                        </a>

                        <!-- User Dropdown -->
                        <div class="dropdown">
                            <div class="user-btn" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user-circle"></i>
                            </div>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-modern">
                                <!-- Dropdown Header -->
                                <li class="dropdown-header-modern">
                                    <img src="/img/avatar/${sessionScope.avatar}" alt="Avatar" class="dropdown-avatar">
                                    <div class="dropdown-username">${sessionScope.fullName}</div>
                                    <div class="dropdown-email">${user.email}</div>
                                </li>

                                <!-- Menu Items -->
                                <li>
                                    <a href="/profile" class="dropdown-item-modern">
                                        <i class="fas fa-user-edit"></i>
                                        <span>Thông tin cá nhân</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/order-history" class="dropdown-item-modern">
                                        <i class="fas fa-history"></i>
                                        <span>Lịch sử mua hàng</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/wishlist" class="dropdown-item-modern">
                                        <i class="fas fa-heart"></i>
                                        <span>Danh sách yêu thích</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/settings" class="dropdown-item-modern">
                                        <i class="fas fa-cog"></i>
                                        <span>Cài đặt</span>
                                    </a>
                                </li>

                                <!-- Logout -->
                                <li>
                                    <form method="post" action="/logout" class="m-0">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button type="submit" class="dropdown-item-modern logout">
                                            <i class="fas fa-sign-out-alt"></i>
                                            <span>Đăng xuất</span>
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </c:if>

                    <c:if test="${empty pageContext.request.userPrincipal}">
                        <!-- Auth Buttons -->
                        <div class="auth-buttons">
                            <a href="/login" class="btn-auth btn-login">
                                <i class="fas fa-sign-in-alt"></i>
                                <span>Đăng nhập</span>
                            </a>
                            <a href="/register" class="btn-auth btn-register">
                                <i class="fas fa-user-plus"></i>
                                <span>Đăng ký</span>
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>
        </nav>
    </div>
</div>

<script>
    // Scroll effect for header
    window.addEventListener('scroll', function() {
        const header = document.getElementById('mainHeader');
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // Active link highlight
    const currentPath = window.location.pathname;
    document.querySelectorAll('.nav-link-modern').forEach(link => {
        if (link.getAttribute('href') === currentPath) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });

    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        const navbar = document.querySelector('.navbar-collapse');
        const toggler = document.querySelector('.navbar-toggler-modern');
        
        if (navbar && navbar.classList.contains('show')) {
            if (!navbar.contains(event.target) && !toggler.contains(event.target)) {
                const bsCollapse = new bootstrap.Collapse(navbar, {
                    toggle: false
                });
                bsCollapse.hide();
            }
        }
    });

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
</script>

<!-- Navbar End -->