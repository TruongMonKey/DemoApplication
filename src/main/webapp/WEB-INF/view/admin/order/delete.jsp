<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <title>Xoá Đơn Hàng</title>

                <!-- Google Fonts & CSS -->
                <link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
                <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                <link href="/css/style.css" rel="stylesheet">
            </head>

            <body style="background-color: #f8f9fa; font-family: 'Nunito', sans-serif;">

                <div class="container d-flex justify-content-center align-items-center vh-100">
                    <div class="card shadow p-4" style="max-width: 500px; width: 100%;">
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size: 3rem;"></i>
                            </div>
                            <h4 class="mb-3 text-danger">Xác nhận xoá đơn hàng</h4>
                            <p class="mb-4">Bạn có chắc chắn muốn xoá đơn hàng với <strong>ID = ${id}</strong>?</p>

                            <form:form method="post" action="/admin/order/delete" modelAttribute="deleteOrder">
                                <form:hidden path="id" value="${id}" />

                                <div class="d-flex justify-content-between">
                                    <a href="/admin/order" class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-left"></i> Quay lại
                                    </a>
                                    <button type="submit" class="btn btn-danger">
                                        <i class="bi bi-trash"></i> Xoá
                                    </button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>

                <!-- JS -->
                <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/js/main.js"></script>
            </body>

            </html>