<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công - MacT&B</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: rgba(15, 195, 149, 0.95);
            --primary-dark: rgba(12, 156, 119, 1);
            --primary-light: rgba(15, 195, 149, 0.1);
        }

        * {
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        /* Background Animation */
        body::before {
            content: '';
            position: absolute;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, var(--primary-light) 0%, transparent 70%);
            border-radius: 50%;
            top: -200px;
            right: -200px;
            animation: float 8s ease-in-out infinite;
        }

        body::after {
            content: '';
            position: absolute;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, var(--primary-light) 0%, transparent 70%);
            border-radius: 50%;
            bottom: -150px;
            left: -150px;
            animation: float 10s ease-in-out infinite reverse;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) scale(1); }
            50% { transform: translateY(-30px) scale(1.1); }
        }

        /* Main Card */
        .thankyou-card {
            background: white;
            border-radius: 30px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            padding: 50px 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 2;
            overflow: hidden;
        }

        .thankyou-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
        }

        /* Success Icon */
        .success-icon-wrapper {
            width: 120px;
            height: 120px;
            margin: 0 auto 30px;
            position: relative;
        }

        .success-circle {
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 30px rgba(15, 195, 149, 0.4);
            animation: scaleIn 0.5s ease-out;
        }

        @keyframes scaleIn {
            from {
                transform: scale(0);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .checkmark-icon {
            font-size: 4rem;
            color: white;
            animation: checkmarkDraw 0.8s ease-out 0.3s;
        }

        @keyframes checkmarkDraw {
            0% {
                transform: scale(0) rotate(-45deg);
                opacity: 0;
            }
            50% {
                transform: scale(1.2) rotate(0deg);
            }
            100% {
                transform: scale(1) rotate(0deg);
                opacity: 1;
            }
        }

        .success-particles {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 150px;
            height: 150px;
        }

        .particle {
            position: absolute;
            width: 10px;
            height: 10px;
            background: var(--primary-color);
            border-radius: 50%;
            animation: particle-burst 1s ease-out;
            opacity: 0;
        }

        .particle:nth-child(1) { top: 0; left: 50%; animation-delay: 0.5s; }
        .particle:nth-child(2) { top: 20%; right: 10%; animation-delay: 0.6s; }
        .particle:nth-child(3) { right: 0; top: 50%; animation-delay: 0.7s; }
        .particle:nth-child(4) { bottom: 20%; right: 10%; animation-delay: 0.8s; }
        .particle:nth-child(5) { bottom: 0; left: 50%; animation-delay: 0.9s; }
        .particle:nth-child(6) { bottom: 20%; left: 10%; animation-delay: 1s; }
        .particle:nth-child(7) { left: 0; top: 50%; animation-delay: 1.1s; }
        .particle:nth-child(8) { top: 20%; left: 10%; animation-delay: 1.2s; }

        @keyframes particle-burst {
            0% {
                transform: scale(0);
                opacity: 1;
            }
            100% {
                transform: scale(1) translateY(-20px);
                opacity: 0;
            }
        }

        /* Title */
        .thankyou-title {
            font-family: 'Playfair Display', serif;
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 15px;
            letter-spacing: -1px;
        }

        /* Order Info */
        .order-info {
            background: var(--primary-light);
            border-radius: 20px;
            padding: 25px;
            margin: 30px 0;
            border: 2px solid rgba(15, 195, 149, 0.3);
        }

        .order-number {
            font-size: 1.1rem;
            color: #4a5568;
            margin-bottom: 15px;
        }

        .order-number strong {
            color: var(--primary-dark);
            font-size: 1.3rem;
            font-weight: 700;
        }

        /* Description */
        .thankyou-desc {
            color: #4a5568;
            font-size: 1.1rem;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .thankyou-desc .highlight {
            color: var(--primary-dark);
            font-weight: 600;
        }

        /* Features List */
        .features-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }

        .feature-item {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 15px;
            transition: all 0.3s ease;
        }

        .feature-item:hover {
            background: var(--primary-light);
            transform: translateY(-5px);
        }

        .feature-icon {
            width: 50px;
            height: 50px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
            color: var(--primary-dark);
            font-size: 1.5rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .feature-text {
            font-size: 0.95rem;
            color: #4a5568;
            font-weight: 500;
        }

        /* Buttons */
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin: 35px 0 25px;
            flex-wrap: wrap;
        }

        .btn-custom {
            padding: 14px 35px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1.05rem;
            transition: all 0.3s ease;
            border: 2px solid;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .btn-primary-custom {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            border-color: var(--primary-color);
            box-shadow: 0 8px 20px rgba(15, 195, 149, 0.3);
        }

        .btn-primary-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(15, 195, 149, 0.4);
            color: white;
        }

        .btn-outline-custom {
            background: white;
            color: var(--primary-dark);
            border-color: var(--primary-color);
        }

        .btn-outline-custom:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(15, 195, 149, 0.3);
        }

        /* Footer */
        .thankyou-footer {
            margin-top: 30px;
            padding-top: 25px;
            border-top: 2px solid #e2e8f0;
            color: #718096;
            font-size: 0.95rem;
        }

        .contact-info {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 15px;
            flex-wrap: wrap;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .contact-item i {
            color: var(--primary-color);
            font-size: 1.1rem;
        }

        .contact-item a {
            color: var(--primary-dark);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .contact-item a:hover {
            color: var(--primary-color);
        }

        /* Social Links */
        .social-links {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            background: var(--primary-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-dark);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .social-icon:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-3px) rotate(360deg);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .thankyou-card {
                padding: 35px 25px;
            }

            .thankyou-title {
                font-size: 2rem;
            }

            .success-icon-wrapper {
                width: 100px;
                height: 100px;
            }

            .success-circle {
                width: 100px;
                height: 100px;
            }

            .checkmark-icon {
                font-size: 3rem;
            }

            .features-list {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn-custom {
                width: 100%;
                justify-content: center;
            }

            .contact-info {
                flex-direction: column;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="thankyou-card animate__animated animate__fadeInUp">
        <!-- Success Icon with Particles -->
        <div class="success-icon-wrapper">
            <div class="success-particles">
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
            </div>
            <div class="success-circle">
                <i class="fas fa-check checkmark-icon"></i>
            </div>
        </div>

        <!-- Title -->
        <h1 class="thankyou-title animate__animated animate__fadeInDown">
            Đặt hàng thành công!
        </h1>

        <!-- Order Info -->
        <div class="order-info animate__animated animate__fadeIn animate__delay-1s">
            <div class="order-number">
                Mã đơn hàng: <strong>#MB${orderCode}</strong>
            </div>
            <p class="mb-0" style="color: #718096; font-size: 0.95rem;">
                Đơn hàng của bạn đã được tiếp nhận và đang được xử lý
            </p>
        </div>

        <!-- Description -->
        <div class="thankyou-desc animate__animated animate__fadeIn animate__delay-1s">
            Cảm ơn bạn đã tin tưởng và lựa chọn <span class="highlight">MacT&B</span>.<br>
            Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để xác nhận và giao hàng.<br>
            <span class="highlight">🎉 Chúc bạn một ngày tuyệt vời!</span>
        </div>

        <!-- Features -->
        <div class="features-list animate__animated animate__fadeInUp animate__delay-1s">
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="fas fa-shipping-fast"></i>
                </div>
                <div class="feature-text">Giao hàng nhanh chóng</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <div class="feature-text">Bảo hành chính hãng</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="fas fa-headset"></i>
                </div>
                <div class="feature-text">Hỗ trợ 24/7</div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons animate__animated animate__fadeInUp animate__delay-2s">
            <a href="/" class="btn-custom btn-primary-custom">
                <i class="fas fa-home"></i>
                <span>Về trang chủ</span>
            </a>
            <a href="/order-history" class="btn-custom btn-outline-custom">
                <i class="fas fa-history"></i>
                <span>Xem đơn hàng</span>
            </a>
        </div>

        <!-- Footer -->
        <div class="thankyou-footer animate__animated animate__fadeInUp animate__delay-2s">
            <p class="mb-2">Nếu có bất kỳ thắc mắc nào, hãy liên hệ với chúng tôi:</p>
            <div class="contact-info">
                <div class="contact-item">
                    <i class="fas fa-phone-alt"></i>
                    <a href="tel:0763339999">076 333 9999</a>
                </div>
                <div class="contact-item">
                    <i class="fas fa-envelope"></i>
                    <a href="mailto:contact@mactb.com">contact@mactb.com</a>
                </div>
            </div>

            <!-- Social Links -->
            <div class="social-links">
                <a href="#" class="social-icon" title="Facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="social-icon" title="Instagram">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="#" class="social-icon" title="Twitter">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="social-icon" title="YouTube">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>

            <p class="mt-3 mb-0" style="font-size: 0.9rem;">
                <strong>MacT&B</strong> luôn sẵn sàng hỗ trợ bạn!
            </p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Confetti effect on load
        window.addEventListener('load', () => {
            // Optional: Add more interactive effects here
            console.log('Order placed successfully!');
        });

        // Prevent back navigation after order
        window.history.pushState(null, '', window.location.href);
        window.onpopstate = function() {
            window.history.pushState(null, '', window.location.href);
        };
    </script>
</body>
</html>