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
                    <h1>Dashboard</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <div>PRODUCT</div>

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