<!-- Navbar start -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <div class="container-fluid" style="top: 0px;">
                <div class="container px-0">
                    <nav class="navbar navbar-light bg-white navbar-expand-xl">
                        <a href="/" class="navbar-brand">
                            <h1 class="text-primary display-6">Mac Shop</h1>
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                            <div class="navbar-nav mx-auto">
                                <a href="index.html" class="nav-item nav-link active">Home</a>
                                <a href="shop.html" class="nav-item nav-link">Shop</a>
                                <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                    <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                        <a href="cart.html" class="dropdown-item">Cart</a>
                                        <a href="chackout.html" class="dropdown-item">Chackout</a>
                                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                        <a href="404.html" class="dropdown-item">404 Page</a>
                                    </div>
                                </div>
                                <a href="contact.html" class="nav-item nav-link">Contact</a>
                            </div>
                            <div class="d-flex m-3 me-0">
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                    <div class="d-flex align-items-center gap-3">

                                        <!-- Giỏ hàng -->
                                        <a href="/cart"
                                            class="position-relative text-decoration-none text-dark me-3 my-auto">
                                            <i class="fa fa-shopping-bag fa-lg"></i>
                                            <span
                                                class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary text-dark"
                                                style="min-width: 18px; height: 18px; font-size: 0.75rem; padding: 2px 4px;">
                                                ${sessionScope.sum}
                                            </span>
                                        </a>


                                        <!-- Avatar & Dropdown -->
                                        <div class="dropdown my-auto">
                                            <a href="#" class="d-flex align-items-center text-decoration-none"
                                                id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fas fa-user fa-lg me-2 text-primary"></i>
                                                <span class="d-none d-lg-inline fw-semibold">Tài khoản</span>
                                            </a>
                                            <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 rounded-3 mt-2"
                                                aria-labelledby="userDropdown" style="min-width: 250px;">
                                                <li class="px-3 py-2">
                                                    <div class="fw-bold text-dark">${user.fullName}</div>
                                                    <div class="text-muted small">${user.email}</div>
                                                </li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li class="text-center py-2">
                                                    <img src="/img/avatar/${sessionScope.avatar}" alt="Avatar"
                                                        class="rounded-circle border" width="70" height="70">

                                                    <div class="text-center my-3">
                                                        <c:out value="${sessionScope.fullName}" />
                                                    </div>
                                                </li>


                                                <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item py-2" href="/profile"><i
                                                            class="fas fa-id-card me-2 text-secondary"></i>Thông tin cá
                                                        nhân</a></li>
                                                <li><a class="dropdown-item py-2" href="/orders"><i
                                                            class="fas fa-box me-2 text-secondary"></i>Đơn hàng của
                                                        tôi</a></li>
                                                <li>
                                                    <form method="post" action="/logout">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button class="dropdown-item py-2 text-danger"><i
                                                                class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                                                        </button>
                                                    </form>
                                                </li>

                                            </ul>
                                        </div>



                                    </div>
                                </c:if>

                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <div class="d-flex align-items-center" style="gap: 1rem;">
                                        <a href="/login"
                                            class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center"
                                            style="min-width: 110px; border-radius: 6px; font-weight: 600; box-shadow: 0 2px 6px rgba(0,0,0,0.1); transition: box-shadow 0.3s ease;">
                                            <i class="fas fa-sign-in-alt me-2"></i> Đăng nhập
                                        </a>
                                        <a href="/register"
                                            class="btn btn-primary btn-sm d-flex align-items-center justify-content-center"
                                            style="min-width: 110px; border-radius: 6px; font-weight: 600; box-shadow: 0 2px 6px rgba(0,0,0,0.1); transition: box-shadow 0.3s ease;">
                                            <i class="fas fa-user-plus me-2"></i> Đăng ký
                                        </a>
                                    </div>
                                </c:if>


                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- Navbar End -->