<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Đăng nhập — MacT&B</title>
    <meta name="description" content="Đăng nhập vào tài khoản MacT&B">
    <meta name="keywords" content="login, đăng nhập, mactb">

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
    <link href="/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/css/style.css" rel="stylesheet">

    <!-- Custom small styling for login page -->
    <style>
        :root{
            --brand: #0fbf95;
            --brand-dark: #0c9c77;
            --muted: #6b7280;
            --card-radius: 14px;
            --glass: rgba(255,255,255,0.85);
        }

        html,body{
            height:100%;
            font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            background: linear-gradient(180deg, #f6fbfa 0%, #eef7f5 60%, #f8fafc 100%);
            -webkit-font-smoothing:antialiased;
            -moz-osx-font-smoothing:grayscale;
        }

        .auth-wrapper{
            min-height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
            padding:40px 16px;
        }

        .auth-card{
            width:100%;
            max-width:420px;
            background: linear-gradient(180deg, rgba(255,255,255,0.98) 0%, rgba(250,250,250,0.95) 100%);
            border-radius: var(--card-radius);
            box-shadow: 0 10px 30px rgba(16,24,40,0.08);
            border: 1px solid rgba(15,23,42,0.04);
            overflow:hidden;
        }

        .auth-header{
            padding:26px 26px 10px 26px;
            display:flex;
            align-items:center;
            gap:14px;
        }

        .auth-brand {
            display:flex;
            align-items:center;
            gap:12px;
            text-decoration:none;
        }

        .auth-brand img{
            width:46px;
            height:46px;
            object-fit:contain;
            border-radius:8px;
            box-shadow: 0 6px 18px rgba(11, 22, 33, 0.06);
        }

        .auth-brand h1{
            margin:0;
            font-family:'Playfair Display', serif;
            font-size:20px;
            color:#0f1724;
            letter-spacing:0.2px;
        }

        .auth-body{
            padding: 18px 26px 26px 26px;
        }

        .auth-intro{
            text-align:center;
            margin-bottom:18px;
        }

        .auth-intro h2{
            margin:0;
            font-size:18px;
            font-weight:700;
            color:#0f1724;
        }

        .auth-intro p{
            margin:6px 0 0;
            color:var(--muted);
            font-size:0.95rem;
        }

        .form-control {
            border-radius:10px;
            padding:12px 14px;
            border:1px solid rgba(15,23,42,0.08);
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
            font-weight:600;
        }

        .btn-primary {
            background: linear-gradient(90deg, var(--brand), var(--brand-dark));
            border: none;
            border-radius: 12px;
            padding: 10px 16px;
            font-weight: 700;
            box-shadow: 0 10px 25px rgba(15,191,149,0.12);
            transition: transform .14s ease, box-shadow .18s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 34px rgba(15,191,149,0.16);
            background: linear-gradient(90deg,var(--brand-dark), var(--brand));
        }

        .helper-row {
            display:flex;
            align-items:center;
            justify-content:space-between;
            gap:12px;
            margin-top:12px;
            margin-bottom:8px;
        }

        .small-link {
            color: var(--muted);
            font-size:0.92rem;
        }

        .small-link a {
            color: var(--brand-dark);
            text-decoration: none;
            font-weight:600;
        }

        .divider {
            height:1px;
            background: linear-gradient(90deg, rgba(15,23,42,0.03), rgba(15,23,42,0.04));
            margin:18px 0;
            border-radius:6px;
        }

        .text-error {
            color: #dc2626;
            font-weight:600;
            font-size:0.95rem;
            margin-bottom:8px;
            text-align:center;
        }

        .footer-note {
            padding:14px 26px 22px 26px;
            text-align:center;
            color: var(--muted);
            font-size:0.92rem;
        }

        /* responsive */
        @media (max-width:420px){
            .auth-card{ border-radius:12px; }
            .auth-header{ padding:18px; }
            .auth-body{ padding:18px; }
        }
    </style>
</head>

<body>
    <main class="auth-wrapper" aria-labelledby="login-heading">
        <div class="auth-card" role="region" aria-label="Đăng nhập MacT&B">
            <header class="auth-header">
                <a href="/" class="auth-brand" aria-label="Trang chủ MacT&B">
                    <img src="https://e7.pngegg.com/pngimages/684/943/png-clipart-apple-logo-computer-icons-apple-logo-heart-logo.png" alt="MacT&B logo">
                    <h1>Mac<span style="color:var(--brand)">T&amp;B</span></h1>
                </a>
            </header>

            <section class="auth-body">
                <div class="auth-intro">
                    <h2 id="login-heading">Đăng nhập tài khoản</h2>
                    <p>Nhập email và mật khẩu để truy cập vào trang quản lý & mua sắm</p>
                </div>

                <!-- Server messages -->
                <c:if test="${param.error != null}">
                    <div class="text-error" role="alert">
                        Email hoặc mật khẩu không đúng. Vui lòng thử lại.
                    </div>
                </c:if>

                <c:if test="${param.logout != null}">
                    <div class="text-success" role="status" style="color: #059669; text-align:center; margin-bottom:12px; font-weight:600;">
                        Bạn đã đăng xuất thành công.
                    </div>
                </c:if>

                <form method="post" action="/login" class="row g-3 needs-validation" novalidate>
                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Email</label>
                        <div class="input-group has-validation">
                            <span class="input-group-text" id="inputGroupPrepend">
                                <i class="bi bi-envelope-fill"></i>
                            </span>
                            <input type="email" name="username" class="form-control" id="yourUsername" placeholder="ví dụ: nguyen@domain.com" required aria-describedby="emailHelp">
                            <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="yourPassword" class="form-label">Mật khẩu</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-lock-fill"></i>
                            </span>
                            <input type="password" name="password" class="form-control" id="yourPassword" placeholder="Nhập mật khẩu" required>
                            <div class="invalid-feedback">Vui lòng nhập mật khẩu.</div>
                        </div>
                    </div>

                    <div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>

                    <div class="col-12 helper-row">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                            <label class="form-check-label small-link" for="rememberMe">Ghi nhớ đăng nhập</label>
                        </div>
                        <div class="small-link">
                            <a href="/forgot-password">Quên mật khẩu?</a>
                        </div>
                    </div>

                    <div class="col-12">
                        <button class="btn btn-primary w-100" type="submit" aria-label="Đăng nhập">Đăng nhập</button>
                    </div>

                    <div class="col-12">
                        <p class="text-center" style="margin:0; color:var(--muted)">
                            Bạn chưa có tài khoản? <a href="/register" style="color:var(--brand-dark); font-weight:600;">Tạo tài khoản</a>
                        </p>
                    </div>
                </form>

                <div class="divider" role="presentation" aria-hidden="true"></div>

                <!-- Optional: other quick actions -->
                <div style="display:flex; gap:10px; justify-content:center; align-items:center; flex-wrap:wrap; margin-top:6px;">
                    <a href="/" class="small-link" style="margin-right:12px;">Về trang chủ</a>
                    <a href="/support" class="small-link">Hỗ trợ</a>
                </div>
            </section>

            <footer class="footer-note" aria-hidden="false">
                © <span id="year"></span> MacT&B • Mọi quyền được bảo lưu.
            </footer>
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
        // accessibility: set year
        document.getElementById('year').textContent = new Date().getFullYear();

        // client-side validation bootstrap style
        (function () {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>

</html>
