<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Đăng ký — MacT&B</title>
    <meta name="description" content="Tạo tài khoản MacT&B">
    <meta name="keywords" content="register, đăng ký, mactb">

    <!-- Favicons -->
    <link href="/img/favicon.png" rel="icon">
    <link href="/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&family=Playfair+Display:wght@600;700&display=swap"
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

    <!-- Custom styling for register page -->
    <style>
        :root {
            --brand: #0fbf95;
            --brand-dark: #0c9c77;
            --muted: #6b7280;
            --card-radius: 14px;
        }

        html,
        body {
            height: 100%;
            font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            background: linear-gradient(180deg, #f6fbfa 0%, #eef7f5 60%, #f8fafc 100%);
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .auth-wrapper {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 34px 16px;
        }

        .register-card {
            width: 100%;
            max-width: 920px;
            border-radius: var(--card-radius);
            overflow: hidden;
            background: linear-gradient(180deg, rgba(255,255,255,0.98) 0%, rgba(250,250,250,0.96) 100%);
            box-shadow: 0 12px 40px rgba(2,6,23,0.06);
            display: grid;
            grid-template-columns: 1fr 420px;
            gap: 0;
            border: 1px solid rgba(2,6,23,0.04);
        }

        /* Left promo / info column */
        .register-side {
            padding: 40px;
            background:
                linear-gradient(180deg, rgba(15,191,149,0.04), rgba(15,191,149,0.02));
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 18px;
        }

        .brand-large {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .brand-large img {
            width: 62px;
            height: 62px;
            object-fit: contain;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(2,6,23,0.06);
        }

        .brand-large h2 {
            margin: 0;
            font-family: 'Playfair Display', serif;
            font-size: 24px;
            color: #0f1724;
        }

        .register-side p.lead {
            margin: 0;
            color: #334155;
            line-height: 1.6;
            font-size: 1rem;
        }

        .benefits {
            display: grid;
            grid-template-columns: repeat(2, minmax(0,1fr));
            gap: 12px;
            margin-top: 12px;
        }

        .benefit {
            display: flex;
            gap: 10px;
            align-items: center;
            background: white;
            border-radius: 12px;
            padding: 10px;
            border: 1px solid rgba(2,6,23,0.04);
            box-shadow: 0 6px 18px rgba(2,6,23,0.03);
            color: #0f1724;
            font-weight: 600;
            font-size: 0.95rem;
        }

        .benefit i {
            color: var(--brand);
            font-size: 20px;
            width: 34px;
            height: 34px;
            display:flex;
            align-items:center;
            justify-content:center;
            background: rgba(15,191,149,0.08);
            border-radius: 8px;
        }

        /* Right form column */
        .register-form {
            padding: 28px;
        }

        .register-form h3 {
            margin: 0 0 8px 0;
            color: #0f1724;
            font-size: 20px;
            font-weight: 700;
        }

        .register-form p.sub {
            margin: 0 0 18px 0;
            color: var(--muted);
        }

        .form-control {
            border-radius: 10px;
            padding: 12px 14px;
            border: 1px solid rgba(15,23,42,0.08);
            background: #fff;
            transition: box-shadow .18s ease, border-color .18s ease;
        }

        .form-control:focus {
            border-color: var(--brand);
            box-shadow: 0 6px 18px rgba(15,191,149,0.12);
        }

        .input-group-text {
            background: transparent;
            border: none;
            color: var(--muted);
            font-weight: 600;
        }

        .btn-register {
            background: linear-gradient(90deg, var(--brand), var(--brand-dark));
            border: none;
            border-radius: 12px;
            padding: 10px 16px;
            font-weight: 700;
            color: white;
            box-shadow: 0 10px 25px rgba(15,191,149,0.12);
            transition: transform .14s ease, box-shadow .18s ease;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 34px rgba(15,191,149,0.16);
        }

        .note {
            font-size: 0.92rem;
            color: var(--muted);
        }

        .form-errors {
            margin-bottom: 10px;
            color: #dc2626;
            font-weight: 600;
            text-align: center;
        }

        .bottom-actions {
            margin-top: 12px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            gap:10px;
            flex-wrap:wrap;
        }

        .small-link a {
            color: var(--brand-dark);
            text-decoration:none;
            font-weight:600;
        }

        .divider {
            height:1px;
            background: linear-gradient(90deg, rgba(15,23,42,0.03), rgba(15,23,42,0.04));
            margin:18px 0;
            border-radius:6px;
        }

        @media (max-width: 992px) {
            .register-card {
                grid-template-columns: 1fr;
            }
            .register-side {
                order: 2;
                padding: 24px;
            }
            .register-form {
                order: 1;
                padding: 20px;
            }
        }

    </style>
</head>

<body>
    <main class="auth-wrapper" aria-labelledby="register-heading">
        <div class="register-card" role="region" aria-label="Tạo tài khoản MacT&B">
            <!-- Left side: promo / benefits -->
            <aside class="register-side" aria-hidden="false">
                <div class="brand-large">
                    <img src="https://e7.pngegg.com/pngimages/684/943/png-clipart-apple-logo-computer-icons-apple-logo-heart-logo.png" alt="MacT&B logo">
                    <h2>Mac<span style="color:var(--brand)">T&amp;B</span></h2>
                </div>

                <p class="lead">Tạo tài khoản để tận hưởng trải nghiệm mua sắm nhanh chóng, bảo hành chính hãng và nhiều khuyến mãi hấp dẫn.</p>

                <div class="benefits" aria-hidden="true">
                    <div class="benefit"><i class="bi bi-truck"></i> Miễn phí vận chuyển</div>
                    <div class="benefit"><i class="bi bi-shield-check"></i> Bảo hành chính hãng</div>
                    <div class="benefit"><i class="bi bi-arrow-repeat"></i> Đổi trả 30 ngày</div>
                    <div class="benefit"><i class="bi bi-headset"></i> Hỗ trợ 24/7</div>
                </div>

                <div class="divider" aria-hidden="true"></div>

                <p class="note">Bạn đã có tài khoản? <a href="/login" class="small-link">Đăng nhập</a></p>
            </aside>

            <!-- Right side: form -->
            <section class="register-form">
                <h3 id="register-heading">Tạo tài khoản mới</h3>
                <p class="sub">Nhập thông tin cá nhân để tạo tài khoản</p>

                <!-- Server-side global error (example) -->
                <c:if test="${not empty errorMessage}">
                    <div class="form-errors" role="alert">${errorMessage}</div>
                </c:if>

                <!-- Flash success (from RedirectAttributes) -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success" role="status">${successMessage}</div>
                </c:if>

                <!-- Fixed Spring form tag: use cssClass and proper action -->
                <form:form method="post"
                           action="${pageContext.request.contextPath}/register"
                           modelAttribute="registerUser"
                           cssClass="row g-3 needs-validation">
                    <div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>

                    <div class="col-md-6">
                        <label for="firstName" class="form-label">Họ</label>
                        <form:input path="firstName" id="firstName" cssClass="form-control" />
                        <form:errors path="firstName" cssClass="invalid-feedback d-block" />
                    </div>

                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Tên</label>
                        <form:input path="lastName" id="lastName" cssClass="form-control" />
                        <form:errors path="lastName" cssClass="invalid-feedback d-block" />
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label">Email</label>
                        <form:input path="email" id="email" type="email" cssClass="form-control" />
                        <form:errors path="email" cssClass="invalid-feedback d-block" />
                    </div>

                    <div class="col-md-6">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <form:password path="password" id="password" cssClass="form-control" />
                        <form:errors path="password" cssClass="invalid-feedback d-block" />
                    </div>

                    <div class="col-md-6">
                        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                        <form:password path="confirmPassword" id="confirmPassword" cssClass="form-control" />
                        <form:errors path="confirmPassword" cssClass="invalid-feedback d-block" />
                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn-register w-100">Tạo tài khoản</button>
                    </div>

                    <div class="col-12">
                        <div class="bottom-actions">
                            <div class="note">Bằng việc tạo tài khoản bạn đồng ý với <a href="/terms" class="small-link">Điều khoản & Chính sách</a>.</div>
                        </div>
                    </div>
                </form:form>

                <div class="divider" aria-hidden="true"></div>

                <div style="text-align:center;">
                    <p class="note">Hoặc tiếp tục với</p>
                    <div style="display:flex; gap:10px; justify-content:center; margin-top:10px;">
                        <a href="#" class="btn btn-outline-secondary"><i class="bi bi-google"></i> Google</a>
                        <a href="#" class="btn btn-outline-secondary"><i class="bi bi-apple"></i> Apple</a>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center" style="position:fixed; right:16px; bottom:16px; width:44px; height:44px; border-radius:8px; background:rgba(15,191,149,0.12); color:var(--brand-dark); text-decoration:none; box-shadow:0 6px 18px rgba(2,6,23,0.06);">
        <i class="bi bi-arrow-up-short" aria-hidden="true" style="font-size:20px;"></i>
    </a>

    <!-- Vendor JS Files -->
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="/vendor/chart.js/chart.umd.js"></script>
    <script src="/vendor/echarts/echarts.min.js"></script>
    <script src="/vendor/quill/quill.js"></script>
    <script src="/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="/vendor/tinymce/tinymce.min.js"></script>
    <script src="/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="/js/main.js"></script>

    <script>
        // Optionally add novalidate attribute to Spring form (if you want HTML5 native validation disabled)
        // Uncomment next block to enable novalidate on the form element after page load
        /*
        document.addEventListener('DOMContentLoaded', function () {
            var f = document.querySelector('form[modelAttribute="registerUser"]');
            if (f) f.setAttribute('novalidate', '');
        });
        */

        // Bootstrap-like client validation + confirm password check
        (function() {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    // custom confirm password check (client-side)
                    const pass = form.querySelector('#password');
                    const confirm = form.querySelector('#confirmPassword');
                    let valid = true;
                    if (pass && confirm && pass.value !== confirm.value) {
                        valid = false;
                        if (!confirm.classList.contains('is-invalid')) confirm.classList.add('is-invalid');
                        let ef = confirm.nextElementSibling;
                        if (ef && ef.classList.contains('invalid-feedback')) {
                            ef.textContent = 'Mật khẩu xác nhận không khớp.';
                        }
                    }
                    if (!form.checkValidity() || !valid) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>

</html>