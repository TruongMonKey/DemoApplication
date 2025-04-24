<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update User</title>
                <!-- Latest compiled and minified CSS -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
                <!-- jQuery library -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <!-- Latest compiled Javascript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link rel="stylesheet" href="/css/demo.css">
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class=" col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>Delete User with id = ${id}</h3>
                            </div>
                            <hr>
                            <div class="alert alert-danger" role="alert">
                                Are you sure delete this user ?
                            </div>
                            <form:form method="post" modelAttribute="newUser" action="/admin/user/delete">
                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">ID : </label>
                                    <form:input value="${id}" type="text" class="form-control" path="id" />
                                </div>
                                <button type=" submit" class="btn btn-danger">Confirm</button>
                            </form:form>

                        </div>
                    </div>
                </div>
            </body>

            </html>