<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                                <li class="breadcrumb-item">User</li>
                                <li class="breadcrumb-item active">Create User</li>
                            </ol>
                        </nav>
                    </div><!-- End Page Title -->

                    <body>
                        <div class="container mt-5">
                            <div class="row">
                                <div class="col-md-6 col-12 mx-auto">
                                    <h3>Create a user</h3>
                                    <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                                        enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="exampleInputEmail1" class="form-label">Email</label>
                                                <form:input type="email" class="form-control is-invalid"
                                                    aria-describedby="emailHelp" path="email" />
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorsPassword">
                                                    <form:errors path="password" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                                <form:input type="password"
                                                    class="form-control ${not empty errorsPassword ? 'is-invalid' : ''}"
                                                    path="password" />
                                                ${errorsPassword}
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class=" mb-3 col-12 col-md-6">

                                                <label for="exampleInputPassword1" class="form-label">Phone
                                                    number</label>
                                                <form:input type="text" class="form-control" path="phone" />
                                            </div>

                                            <div class=" mb-3 col-12 col-md-6">
                                                <c:set var="errorsFullName">
                                                    <form:errors path="fullName" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputPassword1" class="form-label">Full Name</label>
                                                <form:input type="text"
                                                    class="form-control  ${not empty errorsFullName ? 'is-invalid' : ''}"
                                                    path="fullName" />
                                                ${errorsFullName}
                                            </div>
                                        </div>

                                        <div class=" mb-3 col-12">
                                            <label for="exampleInputPassword1" class="form-label">Address</label>
                                            <form:input type="text" class="form-control" path="address" />
                                        </div>

                                        <div class="row">
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label" for="roleSelect">Role:</label>
                                                <form:select id="roleSelect" class="form-select" path="role.name">
                                                    <form:option value="ADMIN">ADMIN</form:option>
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>
                                            </div>


                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Avatar:</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="nameFile" />
                                            </div>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <img src="" id="avatarPreview" alt="Avatar preview"
                                                style="max-height: 250px; display: none;">
                                        </div>

                                        <div class="col-12 mb-5">
                                            <button type="submit" class="btn btn-primary">Create</button>
                                        </div>


                                    </form:form>
                                </div>
                            </div>
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

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $('#avatarFile').on('change', function (event) {
                            const file = event.target.files[0];

                            if (file) {
                                // Chỉ cho phép preview nếu là ảnh
                                if (file.type.startsWith('image/')) {
                                    const reader = new FileReader();

                                    reader.onload = function (e) {
                                        $('#avatarPreview')
                                            .attr('src', e.target.result)
                                            .css('display', 'block'); // Hiện ảnh
                                    };

                                    reader.readAsDataURL(file);
                                } else {
                                    alert("Vui lòng chọn một tập tin ảnh (PNG hoặc JPEG)");
                                    $('#avatarPreview').css('display', 'none').attr('src', '');
                                    $(this).val(''); // Xóa file đã chọn
                                }
                            }
                        });
                    });
                </script>

            </body>

            </html>