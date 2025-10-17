<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công - LaptopShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;400&display=swap" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #e0e7ef 0%, #f8fafc 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Montserrat', Arial, sans-serif;
        }
        .thankyou-card {
            background: rgba(255,255,255,0.98);
            border-radius: 28px;
            box-shadow: 0 8px 40px rgba(25,135,84,0.10), 0 1.5px 8px rgba(0,0,0,0.04);
            padding: 48px 36px 36px 36px;
            max-width: 440px;
            width: 100%;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .thankyou-anim {
            width: 120px;
            margin-bottom: 18px;
            animation: tada 1.2s;
        }
        .checkmark {
            width: 90px;
            height: 90px;
            display: block;
            margin: 0 auto 18px auto;
        }
        .thankyou-title {
            font-size: 2.2rem;
            font-weight: 700;
            color: #198754;
            margin-bottom: 10px;
            letter-spacing: 1px;
        }
        .thankyou-desc {
            color: #444;
            font-size: 1.13rem;
            margin-bottom: 30px;
            line-height: 1.7;
        }
        .btn-home {
            font-size: 1.13rem;
            padding: 12px 38px;
            border-radius: 30px;
            font-weight: 700;
            background: linear-gradient(90deg, #198754 60%, #43e97b 100%);
            color: #fff;
            box-shadow: 0 2px 12px rgba(25,135,84,0.10);
            border: none;
            transition: background 0.2s, color 0.2s, box-shadow 0.2s, transform 0.2s;
        }
        .btn-home:hover {
            background: linear-gradient(90deg, #157347 60%, #43e97b 100%);
            color: #fff;
            box-shadow: 0 6px 24px rgba(25,135,84,0.18);
            transform: translateY(-2px) scale(1.04);
        }
        .thankyou-footer {
            margin-top: 32px;
            color: #888;
            font-size: 0.98rem;
            letter-spacing: 0.5px;
        }
        @media (max-width: 600px) {
            .thankyou-card { padding: 28px 8px 24px 8px; }
            .thankyou-title { font-size: 1.4rem; }
            .thankyou-anim { width: 80px; }
        }
    </style>
</head>
<body>
    <div class="thankyou-card animate__animated animate__fadeInUp">
        <!-- Animated checkmark SVG -->
        <svg class="checkmark animate__animated animate__bounceIn" viewBox="0 0 52 52">
            <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="#eafaf1"/>
            <path class="checkmark__check" fill="none" stroke="#198754" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" d="M14 27l7 7 16-16"/>
        </svg>
        <div class="thankyou-title animate__animated animate__fadeInDown">Đặt hàng thành công!</div>
        <div class="thankyou-desc animate__animated animate__fadeIn animate__delay-1s">
            Cảm ơn bạn đã tin tưởng và lựa chọn <b>LaptopShop</b>.<br>
            Đơn hàng của bạn đã được tiếp nhận và đang được xử lý.<br>
            Chúng tôi sẽ liên hệ với bạn sớm nhất để xác nhận và giao hàng.<br>
            <span class="text-success">Chúc bạn một ngày tuyệt vời!</span>
        </div>
        <a href="/" class="btn btn-home animate__animated animate__pulse animate__infinite">Về trang chủ</a>
        <div class="thankyou-footer animate__animated animate__fadeInUp animate__delay-2s">
            Nếu có bất kỳ thắc mắc nào, hãy liên hệ với chúng tôi qua hotline <b>1800-1234</b>.<br>
            LaptopShop luôn sẵn sàng hỗ trợ bạn!
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>