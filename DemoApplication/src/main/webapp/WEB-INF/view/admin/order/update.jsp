<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">

                    <title>Update Order</title>
                    <meta content="" name="description">
                    <meta content="" name="keywords">

                    <!-- Favicons -->
                    <link href="img/favicon.png" rel="icon">
                    <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

                    <!-- Google Fonts -->
                    <link href="https://fonts.gstatic.com" rel="preconnect">
                    <link
                        href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600"
                        rel="stylesheet">

                    <!-- Vendor CSS Files -->
                    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                    <link href="/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
                    <link href="/vendor/remixicon/remixicon.css" rel="stylesheet">
                    <link href="/vendor/simple-datatables/style.css" rel="stylesheet">
                    <link href="/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Header & Sidebar -->
                    <jsp:include page="../layout/header.jsp" />
                    <jsp:include page="../layout/sidebar.jsp" />

                    <main id="main" class="main">
                        <div class="pagetitle">
                            <h1>Update Order</h1>
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/admin">Home</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/order">Order</a></li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>
                            </nav>
                        </div>

                        <div class="container mt-4">
                            <div class="card shadow">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="mb-0">Cập nhật trạng thái đơn hàng</h5>
                                </div>
                                <div class="card-body">
                                    <form:form method="POST" action="/admin/order/update" modelAttribute="newOrder"
                                        class="row g-4">

                                        <!-- ID -->
                                        <form:hidden path="id" />

                                        <!-- Thông tin chung -->
                                        <div class="col-md-4">
                                            <label class="form-label">Mã đơn hàng</label>
                                            <input type="text" class="form-control" value="${newOrder.id}" readonly>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="form-label">Tên khách hàng</label>
                                            <input type="text" class="form-control" value="${newOrder.receiverName}"
                                                readonly>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="form-label">Số điện thoại</label>
                                            <input type="text" class="form-control" value="${newOrder.receiverPhone}"
                                                readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label">Địa chỉ</label>
                                            <input type="text" class="form-control" value="${newOrder.receiverAddress}"
                                                readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label">Tổng tiền</label>
                                            <input type="text" class="form-control"
                                                value="<fmt:formatNumber value='${newOrder.totalPrice}' type='currency' currencySymbol='₫'/>"
                                                readonly>
                                        </div>

                                        <!-- Trạng thái -->
                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold">Trạng thái đơn hàng</label>
                                            <form:select path="status" cssClass="form-select">
                                                <form:option value="Pending">Chờ xử lý</form:option>
                                                <form:option value="Processing">Đang xử lý</form:option>
                                                <form:option value="Shipped">Đã giao hàng</form:option>
                                                <form:option value="Delivered">Đã nhận</form:option>
                                                <form:option value="Cancelled">Đã huỷ</form:option>
                                            </form:select>
                                        </div>

                                        <!-- Nút thao tác -->
                                        <div class="col-12 d-flex justify-content-between mt-4">
                                            <a href="/admin/order" class="btn btn-outline-secondary">
                                                <i class="bi bi-arrow-left"></i> Quay lại
                                            </a>
                                            <button type="submit" class="btn btn-success">
                                                <i class="bi bi-check-circle"></i> Cập nhật
                                            </button>
                                        </div>

                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </main>

                    <!-- Back to top -->
                    <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
                        <i class="bi bi-arrow-up-short"></i>
                    </a>

                    <!-- JS Files -->
                    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="/vendor/simple-datatables/simple-datatables.js"></script>
                    <script src="/js/main.js"></script>
                </body>

                </html>