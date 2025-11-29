<%@page contentType="text/html" pageEncoding="UTF-8" %>

<style>
    :root {
        --primary-color: rgba(15, 195, 149, 0.95);
        --primary-dark: rgba(12, 156, 119, 1);
        --primary-light: rgba(15, 195, 149, 0.1);
        --footer-bg: #ffffff;
        --footer-bg-light: #f8f9fa;
    }

    /* ========== Footer Core ========== */
    .footer-modern {
        background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
        color: #4a5568;
        position: relative;
        overflow: hidden;
        box-shadow: 0 -5px 20px rgba(0, 0, 0, 0.05);
        -webkit-font-smoothing: antialiased;
        will-change: transform;
    }

    .footer-modern::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--primary-color) 0%, var(--primary-dark) 100%);
    }

    .footer-modern::after {
        content: '';
        position: absolute;
        top: -100px;
        right: -100px;
        width: 300px;
        height: 300px;
        background: radial-gradient(circle, rgba(15, 195, 149, 0.08) 0%, transparent 70%);
        border-radius: 50%;
        pointer-events: none;
    }

    /* Footer Top Section */
    .footer-top {
        padding: 60px 0 40px;
        position: relative;
        z-index: 2;
    }

    .footer-brand {
        margin-bottom: 25px;
    }

    .footer-brand h3 {
        color: #2d3748;
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 10px;
        font-family: 'Playfair Display', serif;
    }

    .footer-brand h3 span {
        color: var(--primary-color);
    }

    .footer-brand .slogan {
        color: #718096;
        font-size: 1rem;
        font-style: italic;
        margin-bottom: 20px;
    }

    .footer-description {
        color: #4a5568;
        line-height: 1.8;
        margin-bottom: 20px;
        font-size: 0.95rem;
    }

    /* ========== Social Links (optimized) ========== */
    .footer-social {
        display: flex;
        gap: 12px;
        margin-top: 20px;
    }

    .social-icon {
        width: 45px;
        height: 45px;
        background: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--primary-color);
        font-size: 1.1rem;
        text-decoration: none;
        border: 2px solid #e2e8f0;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        /* explicit transitions for specific props (avoid transition: all) */
        transition: transform 280ms cubic-bezier(.2,.8,.2,1),
                    background-color 220ms ease,
                    color 200ms ease,
                    border-color 200ms ease,
                    box-shadow 280ms ease;
        will-change: transform, opacity;
        -webkit-transform: translateZ(0);
        transform: translateZ(0);
        transform-origin: center center;
        backface-visibility: hidden;
    }

    /* gentle hover - no heavy rotation or full 360 */
    .social-icon:hover {
        background: var(--primary-color);
        color: white;
        transform: translateY(-4px) rotate(6deg);
        border-color: var(--primary-color);
        box-shadow: 0 6px 16px rgba(15, 195, 149, 0.18);
    }

    .social-icon:focus-visible {
        outline: 3px solid rgba(78,154,241,0.12);
        outline-offset: 3px;
    }

    /* Footer Headings */
    .footer-heading {
        color: #2d3748;
        font-size: 1.2rem;
        font-weight: 600;
        margin-bottom: 20px;
        position: relative;
        padding-bottom: 12px;
    }

    .footer-heading::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 40px;
        height: 3px;
        background: var(--primary-color);
        border-radius: 2px;
    }

    /* Footer Links */
    .footer-links {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-links li {
        margin-bottom: 12px;
    }

    .footer-links a {
        color: #4a5568;
        text-decoration: none;
        font-size: 0.95rem;
        transition: color 220ms ease, padding-left 220ms ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .footer-links a::before {
        content: '→';
        color: var(--primary-color);
        opacity: 0;
        transform: translateX(-10px);
        transition: opacity 220ms ease, transform 220ms ease;
    }

    .footer-links a:hover {
        color: var(--primary-color);
        padding-left: 10px;
    }

    .footer-links a:hover::before {
        opacity: 1;
        transform: translateX(0);
    }

    /* Contact Info */
    .contact-item {
        display: flex;
        align-items: flex-start;
        gap: 15px;
        margin-bottom: 18px;
        color: #4a5568;
        font-size: 0.95rem;
        line-height: 1.6;
    }

    .contact-icon {
        width: 40px;
        height: 40px;
        background: var(--primary-light);
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--primary-dark);
        font-size: 1.1rem;
        flex-shrink: 0;
        transition: background-color 220ms ease, transform 240ms ease;
        will-change: transform, opacity;
    }

    .contact-item:hover .contact-icon {
        background: var(--primary-color);
        color: white;
        transform: scale(1.06);
    }

    .contact-item a {
        color: #4a5568;
        text-decoration: none;
        transition: color 200ms;
    }

    .contact-item a:hover {
        color: var(--primary-color);
    }

    /* Newsletter (optimized) */
    .newsletter-box {
        background: white;
        padding: 25px;
        border-radius: 15px;
        border: 2px solid var(--primary-light);
        transition: border-color 240ms ease, transform 220ms cubic-bezier(.2,.8,.2,1), box-shadow 220ms ease;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        will-change: transform, box-shadow;
        -webkit-transform: translateZ(0);
    }

    .newsletter-box:hover {
        border-color: var(--primary-color);
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(15, 195, 149, 0.12);
    }

    .newsletter-title {
        color: #2d3748;
        font-weight: 600;
        margin-bottom: 10px;
        font-size: 1.1rem;
    }

    .newsletter-text {
        color: #718096;
        font-size: 0.9rem;
        margin-bottom: 15px;
    }

    .newsletter-form {
        display: flex;
        gap: 10px;
    }

    .newsletter-input {
        flex: 1;
        padding: 12px 18px;
        border: 2px solid #e2e8f0;
        background: #f8f9fa;
        border-radius: 25px;
        color: #2d3748;
        font-size: 0.95rem;
        outline: none;
        transition: border-color 200ms ease, background-color 200ms ease, box-shadow 200ms ease;
    }

    .newsletter-input::placeholder {
        color: #a0aec0;
    }

    .newsletter-input:focus {
        border-color: var(--primary-color);
        background: white;
        box-shadow: 0 0 0 4px var(--primary-light);
    }

    .newsletter-btn {
        padding: 12px 25px;
        background: var(--primary-color);
        color: white;
        border: none;
        border-radius: 25px;
        font-weight: 600;
        cursor: pointer;
        transition: transform 180ms ease, box-shadow 200ms ease, background-color 200ms ease;
        white-space: nowrap;
        will-change: transform;
    }

    .newsletter-btn:hover {
        background: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(15, 195, 149, 0.3);
    }

    /* Payment Methods */
    .payment-methods {
        margin-top: 20px;
    }

    .payment-methods img {
        max-width: 160px;
        opacity: 0.9;
        transition: opacity 200ms;
        filter: brightness(0.95);
    }

    .payment-methods img:hover {
        opacity: 1;
    }

    /* Footer Bottom */
    .footer-bottom {
        background: #f8f9fa;
        padding: 25px 0;
        border-top: 2px solid #e2e8f0;
        position: relative;
        z-index: 2;
    }

    .footer-bottom-text {
        color: #718096;
        font-size: 0.9rem;
        margin: 0;
    }

    .footer-bottom-text a {
        color: var(--primary-dark);
        text-decoration: none;
        font-weight: 500;
        transition: color 200ms;
    }

    .footer-bottom-text a:hover {
        color: var(--primary-color);
    }

    .footer-bottom-links {
        display: flex;
        gap: 25px;
        justify-content: center;
        flex-wrap: wrap;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .footer-bottom-links a {
        color: #718096;
        text-decoration: none;
        font-size: 0.9rem;
        transition: color 200ms;
    }

    .footer-bottom-links a:hover {
        color: var(--primary-color);
    }

    /* Features Box */
    .footer-features {
        background: white;
        padding: 30px;
        border-radius: 15px;
        margin-bottom: 30px;
        border: 2px solid #e2e8f0;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    }

    .feature-item {
        display: flex;
        align-items: center;
        gap: 15px;
        padding: 15px 0;
        border-bottom: 1px solid #e2e8f0;
    }

    .feature-item:last-child {
        border-bottom: none;
        padding-bottom: 0;
    }

    .feature-icon-box {
        width: 50px;
        height: 50px;
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 1.3rem;
        flex-shrink: 0;
    }

    .feature-content h6 {
        color: #2d3748;
        margin: 0 0 5px 0;
        font-size: 1rem;
        font-weight: 600;
    }

    .feature-content p {
        color: #718096;
        margin: 0;
        font-size: 0.85rem;
    }

    /* ========== Animation / Intersection initial state ========== */
    .footer-modern .col-lg-4,
    .footer-modern .col-lg-2 {
        opacity: 0;
        transform: translateY(24px);
        transition: opacity 0.6s ease, transform 0.6s cubic-bezier(.2,.8,.2,1);
        will-change: transform, opacity;
    }

    .footer-modern .col-lg-4.in-view,
    .footer-modern .col-lg-2.in-view {
        opacity: 1;
        transform: translateY(0);
    }

    /* Responsive */
    @media (max-width: 768px) {
        .footer-top {
            padding: 40px 0 30px;
        }

        .footer-heading {
            font-size: 1.1rem;
            margin-bottom: 15px;
        }

        .footer-brand h3 {
            font-size: 1.6rem;
        }

        .newsletter-form {
            flex-direction: column;
        }

        .newsletter-btn {
            width: 100%;
        }

        .footer-social {
            justify-content: center;
        }

        .footer-bottom-links {
            margin-top: 15px;
        }
    }

    /* ========== Small fixes to avoid heavy repaints ========== */
    .social-icon, .newsletter-box, .newsletter-btn, .contact-icon {
        backface-visibility: hidden;
        -webkit-transform: translateZ(0);
        transform: translateZ(0);
    }
</style>

<!-- Footer Start -->
<footer class="footer-modern" role="contentinfo" aria-label="Footer">
    <div class="container">
        <!-- Footer Top -->
        <div class="footer-top">
            <div class="row g-4">
                <!-- Brand & About -->
                <div class="col-lg-4 col-md-6">
                    <div class="footer-brand">
                        <h3>Mac<span>T&B</span></h3>
                        <p class="slogan">"MacBook về tay, đẳng cấp lên ngay!"</p>
                    </div>
                    <p class="footer-description">
                        Chuyên cung cấp các dòng MacBook chính hãng, bảo hành uy tín. 
                        Cam kết chất lượng tốt nhất, giá cả cạnh tranh nhất thị trường.
                    </p>
                    <div class="footer-social" aria-hidden="false">
                        <a href="https://facebook.com" class="social-icon" title="Facebook" aria-label="Facebook">
                            <i class="fab fa-facebook-f" aria-hidden="true"></i>
                        </a>
                        <a href="https://twitter.com" class="social-icon" title="Twitter" aria-label="Twitter">
                            <i class="fab fa-twitter" aria-hidden="true"></i>
                        </a>
                        <a href="https://instagram.com" class="social-icon" title="Instagram" aria-label="Instagram">
                            <i class="fab fa-instagram" aria-hidden="true"></i>
                        </a>
                        <a href="https://youtube.com" class="social-icon" title="YouTube" aria-label="YouTube">
                            <i class="fab fa-youtube" aria-hidden="true"></i>
                        </a>
                        <a href="https://linkedin.com" class="social-icon" title="LinkedIn" aria-label="LinkedIn">
                            <i class="fab fa-linkedin-in" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>

                <!-- Quick Links -->
                <div class="col-lg-2 col-md-6">
                    <h5 class="footer-heading">Về chúng tôi</h5>
                    <ul class="footer-links">
                        <li><a href="/about">Giới thiệu</a></li>
                        <li><a href="/products">Sản phẩm</a></li>
                        <li><a href="/warranty">Bảo hành</a></li>
                        <li><a href="/blog">Tin tức</a></li>
                        <li><a href="/careers">Tuyển dụng</a></li>
                    </ul>
                </div>

                <!-- Customer Service -->
                <div class="col-lg-2 col-md-6">
                    <h5 class="footer-heading">Dịch vụ</h5>
                    <ul class="footer-links">
                        <li><a href="/account">Tài khoản</a></li>
                        <li><a href="/cart">Giỏ hàng</a></li>
                        <li><a href="/wishlist">Yêu thích</a></li>
                        <li><a href="/tracking">Theo dõi</a></li>
                        <li><a href="/support">Hỗ trợ</a></li>
                    </ul>
                </div>

                <!-- Contact Info -->
                <div class="col-lg-4 col-md-6">
                    <h5 class="footer-heading">Liên hệ</h5>

                    <div class="contact-item">
                        <div class="contact-icon" aria-hidden="true">
                            <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                        </div>
                        <div>
                            <strong>Địa chỉ:</strong><br>
                            Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="contact-icon" aria-hidden="true">
                            <i class="fas fa-phone-alt" aria-hidden="true"></i>
                        </div>
                        <div>
                            <strong>Hotline:</strong><br>
                            <a href="tel:0763339999">076 333 9999</a>
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="contact-icon" aria-hidden="true">
                            <i class="fas fa-envelope" aria-hidden="true"></i>
                        </div>
                        <div>
                            <strong>Email:</strong><br>
                            <a href="mailto:contact@mactb.com">contact@mactb.com</a>
                        </div>
                    </div>

                    <div class="payment-methods" aria-hidden="true">
                        <img src="/client/img/payment.png" alt="Payment Methods">
                    </div>
                </div>
            </div>

            <!-- Newsletter Section -->
            <div class="row mt-4">
                <div class="col-lg-6 mx-auto">
                    <div class="newsletter-box" role="region" aria-label="Newsletter">
                        <h5 class="newsletter-title">🎉 Đăng ký nhận tin khuyến mãi</h5>
                        <p class="newsletter-text">Nhận ngay voucher 500K cho đơn hàng đầu tiên!</p>
                        <form class="newsletter-form" onsubmit="return handleNewsletter(event)">
                            <input type="email" class="newsletter-input" placeholder="Nhập email của bạn..." required>
                            <button type="submit" class="newsletter-btn">
                                <i class="fas fa-paper-plane me-1" aria-hidden="true"></i> Đăng ký
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Features -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="footer-features">
                        <div class="row g-3">
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-item">
                                    <div class="feature-icon-box">
                                        <i class="fas fa-shipping-fast" aria-hidden="true"></i>
                                    </div>
                                    <div class="feature-content">
                                        <h6>Miễn phí vận chuyển</h6>
                                        <p>Đơn hàng từ 5 triệu</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-item">
                                    <div class="feature-icon-box">
                                        <i class="fas fa-shield-alt" aria-hidden="true"></i>
                                    </div>
                                    <div class="feature-content">
                                        <h6>Bảo hành 12 tháng</h6>
                                        <p>Chính hãng Apple</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-item">
                                    <div class="feature-icon-box">
                                        <i class="fas fa-undo-alt" aria-hidden="true"></i>
                                    </div>
                                    <div class="feature-content">
                                        <h6>Đổi trả 30 ngày</h6>
                                        <p>Nếu có lỗi từ NSX</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-item">
                                    <div class="feature-icon-box">
                                        <i class="fas fa-headset" aria-hidden="true"></i>
                                    </div>
                                    <div class="feature-content">
                                        <h6>Hỗ trợ 24/7</h6>
                                        <p>Tư vấn nhiệt tình</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    <p class="footer-bottom-text">
                        © 2025 <a href="/">MacT&B Store</a>. All rights reserved.
                    </p>
                </div>
                <div class="col-md-6">
                    <ul class="footer-bottom-links">
                        <li><a href="/privacy">Chính sách bảo mật</a></li>
                        <li><a href="/terms">Điều khoản</a></li>
                        <li><a href="/sitemap">Sơ đồ trang</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer End -->

<script>
    // Newsletter handler (kept, small improvements)
    function handleNewsletter(event) {
        event.preventDefault();
        const email = event.target.querySelector('input[type="email"]').value;
        const btn = event.target.querySelector('.newsletter-btn');
        const originalHTML = btn.innerHTML;

        // Show loading
        btn.disabled = true;
        btn.innerHTML = '<i class="fas fa-spinner fa-spin me-1" aria-hidden="true"></i> Đang xử lý...';

        // Simulate API call
        setTimeout(() => {
            btn.innerHTML = '<i class="fas fa-check me-1" aria-hidden="true"></i> Đã đăng ký!';
            btn.style.background = '#10b981';

            // Reset form
            setTimeout(() => {
                event.target.reset();
                btn.disabled = false;
                btn.innerHTML = originalHTML;
                btn.style.background = '';

                // Show success message
                try {
                    // non-blocking; avoid heavy modal reflows
                    alert('✅ Cảm ơn bạn đã đăng ký! Chúng tôi sẽ gửi ưu đãi đến email: ' + email);
                } catch (e) {
                    console.log('newsletter success', email);
                }
            }, 1400);
        }, 900);

        return false;
    }

    // IntersectionObserver: add class instead of setting inline animation styles
    (function () {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('in-view');
                }
            });
        }, { threshold: 0.12 });

        // Select the columns we want to animate
        const cols = document.querySelectorAll('.footer-modern .col-lg-4, .footer-modern .col-lg-2');
        cols.forEach(el => {
            // ensure initial state is controlled by CSS (no inline style)
            // leave opacity/transform to CSS initial
            observer.observe(el);
        });
    })();
</script>
