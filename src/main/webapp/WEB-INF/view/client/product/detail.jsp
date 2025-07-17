<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title> ${product.name} - MacT&B</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">

                <head>
                    <!-- các thẻ meta, link bootstrap, fontawesome,... -->
                    <style>
                        /* Đẩy nội dung xuống dưới navbar fixed */
                        body {
                            padding-top: 60px;
                            /* đúng với chiều cao navbar */
                        }

                        /* Có thể tùy chỉnh lại nếu cần */
                        #spinner {
                            z-index: 1050;
                            /* đảm bảo spinner nằm trên cùng */
                        }
                    </style>
                </head>

            </head>

            <script>
                window.addEventListener('load', function () {
                    const spinner = document.getElementById('spinner');
                    if (spinner) {
                        spinner.classList.remove('show');
                    }
                });
            </script>

            <body class="bg-light">

                <!-- Spinner -->
                <div id="spinner"
                    class="show position-fixed w-100 vh-100 bg-white d-flex justify-content-center align-items-center">
                    <div class="spinner-border text-primary" role="status"></div>
                </div>

                <!-- Navbar -->
                <jsp:include page="../layout/header.jsp" />


                <!-- Search Modal -->
                <div class="modal fade" id="searchModal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0">
                                <h5 class="modal-title">Tìm kiếm sản phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="search" class="form-control" placeholder="Nhập từ khóa...">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Detail -->
                <div class="container py-5 mt-5">
                    <div class="row g-4 align-items-center">
                        <div class="col-lg-6">
                            <img src="/img/product/${product.image}" class="img-fluid rounded shadow-sm d-block mx-auto"
                                style="width: 280px; height: auto;" alt="${product.name}">
                        </div>
                        <div class="col-lg-6">
                            <h2 class="fw-bold">${product.name}</h2>
                            <p class="text-muted">${product.factory}</p>
                            <h4 class="text-primary">
                                <fmt:formatNumber type="number" value="${product.price}" /> đ
                            </h4>
                            <div class="mb-3">
                                <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i><i class="fa fa-star-half-alt text-warning"></i>
                                <i class="far fa-star text-warning"></i>
                            </div>
                            <p>${product.shortDesc}</p>
                            <form action="/add-product-from-view-detail" method="post" modelAttribute="product">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" value="${product.id}" name="id" />
                                <input type="hidden" name="quantity" id="cartDetails0.quantity" value="1" />
                                <button class=" btn btn-primary rounded-pill px-4"><i
                                        class="fa fa-shopping-bag me-2"></i>Thêm vào giỏ</button>
                            </form>

                        </div>
                    </div>

                    <!-- Tabs -->
                    <ul class="nav nav-tabs mt-5">
                        <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab"
                                data-bs-target="#desc">Mô tả</button></li>
                        <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#review">Đánh
                                giá</button></li>
                    </ul>
                    <div class="tab-content pt-3">
                        <div class="tab-pane fade show active" id="desc">
                            <p>${product.detailDesc}</p>
                        </div>
                        <div class="tab-pane fade" id="review">
                            <div class="mt-3">
                                <div class="d-flex mb-3">
                                    <img src="/client/img/avatar.jpg" class="rounded-circle me-3" width="60"
                                        height="60">
                                    <div>
                                        <strong>Jason Smith</strong> <span class="text-muted small">April 12,
                                            2024</span>
                                        <div class="text-warning small"><i class="fa fa-star"></i> <i
                                                class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                class="fa fa-star"></i> <i class="fa fa-star-half-alt"></i></div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Related Products -->
                    <h3 class="fw-bold mt-5 mb-3">Sản phẩm liên quan</h3>
                    <div class="row g-4">
                        <c:forEach var="related" items="${relatedProducts}">
                            <div class="col-md-3">
                                <div class="card border-0 shadow-sm h-100">
                                    <div class="position-relative"
                                        style="width: 100%; height: 250px; overflow: hidden;">
                                        <img src="/img/product/${related.image}" class="card-img-top img-fluid"
                                            style="width: 100%; height: 250px; object-fit: cover;"
                                            alt="${related.name}">


                                    </div>
                                    <div class="card-body">
                                        <h6>${related.name}</h6>
                                        <p class="text-muted small">${related.shortDesc}</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <strong>
                                                <fmt:formatNumber type="number" value="${related.price}" /> đ
                                            </strong>
                                            <a href="/product/${related.id}"
                                                class="btn btn-outline-primary btn-sm rounded-pill">Xem</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <a href="#" class="btn btn-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
                <script>
                    window.addEventListener('load', () => {
                        const spinner = document.getElementById('spinner');
                        if (spinner) spinner.style.display = 'none';
                    });
                </script>

            </body>



            </html>