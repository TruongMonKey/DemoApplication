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
                        .cart-table th,
                        .cart-table td {
                            vertical-align: middle;
                        }

                        .cart-img-minimal {
                            width: 60px;
                            height: 60px;
                            object-fit: cover;
                            border-radius: 8px;
                        }

                        .cart-qty-input-minimal {
                            width: 48px;
                            text-align: center;
                        }

                        .order-summary-minimal {
                            background: #fff;
                            border-radius: 12px;
                            box-shadow: 0 2px 16px rgba(0, 0, 0, 0.04);
                        }

                        .cart-action-btns .btn {
                            min-width: 36px;
                            border-radius: 50%;
                            padding: 0.25rem 0.6rem;
                            font-size: 1.1rem;
                            transition: background 0.2s, color 0.2s;
                        }

                        .cart-action-btns .btn:hover {
                            background: #f0f4fa;
                            color: #0d6efd;
                        }

                        .cart-qty-input-minimal {
                            margin: 0 4px;
                            font-weight: 500;
                            font-size: 1rem;
                            background: #f8fafc;
                            border-radius: 6px;
                            border: 1px solid #e0e0e0;
                        }

                        @media (max-width: 767px) {
                            .order-summary-minimal {
                                margin-top: 24px;
                            }
                        }
                    </style>
                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />
                    <div class="container py-5">
                        <h2 class="mb-4">Giỏ hàng của bạn</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered cart-table align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th class="text-center">Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th class="text-center">Giá</th>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-center">Thành tiền</th>
                                        <th class="text-center">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty cartDetails}">
                                        <tr>
                                            <td colspan="6" class="text-center py-5 text-secondary"
                                                style="font-size: 22px;">
                                                <i class="fa fa-shopping-cart fa-3x mb-3 text-primary"></i><br>
                                                Không có sản phẩm trong giỏ hàng
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                        <tr>
                                            <td class="text-center">
                                                <img src="/img/product/${cartDetail.product.image}"
                                                    class="cart-img-minimal" alt="${cartDetail.product.name}">
                                            </td>
                                            <td>
                                                <a href="/product/${cartDetail.product.id}" target="_blank"
                                                    class="fw-bold text-dark text-decoration-none">
                                                    ${cartDetail.product.name}
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <span class="text-primary fw-bold">
                                                    <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                </span>
                                            </td>
                                            <td class="text-center">
                                                <div
                                                    class="quantity d-inline-flex align-items-center cart-action-btns justify-content-center">
                                                    <button class="btn btn-sm btn-outline-secondary btn-minus"
                                                        type="button" title="Giảm số lượng">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                    <input type="text"
                                                        class="form-control cart-qty-input cart-qty-input-minimal"
                                                        value="${cartDetail.quantity}"
                                                        data-cart-detail-id="${cartDetail.id}"
                                                        data-cart-detail-price="${cartDetail.price}"
                                                        data-cart-detail-index="${status.index}" readonly
                                                        style="width: 56px;">
                                                    <button class="btn btn-sm btn-outline-secondary btn-plus"
                                                        type="button" title="Tăng số lượng">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <p class="text-success fw-bold" data-cart-detail-id="${cartDetail.id}">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                </p>
                                            </td>
                                            <td class="text-center">
                                                <form method="post" action="/delete-cart-product/${cartDetail.id}">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button class="btn btn-sm btn-outline-danger"
                                                        title="Xóa sản phẩm"><i class="fa fa-trash"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <c:if test="${not empty cartDetails}">
                            <div class="row justify-content-center mt-4">
                                <div class="col-12 col-md-8 col-lg-6">
                                    <div class="order-summary-minimal p-4">
                                        <h5 class="mb-3 text-center">Thông tin đơn hàng</h5>
                                        <div class="d-flex justify-content-between mb-2">
                                            <span>Tạm tính:</span>
                                            <p class="mb-0 d-inline" data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between mb-2">
                                            <span>Phí vận chuyển:</span>
                                            <span>0 đ</span>
                                        </div>
                                        <div class="d-flex justify-content-between border-top pt-2">
                                            <strong>Tổng cộng:</strong>
                                            <p class="mb-0 d-inline fw-bold" data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                            </p>
                                        </div>
                                        <form:form method="post" action="/confirm-checkout" modelAttribute="cart"
                                            class="mt-3">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div style="display: none;">
                                                <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                    varStatus="status">
                                                    <div class="mb-3">
                                                        <div class="form-group">
                                                            <label>Id:</label>
                                                            <form:input type="text" class="form-control"
                                                                value="${cartDetail.id}"
                                                                path="cartDetails[${status.index}].id" />
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Quantity:</label>
                                                            <form:input type="text" class="form-control"
                                                                value="${cartDetail.quantity}"
                                                                path="cartDetails[${status.index}].quantity" />
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <button class="btn btn-success w-100 mt-2">Xác nhận đặt hàng</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- 1. jQuery ✅ (bắt buộc phải trước mọi plugin dùng jQuery) -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

                    <!-- 2. Bootstrap ✅ -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

                    <!-- 3. Các plugin phụ khác ✅ -->
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>

                    <!-- 4. Owl Carousel ✅ (phải sau jQuery) -->
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- 5. Script chính của bạn (main.js) ✅ (phải để cuối cùng) -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>