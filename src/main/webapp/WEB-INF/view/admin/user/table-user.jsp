<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
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
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>Table User</h3>
                                <a href="/admin/user/create" class="btn btn-primary">Create a User</a>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="width: 10%;">ID</th>
                                <th style="width: 25%;">Email</th>
                                <th style="width: 25%;">Full Name</th>
                                <th style="width: 40%;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users1}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.email}</td>
                                    <td>${user.fullName}</td>
                                    <td><a href="/admin/user/${user.id}" type="button" class="btn btn-success">View</a>
                                        <a href="/admin/user/update/${user.id}" type="button"
                                            class="btn btn-warning mx-2">Update</a>
                                        <a href="/admin/user/delete/${user.id}" type="button"
                                            class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </body>

            </html>