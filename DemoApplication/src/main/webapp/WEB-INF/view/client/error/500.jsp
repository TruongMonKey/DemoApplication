<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lỗi hệ thống</title>
    <link href="<c:url value='/client/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/client/css/style.css'/>" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h1 class="display-1 text-danger">500</h1>
                <h2>Lỗi hệ thống</h2>
                <p class="lead">Đã xảy ra lỗi trong quá trình xử lý yêu cầu của bạn.</p>
                <c:if test="${not empty message}">
                    <p class="text-muted">${message}</p>
                </c:if>
                <a href="<c:url value='/'/>" class="btn btn-primary">Về trang chủ</a>
            </div>
        </div>
    </div>
</body>
</html> 