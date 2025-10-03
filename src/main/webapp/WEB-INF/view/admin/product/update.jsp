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
                                <li class="breadcrumb-item">Product</li>
                                <li class="breadcrumb-item active">Update</li>
                            </ol>
                        </nav>
                    </div><!-- End Page Title -->

                    <div class="container mt-5">
                        <form:form method="post" action="/admin/product/update/${newProduct.id}"
                            modelAttribute="newProduct" enctype="multipart/form-data">
                            <div class="row">
                                <c:set var="errorsName">
                                    <form:errors path="name" cssClass="invalid-feedback" />
                                </c:set>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="name" class="form-label">Name</label>
                                    <form:input type="text"
                                        class="form-control ${not empty errorsName ? 'is-invalid' : ''}" path="name"
                                        id="name" />
                                    ${errorsName}
                                </div>

                                <c:set var="errorsPrice">
                                    <form:errors path="price" cssClass="invalid-feedback" />
                                </c:set>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="price" class="form-label">Price</label>
                                    <form:input type="number"
                                        class="form-control ${not empty errorsPrice ? 'is-invalid' : ''}" path="price"
                                        id="price" />
                                    ${errorsPrice}
                                </div>
                            </div>

                            <c:set var="errorsDetail">
                                <form:errors path="detailDesc" cssClass="invalid-feedback" />
                            </c:set>
                            <div class="mb-3 col-12 col-md-12">
                                <label for="detailDesc" class="form-label">Detail Desc</label>
                                <form:textarea class="form-control ${not empty errorsDetail ? 'is-invalid' : ''}"
                                    path="detailDesc" id="detailDesc" rows="4" />
                                ${errorsDetail}
                            </div>

                            <div class="row">
                                <c:set var="errorsShort">
                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                </c:set>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="shortDesc" class="form-label">Short Desc</label>
                                    <form:input type="text"
                                        class="form-control ${not empty errorsShort ? 'is-invalid' : ''}"
                                        path="shortDesc" id="shortDesc" />
                                    ${errorsShort}
                                </div>

                                <c:set var="errorsQty">
                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                </c:set>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="quantity" class="form-label">Quantity</label>
                                    <form:input type="number"
                                        class="form-control ${not empty errorsQty ? 'is-invalid' : ''}" path="quantity"
                                        id="quantity" />
                                    ${errorsQty}
                                </div>
                            </div>

                            <div class="row">
                                <c:set var="errorsFactory">
                                    <form:errors path="factory" cssClass="invalid-feedback" />
                                </c:set>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="factory" class="form-label">Factory</label>
                                    <form:select class="form-select ${not empty errorsFactory ? 'is-invalid' : ''}"
                                        path="factory" id="factory">
                                        <form:option value="">-- Select Factory --</form:option>
                                        <form:option value="FactoryA">MacBook Air</form:option>
                                        <form:option value="FactoryB">MacBook Pro</form:option>
                                    </form:select>
                                    ${errorsFactory}
                                </div>

                                <c:set var="errorsTarget">
                                    <form:errors path="target" cssClass="invalid-feedback" />
                                </c:set>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="target" class="form-label">Target</label>
                                    <form:select class="form-select ${not empty errorsTarget ? 'is-invalid' : ''}"
                                        path="target" id="target">
                                        <form:option value="">-- Select Target --</form:option>
                                        <form:option value="Gaming">Gaming</form:option>
                                        <form:option value="Student">Student</form:option>
                                        <form:option value="Graphics">Graphics</form:option>
                                        <form:option value="Business">Business</form:option>
                                    </form:select>
                                    ${errorsTarget}
                                </div>

                                <!-- Không validate file nên không cần lỗi -->
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="avatarFile" class="form-label">Image</label>
                                    <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg"
                                        name="nameFile" />
                                </div>
                            </div>

                            <!-- Preview ảnh hiện tại -->
                            <div class="col-12 mb-3">
                                <label class="form-label">Ảnh hiện tại:</label>
                                <p>Ảnh hiện tại: ${newProduct.image}</p>
                                <img src="/img/product/${newProduct.image}" id="currentImage"
                                    alt="Ảnh sản phẩm hiện tại"
                                    style="max-height: 250px; width: auto; border: 1px solid #ccc; padding: 5px; border-radius: 10px;">
                            </div>

                            <!-- Preview ảnh mới nếu người dùng chọn -->
                            <div class="col-12 mb-3">
                                <label class="form-label">Ảnh vừa chọn (nếu có):</label>
                                <img src="" id="avatarPreview" alt="Ảnh sản phẩm preview"
                                    style="max-height: 250px; width: auto; display: none; border: 2px dashed #aaa; padding: 5px; border-radius: 10px;" />
                            </div>


                            <div class="col-12 mb-5">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form:form>



                    </div>

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
                                if (file.type.startsWith('image/')) {
                                    const reader = new FileReader();
                                    reader.onload = function (e) {
                                        $('#avatarPreview').attr('src', e.target.result).css('display', 'block');
                                    };

                                    reader.readAsDataURL(file);
                                } else {
                                    alert("Vui lòng chọn một tập tin ảnh (PNG hoặc JPEG)");
                                    $('#avatarPreview').css('display', 'none').attr('src', '');
                                    $(this).val('');
                                }
                            }
                        });
                    });
                </script>

            </body>

            </html>