<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Mac Shop</title>

                <!-- Expose CSRF token/header cho AJAX -->
                <meta name="_csrf" content="${_csrf.token}" />
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <!-- Fonts / Icons -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- CSS local (dùng c:url để tương thích context path) -->
                <link href="<c:url value='/client/lib/lightbox/css/lightbox.min.css'/>" rel="stylesheet">
                <link href="<c:url value='/client/lib/owlcarousel/assets/owl.carousel.min.css'/>" rel="stylesheet">
                <link href="<c:url value='/client/css/bootstrap.min.css'/>" rel="stylesheet">
                <link href="<c:url value='/client/css/style.css'/>" rel="stylesheet">
            </head>

            <body class="homepage">
                <!-- Spinner -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>

                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/banner.jsp" />
                <jsp:include page="../layout/feature.jsp" />

                <!-- Products -->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4 text-start">
                                    <h1>Sản phẩm của chúng tôi</h1>
                                </div>
                                <div class="col-lg-8 text-end">
                                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill active"
                                                href="<c:url value='/products'/>">
                                                <span class="text-dark" style="width:130px;">Tất cả sản phẩm</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-2">
                                                <span class="text-dark" style="width:130px;">MacBook Air</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-3">
                                                <span class="text-dark" style="width:130px;">MacBook Pro</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach var="product" items="${products}">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div
                                                            class="card product-card h-100 border-0 shadow-sm position-relative">
                                                            <a href="<c:url value='/product/${product.id}'/>">
                                                                <img src="<c:url value='/img/product/${product.image}'/>"
                                                                    class="card-img-top product-img mx-auto d-block mt-3"
                                                                    alt="<c:out value='${product.name}'/>"
                                                                    loading="lazy">
                                                            </a>

                                                            <div class="badge bg-secondary position-absolute"
                                                                style="top:10px; left:10px;">MacT&B</div>

                                                            <div
                                                                class="card-body d-flex flex-column justify-content-between align-items-center">
                                                                <a href="<c:url value='/product/${product.id}'/>"
                                                                    class="text-decoration-none text-dark text-center w-100">
                                                                    <h5 class="card-title mb-2" style="font-size:16px;">
                                                                        <c:out value="${product.name}" />
                                                                    </h5>
                                                                </a>

                                                                <p class="card-text text-muted text-center mb-2"
                                                                    style="font-size:13px; min-height:38px;">
                                                                    <c:out value="${product.shortDesc}" />
                                                                </p>

                                                                <p class="fw-bold text-primary mb-3"
                                                                    style="font-size:16px;">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" /> đ
                                                                </p>

                                                                <button type="button"
                                                                    class="btn btn-outline-primary rounded-pill px-3 py-1 w-100 add-to-cart-btn"
                                                                    data-id="<c:out value='${product.id}'/>">
                                                                    <i class="fa fa-shopping-bag me-2"></i> Thêm vào giỏ
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Tab 2..3.. giữ nguyên nội dung (bạn có thể chèn lại markup hiện có) -->
                                <div id="tab-2" class="tab-pane fade p-0"> ... </div>
                                <div id="tab-3" class="tab-pane fade p-0"> ... </div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <!-- Scripts -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="<c:url value='/client/lib/easing/easing.min.js'/>"></script>
                <script src="<c:url value='/client/lib/waypoints/waypoints.min.js'/>"></script>
                <script src="<c:url value='/client/lib/lightbox/js/lightbox.min.js'/>"></script>
                <script src="<c:url value='/client/lib/owlcarousel/owl.carousel.min.js'/>"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script src="<c:url value='/client/js/main.js'/>"></script>

                <!-- AJAX Add-to-cart: lấy token từ meta và gửi trong header (an toàn hơn) -->
                <script>
                    $(function () {

                        const csrfToken = $('meta[name="_csrf"]').attr('content');
                        const csrfHeader = $('meta[name="_csrf_header"]').attr('content') || 'X-CSRF-TOKEN';

                        $('.add-to-cart-btn').on('click', function () {

                            const productId = $(this).data('id');

                            $.ajax({
                                url: '/add-product-to-cart/' + productId,
                                type: 'POST',
                                beforeSend: function (xhr) {
                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                },
                                success: function () {

                                    // Hiển thị thông báo thành công
                                    Swal.fire({
                                        toast: true,
                                        position: 'top-end',
                                        icon: 'success',
                                        title: 'Đã thêm sản phẩm vào giỏ!',
                                        showConfirmButton: false,
                                        timer: 800
                                    });

                                    // Sau 0.8 giây → reload trang
                                    setTimeout(() => {
                                        location.reload();
                                    }, 800);
                                },

                                error: function () {
                                    Swal.fire({
                                        toast: true,
                                        position: 'top-end',
                                        icon: 'error',
                                        title: 'Thêm sản phẩm thất bại!',
                                        showConfirmButton: false,
                                        timer: 1000
                                    });
                                }
                            });
                        });
                    });

                </script>
            </body>

            </html>