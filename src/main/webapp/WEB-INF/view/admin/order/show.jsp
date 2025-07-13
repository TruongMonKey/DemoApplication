<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta content="width=device-width, initial-scale=1.0" name="viewport">

                <title>Demo App</title>
                <meta content="" name="description">
                <meta content="" name="keywords">

                <!-- Favicons -->
                <link href="img/favicon.png" rel="icon">
                <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

                <!-- Google Fonts -->
                <link href="https://fonts.gstatic.com" rel="preconnect">
                <link
                    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
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

                <!-- ======= Header ======= -->
                <jsp:include page="../layout/header.jsp" />

                <!-- ======= Sidebar ======= -->
                <jsp:include page="../layout/sidebar.jsp" />

                <main id="main" class="main">

                    <div class="pagetitle">
                        <h1>Dashboard</h1>
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/admin">Home</a></li>
                                <li class="breadcrumb-item active">Order</li>
                            </ol>
                        </nav>
                    </div><!-- End Page Title -->

                    <div class="container mt-4">
                        <h4 class="mb-3">Danh sách đơn hàng</h4>
                        <table class="table table-bordered table-striped text-center align-middle">
                            <thead class="table-primary">
                                <tr>
                                    <th>ID</th>
                                    <th>Total Price</th>
                                    <th>User</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>
                                            <fmt:formatNumber value="${order.totalPrice}" type="number" /> đ
                                        </td>
                                        <td>${order.user.fullName}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 'PENDING'}">
                                                    <span class="badge bg-warning text-dark">Chờ xác nhận</span>
                                                </c:when>
                                                <c:when test="${order.status == 'COMPLETED'}">
                                                    <span class="badge bg-success">Đã thanh toán</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">${order.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="/admin/order/${order.id}" class="btn btn-sm btn-outline-success">
                                                <i class="bi bi-eye"></i> View
                                            </a>
                                            <a href="/admin/order/update/${order.id}"
                                                class="btn btn-sm btn-outline-warning mx-1">
                                                <i class="bi bi-pencil-square"></i> Update
                                            </a>
                                            <a href="/admin/order/delete/${order.id}"
                                                class="btn btn-sm btn-outline-danger">
                                                <i class="bi bi-trash"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>


                </main><!-- End #main -->


                <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                        class="bi bi-arrow-up-short"></i></a>

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