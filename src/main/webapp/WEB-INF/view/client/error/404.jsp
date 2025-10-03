<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Không tìm thấy trang</title>
    <link href="<c:url value='/client/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/client/css/style.css'/>" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h1 class="display-1 text-warning">404</h1>
                <h2>Không tìm thấy trang</h2>
                <p class="lead">Trang bạn đang tìm kiếm không tồn tại hoặc đã bị di chuyển.</p>
                <a href="<c:url value='/'/>" class="btn btn-primary">Về trang chủ</a>
            </div>
        </div>
    </div>
</body>
</html> 