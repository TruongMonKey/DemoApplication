<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Thanh toán</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">

                    <style>
                        :root {
                            --primary-color: #00bfa6;
                            --primary-dark: #00a08a;
                            --primary-light: #e0f7f4;
                            --text-dark: #1a1a1a;
                            --text-light: #6b7280;
                            --border-color: #e5e7eb;
                            --bg-light: #f9fafb;
                        }

                        * {
                            font-family: 'Inter', sans-serif;
                        }

                        body {
                            background-color: var(--bg-light);
                            color: var(--text-dark);
                        }

                        .checkout-container {
                            max-width: 1400px;
                            margin: 0 auto;
                            padding: 2rem 1rem;
                        }

                        /* Breadcrumb Modern */
                        .modern-breadcrumb {
                            background: white;
                            padding: 1rem 1.5rem;
                            border-radius: 12px;
                            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
                            margin-bottom: 2rem;
                        }

                        .modern-breadcrumb .breadcrumb {
                            margin: 0;
                            background: transparent;
                            padding: 0;
                        }

                        .modern-breadcrumb .breadcrumb-item a {
                            color: var(--primary-color);
                            text-decoration: none;
                            font-weight: 500;
                            transition: all 0.3s;
                        }

                        .modern-breadcrumb .breadcrumb-item a:hover {
                            color: var(--primary-dark);
                        }

                        .modern-breadcrumb .breadcrumb-item.active {
                            color: var(--text-light);
                        }

                        /* Page Header */
                        .page-header {
                            text-align: center;
                            margin-bottom: 3rem;
                        }

                        .page-header h1 {
                            font-size: 2.5rem;
                            font-weight: 700;
                            color: var(--text-dark);
                            margin-bottom: 0.5rem;
                        }

                        .page-header p {
                            color: var(--text-light);
                            font-size: 1.1rem;
                        }

                        /* Modern Card */
                        .modern-card {
                            background: white;
                            border-radius: 16px;
                            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
                            padding: 2rem;
                            margin-bottom: 2rem;
                            border: 1px solid var(--border-color);
                            transition: all 0.3s;
                        }

                        .modern-card:hover {
                            box-shadow: 0 8px 16px rgba(0, 191, 166, 0.1);
                            transform: translateY(-2px);
                        }

                        .card-title {
                            font-size: 1.5rem;
                            font-weight: 700;
                            color: var(--text-dark);
                            margin-bottom: 1.5rem;
                            padding-bottom: 1rem;
                            border-bottom: 2px solid var(--primary-light);
                            display: flex;
                            align-items: center;
                            gap: 0.75rem;
                        }

                        .card-title i {
                            color: var(--primary-color);
                            font-size: 1.75rem;
                        }

                        /* Product Table */
                        .product-table {
                            background: white;
                            border-radius: 16px;
                            overflow: hidden;
                            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
                            margin-bottom: 2rem;
                        }

                        .product-table table {
                            margin: 0;
                        }

                        .product-table thead {
                            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
                        }

                        .product-table thead th {
                            color: white;
                            font-weight: 600;
                            padding: 1.25rem 1rem;
                            border: none;
                            text-transform: uppercase;
                            font-size: 0.875rem;
                            letter-spacing: 0.5px;
                        }

                        .product-table tbody tr {
                            border-bottom: 1px solid var(--border-color);
                            transition: all 0.3s;
                        }

                        .product-table tbody tr:last-child {
                            border-bottom: none;
                        }

                        .product-table tbody tr:hover {
                            background-color: var(--primary-light);
                        }

                        .product-table tbody td {
                            padding: 1.5rem 1rem;
                            vertical-align: middle;
                        }

                        .product-image {
                            width: 80px;
                            height: 80px;
                            border-radius: 12px;
                            object-fit: cover;
                            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                        }

                        .product-name {
                            font-weight: 600;
                            color: var(--text-dark);
                            text-decoration: none;
                            transition: all 0.3s;
                        }

                        .product-name:hover {
                            color: var(--primary-color);
                        }

                        .product-price {
                            font-weight: 600;
                            color: var(--primary-color);
                            font-size: 1.1rem;
                        }

                        .quantity-input {
                            width: 80px;
                            text-align: center;
                            border: 2px solid var(--border-color);
                            border-radius: 8px;
                            padding: 0.5rem;
                            font-weight: 600;
                            background-color: var(--bg-light);
                        }

                        /* Form Styling */
                        .form-group label {
                            font-weight: 600;
                            color: var(--text-dark);
                            margin-bottom: 0.5rem;
                            display: flex;
                            align-items: center;
                            gap: 0.5rem;
                        }

                        .form-group label i {
                            color: var(--primary-color);
                        }

                        .form-control {
                            border: 2px solid var(--border-color);
                            border-radius: 10px;
                            padding: 0.75rem 1rem;
                            font-size: 1rem;
                            transition: all 0.3s;
                        }

                        .form-control:focus {
                            border-color: var(--primary-color);
                            box-shadow: 0 0 0 3px var(--primary-light);
                            outline: none;
                        }

                        /* Summary Card */
                        .summary-card {
                            background: linear-gradient(135deg, #ffffff 0%, var(--primary-light) 100%);
                            border-radius: 16px;
                            padding: 2rem;
                            box-shadow: 0 8px 16px rgba(0, 191, 166, 0.15);
                            border: 2px solid var(--primary-color);
                        }

                        .summary-title {
                            font-size: 1.75rem;
                            font-weight: 700;
                            color: var(--text-dark);
                            margin-bottom: 1.5rem;
                            text-align: center;
                        }

                        .summary-title .highlight {
                            color: var(--primary-color);
                        }

                        .summary-row {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            padding: 1rem 0;
                            border-bottom: 1px solid var(--border-color);
                        }

                        .summary-row:last-child {
                            border-bottom: none;
                        }

                        .summary-label {
                            font-weight: 600;
                            color: var(--text-dark);
                            display: flex;
                            align-items: center;
                            gap: 0.5rem;
                        }

                        .summary-label i {
                            color: var(--primary-color);
                        }

                        .summary-value {
                            font-weight: 600;
                            color: var(--text-light);
                        }

                        .summary-total {
                            background: white;
                            padding: 1.5rem;
                            border-radius: 12px;
                            margin: 1.5rem 0;
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                        }

                        .summary-total .label {
                            font-size: 1.25rem;
                            font-weight: 700;
                            color: var(--text-dark);
                        }

                        .summary-total .value {
                            font-size: 1.75rem;
                            font-weight: 700;
                            color: var(--primary-color);
                        }

                        /* Buttons */
                        .btn-checkout {
                            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
                            color: white;
                            border: none;
                            border-radius: 12px;
                            padding: 1rem 2rem;
                            font-size: 1.1rem;
                            font-weight: 600;
                            width: 100%;
                            text-transform: uppercase;
                            letter-spacing: 0.5px;
                            transition: all 0.3s;
                            box-shadow: 0 4px 12px rgba(0, 191, 166, 0.3);
                        }

                        .btn-checkout:hover {
                            transform: translateY(-2px);
                            box-shadow: 0 6px 20px rgba(0, 191, 166, 0.4);
                            background: linear-gradient(135deg, var(--primary-dark), var(--primary-color));
                        }

                        .btn-back {
                            color: var(--primary-color);
                            text-decoration: none;
                            font-weight: 600;
                            display: inline-flex;
                            align-items: center;
                            gap: 0.5rem;
                            transition: all 0.3s;
                            padding: 0.75rem 1.5rem;
                            border-radius: 10px;
                            background: white;
                            border: 2px solid var(--primary-color);
                        }

                        .btn-back:hover {
                            background: var(--primary-color);
                            color: white;
                            transform: translateX(-5px);
                        }

                        /* Empty State */
                        .empty-state {
                            text-align: center;
                            padding: 4rem 2rem;
                        }

                        .empty-state i {
                            font-size: 5rem;
                            color: var(--border-color);
                            margin-bottom: 1rem;
                        }

                        .empty-state h3 {
                            color: var(--text-light);
                            font-weight: 600;
                        }

                        /* Badge */
                        .badge-success {
                            background: var(--primary-light);
                            color: var(--primary-color);
                            padding: 0.5rem 1rem;
                            border-radius: 20px;
                            font-weight: 600;
                            display: inline-flex;
                            align-items: center;
                            gap: 0.5rem;
                        }

                        /* Responsive */
                        @media (max-width: 768px) {
                            .page-header h1 {
                                font-size: 1.75rem;
                            }

                            .modern-card {
                                padding: 1.5rem;
                            }

                            .product-table thead th {
                                font-size: 0.75rem;
                                padding: 1rem 0.5rem;
                            }

                            .product-table tbody td {
                                padding: 1rem 0.5rem;
                            }

                            .product-image {
                                width: 60px;
                                height: 60px;
                            }

                            .summary-title {
                                font-size: 1.5rem;
                            }
                        }

                        /* Animation */
                        @keyframes fadeInUp {
                            from {
                                opacity: 0;
                                transform: translateY(20px);
                            }
                            to {
                                opacity: 1;
                                transform: translateY(0);
                            }
                        }

                        .modern-card, .product-table {
                            animation: fadeInUp 0.6s ease-out;
                        }
                    </style>
                </head>

                <body>
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-grow" style="color: var(--primary-color);" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Checkout Page Start -->
                    <div class="checkout-container">
                        <!-- Breadcrumb -->
                        <div class="modern-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i> Trang chủ</a></li>
                                    <li class="breadcrumb-item"><a href="/cart"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
                                </ol>
                            </nav>
                        </div>

                        <!-- Page Header -->
                        <div class="page-header">
                            <h1><i class="fas fa-credit-card"></i> Thanh Toán Đơn Hàng</h1>
                            <p>Vui lòng kiểm tra thông tin và hoàn tất đơn hàng của bạn</p>
                        </div>

                        <!-- Product Table -->
                        <div class="product-table">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Tên sản phẩm</th>
                                        <th scope="col">Đơn giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty cartDetails}">
                                        <tr>
                                            <td colspan="5">
                                                <div class="empty-state">
                                                    <i class="fas fa-shopping-basket"></i>
                                                    <h3>Giỏ hàng trống</h3>
                                                    <p>Hãy thêm sản phẩm vào giỏ hàng để tiếp tục</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <tr>
                                            <td>
                                                <img src="/img/product/${cartDetail.product.image}"
                                                    class="product-image" alt="${cartDetail.product.name}">
                                            </td>
                                            <td>
                                                <a href="/product/${cartDetail.product.id}" target="_blank" class="product-name">
                                                    ${cartDetail.product.name}
                                                </a>
                                            </td>
                                            <td>
                                                <span class="product-price">
                                                    <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                </span>
                                            </td>
                                            <td>
                                                <input type="text" class="quantity-input" value="${cartDetail.quantity}" readonly>
                                            </td>
                                            <td>
                                                <span class="product-price" data-cart-detail-id="${cartDetail.id}">
                                                    <fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <c:if test="${not empty cartDetails}">
                            <form:form action="/place-order" method="post" modelAttribute="cart">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="row g-4">
                                    <!-- Receiver Information -->
                                    <div class="col-lg-7">
                                        <div class="modern-card">
                                            <h5 class="card-title">
                                                <i class="fas fa-user-circle"></i>
                                                Thông Tin Người Nhận
                                            </h5>
                                            <div class="row g-3">
                                                <div class="col-12 form-group">
                                                    <label><i class="fas fa-user"></i> Họ và tên</label>
                                                    <input class="form-control" name="receiverName" placeholder="Nhập họ tên người nhận" required />
                                                </div>
                                                <div class="col-12 form-group">
                                                    <label><i class="fas fa-map-marker-alt"></i> Địa chỉ nhận hàng</label>
                                                    <input class="form-control" name="receiverAddress" placeholder="Nhập địa chỉ chi tiết" required />
                                                </div>
                                                <div class="col-12 form-group">
                                                    <label><i class="fas fa-phone"></i> Số điện thoại</label>
                                                    <input class="form-control" name="receiverPhone" placeholder="Nhập số điện thoại" required />
                                                </div>
                                            </div>
                                            <div class="mt-4">
                                                <a href="/cart" class="btn-back">
                                                    <i class="fas fa-arrow-left"></i>
                                                    Quay lại giỏ hàng
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Payment Summary -->
                                    <div class="col-lg-5">
                                        <div class="summary-card">
                                            <h2 class="summary-title">
                                                Thông Tin <span class="highlight">Thanh Toán</span>
                                            </h2>

                                            <div class="summary-row">
                                                <span class="summary-label">
                                                    <i class="fas fa-shipping-fast"></i>
                                                    Phí vận chuyển
                                                </span>
                                                <span class="summary-value">0 đ</span>
                                            </div>

                                            <div class="summary-row">
                                                <span class="summary-label">
                                                    <i class="fas fa-money-bill-wave"></i>
                                                    Hình thức thanh toán
                                                </span>
                                                <span class="badge-success">
                                                    <i class="fas fa-check-circle"></i>
                                                    COD
                                                </span>
                                            </div>

                                            <div class="summary-total">
                                                <span class="label">Tổng thanh toán</span>
                                                <span class="value" data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                </span>
                                            </div>

                                            <button type="submit" class="btn-checkout">
                                                <i class="fas fa-check-circle"></i>
                                                Xác nhận đặt hàng
                                            </button>

                                            <div class="text-center mt-3">
                                                <small style="color: var(--text-light);">
                                                    <i class="fas fa-shield-alt"></i>
                                                    Đảm bảo thanh toán an toàn & bảo mật
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </c:if>
                    </div>
                    <!-- Checkout Page End -->

                    <jsp:include page="../layout/footer.jsp" />

                    <!-- Back to Top -->
                    <a href="#" class="btn border-3 rounded-circle back-to-top" style="background-color: var(--primary-color); border-color: var(--primary-color) !important;">
                        <i class="fa fa-arrow-up" style="color: white;"></i>
                    </a>

                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script src="/client/js/main.js"></script>
                </body>
                </html>