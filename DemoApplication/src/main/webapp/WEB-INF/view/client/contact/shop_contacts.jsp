<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Liên hệ - MacT&B</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Liên hệ với MacT&B Store" name="description">
    <meta content="liên hệ, contact, MacT&B" name="keywords">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@700;800&display=swap"
          rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries CSS -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template CSS -->
    <link href="/client/css/style.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: rgba(15, 195, 149, 0.95);
            --primary-dark: rgba(12, 156, 119, 1);
            --primary-light: rgba(15, 195, 149, 0.1);
            --secondary-color: #2c3e50;
            --text-dark: #2d3748;
            --text-light: #718096;
        }

        * {
            font-family: 'Poppins', sans-serif;
        }

        body {
            padding-top: 60px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        /* Hero Section */
        .contact-hero {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
            padding: 100px 0 80px;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .contact-hero::before {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: -100px;
            right: -100px;
        }

        .contact-hero::after {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            bottom: -50px;
            left: -50px;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-align: center;
        }

        .hero-content h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1rem;
            text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .hero-content p {
            font-size: 1.2rem;
            opacity: 0.95;
        }

        /* Main Content */
        .contact-section {
            padding: 80px 0;
        }

        /* Info Cards */
        .info-card {
            background: white;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            text-align: center;
            height: 100%;
            transition: all 0.4s ease;
            border-top: 4px solid var(--primary-light);
        }

        .info-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 50px rgba(15, 195, 149, 0.2);
            border-top-color: var(--primary-color);
        }

        .info-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            background: var(--primary-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.4s ease;
        }

        .info-card:hover .info-icon {
            background: var(--primary-color);
            transform: scale(1.1) rotate(360deg);
        }

        .info-icon i {
            font-size: 2rem;
            color: var(--primary-dark);
            transition: color 0.4s ease;
        }

        .info-card:hover .info-icon i {
            color: white;
        }

        .info-card h4 {
            color: var(--text-dark);
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 1.3rem;
        }

        .info-card p {
            color: var(--text-light);
            margin: 0;
            line-height: 1.8;
        }

        .info-card a {
            color: var(--primary-dark);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .info-card a:hover {
            color: var(--primary-color);
        }

        /* Contact Form */
        .contact-form-wrapper {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-family: 'Playfair Display', serif;
            color: var(--text-dark);
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .form-subtitle {
            color: var(--text-light);
            margin-bottom: 2.5rem;
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            color: var(--text-dark);
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
        }

        .form-control {
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 14px 20px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px var(--primary-light);
            background: white;
            outline: none;
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .btn-submit {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 16px 50px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(15, 195, 149, 0.3);
            width: 100%;
        }

        .btn-submit:hover {
            background: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(15, 195, 149, 0.4);
            color: white;
        }

        .btn-submit i {
            margin-left: 10px;
            transition: transform 0.3s;
        }

        .btn-submit:hover i {
            transform: translateX(5px);
        }

        /* Map Section */
        .map-wrapper {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }

        .map-title {
            font-family: 'Playfair Display', serif;
            color: var(--text-dark);
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .map-container {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .map-container iframe {
            width: 100%;
            height: 450px;
            border: none;
        }

        /* Social Links */
        .social-section {
            text-align: center;
            padding: 60px 0;
            background: white;
            margin-top: 80px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }

        .social-title {
            font-family: 'Playfair Display', serif;
            color: var(--text-dark);
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .social-subtitle {
            color: var(--text-light);
            margin-bottom: 2rem;
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .social-link {
            width: 60px;
            height: 60px;
            background: var(--primary-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-dark);
            font-size: 1.5rem;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .social-link:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-5px) rotate(360deg);
            box-shadow: 0 10px 25px rgba(15, 195, 149, 0.3);
        }

        /* Back to top */
        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: var(--primary-color);
            color: white;
            width: 50px;
            height: 50px;
            display: none;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            box-shadow: 0 5px 15px rgba(15, 195, 149, 0.4);
            transition: all 0.3s ease;
            z-index: 999;
            border: none;
        }

        .back-to-top:hover {
            background: var(--primary-dark);
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(15, 195, 149, 0.5);
            color: white;
        }

        /* Animations */
        .animate-fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease;
        }

        .animate-fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* Success Message */
        .alert-success {
            background: var(--primary-light);
            border: 2px solid var(--primary-color);
            color: var(--primary-dark);
            border-radius: 12px;
            padding: 15px 20px;
            margin-bottom: 20px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2.5rem;
            }

            .contact-form-wrapper,
            .map-wrapper {
                padding: 30px 20px;
            }

            .contact-section {
                padding: 50px 0;
            }

            .info-card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>

<body>

    <!-- Spinner -->
    <div id="spinner"
         class="show position-fixed w-100 vh-100 bg-white d-flex justify-content-center align-items-center"
         style="z-index: 9999;">
        <div class="spinner-border" style="color: var(--primary-color);" role="status"></div>
    </div>

    <!-- Navbar -->
    <jsp:include page="../layout/header.jsp" />

    <!-- ======================= HERO SECTION ======================= -->
    <div class="contact-hero">
        <div class="container">
            <div class="hero-content">
                <h1>Liên hệ với chúng tôi</h1>
                <p>Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn</p>
            </div>
        </div>
    </div>

    <!-- ======================= CONTACT INFO CARDS ======================= -->
    <div class="contact-section">
        <div class="container">
            <div class="row g-4 mb-5">
                <div class="col-lg-4 col-md-6 animate-fade-in">
                    <div class="info-card">
                        <div class="info-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h4>Địa chỉ</h4>
                        <p>
                            Số 1, Đại Cồ Việt<br>
                            Hai Bà Trưng, Hà Nội<br>
                            Việt Nam
                        </p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 animate-fade-in">
                    <div class="info-card">
                        <div class="info-icon">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <h4>Điện thoại</h4>
                        <p>
                            Hotline: <a href="tel:+84123456789">+84 123 456 789</a><br>
                            Tư vấn: <a href="tel:+84987654321">+84 987 654 321</a><br>
                            <small>Thứ 2 - Chủ nhật: 8:00 - 22:00</small>
                        </p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 animate-fade-in">
                    <div class="info-card">
                        <div class="info-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <h4>Email</h4>
                        <p>
                            Hỗ trợ: <a href="mailto:support@mactb.com">support@mactb.com</a><br>
                            Kinh doanh: <a href="mailto:sales@mactb.com">sales@mactb.com</a><br>
                            <small>Phản hồi trong vòng 24h</small>
                        </p>
                    </div>
                </div>
            </div>

            <!-- ======================= CONTACT FORM ======================= -->
            <div class="row">
                <div class="col-lg-8 mx-auto animate-fade-in">
                    <div class="contact-form-wrapper">
                        <h2 class="form-title">Gửi tin nhắn cho chúng tôi</h2>
                        <p class="form-subtitle">Điền thông tin bên dưới và chúng tôi sẽ liên hệ lại với bạn trong thời gian sớm nhất</p>

                        <form id="contactForm" method="post" action="/contact/send">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Họ và tên *</label>
                                        <input type="text" class="form-control" name="fullName" 
                                               placeholder="Nguyễn Văn A" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Email *</label>
                                        <input type="email" class="form-control" name="email" 
                                               placeholder="example@email.com" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Số điện thoại</label>
                                        <input type="tel" class="form-control" name="phone" 
                                               placeholder="0123 456 789">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Chủ đề</label>
                                        <select class="form-control" name="subject">
                                            <option value="">Chọn chủ đề</option>
                                            <option value="product">Thông tin sản phẩm</option>
                                            <option value="order">Đơn hàng</option>
                                            <option value="support">Hỗ trợ kỹ thuật</option>
                                            <option value="complaint">Khiếu nại</option>
                                            <option value="cooperation">Hợp tác kinh doanh</option>
                                            <option value="other">Khác</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="form-label">Nội dung *</label>
                                        <textarea class="form-control" name="message" 
                                                  placeholder="Nhập nội dung tin nhắn của bạn..." required></textarea>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <button type="submit" class="btn btn-submit">
                                        Gửi tin nhắn
                                        <i class="fas fa-paper-plane"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ======================= MAP SECTION ======================= -->
    <div class="container mb-5">
        <div class="map-wrapper animate-fade-in">
            <h2 class="map-title">Vị trí cửa hàng</h2>
            <div class="map-container">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4876927640374!2d105.84117731533422!3d21.006929193758!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135aba1537e48df%3A0x24cd2e160c67402d!2zxJDhuqFpIGjhu41jIELDoWNoIEtob2EgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1234567890123!5m2!1svi!2s"
                    allowfullscreen="" 
                    loading="lazy" 
                    referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
    </div>

    <!-- ======================= SOCIAL SECTION ======================= -->
    <div class="container mb-5">
        <div class="social-section animate-fade-in">
            <h2 class="social-title">Kết nối với chúng tôi</h2>
            <p class="social-subtitle">Theo dõi chúng tôi trên các nền tảng mạng xã hội</p>
            <div class="social-links">
                <a href="https://facebook.com" class="social-link" target="_blank" title="Facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="https://instagram.com" class="social-link" target="_blank" title="Instagram">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="https://twitter.com" class="social-link" target="_blank" title="Twitter">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="https://youtube.com" class="social-link" target="_blank" title="YouTube">
                    <i class="fab fa-youtube"></i>
                </a>
                <a href="https://linkedin.com" class="social-link" target="_blank" title="LinkedIn">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a href="https://tiktok.com" class="social-link" target="_blank" title="TikTok">
                    <i class="fab fa-tiktok"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="../layout/footer.jsp" />

    <!-- Back to top button -->
    <a href="#" class="btn back-to-top">
        <i class="fas fa-arrow-up"></i>
    </a>

    <!-- JS Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template JS -->
    <script src="/client/js/main.js"></script>

    <script>
        // Hide spinner on load
        window.addEventListener('load', () => {
            const spinner = document.getElementById('spinner');
            if (spinner) {
                setTimeout(() => {
                    spinner.classList.remove('show');
                    spinner.style.display = 'none';
                }, 300);
            }
        });

        // Animate elements on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        document.querySelectorAll('.animate-fade-in').forEach(el => {
            observer.observe(el);
        });

        // Back to top button
        const backToTop = document.querySelector('.back-to-top');
        if (backToTop) {
            window.addEventListener('scroll', () => {
                if (window.scrollY > 300) {
                    backToTop.style.display = 'flex';
                } else {
                    backToTop.style.display = 'none';
                }
            });

            backToTop.addEventListener('click', (e) => {
                e.preventDefault();
                window.scrollTo({ top: 0, behavior: 'smooth' });
            });
        }

        // Form validation and submission
        const contactForm = document.getElementById('contactForm');
        if (contactForm) {
            contactForm.addEventListener('submit', (e) => {
                e.preventDefault();
                
                const formData = new FormData(contactForm);
                const submitBtn = contactForm.querySelector('.btn-submit');
                const originalText = submitBtn.innerHTML;
                
                // Show loading state
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Đang gửi...';
                
                // Simulate form submission (replace with actual AJAX call)
                setTimeout(() => {
                    // Show success message
                    const successMsg = document.createElement('div');
                    successMsg.className = 'alert alert-success';
                    successMsg.innerHTML = '<i class="fas fa-check-circle me-2"></i>Cảm ơn bạn đã liên hệ! Chúng tôi sẽ phản hồi trong thời gian sớm nhất.';
                    contactForm.insertBefore(successMsg, contactForm.firstChild);
                    
                    // Reset form
                    contactForm.reset();
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalText;
                    
                    // Remove success message after 5 seconds
                    setTimeout(() => {
                        successMsg.remove();
                    }, 5000);
                    
                    // Scroll to success message
                    successMsg.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }, 1500);
            });
        }

        // Add animation to form inputs on focus
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });
        });

        // Phone number formatting
        const phoneInput = document.querySelector('input[name="phone"]');
        if (phoneInput) {
            phoneInput.addEventListener('input', function(e) {
                let value = e.target.value.replace(/\D/g, '');
                if (value.length > 10) value = value.slice(0, 10);
                e.target.value = value;
            });
        }
    </script>

</body>

</html>