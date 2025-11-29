<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Giỏ hàng - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/client/css/style.css" rel="stylesheet">
                    <style>
                        :root {
                            --primary-color: #00bfa6;
                            --primary-dark: #00a896;
                            --primary-light: #e0f7f4;
                            --text-dark: #2c3e50;
                            --text-muted: #6c757d;
                            --border-color: #e8ecef;
                            --shadow-sm: 0 2px 8px rgba(0, 191, 166, 0.08);
                            --shadow-md: 0 4px 20px rgba(0, 191, 166, 0.12);
                        }

                        /* Fix header overlap issue */
                        .cart-container {
                            padding-top: 232px !important;
                            min-height: calc(100vh - 200px);
                        }

                        .cart-header {
                            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
                            padding: 2rem 0;
                            margin: -140px -15px 2rem -15px;
                            color: white;
                            border-radius: 0 0 24px 24px;
                            box-shadow: 0 4px 20px rgba(0, 191, 166, 0.2);
                        }

                        .cart-header h2 {
                            margin: 0;
                            font-weight: 700;
                            font-size: 2rem;
                            display: flex;
                            align-items: center;
                            gap: 12px;
                        }

                        .cart-header .cart-count {
                            background: rgba(255, 255, 255, 0.2);
                            padding: 4px 12px;
                            border-radius: 20px;
                            font-size: 0.9rem;
                            font-weight: 600;
                        }

                        /* Table Styling */
                        .cart-table-wrapper {
                            background: white;
                            border-radius: 16px;
                            box-shadow: var(--shadow-sm);
                            overflow: hidden;
                            margin-bottom: 2rem;
                        }

                        .cart-table {
                            margin: 0;
                        }

                        .cart-table thead {
                            background: linear-gradient(to right, var(--primary-light), #f0fffe);
                            border-bottom: 2px solid var(--primary-color);
                        }

                        .cart-table thead th {
                            color: var(--primary-dark);
                            font-weight: 600;
                            text-transform: uppercase;
                            font-size: 0.85rem;
                            letter-spacing: 0.5px;
                            padding: 1.2rem 1rem;
                            border: none;
                        }

                        .cart-table tbody tr {
                            border-bottom: 1px solid var(--border-color);
                            transition: all 0.3s ease;
                        }

                        .cart-table tbody tr:hover {
                            background: #f8fcfb;
                            transform: translateX(4px);
                        }

                        .cart-table tbody td {
                            padding: 1.5rem 1rem;
                            vertical-align: middle;
                            border: none;
                        }

                        /* Product Image */
                        .cart-img {
                            width: 80px;
                            height: 80px;
                            object-fit: cover;
                            border-radius: 12px;
                            border: 2px solid var(--border-color);
                            transition: all 0.3s ease;
                        }

                        .cart-img:hover {
                            transform: scale(1.1);
                            border-color: var(--primary-color);
                            box-shadow: 0 4px 12px rgba(0, 191, 166, 0.2);
                        }

                        /* Product Name */
                        .product-name {
                            font-weight: 600;
                            color: var(--text-dark);
                            text-decoration: none;
                            transition: color 0.3s ease;
                            display: inline-block;
                        }

                        .product-name:hover {
                            color: var(--primary-color);
                            text-decoration: none;
                        }

                        /* Price Display */
                        .price-tag {
                            color: var(--primary-color);
                            font-weight: 700;
                            font-size: 1.1rem;
                        }

                        .total-price {
                            color: #00a896;
                            font-weight: 700;
                            font-size: 1.15rem;
                        }

                        /* Quantity Controls */
                        .quantity-controls {
                            display: inline-flex;
                            align-items: center;
                            background: white;
                            border: 2px solid var(--border-color);
                            border-radius: 12px;
                            overflow: hidden;
                            box-shadow: var(--shadow-sm);
                        }

                        .quantity-controls button {
                            width: 36px;
                            height: 36px;
                            border: none;
                            background: transparent;
                            color: var(--primary-color);
                            cursor: pointer;
                            transition: all 0.2s ease;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        }

                        .quantity-controls button:hover {
                            background: var(--primary-light);
                            color: var(--primary-dark);
                        }

                        .quantity-controls button:active {
                            transform: scale(0.9);
                        }

                        .quantity-controls input {
                            width: 50px;
                            height: 36px;
                            border: none;
                            border-left: 1px solid var(--border-color);
                            border-right: 1px solid var(--border-color);
                            text-align: center;
                            font-weight: 600;
                            color: var(--text-dark);
                            background: #fafafa;
                        }

                        /* Delete Button */
                        .btn-delete {
                            width: 40px;
                            height: 40px;
                            border-radius: 10px;
                            border: 2px solid #ffebee;
                            background: white;
                            color: #f44336;
                            transition: all 0.3s ease;
                            display: inline-flex;
                            align-items: center;
                            justify-content: center;
                        }

                        .btn-delete:hover {
                            background: #f44336;
                            color: white;
                            border-color: #f44336;
                            transform: rotate(10deg) scale(1.1);
                        }

                        /* Empty Cart State */
                        .empty-cart {
                            text-align: center;
                            padding: 4rem 2rem;
                        }

                        .empty-cart i {
                            font-size: 4rem;
                            color: var(--primary-color);
                            margin-bottom: 1.5rem;
                            opacity: 0.6;
                        }

                        .empty-cart h4 {
                            color: var(--text-muted);
                            font-weight: 600;
                            margin-bottom: 1rem;
                        }

                        .empty-cart .btn {
                            margin-top: 1rem;
                        }

                        /* Order Summary */
                        .order-summary {
                            background: white;
                            border-radius: 16px;
                            box-shadow: var(--shadow-md);
                            padding: 2rem;
                            position: sticky;
                            top: 120px;
                        }

                        .order-summary h5 {
                            color: var(--text-dark);
                            font-weight: 700;
                            margin-bottom: 1.5rem;
                            padding-bottom: 1rem;
                            border-bottom: 2px solid var(--primary-light);
                        }

                        .summary-row {
                            display: flex;
                            justify-content: space-between;
                            padding: 0.75rem 0;
                            color: var(--text-muted);
                            font-size: 0.95rem;
                        }

                        .summary-row.total {
                            margin-top: 1rem;
                            padding-top: 1rem;
                            border-top: 2px solid var(--border-color);
                            font-size: 1.25rem;
                            font-weight: 700;
                            color: var(--text-dark);
                        }

                        .summary-row.total .amount {
                            color: var(--primary-color);
                        }

                        .btn-checkout {
                            width: 100%;
                            padding: 1rem;
                            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
                            border: none;
                            border-radius: 12px;
                            color: white;
                            font-weight: 600;
                            font-size: 1.1rem;
                            margin-top: 1.5rem;
                            transition: all 0.3s ease;
                            box-shadow: 0 4px 15px rgba(0, 191, 166, 0.3);
                        }

                        .btn-checkout:hover {
                            transform: translateY(-2px);
                            box-shadow: 0 6px 20px rgba(0, 191, 166, 0.4);
                        }

                        .btn-checkout:active {
                            transform: translateY(0);
                        }

                        /* Responsive Design */
                        @media (max-width: 992px) {
                            .cart-container {
                                padding-top: 232px !important;
                            }

                            .order-summary {
                                position: relative;
                                top: 0;
                                margin-top: 2rem;
                            }
                        }

                        @media (max-width: 768px) {
                            .cart-header h2 {
                                font-size: 1.5rem;
                            }

                            .cart-table {
                                font-size: 0.9rem;
                            }

                            .cart-img {
                                width: 60px;
                                height: 60px;
                            }

                            .quantity-controls {
                                transform: scale(0.9);
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

                        .cart-table-wrapper,
                        .order-summary {
                            animation: fadeInUp 0.5s ease;
                        }
                    </style>
                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />
                    
                    <div class="container cart-container">
                        <!-- Cart Header -->
                        <div class="cart-header">
                            <div class="container">
                                <h2>
                                    <i class="fas fa-shopping-cart"></i>
                                    Giỏ hàng của bạn
                                    <c:if test="${not empty cartDetails}">
                                        <span class="cart-count">${cartDetails.size()} sản phẩm</span>
                                    </c:if>
                                </h2>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Cart Items -->
                            <div class="col-lg-8">
                                <div class="cart-table-wrapper">
                                    <table class="table cart-table mb-0">
                                        <thead>
                                            <tr>
                                                <th class="text-center" style="width: 100px;">Sản phẩm</th>
                                                <th>Thông tin</th>
                                                <th class="text-center" style="width: 120px;">Đơn giá</th>
                                                <th class="text-center" style="width: 140px;">Số lượng</th>
                                                <th class="text-center" style="width: 130px;">Tổng tiền</th>
                                                <th class="text-center" style="width: 70px;">Xóa</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty cartDetails}">
                                                <tr>
                                                    <td colspan="6" class="empty-cart">
                                                        <i class="fas fa-shopping-cart"></i>
                                                        <h4>Giỏ hàng của bạn đang trống</h4>
                                                        <p class="text-muted">Hãy thêm sản phẩm vào giỏ hàng để tiếp tục mua sắm</p>
                                                        <a href="/products" class="btn btn-checkout" style="width: auto; padding: 0.75rem 2rem;">
                                                            <i class="fas fa-shopping-bag me-2"></i>Tiếp tục mua sắm
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                                <tr>
                                                    <td class="text-center">
                                                        <img src="/img/product/${cartDetail.product.image}"
                                                            class="cart-img" alt="${cartDetail.product.name}">
                                                    </td>
                                                    <td>
                                                        <a href="/product/${cartDetail.product.id}" target="_blank"
                                                            class="product-name">
                                                            ${cartDetail.product.name}
                                                        </a>
                                                    </td>
                                                    <td class="text-center">
                                                        <span class="price-tag">
                                                            <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="quantity-controls">
                                                            <button class="btn-minus" type="button" title="Giảm">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <input type="text" class="cart-qty-input"
                                                                value="${cartDetail.quantity}"
                                                                data-cart-detail-id="${cartDetail.id}"
                                                                data-cart-detail-price="${cartDetail.price}"
                                                                data-cart-detail-index="${status.index}" readonly>
                                                            <button class="btn-plus" type="button" title="Tăng">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <span class="total-price" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button class="btn-delete" type="submit" title="Xóa sản phẩm">
                                                                <i class="fa fa-trash"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!-- Order Summary -->
                            <c:if test="${not empty cartDetails}">
                                <div class="col-lg-4">
                                    <div class="order-summary">
                                        <h5><i class="fas fa-file-invoice-dollar me-2"></i>Thông tin đơn hàng</h5>
                                        
                                        <div class="summary-row">
                                            <span>Tạm tính:</span>
                                            <span class="amount" data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                            </span>
                                        </div>
                                        
                                        <div class="summary-row">
                                            <span>Phí vận chuyển:</span>
                                            <span class="amount text-success">Miễn phí</span>
                                        </div>
                                        
                                        <div class="summary-row total">
                                            <span>Tổng cộng:</span>
                                            <span class="amount" data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                            </span>
                                        </div>

                                        <form:form method="post" action="/confirm-checkout" modelAttribute="cart">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div style="display: none;">
                                                <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                    varStatus="status">
                                                    <div>
                                                        <form:input type="text" value="${cartDetail.id}"
                                                            path="cartDetails[${status.index}].id" />
                                                        <form:input type="text" value="${cartDetail.quantity}"
                                                            path="cartDetails[${status.index}].quantity" />
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <button type="submit" class="btn-checkout">
                                                <i class="fas fa-check-circle me-2"></i>Xác nhận đặt hàng
                                            </button>
                                        </form:form>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
                    
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script src="/client/js/main.js"></script>
                </body>

                </html>