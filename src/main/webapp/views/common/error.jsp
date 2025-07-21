
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>🚨 Đã xảy ra lỗi - Fashion Shop</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">

        <style>
            body {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .error-container {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                padding: 2rem 1rem;
            }

            .error-card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border: none;
                border-radius: 2rem;
                box-shadow: 0 20px 40px rgba(0,0,0,0.1);
                max-width: 600px;
                width: 100%;
                text-align: center;
                overflow: hidden;
            }

            .error-icon {
                background: var(--danger-gradient);
                color: white;
                width: 120px;
                height: 120px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 2rem;
                font-size: 3rem;
                animation: pulse 2s infinite;
            }

            @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.05); }
                100% { transform: scale(1); }
            }

            .error-title {
                background: var(--danger-gradient);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                font-size: 2.5rem;
                font-weight: 800;
                margin-bottom: 1rem;
            }

            .error-message {
                color: #6c757d;
                font-size: 1.1rem;
                margin-bottom: 2rem;
                line-height: 1.6;
            }

            .action-buttons {
                display: flex;
                gap: 1rem;
                justify-content: center;
                flex-wrap: wrap;
            }

            .btn-home {
                background: var(--primary-gradient);
                border: none;
                color: white;
                padding: 1rem 2rem;
                border-radius: 1rem;
                font-weight: 600;
                text-decoration: none;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .btn-home:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 25px rgba(233, 30, 99, 0.3);
                color: white;
            }

            .btn-back {
                background: transparent;
                border: 2px solid #6c757d;
                color: #6c757d;
                padding: 1rem 2rem;
                border-radius: 1rem;
                font-weight: 600;
                text-decoration: none;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .btn-back:hover {
                background: #6c757d;
                color: white;
                transform: translateY(-3px);
            }

            .error-details {
                background: rgba(248, 249, 250, 0.8);
                border-radius: 1rem;
                padding: 1.5rem;
                margin-top: 2rem;
                border-left: 4px solid var(--primary-color);
            }

            .floating-shapes {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index: -1;
            }

            .floating-shapes::before,
            .floating-shapes::after {
                content: '';
                position: absolute;
                width: 200px;
                height: 200px;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 50%;
            }

            .floating-shapes::before {
                top: 10%;
                left: 10%;
                animation: float 6s ease-in-out infinite;
            }

            .floating-shapes::after {
                bottom: 10%;
                right: 10%;
                animation: float 8s ease-in-out infinite reverse;
            }

            @keyframes float {
                0%, 100% { transform: translateY(0px); }
                50% { transform: translateY(-20px); }
            }

            @media (max-width: 768px) {
                .error-title {
                    font-size: 2rem;
                }

                .action-buttons {
                    flex-direction: column;
                    align-items: center;
                }

                .btn-home, .btn-back {
                    width: 100%;
                    max-width: 300px;
                }
            }
        </style>
    </head>
    <body>
        <div class="floating-shapes"></div>

        <div class="error-container">
            <div class="card error-card animate-fade-in-up">
                <div class="card-body p-5">
                    <div class="error-icon">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>

                    <h1 class="error-title">
                        ⚠️ Oops! Đã xảy ra lỗi
                    </h1>

                    <p class="error-message">
                        <strong>Xin lỗi!</strong> Có vẻ như đã xảy ra sự cố không mong muốn. 
                        Vui lòng kiểm tra lại thao tác của bạn hoặc thử lại sau ít phút.
                    </p>

                    <div class="action-buttons">
                        <a href="${pageContext.request.contextPath}/home" class="btn-home">
                            <i class="fas fa-home"></i>
                            🏠 Về trang chủ
                        </a>

                        <a href="javascript:history.back()" class="btn-back">
                            <i class="fas fa-arrow-left"></i>
                            ↩️ Quay lại
                        </a>
                    </div>

                    <!-- Error Details (if available) -->
                    <c:if test="${not empty errorMessage || not empty exception}">
                        <div class="error-details">
                            <h6 class="text-muted mb-2">
                                <i class="fas fa-info-circle me-2"></i>
                                Thông tin chi tiết:
                            </h6>
                            <c:if test="${not empty errorMessage}">
                                <small class="text-muted d-block">${errorMessage}</small>
                            </c:if>
                            <c:if test="${not empty exception}">
                                <small class="text-muted d-block">${exception.message}</small>
                            </c:if>
                        </div>
                    </c:if>

                    <!-- Contact Support -->
                    <div class="mt-4 pt-3 border-top">
                        <p class="text-muted mb-2">
                            <small>
                                💡 Nếu vấn đề vẫn tiếp tục, vui lòng liên hệ với chúng tôi:
                            </small>
                        </p>
                        <div class="d-flex justify-content-center gap-3">
                            <a href="${pageContext.request.contextPath}/contact" class="text-decoration-none">
                                <small class="text-primary">
                                    <i class="fas fa-envelope me-1"></i>
                                    📧 Liên hệ hỗ trợ
                                </small>
                            </a>
                            <span class="text-muted">|</span>
                            <a href="tel:+84123456789" class="text-decoration-none">
                                <small class="text-primary">
                                    <i class="fas fa-phone me-1"></i>
                                    📞 Hotline: 0123-456-789
                                </small>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Auto-refresh suggestion after 30 seconds
            setTimeout(function() {
                const refreshSuggestion = document.createElement('div');
                refreshSuggestion.className = 'alert alert-info mt-3 animate-fade-in-up';
                refreshSuggestion.innerHTML = `
                    <i class="fas fa-sync-alt me-2"></i>
                    <strong>Gợi ý:</strong> Bạn có muốn thử tải lại trang?
                    <button class="btn btn-sm btn-outline-info ms-2" onclick="location.reload()">
                        <i class="fas fa-redo"></i> Tải lại
                    </button>
                `;
                document.querySelector('.card-body').appendChild(refreshSuggestion);
            }, 30000);
        </script>
    </body>
    </html>
