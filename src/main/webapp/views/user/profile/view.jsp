
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../common/header.jsp" />

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin tài khoản - FashionShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-color: #2563eb;
                --primary-dark: #1d4ed8;
                --primary-light: #dbeafe;
                --secondary-color: #1f2937;
                --success-color: #059669;
                --success-light: #d1fae5;
                --danger-color: #dc2626;
                --danger-light: #fee2e2;
                --warning-color: #d97706;
                --warning-light: #fef3c7;
                --info-color: #0891b2;
                --gray-50: #f9fafb;
                --gray-100: #f3f4f6;
                --gray-200: #e5e7eb;
                --gray-300: #d1d5db;
                --gray-400: #9ca3af;
                --gray-500: #6b7280;
                --gray-600: #4b5563;
                --gray-700: #374151;
                --gray-800: #1f2937;
                --gray-900: #111827;
                --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
                --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
                --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
                --border-radius: 0.75rem;
                --border-radius-sm: 0.5rem;
                --border-radius-lg: 1rem;
                --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
                background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
                min-height: 100vh;
                line-height: 1.6;
                color: var(--gray-800);
            }

            /* Container */
            .profile-container {
                max-width: 800px;
                margin: 2rem auto;
                padding: 0 1rem;
            }

            /* Page Header */
            .page-header {
                background: white;
                border-radius: var(--border-radius);
                padding: 2rem;
                margin-bottom: 2rem;
                box-shadow: var(--shadow-sm);
                border: 1px solid var(--gray-200);
                position: relative;
                overflow: hidden;
            }

            .page-header::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, var(--primary-color), #3b82f6);
            }

            .page-title {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 0.5rem;
            }

            .page-title i {
                width: 48px;
                height: 48px;
                background: linear-gradient(135deg, var(--primary-color), #3b82f6);
                color: white;
                border-radius: var(--border-radius-sm);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
            }

            .page-title h1 {
                font-size: 2rem;
                font-weight: 700;
                color: var(--gray-900);
                margin: 0;
            }

            .page-subtitle {
                color: var(--gray-600);
                font-size: 1.1rem;
                margin: 0;
            }

            /* Alert Messages */
            .alert {
                border: none;
                border-radius: var(--border-radius-sm);
                padding: 1rem 1.25rem;
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
                gap: 0.75rem;
                font-weight: 500;
                box-shadow: var(--shadow-sm);
                animation: slideInDown 0.3s ease-out;
            }

            .alert-success {
                background: var(--success-light);
                color: #065f46;
                border: 1px solid #a7f3d0;
            }

            .alert-danger {
                background: var(--danger-light);
                color: #991b1b;
                border: 1px solid #fca5a5;
            }

            .alert i {
                font-size: 1.25rem;
            }

            /* Profile Card */
            .profile-card {
                background: white;
                border-radius: var(--border-radius);
                box-shadow: var(--shadow-sm);
                border: 1px solid var(--gray-200);
                overflow: hidden;
                transition: var(--transition);
                animation: slideInUp 0.5s ease-out;
            }

            .profile-card:hover {
                box-shadow: var(--shadow-md);
                transform: translateY(-2px);
            }

            .profile-card-header {
                background: var(--gray-50);
                padding: 1.5rem;
                border-bottom: 1px solid var(--gray-200);
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .profile-avatar {
                width: 60px;
                height: 60px;
                background: linear-gradient(135deg, var(--primary-color), #3b82f6);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                color: white;
                font-weight: 600;
            }

            .profile-info h3 {
                font-size: 1.25rem;
                font-weight: 600;
                color: var(--gray-900);
                margin: 0 0 0.25rem 0;
            }

            .profile-info p {
                color: var(--gray-600);
                font-size: 0.9rem;
                margin: 0;
            }

            /* Form */
            .profile-form {
                padding: 2rem;
            }

            .form-section {
                margin-bottom: 2rem;
            }

            .form-section-title {
                font-size: 1rem;
                font-weight: 600;
                color: var(--gray-900);
                margin-bottom: 1rem;
                padding-bottom: 0.5rem;
                border-bottom: 2px solid var(--gray-200);
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .form-section-title i {
                color: var(--primary-color);
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-label {
                display: block;
                font-size: 0.875rem;
                font-weight: 600;
                color: var(--gray-700);
                margin-bottom: 0.5rem;
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }

            .form-control {
                width: 100%;
                padding: 0.875rem 1rem;
                font-size: 1rem;
                border: 2px solid var(--gray-300);
                border-radius: var(--border-radius-sm);
                background-color: white;
                transition: var(--transition);
                font-family: inherit;
            }

            .form-control:focus {
                outline: none;
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
                transform: translateY(-1px);
            }

            .form-control:disabled,
            .form-control[readonly] {
                background-color: var(--gray-50);
                color: var(--gray-500);
                cursor: not-allowed;
                border-color: var(--gray-200);
            }

            .form-control:invalid {
                border-color: var(--danger-color);
            }

            .form-control:valid:not(:focus) {
                border-color: var(--success-color);
            }

            .form-text {
                font-size: 0.875rem;
                color: var(--gray-500);
                margin-top: 0.25rem;
                display: flex;
                align-items: center;
                gap: 0.25rem;
            }

            .form-text i {
                font-size: 0.875rem;
            }

            /* Textarea */
            textarea.form-control {
                resize: vertical;
                min-height: 100px;
                max-height: 200px;
            }

            /* Input Groups */
            .input-group {
                position: relative;
            }

            .input-group .form-control {
                padding-left: 2.75rem;
            }

            .input-icon {
                position: absolute;
                left: 1rem;
                top: 50%;
                transform: translateY(-50%);
                color: var(--gray-400);
                font-size: 1rem;
                z-index: 2;
                pointer-events: none;
            }

            .input-group:focus-within .input-icon {
                color: var(--primary-color);
            }

            /* Buttons */
            .btn-group {
                display: flex;
                gap: 1rem;
                justify-content: flex-end;
                padding-top: 1.5rem;
                border-top: 1px solid var(--gray-200);
                margin-top: 1.5rem;
            }

            .btn {
                padding: 0.75rem 2rem;
                font-size: 1rem;
                font-weight: 600;
                border-radius: var(--border-radius-sm);
                border: none;
                cursor: pointer;
                transition: var(--transition);
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                text-decoration: none;
                position: relative;
                overflow: hidden;
            }

            .btn::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
                transition: left 0.5s ease;
            }

            .btn:hover::before {
                left: 100%;
            }

            .btn:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
            }

            .btn:active {
                transform: scale(0.98);
            }

            .btn-primary {
                background: linear-gradient(135deg, var(--primary-color), #3b82f6);
                color: white;
                box-shadow: var(--shadow-sm);
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: var(--shadow-lg);
            }

            .btn-secondary {
                background: white;
                color: var(--gray-700);
                border: 2px solid var(--gray-300);
            }

            .btn-secondary:hover {
                background: var(--gray-50);
                border-color: var(--gray-400);
                transform: translateY(-1px);
            }

            /* Loading State */
            .btn.loading {
                pointer-events: none;
                opacity: 0.7;
            }

            .btn.loading::after {
                content: '';
                width: 16px;
                height: 16px;
                border: 2px solid rgba(255,255,255,0.3);
                border-radius: 50%;
                border-top: 2px solid white;
                animation: spin 1s linear infinite;
                margin-left: 0.5rem;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            /* Quick Actions */
            .quick-actions {
                background: var(--gray-50);
                border-radius: var(--border-radius-sm);
                padding: 1.5rem;
                margin-bottom: 2rem;
            }

            .quick-actions-title {
                font-size: 1rem;
                font-weight: 600;
                color: var(--gray-900);
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .quick-actions-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 1rem;
            }

            .quick-action-item {
                background: white;
                border: 1px solid var(--gray-200);
                border-radius: var(--border-radius-sm);
                padding: 1rem;
                text-align: center;
                transition: var(--transition);
                cursor: pointer;
                text-decoration: none;
                color: inherit;
            }

            .quick-action-item:hover {
                background: var(--primary-light);
                border-color: var(--primary-color);
                transform: translateY(-2px);
                box-shadow: var(--shadow-md);
                color: inherit;
                text-decoration: none;
            }

            .quick-action-icon {
                width: 40px;
                height: 40px;
                background: linear-gradient(135deg, var(--primary-color), #3b82f6);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 0.5rem;
                font-size: 1.25rem;
                color: white;
            }

            .quick-action-title {
                font-size: 0.875rem;
                font-weight: 600;
                color: var(--gray-900);
                margin: 0;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .profile-container {
                    margin: 1rem auto;
                    padding: 0 0.5rem;
                }

                .page-header {
                    padding: 1.5rem;
                    margin-bottom: 1.5rem;
                }

                .page-title {
                    flex-direction: column;
                    text-align: center;
                    gap: 0.75rem;
                }

                .page-title h1 {
                    font-size: 1.75rem;
                }

                .profile-card-header {
                    flex-direction: column;
                    text-align: center;
                    gap: 0.75rem;
                }

                .profile-form {
                    padding: 1.5rem;
                }

                .btn-group {
                    flex-direction: column-reverse;
                    gap: 0.75rem;
                }

                .btn {
                    width: 100%;
                    justify-content: center;
                }

                .quick-actions-grid {
                    grid-template-columns: 1fr;
                }
            }

            /* Animations */
            @keyframes slideInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes slideInDown {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Form Validation Visual Feedback */
            .form-group.has-error .form-control {
                border-color: var(--danger-color);
                background-color: #fef2f2;
            }

            .form-group.has-success .form-control {
                border-color: var(--success-color);
                background-color: #f0fdf4;
            }

            .validation-message {
                font-size: 0.875rem;
                margin-top: 0.25rem;
                display: flex;
                align-items: center;
                gap: 0.25rem;
            }

            .validation-message.error {
                color: var(--danger-color);
            }

            .validation-message.success {
                color: var(--success-color);
            }

            /* Accessibility */
            .btn:focus-visible,
            .form-control:focus-visible,
            .quick-action-item:focus-visible {
                outline: 2px solid var(--primary-color);
                outline-offset: 2px;
            }

            /* High contrast mode support */
            @media (prefers-contrast: high) {
                :root {
                    --gray-300: #000000;
                    --gray-500: #000000;
                    --gray-600: #000000;
                }
            }

            /* Reduced motion support */
            @media (prefers-reduced-motion: reduce) {
                * {
                    animation-duration: 0.01ms !important;
                    animation-iteration-count: 1 !important;
                    transition-duration: 0.01ms !important;
                }
            }
        </style>
    </head>
    <body>
        <div class="profile-container">
            <!-- Page Header -->
            <div class="page-header">
                <div class="page-title">
                    <i class="bi bi-person-circle"></i>
                    <div>
                        <h1>Thông tin tài khoản</h1>
                        <p class="page-subtitle">Quản lý thông tin cá nhân và cài đặt tài khoản của bạn</p>
                    </div>
                </div>
            </div>

            <!-- Alert Messages -->
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">
                    <i class="bi bi-check-circle-fill"></i>
                    ${success}
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    ${error}
                </div>
            </c:if>

            <!-- Quick Actions -->
            <div class="quick-actions">
                <div class="quick-actions-title">
                    <i class="bi bi-lightning-fill"></i>
                    Truy cập nhanh
                </div>
                <div class="quick-actions-grid">
                    <a href="${pageContext.request.contextPath}/order/history" class="quick-action-item">
                        <div class="quick-action-icon">
                            <i class="bi bi-clock-history"></i>
                        </div>
                        <div class="quick-action-title">Lịch sử đơn hàng</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/user/change-password" class="quick-action-item">
                        <div class="quick-action-icon">
                            <i class="bi bi-shield-lock"></i>
                        </div>
                        <div class="quick-action-title">Đổi mật khẩu</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/wishlist" class="quick-action-item">
                        <div class="quick-action-icon">
                            <i class="bi bi-heart"></i>
                        </div>
                        <div class="quick-action-title">Sản phẩm yêu thích</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/cart" class="quick-action-item">
                        <div class="quick-action-icon">
                            <i class="bi bi-cart"></i>
                        </div>
                        <div class="quick-action-title">Giỏ hàng</div>
                    </a>
                </div>
            </div>

            <!-- Profile Card -->
            <div class="profile-card">
                <!-- Profile Header -->
                <div class="profile-card-header">
                    <div class="profile-avatar">
                        ${user.name.substring(0, 1).toUpperCase()}
                    </div>
                    <div class="profile-info">
                        <h3>${user.name}</h3>
                        <p>Thành viên từ: <fmt:formatDate value="${user.createdDate}" pattern="dd/MM/yyyy" /></p>
                    </div>
                </div>

                <!-- Profile Form -->
                <form action="${pageContext.request.contextPath}/profile" method="post" class="profile-form" id="profileForm" novalidate>
                    <!-- Personal Information Section -->
                    <div class="form-section">
                        <div class="form-section-title">
                            <i class="bi bi-person"></i>
                            Thông tin cá nhân
                        </div>

                        <div class="form-group">
                            <label for="name" class="form-label">
                                <i class="bi bi-person-fill"></i>
                                Họ và tên *
                            </label>
                            <div class="input-group">
                                <i class="input-icon bi bi-person"></i>
                                <input 
                                    type="text" 
                                    id="name" 
                                    name="name" 
                                    class="form-control" 
                                    value="${user.name}" 
                                    required 
                                    minlength="2"
                                    maxlength="100"
                                    placeholder="Nhập họ và tên đầy đủ"
                                    autocomplete="name"
                                    />
                            </div>
                            <div class="form-text">
                                <i class="bi bi-info-circle"></i>
                                Họ và tên sẽ được hiển thị trên hóa đơn và thông tin giao hàng
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">
                                <i class="bi bi-envelope-fill"></i>
                                Địa chỉ email
                            </label>
                            <div class="input-group">
                                <i class="input-icon bi bi-envelope"></i>
                                <input 
                                    type="email" 
                                    id="email" 
                                    name="email" 
                                    class="form-control" 
                                    value="${user.email}" 
                                    readonly 
                                    placeholder="email@example.com"
                                    autocomplete="email"
                                    />
                            </div>
                            <div class="form-text">
                                <i class="bi bi-lock-fill"></i>
                                Địa chỉ email không thể thay đổi vì lý do bảo mật
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phone" class="form-label">
                                <i class="bi bi-telephone-fill"></i>
                                Số điện thoại
                            </label>
                            <div class="input-group">
                                <i class="input-icon bi bi-telephone"></i>
                                <input 
                                    type="tel" 
                                    id="phone" 
                                    name="phone" 
                                    class="form-control" 
                                    value="${user.phone}" 
                                    pattern="[0-9]{10,11}"
                                    placeholder="Nhập số điện thoại (10-11 chữ số)"
                                    autocomplete="tel"
                                    />
                            </div>
                            <div class="form-text">
                                <i class="bi bi-info-circle"></i>
                                Số điện thoại sẽ được sử dụng cho việc giao hàng và liên lạc
                            </div>
                        </div>
                    </div>

                    <!-- Address Information Section -->
                    <div class="form-section">
                        <div class="form-section-title">
                            <i class="bi bi-geo-alt"></i>
                            Thông tin địa chỉ
                        </div>

                        <div class="form-group">
                            <label for="address" class="form-label">
                                <i class="bi bi-house-fill"></i>
                                Địa chỉ giao hàng
                            </label>
                            <div class="input-group">
                                <i class="input-icon bi bi-house" style="top: 1.25rem;"></i>
                                <textarea 
                                    id="address" 
                                    name="address" 
                                    class="form-control" 
                                    rows="3" 
                                    maxlength="500"
                                    placeholder="Nhập địa chỉ đầy đủ: Số nhà, tên đường, phường/xã, quận/huyện, tỉnh/thành phố"
                                    autocomplete="street-address"
                                    >${user.address}</textarea>
                            </div>
                            <div class="form-text">
                                <i class="bi bi-info-circle"></i>
                                Địa chỉ chi tiết giúp việc giao hàng được nhanh chóng và chính xác
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">
                            <i class="bi bi-arrow-clockwise"></i>
                            Khôi phục
                        </button>
                        <button type="submit" class="btn btn-primary" id="submitBtn">
                            <i class="bi bi-check-circle"></i>
                            Cập nhật thông tin
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                            // Form validation and enhancement
                            document.addEventListener('DOMContentLoaded', function () {
                                const form = document.getElementById('profileForm');
                                const submitBtn = document.getElementById('submitBtn');
                                const inputs = form.querySelectorAll('input, textarea');

                                // Real-time validation
                                inputs.forEach(input => {
                                    input.addEventListener('blur', validateField);
                                    input.addEventListener('input', debounce(validateField, 300));
                                });

                                // Form submission
                                form.addEventListener('submit', function (e) {
                                    e.preventDefault();

                                    if (validateForm()) {
                                        submitBtn.classList.add('loading');
                                        submitBtn.disabled = true;

                                        // Simulate processing time for better UX
                                        setTimeout(() => {
                                            form.submit();
                                        }, 500);
                                    }
                                });

                                // Validate individual field
                                function validateField(e) {
                                    const field = e.target;
                                    const fieldGroup = field.closest('.form-group');
                                    const fieldName = field.name;
                                    let isValid = true;
                                    let message = '';

                                    // Remove existing validation states
                                    fieldGroup.classList.remove('has-error', 'has-success');
                                    const existingMessage = fieldGroup.querySelector('.validation-message');
                                    if (existingMessage) {
                                        existingMessage.remove();
                                    }

                                    // Validate based on field type
                                    switch (fieldName) {
                                        case 'name':
                                            if (!field.value.trim()) {
                                                isValid = false;
                                                message = 'Vui lòng nhập họ và tên';
                                            } else if (field.value.trim().length < 2) {
                                                isValid = false;
                                                message = 'Họ và tên phải có ít nhất 2 ký tự';
                                            } else if (field.value.trim().length > 100) {
                                                isValid = false;
                                                message = 'Họ và tên không được vượt quá 100 ký tự';
                                            }
                                            break;

                                        case 'phone':
                                            if (field.value && !/^[0-9]{10,11}$/.test(field.value)) {
                                                isValid = false;
                                                message = 'Số điện thoại phải có 10-11 chữ số';
                                            }
                                            break;

                                        case 'address':
                                            if (field.value && field.value.length > 500) {
                                                isValid = false;
                                                message = 'Địa chỉ không được vượt quá 500 ký tự';
                                            }
                                            break;
                                    }

                                    // Apply validation state
                                    if (!isValid) {
                                        fieldGroup.classList.add('has-error');
                                        const messageEl = document.createElement('div');
                                        messageEl.className = 'validation-message error';
                                        messageEl.innerHTML = `<i class="bi bi-exclamation-circle"></i> ${message}`;
                                        field.parentNode.appendChild(messageEl);
                                    } else if (field.value.trim()) {
                                        fieldGroup.classList.add('has-success');
                                        const messageEl = document.createElement('div');
                                        messageEl.className = 'validation-message success';
                                        messageEl.innerHTML = `<i class="bi bi-check-circle"></i> Hợp lệ`;
                                        field.parentNode.appendChild(messageEl);
                                    }

                                    return isValid;
                                }

                                // Validate entire form
                                function validateForm() {
                                    let isFormValid = true;

                                    inputs.forEach(input => {
                                        if (input.hasAttribute('required') && !validateField({target: input})) {
                                            isFormValid = false;
                                        }
                                    });

                                    return isFormValid;
                                }

                                // Debounce function for performance
                                function debounce(func, wait) {
                                    let timeout;
                                    return function executedFunction(...args) {
                                        const later = () => {
                                            clearTimeout(timeout);
                                            func(...args);
                                        };
                                        clearTimeout(timeout);
                                        timeout = setTimeout(later, wait);
                                    };
                                }

                                // Auto-save functionality (optional)
                                let autoSaveTimeout;
                                inputs.forEach(input => {
                                    input.addEventListener('input', () => {
                                        clearTimeout(autoSaveTimeout);
                                        autoSaveTimeout = setTimeout(() => {
                                            // Auto-save logic could go here
                                            console.log('Auto-saving...');
                                        }, 2000);
                                    });
                                });

                                // Enhanced interactions
                                inputs.forEach(input => {
                                    input.addEventListener('focus', function () {
                                        this.parentNode.style.transform = 'translateY(-1px)';
                                    });

                                    input.addEventListener('blur', function () {
                                        this.parentNode.style.transform = 'translateY(0)';
                                    });
                                });
                            });

                            // Reset form function
                            function resetForm() {
                                if (confirm('Bạn có chắc chắn muốn khôi phục lại thông tin ban đầu?')) {
                                    document.getElementById('profileForm').reset();

                                    // Remove all validation states
                                    document.querySelectorAll('.form-group').forEach(group => {
                                        group.classList.remove('has-error', 'has-success');
                                    });

                                    document.querySelectorAll('.validation-message').forEach(msg => {
                                        msg.remove();
                                    });

                                    // Show success message
                                    showNotification('Đã khôi phục thông tin ban đầu', 'success');
                                }
                            }

                            // Show notification
                            function showNotification(message, type) {
                                type = type || 'info';

                                const notification = document.createElement('div');
                                notification.className = 'alert alert-' + type;
                                notification.style.position = 'fixed';
                                notification.style.top = '20px';
                                notification.style.right = '20px';
                                notification.style.zIndex = '9999';
                                notification.style.minWidth = '300px';
                                notification.style.animation = 'slideInRight 0.3s ease-out';

                                const icon = type === 'success' ? 'check-circle-fill' : 'info-circle-fill';
                                notification.innerHTML = '<i class="bi bi-' + icon + ' me-2"></i>' + message;

                                document.body.appendChild(notification);

                                setTimeout(function () {
                                    notification.style.animation = 'slideOutRight 0.3s ease-out';
                                    setTimeout(function () {
                                        notification.remove();
                                    }, 300);
                                }, 3000);
                            }


                            // Add CSS animations for notifications
                            const style = document.createElement('style');
                            style.textContent = `
                @keyframes slideInRight {
                    from {
                        opacity: 0;
                        transform: translateX(100%);
                    }
                    to {
                        opacity: 1;
                        transform: translateX(0);
                    }
                }
            
                @keyframes slideOutRight {
                    from {
                        opacity: 1;
                        transform: translateX(0);
                    }
                    to {
                        opacity: 0;
                        transform: translateX(100%);
                    }
                }
            `;
                            document.head.appendChild(style);

                            // Keyboard shortcuts
                            document.addEventListener('keydown', function (e) {
                                // Ctrl/Cmd + S to save
                                if ((e.ctrlKey || e.metaKey) && e.key === 's') {
                                    e.preventDefault();
                                    document.getElementById('profileForm').dispatchEvent(new Event('submit'));
                                }

                                // Escape to reset form
                                if (e.key === 'Escape') {
                                    resetForm();
                                }
                            });

                            // Performance optimization - lazy load animations
                            if ('IntersectionObserver' in window) {
                                const observer = new IntersectionObserver((entries) => {
                                    entries.forEach(entry => {
                                        if (entry.isIntersecting) {
                                            entry.target.style.animation = 'slideInUp 0.5s ease-out';
                                        }
                                    });
                                });

                                document.querySelectorAll('.profile-card, .quick-actions').forEach(el => {
                                    observer.observe(el);
                                });
                            }
        </script>
    </body>
</html>

<jsp:include page="../../common/footer.jsp" />
