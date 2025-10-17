<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <title>Chi tiết đơn hàng - Admin</title>

                <!-- Favicons -->
                <link href="/img/favicon.png" rel="icon">
                <link href="/img/apple-touch-icon.png" rel="apple-touch-icon">

                <!-- Google Fonts -->
                <link href="https://fonts.gstatic.com" rel="preconnect">
                <link
                    href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700"
                    rel="stylesheet">

                <!-- Vendor CSS Files -->
                <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                <link href="/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
                <link href="/vendor/quill/quill.snow.css" rel="stylesheet">
                <link href="/vendor/quill/quill.bubble.css" rel="stylesheet">
                <link href="/vendor/remixicon/remixicon.css" rel="stylesheet">
                <link href="/vendor/simple-datatables/style.css" rel="stylesheet">
                <link href="/css/style.css" rel="stylesheet">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/sidebar.jsp" />

                <main id="main" class="main">
                    <div class="pagetitle">
                        <h1>Chi tiết đơn hàng</h1>
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="/admin/order">Đơn hàng</a></li>
                                <li class="breadcrumb-item active">Chi tiết</li>
                            </ol>
                        </nav>
                    </div>

                    <div class="container mt-4">
                        <h4 class="mb-3">Danh sách sản phẩm trong đơn hàng</h4>
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <table class="table table-bordered table-hover text-center align-middle">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>Hình ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Giá</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="orderDetail" items="${orderDetails}">
                                            <tr>
                                                <td>
                                                    <img src="/img/product/${orderDetail.product.image}" class="rounded"
                                                        style="width: 80px; height: 80px; object-fit: cover;"
                                                        alt="${orderDetail.product.name}">
                                                </td>
                                                <td>
                                                    <a href="/product/${orderDetail.product.id}" target="_blank"
                                                        class="text-decoration-none fw-semibold">
                                                        ${orderDetail.product.name}
                                                    </a>
                                                </td>
                                                <td>${orderDetail.quantity}</td>
                                                <td>
                                                    <fmt:formatNumber value="${orderDetail.price}" type="number" /> đ
                                                </td>
                                                <td>
                                                    <fmt:formatNumber
                                                        value="${orderDetail.price * orderDetail.quantity}"
                                                        type="number" /> đ
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="text-end mt-4">
                                    <a href="/admin/order" class="btn btn-outline-primary">
                                        <i class="bi bi-arrow-left"></i> Quay lại danh sách đơn hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
                    <i class="bi bi-arrow-up-short"></i>
                </a>

                <!-- Vendor JS Files -->
                <script src="/vendor/apexcharts/apexcharts.min.js"></script>
                <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/vendor/chart.js/chart.umd.js"></script>
                <script src="/vendor/echarts/echarts.min.js"></script>
                <script src="/vendor/quill/quill.js"></script>
                <script src="/vendor/simple-datatables/simple-datatables.js"></script>
                <script src="/vendor/tinymce/tinymce.min.js"></script>
                <script src="/vendor/php-email-form/validate.js"></script>

                <!-- Template Main JS File -->
                <script src="/js/main.js"></script>
            </body>

            </html>