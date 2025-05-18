<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <!-- Template Main CSS File -->
            <link href="/css/style.css" rel="stylesheet">

            <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
        </head>

        <body>

            <!-- ======= Header ======= -->
            <jsp:include page="../layout/header.jsp" />

            <!-- ======= Sidebar ======= -->
            <jsp:include page="../layout/sidebar.jsp" />

            <main id="main" class="main">

                <div class="pagetitle">
                    <h1>Manage Product</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Manage Product</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <body>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="d-flex justify-content-between">
                                    <h3>Table Product</h3>
                                    <a href="/admin/product/create" class="btn btn-primary">Create a Product</a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">ID</th>
                                    <th style="width: 25%;">Name</th>
                                    <th style="width: 25%;">Price</th>
                                    <th style="width: 15%;">Factory</th>
                                    <th style="width: 25%;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td>${product.id}</td>
                                        <td>${product.name}</td>
                                        <td>${product.price}</td>
                                        <td>${product.factory}</td>
                                        <td>
                                            <a href="/admin/product/${product.id}" class="btn btn-success">View</a>
                                            <a href="/admin/product/update/${product.id}"
                                                class="btn btn-warning mx-2">Update</a>
                                            <a href="/admin/product/delete/${product.id}"
                                                class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </body>

            </main><!-- End #main -->

            <!-- ======= Footer ======= -->
            <!-- <jsp:include page="../layout/footer.jsp" /> -->

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