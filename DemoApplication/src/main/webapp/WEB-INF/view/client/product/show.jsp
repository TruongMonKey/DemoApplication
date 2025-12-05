<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Sản phẩm - MacT&B</title>
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

                    <style>
                        .card.border-0.shadow-sm.h-100 {
                            border: 1px solid rgba(46, 46, 46, 0.15) !important;
                            /* viền xanh dương đậm */
                            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                            border-radius: 10px;
                        }

                        .card-img-top {
                            height: 250px;
                            /* hoặc giá trị khác tùy bạn */
                            object-fit: cover;
                            border-radius: 10px;
                        }
                    </style>
                </head>

                <body>
                    <input type="hidden" id="csrfToken" value="${_csrf.token}" />
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Spinner -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>

                    <!-- Search Modal -->
                    <div class="modal fade" id="searchModal" tabindex="-1">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title">Tìm kiếm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body d-flex align-items-center">
                                    <div class="input-group w-75 mx-auto">
                                        <input type="search" class="form-control p-3" placeholder="Từ khóa...">
                                        <span class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Section -->
                    <div class="container py-5">
                        <h3 class="mb-4" style="margin-left: 50%; margin-top: 40px;">Danh sách sản phẩm</h3>
                        <div class="row g-4">
                            <!-- Filter Sidebar -->
                            <div class="col-lg-3">
                                <div class="border p-3 rounded shadow-sm">
                                    <h5 class="mb-3">Lọc sản phẩm</h5>

                                    <h6>Loại MacBook</h6>
                                    <div id="nameFilter">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="Air" <c:if
                                                test="${productCriterialDTO.name.present and fn:contains(productCriterialDTO.name.get(), 'Air')}">checked
                                            </c:if>>
                                            <label class="form-check-label">MacBook Air</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="Pro" <c:if
                                                test="${productCriterialDTO.name.present and fn:contains(productCriterialDTO.name.get(), 'Pro')}">checked
                                            </c:if>>
                                            <label class="form-check-label">MacBook Pro</label>
                                        </div>
                                    </div>

                                    <h6 class="mt-3">Mục đích sử dụng</h6>
                                    <div id="targetFilter">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="MONG-NHE" <c:if
                                                test="${productCriterialDTO.target.present and fn:contains(productCriterialDTO.target.get(), 'MONG-NHE')}">checked
                                            </c:if>>
                                            <label class="form-check-label">Sinh viên - Văn phòng</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="DO-HOA-KY-THUAT"
                                                <c:if
                                                test="${productCriterialDTO.target.present and fn:contains(productCriterialDTO.target.get(), 'DO-HOA-KY-THUAT')}">checked
                                            </c:if>>
                                            <label class="form-check-label">Thiết kế đồ họa</label>
                                        </div>
                                    </div>

                                    <h6 class="mt-3">Mức giá</h6>
                                    <div id="moneyFilter">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="duoi-10-trieu" <c:if
                                                test="${productCriterialDTO.price.present and fn:contains(productCriterialDTO.price.get(), 'duoi-10-trieu')}">checked
                                            </c:if>>
                                            <label class="form-check-label">Dưới 10 triệu</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="10-toi-20-trieu"
                                                <c:if
                                                test="${productCriterialDTO.price.present and fn:contains(productCriterialDTO.price.get(), '10-toi-20-trieu')}">checked
                                            </c:if>>
                                            <label class="form-check-label">10 - 20 triệu</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="20-toi-30-trieu"
                                                <c:if
                                                test="${productCriterialDTO.price.present and fn:contains(productCriterialDTO.price.get(), '20-toi-30-trieu')}">checked
                                            </c:if>>
                                            <label class="form-check-label">20 - 30 triệu</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="tren-30-trieu" <c:if
                                                test="${productCriterialDTO.price.present and fn:contains(productCriterialDTO.price.get(), 'tren-30-trieu')}">checked
                                            </c:if>>
                                            <label class="form-check-label">Trên 30 triệu</label>
                                        </div>
                                    </div>

                                    <h6 class="mt-3">Sắp xếp</h6>
                                    <div id="sortFilter">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sortPrice"
                                                value="gia-tang-dan" ${sort=='gia-tang-dan' ? 'checked' : '' }>
                                            <label class="form-check-label">Giá tăng dần</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sortPrice"
                                                value="gia-giam-dan" ${sort=='gia-giam-dan' ? 'checked' : '' }>
                                            <label class="form-check-label">Giá giảm dần</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sortPrice" value=""
                                                ${sort=='' ? 'checked' : '' }>
                                            <label class="form-check-label">Không sắp xếp</label>
                                        </div>
                                    </div>



                                    <button id="filterButton" class="btn btn-primary w-100 mt-3">Lọc sản phẩm</button>
                                </div>
                            </div>




                            <!-- Product Grid -->
                            <div class="col-lg-9">
                                <div class="row g-4">
                                    <c:if test="${totalPages == 0}">
                                        <div>
                                            Không tìm thấy sản phẩm
                                        </div>
                                    </c:if>

                                    <c:forEach var="product" items="${products}">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="card border-0 shadow-sm h-100">
                                                <a href="/product/${product.id}">
                                                    <img src="/img/product/${product.image}" alt="${product.name}"
                                                        class="card-img-top p-3"
                                                        style="aspect-ratio:1/1; object-fit:cover; border-radius:10px;">
                                                </a>
                                                <div class="card-body text-center">
                                                    <a href="/product/${product.id}"
                                                        class="text-dark text-decoration-none">
                                                        <h5 class="mb-2">${product.name}</h5>
                                                    </a>
                                                    <p class="text-muted mb-2" style="font-size: 14px;">
                                                        ${product.shortDesc}
                                                    </p>
                                                    <p class="fw-bold text-primary mb-3">
                                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                    </p>

                                                    <!-- ⚡ Nút AJAX thay thế form -->
                                                    <button type="button"
                                                        class="btn btn-outline-primary rounded-pill px-3 py-1 add-to-cart-btn"
                                                        data-id="${product.id}">
                                                        <i class="fa fa-shopping-bag me-2"></i>Thêm vào giỏ
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <c:if test="${totalPages > 0}">
                                    <div class="d-flex justify-content-center mt-5">
                                        <a href="/products?page=${currentPage - 1}${queryString}"
                                            class="btn mx-1 ${currentPage == 1 ? 'btn-light disabled' : 'btn-light'}">&laquo;</a>

                                        <c:forEach begin="1" end="${totalPages}" var="pageNum">
                                            <a href="/products?page=${pageNum}${queryString}"
                                                class="btn mx-1 ${pageNum == currentPage ? 'btn-primary' : 'btn-light'}">${pageNum}</a>
                                        </c:forEach>

                                        <a href="/products?page=${currentPage + 1}${queryString}"
                                            class="btn mx-1 ${currentPage == totalPages ? 'btn-light disabled' : 'btn-light'}">&raquo;</a>
                                    </div>
                                </c:if>


                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />
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
                    <%-- base URL cho endpoint add-to-cart (dùng c:url để tương thích context-path) --%>
                        <c:url var="addToCartBase" value="/add-product-to-cart/" />

                        <!-- Nếu chưa có SweetAlert2, import CDN -->
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                        <c:url var="addToCartBase" value="/add-product-to-cart/" />
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                        <script>
                            $(function () {
                                // Lấy CSRF token: ưu tiên meta nếu có, fallback tới hidden input #csrfToken
                                const csrfToken = $('meta[name="_csrf"]').attr('content') || $('#csrfToken').val() || '${_csrf.token}';
                                const csrfHeader = $('meta[name="_csrf_header"]').attr('content') || 'X-CSRF-TOKEN';

                                // Delegated event (an toàn khi DOM thay đổi)
                                $(document).on('click', '.add-to-cart-btn', function (e) {
                                    e.preventDefault();
                                    const $btn = $(this);
                                    const productId = $btn.data('id');
                                    if (!productId) return;

                                    // disable nút tránh bấm liên tục
                                    $btn.prop('disabled', true).addClass('opacity-50');

                                    $.ajax({
                                        url: '${addToCartBase}' + productId,
                                        type: 'POST',
                                        // Không đặt dataType để tránh parsererror khi server trả HTML/redirect
                                        beforeSend: function (xhr) {
                                            xhr.setRequestHeader(csrfHeader, csrfToken);
                                            xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest'); // backend dễ nhận biết AJAX
                                        },
                                        success: function (responseText) {
                                            // Hiện thông báo thành công rồi reload trang
                                            Swal.fire({
                                                toast: true,
                                                position: 'top-end',
                                                icon: 'success',
                                                title: 'Đã thêm sản phẩm vào giỏ!',
                                                showConfirmButton: false,
                                                timer: 700
                                            });

                                            setTimeout(function () {
                                                location.reload();
                                            }, 700);
                                        },
                                        error: function (xhr) {
                                            // Show message cụ thể nếu server trả JSON error, nếu không dùng thông báo mặc định
                                            let msg = 'Thêm sản phẩm thất bại!';
                                            try {
                                                const json = JSON.parse(xhr.responseText);
                                                if (json && json.message) msg = json.message;
                                            } catch (e) { /* không phải JSON */ }

                                            Swal.fire({
                                                toast: true,
                                                position: 'top-end',
                                                icon: 'error',
                                                title: msg,
                                                showConfirmButton: false,
                                                timer: 1500
                                            });
                                        },
                                        complete: function () {
                                            // bật lại nút
                                            $btn.prop('disabled', false).removeClass('opacity-50');
                                        }
                                    });
                                });
                            });
                        </script>


                </body>


                </html>