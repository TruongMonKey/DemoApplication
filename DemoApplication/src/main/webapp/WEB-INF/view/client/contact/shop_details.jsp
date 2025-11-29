<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Giới thiệu - MacT&B</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

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

        /* Banner chính với hiệu ứng gradient overlay */
        .shop-banner {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%),
                        url('/client/img/banner-shop.jpg') center/cover no-repeat;
            background-blend-mode: overlay;
            min-height: 70vh;
            display: flex;
            align-items: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .shop-banner::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: pulse 8s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: translate(-50%, -50%) scale(1); }
            50% { transform: translate(-30%, -30%) scale(1.1); }
        }

        .banner-content {
            position: relative;
            z-index: 2;
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .banner-content h1 {
            font-family: 'Playfair Display', serif;
            font-size: 4rem;
            font-weight: 800;
            text-shadow: 2px 4px 8px rgba(0,0,0,0.3);
            margin-bottom: 1.5rem;
        }

        .banner-content .lead {
            font-size: 1.4rem;
            font-weight: 300;
            text-shadow: 1px 2px 4px rgba(0,0,0,0.2);
            margin-bottom: 2rem;
        }

        .btn-custom {
            background: white;
            color: var(--primary-dark);
            border: none;
            padding: 14px 40px;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 50px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.25);
            color: var(--primary-dark);
            background: #f8f9fa;
        }

        /* Section styling */
        .shop-section {
            padding: 80px 0;
            background: white;
            position: relative;
        }

        .shop-section:nth-child(even) {
            background: #f8f9fa;
        }

        .section-title {
            font-family: 'Playfair Display', serif;
            font-size: 2.8rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
            border-radius: 2px;
        }

        .section-subtitle {
            color: var(--text-light);
            font-size: 1.1rem;
            margin-bottom: 3rem;
        }

        /* About section */
        .about-image {
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            overflow: hidden;
            position: relative;
        }

        .about-image::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(15, 195, 149, 0.3), transparent);
            transform: rotate(45deg);
            animation: shine 3s infinite;
        }

        @keyframes shine {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        .about-image img {
            transition: transform 0.5s ease;
        }

        .about-image:hover img {
            transform: scale(1.05);
        }

        .about-content h2 {
            font-family: 'Playfair Display', serif;
            color: var(--text-dark);
            margin-bottom: 1.5rem;
        }

        .about-content p {
            color: var(--text-light);
            line-height: 1.8;
            font-size: 1.05rem;
            margin-bottom: 1.2rem;
        }

        .about-content .highlight {
            color: var(--primary-dark);
            font-weight: 600;
        }

        .btn-outline-custom {
            color: var(--primary-dark);
            border: 2px solid var(--primary-color);
            padding: 12px 35px;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.3s ease;
        }

        .btn-outline-custom:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(15, 195, 149, 0.3);
        }

        /* Feature boxes */
        .feature-box {
            background: white;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: all 0.4s ease;
            text-align: center;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        .feature-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
            transform: scaleX(0);
            transition: transform 0.4s ease;
        }

        .feature-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 50px rgba(15, 195, 149, 0.2);
        }

        .feature-box:hover::before {
            transform: scaleX(1);
        }

        .feature-icon {
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

        .feature-box:hover .feature-icon {
            background: var(--primary-color);
            transform: rotateY(360deg);
        }

        .feature-icon i {
            font-size: 2rem;
            color: var(--primary-dark);
            transition: color 0.4s ease;
        }

        .feature-box:hover .feature-icon i {
            color: white;
        }

        .feature-box h5 {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 15px;
            font-size: 1.3rem;
        }

        .feature-box p {
            color: var(--text-light);
            line-height: 1.7;
            margin: 0;
        }

        /* Stats Section */
        .stats-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
            padding: 60px 0;
            color: white;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            font-family: 'Playfair Display', serif;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
            font-weight: 300;
        }

        /* Back to top button */
        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: var(--primary-color);
            color: white;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            box-shadow: 0 5px 15px rgba(15, 195, 149, 0.4);
            transition: all 0.3s ease;
            z-index: 999;
        }

        .back-to-top:hover {
            background: var(--primary-dark);
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(15, 195, 149, 0.5);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .banner-content h1 {
                font-size: 2.5rem;
            }

            .banner-content .lead {
                font-size: 1.1rem;
            }

            .section-title {
                font-size: 2rem;
            }

            .shop-section {
                padding: 50px 0;
            }
        }

        /* Animations */
        .animate-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }

        .animate-on-scroll.animated {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>


<body>

<!-- Spinner -->
<div id="spinner"
     class="show position-fixed w-100 vh-100 bg-white d-flex justify-content-center align-items-center" style="z-index: 9999;">
    <div class="spinner-border text-primary" role="status" style="color: var(--primary-color) !important;"></div>
</div>

<!-- Navbar -->
<jsp:include page="../layout/header.jsp" />


<!-- ======================= BANNER GIỚI THIỆU ======================= -->
<div class="shop-banner position-relative">
    <div class="container">
        <div class="banner-content text-center">
            <h1 class="display-3 fw-bold">MacT&B Store</h1>
            <p class="lead">Hiện đại – Chất lượng – Giá trị bền vững</p>
            <a href="/products" class="btn btn-custom">
                <i class="fas fa-shopping-bag me-2"></i>Khám phá sản phẩm
            </a>
        </div>
    </div>
</div>


<!-- ======================= STATS ======================= -->
<div class="stats-section">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-6">
                <div class="stat-item animate-on-scroll">
                    <div class="stat-number">5000+</div>
                    <div class="stat-label">Khách hàng hài lòng</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item animate-on-scroll">
                    <div class="stat-number">500+</div>
                    <div class="stat-label">Sản phẩm chất lượng</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item animate-on-scroll">
                    <div class="stat-number">24/7</div>
                    <div class="stat-label">Hỗ trợ khách hàng</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item animate-on-scroll">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Cam kết chất lượng</div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- ======================= GIỚI THIỆU ======================= -->
<div class="shop-section">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6 animate-on-scroll">
                <div class="about-image">
                    <img src="/client/img/banner_mac.jpeg" class="img-fluid" alt="About Shop">
                </div>
            </div>
            <div class="col-lg-6 animate-on-scroll">
                <div class="about-content">
                    <h2 class="fw-bold mb-4">Về MacT&B</h2>
                    <p>
                        Chúng tôi là <span class="highlight">cửa hàng hàng đầu</span> chuyên cung cấp các sản phẩm chất lượng cao, 
                        hướng đến sự hài lòng và trải nghiệm tuyệt vời nhất cho khách hàng. 
                    </p>
                    <p>
                        Mỗi sản phẩm đều được <span class="highlight">lựa chọn kỹ lưỡng</span>, đảm bảo xuất xứ rõ ràng 
                        và được kiểm định chất lượng theo tiêu chuẩn quốc tế.
                    </p>
                    <p>
                        Với đội ngũ nhân viên <span class="highlight">chuyên nghiệp và nhiệt tình</span>, 
                        MacT&B tự tin mang đến những giá trị tốt nhất cho cuộc sống của bạn.
                    </p>
                    <a href="/contact" class="btn btn-outline-custom mt-3">
                        <i class="fas fa-phone-alt me-2"></i>Liên hệ với chúng tôi
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- ======================= LÝ DO NÊN CHỌN SHOP ======================= -->
<div class="shop-section" style="background: #f8f9fa;">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="section-title">Tại sao chọn chúng tôi?</h2>
            <p class="section-subtitle">Những giá trị cốt lõi làm nên sự khác biệt của MacT&B</p>
        </div>

        <div class="row g-4">
            <div class="col-lg-4 col-md-6 animate-on-scroll">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-gem"></i>
                    </div>
                    <h5>Chất lượng cao cấp</h5>
                    <p>Sản phẩm được tuyển chọn nghiêm ngặt từ các thương hiệu uy tín, đảm bảo độ bền và giá trị sử dụng lâu dài.</p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 animate-on-scroll">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-shipping-fast"></i>
                    </div>
                    <h5>Giao hàng nhanh chóng</h5>
                    <p>Vận chuyển trong ngày tại nội thành, giao hàng toàn quốc với đội ngũ vận chuyển chuyên nghiệp.</p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 animate-on-scroll">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <h5>Hỗ trợ tận tâm</h5>
                    <p>Đội ngũ tư vấn chuyên nghiệp sẵn sàng giải đáp mọi thắc mắc và hỗ trợ khách hàng 24/7.</p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 animate-on-scroll">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h5>Bảo hành uy tín</h5>
                    <p>Chính sách bảo hành rõ ràng, đổi trả linh hoạt trong vòng 30 ngày nếu có vấn đề.</p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 animate-on-scroll">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-tags"></i>
                    </div>
                    <h5>Giá cả cạnh tranh</h5>
                    <p>Cam kết giá tốt nhất thị trường với nhiều chương trình khuyến mãi hấp dẫn quanh năm.</p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 animate-on-scroll">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <h5>Uy tín hàng đầu</h5>
                    <p>Được tin tưởng bởi hàng nghìn khách hàng và đối tác trên toàn quốc.</p>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Footer -->
<jsp:include page="../layout/footer.jsp" />

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
    // Hide spinner
    window.addEventListener('load', () => {
        const spinner = document.getElementById('spinner');
        if (spinner) {
            setTimeout(() => {
                spinner.classList.remove('show');
                spinner.style.display = 'none';
            }, 300);
        }
    });

    // Animate on scroll
    const animateOnScroll = () => {
        const elements = document.querySelectorAll('.animate-on-scroll');
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animated');
                }
            });
        }, {
            threshold: 0.1
        });

        elements.forEach(el => observer.observe(el));
    };

    // Counter animation for stats
    const animateCounters = () => {
        const counters = document.querySelectorAll('.stat-number');
        
        counters.forEach(counter => {
            const target = counter.textContent;
            const isPlus = target.includes('+');
            const isPercent = target.includes('%');
            const number = parseInt(target.replace(/[^0-9]/g, ''));
            
            let current = 0;
            const increment = number / 50;
            
            const updateCounter = () => {
                if (current < number) {
                    current += increment;
                    counter.textContent = Math.ceil(current) + (isPlus ? '+' : '') + (isPercent ? '%' : '');
                    requestAnimationFrame(updateCounter);
                } else {
                    counter.textContent = target;
                }
            };
            
            // Start animation when visible
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        updateCounter();
                        observer.disconnect();
                    }
                });
            }, { threshold: 0.5 });
            
            observer.observe(counter);
        });
    };

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

    // Initialize animations
    document.addEventListener('DOMContentLoaded', () => {
        animateOnScroll();
        animateCounters();
    });
</script>

</body>

</html>