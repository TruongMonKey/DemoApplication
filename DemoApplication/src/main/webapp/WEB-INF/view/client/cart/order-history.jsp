<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Lịch sử mua hàng - Laptopshop</title>
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
                        <h2 class="mb-4 text-primary fw-bold">Lịch sử mua hàng</h2>

                        <c:if test="${empty orders}">
                            <div class="text-center text-secondary py-5" style="font-size: 22px;">
                                <i class="fa fa-shopping-cart fa-3x mb-3 text-primary"></i><br>
                                Không có lịch sử mua hàng
                            </div>
                        </c:if>

                        <c:forEach var="order" items="${orders}">
                            <div class="card shadow-sm mb-4 border-0">
                                <div class="card-header bg-white border-0">
                                    <div class="d-flex justify-content-between align-items-center" style="gap: 20px;">
                                        <div>
                                            <strong>Đơn hàng ${order.id}</strong> <br />
                                            Tổng tiền:
                                            <span class="text-success fw-bold">
                                                <fmt:formatNumber value="${order.totalPrice}" type="number" /> đ
                                            </span>
                                        </div>
                                        <span class="badge bg-info text-dark">${order.status}</span>
                                    </div>
                                </div>


                                <div class="card-body p-0">
                                    <table class="table table-hover align-middle mb-0">
                                        <thead class="table-light">
                                            <tr>
                                                <th class="text-center">Ảnh</th>
                                                <th>Tên sản phẩm</th>
                                                <th class="text-center">Giá</th>
                                                <th class="text-center">Số lượng</th>
                                                <th class="text-center">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                <tr>
                                                    <td class="text-center">
                                                        <img src="/img/product/${orderDetail.product.image}"
                                                            alt="${orderDetail.product.name}" width="60" height="60"
                                                            style="object-fit: cover; border-radius: 8px;">
                                                    </td>
                                                    <td>
                                                        <a href="/product/${orderDetail.product.id}" target="_blank"
                                                            class="fw-bold text-dark text-decoration-none">
                                                            ${orderDetail.product.name}
                                                        </a>
                                                    </td>
                                                    <td class="text-center text-primary fw-bold">
                                                        <fmt:formatNumber value="${orderDetail.price}" type="number" />
                                                        đ
                                                    </td>
                                                    <td class="text-center">${orderDetail.quantity}</td>
                                                    <td class="text-center text-success fw-bold">
                                                        <fmt:formatNumber
                                                            value="${orderDetail.price * orderDetail.quantity}"
                                                            type="number" /> đ
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/js/main.js"></script>
                </body>




                </html>