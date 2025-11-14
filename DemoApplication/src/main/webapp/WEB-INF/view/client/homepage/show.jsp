<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Mac Shop</title>

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
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <jsp:include page="../layout/banner.jsp" />

                <jsp:include page="../layout/feature.jsp" />



                <!-- Fruits Shop Start-->
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
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" href="/products">
                                                <span class="text-dark" style="width: 130px;">Tất cả sản phẩm</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-2">
                                                <span class="text-dark" style="width: 130px;">MacBook Air</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill"
                                                href="#tab-3">
                                                <span class="text-dark" style="width: 130px;">MacBook Pro</span>
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
                                                            <a href="/product/${product.id}">
                                                                <img src="/img/product/${product.image}"
                                                                    class="card-img-top product-img mx-auto d-block mt-3"
                                                                    alt="${product.name}">
                                                            </a>
                                                            <div class="badge bg-secondary position-absolute"
                                                                style="top: 10px; left: 10px;">MacT&B</div>
                                                            <div
                                                                class="card-body d-flex flex-column justify-content-between align-items-center">
                                                                <a href="/product/${product.id}"
                                                                    class="text-decoration-none text-dark text-center w-100">
                                                                    <h5 class="card-title mb-2"
                                                                        style="font-size: 16px;">${product.name}</h5>
                                                                </a>
                                                                <p class="card-text text-muted text-center mb-2"
                                                                    style="font-size: 13px; min-height: 38px;">
                                                                    ${product.shortDesc}</p>
                                                                <p class="fw-bold text-primary mb-3"
                                                                    style="font-size: 16px;">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" /> đ
                                                                </p>
                                                                <form action="/add-product-to-cart/${product.id}"
                                                                    method="post"
                                                                    class="w-100 d-flex justify-content-center">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />
                                                                    <button type="button"
                                                                        class="btn btn-outline-primary rounded-pill px-3 py-1 w-100 add-to-cart-btn"
                                                                        data-id="${product.id}">
                                                                        <i class="fa fa-shopping-bag me-2"></i>Thêm vào
                                                                        giỏ
                                                                    </button>

                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="https://phongvu.vn/cong-nghe/wp-content/uploads/2024/01/So-sanh-MacBook-Air-va-MacBook-Pro-5.png"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Trái cây</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Nho</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">4.99 đ / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="https://i.guim.co.uk/img/media/b6a2f9744de0a7048318ec8ea382fd6c07f95e76/0_306_7008_4366/master/7008.jpg?width=700&quality=85&auto=format&fit=max&s=dc7ce4d0c1ff60d3dcde2c29783ddbc5"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Trái cây</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Mâm xôi</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">4.99 đ / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-3" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-1.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Trái cây</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Cam</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">4.99 đ / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-6.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Trái cây</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Táo</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">4.99 đ / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-4" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="https://phongvu.vn/cong-nghe/wp-content/uploads/2024/01/So-sanh-MacBook-Air-va-MacBook-Pro-5.png"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Trái cây</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Nho</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">4.99 đ / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="https://maconline.vn/uploads/macbook/macbook-air/macbook-air-m1/air-m1-gold-1.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Trái cây</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Mơ</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">4.99 đ / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-5" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="https://cdn.tgdd.vn/Files/2020/11/11/1305898/mac-2_913x511-600x400.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Trái cây</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Chuối</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">4.99 đ / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="https://cdn.tgdd.vn/Files/2020/11/11/1305898/mac-2_913x511-600x400.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Raspberries</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="https://cdn.tgdd.vn/Files/2020/11/11/1305898/mac-2_913x511-600x400.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Oranges</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed
                                                                do eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->


                <!-- Banner Section Start-->
                <div class="container-fluid banner banner-greenblue my-5">
                    <div class="container py-5">
                        <div class="row g-4 align-items-center">
                            <div class="col-lg-6">
                                <div class="py-4">
                                    <h1 class="display-3 text-white">Sản phẩm mới cao cấp</h1>
                                    <p class="fw-normal display-6 text-white-50 mb-4">Tại cửa hàng của chúng tôi</p>
                                    <p class="mb-4 text-white-75">Khám phá bộ sưu tập sản phẩm chính hãng với ưu đãi hấp dẫn và dịch vụ tận tâm.</p>
                                    <a href="#"
                                        class="banner-btn btn border-2 border-white rounded-pill text-white py-3 px-5">Mua ngay</a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="position-relative">
                                    <img src="https://s.yimg.com/ny/api/res/1.2/BYgf7buNT4Xg0FFKe2Tq0w--/YXBwaWQ9aGlnaGxhbmRlcjt3PTE2MDA7aD05NDI7cT01MA--/https%3A//s.yimg.com/os/creatr-uploaded-images/2025-10/01c53080-aded-11f0-af73-816473ec2e2b" class="img-fluid w-100 rounded" alt="">
                                    <div class="banner-price-badge d-flex align-items-center justify-content-center rounded-circle position-absolute">
                                        <h1 class="mb-0">1</h1>
                                        <div class="d-flex flex-column ms-2">
                                            <span class="h2 mb-0">50$</span>
                                            <span class="h6 text-muted mb-0">kg</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Banner Section End -->


                <!-- Sản phẩm bán chạy nhất Start -->
                <div class="container-fluid py-5 best-section">
                    <div class="container py-5">
                        <div class="text-center mx-auto mb-5" style="max-width: 700px;">
                            <h1 class="display-4">Sản phẩm bán chạy nhất</h1>
                            <p class="text-muted">Khám phá 6 sản phẩm đang được yêu thích nhất hiện nay.</p>
                        </div>
                        <div class="row g-4">
                            <c:forEach var="item" items="${bestSellers}" varStatus="st">
                                    <div class="col-12 col-sm-6 col-lg-3">
                                        <div class="p-3 p-lg-4 rounded-4 bg-white best-card best-card-xl h-100">
                                            <div class="d-flex flex-column">
                                                <div class="best-card-media mb-3">
                                                    <img src="/img/product/${item.image}" alt="${item.productName}" class="img-fluid rounded-3 best-card-img">
                                        </div>
                                                <a href="/product/${item.productId}" class="best-card-title mb-2 text-decoration-none">${item.productName}</a>
                                                <p class="text-muted mb-3">Đã bán: <strong>${item.totalSold}</strong></p>
                                                <div class="mt-auto">
                                                    <a href="/product/${item.productId}" class="btn btn-brand w-100 rounded-pill px-3">Xem chi tiết</a>
                                        </div>
                                            </div>
                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- Sản phẩm bán chạy nhất End -->



                <jsp:include page="../layout/footer.jsp" />



                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>
            <style>
                .product-card {
                    border: 1.5px solid #e0e0e0;
                    transition: transform 0.3s cubic-bezier(.4, 2, .3, 1), box-shadow 0.3s, border-color 0.3s;
                    border-radius: 18px;
                    background: #fff;
                    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.07);
                    overflow: hidden;
                    position: relative;
                }

                .product-card:hover {
                    transform: translateY(-10px) scale(1.04);
                    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.18);
                    border-color: #4e9af1;
                    z-index: 2;
                }

                .product-card .product-img {
                    width: 180px;
                    height: 180px;
                    object-fit: cover;
                    border-radius: 12px;
                    background: #f8f9fa;
                    transition: transform 0.35s cubic-bezier(.4, 2, .3, 1);
                }

                .product-card:hover .product-img {
                    transform: scale(1.08) rotate(-2deg);
                    box-shadow: 0 4px 24px rgba(0, 0, 0, 0.10);
                }

                .product-card .btn-outline-primary {
                    transition: background 0.25s, color 0.25s, transform 0.2s;
                    font-weight: 600;
                    letter-spacing: 0.5px;
                }

                .product-card .btn-outline-primary:hover {
                    background: linear-gradient(90deg, #2adfb2 100%, #6ed6a0 100%);
                    color: #05cc5b;
                    transform: scale(1.06);
                    border: none;
                    box-shadow: 0 2px 8px rgba(78, 154, 241, 0.15);
                }

                .product-card .badge {
                    font-size: 13px;
                    padding: 6px 14px;
                    border-radius: 12px;
                    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                }

                
            </style>