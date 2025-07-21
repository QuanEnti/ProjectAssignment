
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Assistant</title>
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
            --warning-color: #d97706;
            --danger-color: #dc2626;
            --info-color: #0891b2;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
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
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
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

        /* Floating Chat Button */
        .chat-toggle-button {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            border: none;
            border-radius: 50%;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            box-shadow: var(--shadow-lg);
            transition: var(--transition);
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .chat-toggle-button:hover {
            transform: scale(1.1);
            box-shadow: var(--shadow-xl);
        }

        .chat-toggle-button.active {
            background: linear-gradient(135deg, var(--danger-color), #ef4444);
        }

        /* Chat Widget Container */
        .chat-widget {
            position: fixed;
            bottom: 100px;
            right: 30px;
            width: 380px;
            height: 500px;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-xl);
            display: none;
            flex-direction: column;
            z-index: 999;
            overflow: hidden;
            border: 1px solid var(--gray-200);
            animation: slideInUp 0.3s ease-out;
        }

        .chat-widget.active {
            display: flex;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(20px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        /* Chat Header */
        .chat-header {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            padding: 1rem 1.25rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

        .chat-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            animation: shimmer 3s infinite;
        }

        @keyframes shimmer {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        .chat-header-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            position: relative;
            z-index: 2;
        }

        .chat-avatar {
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            position: relative;
        }

        .chat-avatar::after {
            content: '';
            position: absolute;
            bottom: -2px;
            right: -2px;
            width: 12px;
            height: 12px;
            background: #10b981;
            border: 2px solid white;
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .chat-title {
            display: flex;
            flex-direction: column;
        }

        .chat-title h3 {
            font-size: 1rem;
            font-weight: 600;
            margin: 0;
        }

        .chat-status {
            font-size: 0.75rem;
            opacity: 0.9;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .status-indicator {
            width: 6px;
            height: 6px;
            background: #10b981;
            border-radius: 50%;
            animation: blink 1.5s infinite;
        }

        @keyframes blink {
            0%, 50% { opacity: 1; }
            51%, 100% { opacity: 0.3; }
        }

        .chat-close {
            background: none;
            border: none;
            color: white;
            font-size: 1.25rem;
            cursor: pointer;
            padding: 0.25rem;
            border-radius: 0.25rem;
            transition: var(--transition);
            position: relative;
            z-index: 2;
        }

        .chat-close:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* Chat Body */
        .chat-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            background: var(--gray-50);
            position: relative;
        }

        /* Chat Messages */
        .chat-messages {
            flex: 1;
            padding: 1rem;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            background: white;
            position: relative;
        }

        .chat-messages::-webkit-scrollbar {
            width: 4px;
        }

        .chat-messages::-webkit-scrollbar-track {
            background: var(--gray-100);
        }

        .chat-messages::-webkit-scrollbar-thumb {
            background: var(--gray-300);
            border-radius: 2px;
        }

        .chat-messages::-webkit-scrollbar-thumb:hover {
            background: var(--gray-400);
        }

        /* Message Bubbles */
        .message {
            display: flex;
            gap: 0.75rem;
            animation: messageSlideIn 0.3s ease-out;
        }

        @keyframes messageSlideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message.user {
            flex-direction: row-reverse;
        }

        .message-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.875rem;
            font-weight: 600;
            flex-shrink: 0;
            margin-top: 0.25rem;
        }

        .message.bot .message-avatar {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
        }

        .message.user .message-avatar {
            background: linear-gradient(135deg, var(--success-color), #10b981);
            color: white;
        }

        .message-content {
            flex: 1;
            max-width: 80%;
        }

        .message-bubble {
            background: white;
            padding: 0.75rem 1rem;
            border-radius: 1rem;
            border: 1px solid var(--gray-200);
            box-shadow: var(--shadow-sm);
            position: relative;
            word-wrap: break-word;
            font-size: 0.875rem;
            line-height: 1.5;
        }

        .message.bot .message-bubble {
            background: var(--gray-50);
            border-bottom-left-radius: 0.25rem;
        }

        .message.user .message-bubble {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border: 1px solid var(--primary-color);
            border-bottom-right-radius: 0.25rem;
        }

        .message-bubble::before {
            content: '';
            position: absolute;
            width: 0;
            height: 0;
            border: 6px solid transparent;
        }

        .message.bot .message-bubble::before {
            left: -11px;
            top: 12px;
            border-right-color: var(--gray-50);
        }

        .message.user .message-bubble::before {
            right: -11px;
            top: 12px;
            border-left-color: var(--primary-color);
        }

        .message-time {
            font-size: 0.7rem;
            color: var(--gray-500);
            text-align: center;
            margin-top: 0.25rem;
        }

        .message.user .message-time {
            color: rgba(255, 255, 255, 0.8);
        }

        /* Empty State */
        .chat-empty {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
            text-align: center;
            padding: 2rem;
            color: var(--gray-500);
        }

        .empty-icon {
            width: 60px;
            height: 60px;
            background: var(--gray-100);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .empty-text h4 {
            font-size: 1rem;
            font-weight: 600;
            color: var(--gray-700);
            margin-bottom: 0.5rem;
        }

        .empty-text p {
            font-size: 0.875rem;
            color: var(--gray-500);
            margin: 0;
        }

        /* Chat Input */
        .chat-input {
            background: white;
            border-top: 1px solid var(--gray-200);
            padding: 1rem;
            display: flex;
            gap: 0.75rem;
            align-items: flex-end;
        }

        .input-group {
            flex: 1;
            position: relative;
        }

        .chat-textarea {
            width: 100%;
            border: 1px solid var(--gray-300);
            border-radius: var(--border-radius-sm);
            padding: 0.75rem;
            font-size: 0.875rem;
            font-family: inherit;
            resize: none;
            min-height: 40px;
            max-height: 100px;
            background: var(--gray-50);
            transition: var(--transition);
            line-height: 1.4;
        }

        .chat-textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            background: white;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .chat-textarea::placeholder {
            color: var(--gray-500);
        }

        .send-button {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
            font-size: 1rem;
            flex-shrink: 0;
        }

        .send-button:hover {
            transform: scale(1.05);
            box-shadow: var(--shadow-md);
        }

        .send-button:active {
            transform: scale(0.95);
        }

        .send-button:disabled {
            background: var(--gray-300);
            cursor: not-allowed;
            transform: none;
        }

        /* Typing Indicator */
        .typing-indicator {
            display: none;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1rem;
            font-size: 0.875rem;
            color: var(--gray-500);
            background: white;
            border-top: 1px solid var(--gray-200);
        }

        .typing-indicator.active {
            display: flex;
        }

        .typing-dots {
            display: flex;
            gap: 0.25rem;
        }

        .typing-dots span {
            width: 6px;
            height: 6px;
            background: var(--gray-400);
            border-radius: 50%;
            animation: typingBounce 1.4s infinite ease-in-out;
        }

        .typing-dots span:nth-child(1) { animation-delay: 0s; }
        .typing-dots span:nth-child(2) { animation-delay: 0.2s; }
        .typing-dots span:nth-child(3) { animation-delay: 0.4s; }

        @keyframes typingBounce {
            0%, 60%, 100% { transform: translateY(0); }
            30% { transform: translateY(-10px); }
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .chat-widget {
                bottom: 90px;
                right: 15px;
                left: 15px;
                width: auto;
                height: 450px;
            }

            .chat-toggle-button {
                bottom: 20px;
                right: 20px;
                width: 55px;
                height: 55px;
            }
        }

        /* Accessibility */
        .chat-toggle-button:focus,
        .send-button:focus,
        .chat-close:focus,
        .chat-textarea:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Loading Animation */
        .loading-dots {
            display: inline-flex;
            gap: 2px;
        }

        .loading-dots span {
            width: 4px;
            height: 4px;
            background: currentColor;
            border-radius: 50%;
            animation: loadingPulse 1.4s infinite ease-in-out;
        }

        .loading-dots span:nth-child(1) { animation-delay: 0s; }
        .loading-dots span:nth-child(2) { animation-delay: 0.2s; }
        .loading-dots span:nth-child(3) { animation-delay: 0.4s; }

        @keyframes loadingPulse {
            0%, 60%, 100% { transform: scale(1); opacity: 1; }
            30% { transform: scale(0.8); opacity: 0.5; }
        }
    </style>
</head>
<body>
    <!-- Chat Toggle Button -->
    <button class="chat-toggle-button" id="chatToggle" aria-label="Toggle AI Chat Assistant">
        <i class="bi bi-chat-dots" id="chatToggleIcon"></i>
    </button>

    <!-- Chat Widget -->
    <div class="chat-widget" id="chatWidget">
        <!-- Chat Header -->
        <div class="chat-header">
            <div class="chat-header-info">
                <div class="chat-avatar">
                    <i class="bi bi-robot"></i>
                </div>
                <div class="chat-title">
                    <h3>AI Trợ lý</h3>
                    <div class="chat-status">
                        <div class="status-indicator"></div>
                        Đang trực tuyến
                    </div>
                </div>
            </div>
            <button class="chat-close" id="chatClose" aria-label="Close chat">
                <i class="bi bi-x-lg"></i>
            </button>
        </div>

        <!-- Chat Body -->
        <div class="chat-body">
            <!-- Chat Messages -->
            <div class="chat-messages" id="chatMessages">
                <c:choose>
                    <c:when test="${empty chatHistory}">
                        <div class="chat-empty">
                            <div class="empty-icon">
                                <i class="bi bi-chat-heart"></i>
                            </div>
                            <div class="empty-text">
                                <h4>Xin chào! 👋</h4>
                                <p>Tôi là AI trợ lý của FashionShop.<br>Tôi có thể giúp bạn điều gì?</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="msg" items="${chatHistory}" varStatus="status">
                            <div class="message ${msg.sender}">
                                <div class="message-avatar">
                                    <c:choose>
                                        <c:when test="${msg.sender eq 'bot'}">
                                            <i class="bi bi-robot"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="bi bi-person"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="message-content">
                                    <div class="message-bubble">
                                        ${msg.message}
                                    </div>
                                    <div class="message-time">
                                        <script>document.write(new Date().toLocaleTimeString('vi-VN', {hour: '2-digit', minute: '2-digit'}));</script>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Typing Indicator -->
            <div class="typing-indicator" id="typingIndicator">
                <i class="bi bi-robot me-2"></i>
                AI đang trả lời
                <div class="typing-dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>

        <!-- Chat Input -->
        <div class="chat-input">
            <form method="post" action="${pageContext.request.contextPath}/user/chat" id="chatForm" style="display: flex; gap: 0.75rem; width: 100%; align-items: flex-end;">
                <div class="input-group">
                    <textarea 
                        class="chat-textarea" 
                        name="message" 
                        id="messageInput"
                        placeholder="Nhập tin nhắn của bạn..." 
                        required
                        rows="1"
                        maxlength="500"></textarea>
                </div>
                <button type="submit" class="send-button" id="sendButton" aria-label="Send message">
                    <i class="bi bi-send"></i>
                </button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Chat Widget Controller
        class ChatWidget {
            constructor() {
                this.isOpen = false;
                this.isTyping = false;
                this.messageQueue = [];
                this.init();
            }

            init() {
                // DOM Elements
                this.chatToggle = document.getElementById('chatToggle');
                this.chatWidget = document.getElementById('chatWidget');
                this.chatClose = document.getElementById('chatClose');
                this.chatForm = document.getElementById('chatForm');
                this.messageInput = document.getElementById('messageInput');
                this.sendButton = document.getElementById('sendButton');
                this.chatMessages = document.getElementById('chatMessages');
                this.typingIndicator = document.getElementById('typingIndicator');
                this.chatToggleIcon = document.getElementById('chatToggleIcon');

                // Event Listeners
                this.attachEventListeners();
                
                // Auto-resize textarea
                this.setupTextareaAutoResize();
                
                // Initialize state
                this.scrollToBottom();
            }

            attachEventListeners() {
                // Toggle chat widget
                this.chatToggle.addEventListener('click', () => this.toggleChat());
                this.chatClose.addEventListener('click', () => this.closeChat());

                // Form submission
                this.chatForm.addEventListener('submit', (e) => this.handleSubmit(e));

                // Input events
                this.messageInput.addEventListener('keydown', (e) => this.handleKeydown(e));
                this.messageInput.addEventListener('input', () => this.handleInput());

                // Click outside to close
                document.addEventListener('click', (e) => this.handleOutsideClick(e));

                // Escape key to close
                document.addEventListener('keydown', (e) => {
                    if (e.key === 'Escape' && this.isOpen) {
                        this.closeChat();
                    }
                });

                // Window resize
                window.addEventListener('resize', () => this.handleResize());
            }

            setupTextareaAutoResize() {
                this.messageInput.addEventListener('input', () => {
                    this.messageInput.style.height = 'auto';
                    this.messageInput.style.height = Math.min(this.messageInput.scrollHeight, 100) + 'px';
                });
            }

            toggleChat() {
                this.isOpen ? this.closeChat() : this.openChat();
            }

            openChat() {
                this.isOpen = true;
                this.chatWidget.classList.add('active');
                this.chatToggle.classList.add('active');
                this.chatToggleIcon.className = 'bi bi-x-lg';
                this.messageInput.focus();
                this.scrollToBottom();
                
                // Add body class to prevent scroll
                document.body.style.overflow = 'hidden';
            }

            closeChat() {
                this.isOpen = false;
                this.chatWidget.classList.remove('active');
                this.chatToggle.classList.remove('active');
                this.chatToggleIcon.className = 'bi bi-chat-dots';
                
                // Restore body scroll
                document.body.style.overflow = '';
            }

            handleSubmit(e) {
                e.preventDefault();
                
                const message = this.messageInput.value.trim();
                if (!message || this.isTyping) return;

                // Add user message to UI
                this.addMessage(message, 'user');
                
                // Clear input
                this.messageInput.value = '';
                this.messageInput.style.height = 'auto';
                
                // Show typing indicator
                this.showTyping();
                
                // Disable form
                this.setFormDisabled(true);
                
                // Submit form
                this.submitMessage(message);
            }

            handleKeydown(e) {
                if (e.key === 'Enter' && !e.shiftKey) {
                    e.preventDefault();
                    this.chatForm.dispatchEvent(new Event('submit'));
                }
            }

            handleInput() {
                // Enable/disable send button based on input
                const hasText = this.messageInput.value.trim().length > 0;
                this.sendButton.disabled = !hasText || this.isTyping;
            }

            handleOutsideClick(e) {
                if (this.isOpen && 
                    !this.chatWidget.contains(e.target) && 
                    !this.chatToggle.contains(e.target)) {
                    this.closeChat();
                }
            }

            handleResize() {
                if (this.isOpen) {
                    this.scrollToBottom();
                }
            }

            addMessage(message, sender) {
                const messageElement = this.createMessageElement(message, sender);
                
                // Remove empty state if exists
                const emptyState = this.chatMessages.querySelector('.chat-empty');
                if (emptyState) {
                    emptyState.remove();
                }
                
                this.chatMessages.appendChild(messageElement);
                this.scrollToBottom();
            }

            createMessageElement(message, sender) {
                const messageDiv = document.createElement('div');
                messageDiv.className = `message ${sender}`;
                
                const currentTime = new Date().toLocaleTimeString('vi-VN', {
                    hour: '2-digit',
                    minute: '2-digit'
                });
                
                const icon = sender === 'bot' ? 'bi-robot' : 'bi-person';
                
                messageDiv.innerHTML = `
                    <div class="message-avatar">
                        <i class="bi ${icon}"></i>
                    </div>
                    <div class="message-content">
                        <div class="message-bubble">
                            ${this.formatMessage(message)}
                        </div>
                        <div class="message-time">${currentTime}</div>
                    </div>
                `;
                
                return messageDiv;
            }

            formatMessage(message) {
                // Basic text formatting
                return message
                    .replace(/\n/g, '<br>')
                    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
                    .replace(/\*(.*?)\*/g, '<em>$1</em>');
            }

            showTyping() {
                this.isTyping = true;
                this.typingIndicator.classList.add('active');
                this.scrollToBottom();
            }

            hideTyping() {
                this.isTyping = false;
                this.typingIndicator.classList.remove('active');
                this.setFormDisabled(false);
            }

            setFormDisabled(disabled) {
                this.messageInput.disabled = disabled;
                this.sendButton.disabled = disabled || this.messageInput.value.trim().length === 0;
            }

            async submitMessage(message) {
                try {
                    const formData = new FormData();
                    formData.append('message', message);
                    
                    const response = await fetch(this.chatForm.action, {
                        method: 'POST',
                        body: formData
                    });
                    
                    if (response.ok) {
                        // Simulate delay for better UX
                        setTimeout(() => {
                            // For demo purposes, add a mock response
                            // In real implementation, you'd parse the response
                            this.addMessage(this.generateMockResponse(message), 'bot');
                            this.hideTyping();
                        }, 1000 + Math.random() * 2000);
                    } else {
                        throw new Error('Network response was not ok');
                    }
                } catch (error) {
                    console.error('Error:', error);
                    setTimeout(() => {
                        this.addMessage('Xin lỗi, tôi đang gặp sự cố kỹ thuật. Vui lòng thử lại sau.', 'bot');
                        this.hideTyping();
                    }, 1000);
                }
            }

            generateMockResponse(userMessage) {
                // Mock responses for demo
                const responses = [
                    'Cảm ơn bạn đã liên hệ! Tôi đang xử lý yêu cầu của bạn.',
                    'Để tôi giúp bạn tìm hiểu thêm về sản phẩm này.',
                    'Bạn có thể cung cấp thêm chi tiết không?',
                    'Tôi hiểu vấn đề của bạn. Hãy để tôi hướng dẫn bạn.',
                    'Có gì khác tôi có thể hỗ trợ bạn không?'
                ];
                
                return responses[Math.floor(Math.random() * responses.length)];
            }

            scrollToBottom() {
                requestAnimationFrame(() => {
                    this.chatMessages.scrollTop = this.chatMessages.scrollHeight;
                });
            }
        }

        // Initialize chat widget when DOM is loaded
        document.addEventListener('DOMContentLoaded', () => {
            new ChatWidget();
        });

        // Add ripple effect to buttons
        document.addEventListener('click', (e) => {
            if (e.target.matches('.send-button, .chat-toggle-button')) {
                const button = e.target;
                const rect = button.getBoundingClientRect();
                const ripple = document.createElement('span');
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.cssText = `
                    position: absolute;
                    width: ${size}px;
                    height: ${size}px;
                    left: ${x}px;
                    top: ${y}px;
                    background: rgba(255,255,255,0.4);
                    border-radius: 50%;
                    transform: scale(0);
                    animation: ripple 0.6s linear;
                    pointer-events: none;
                `;
                
                button.style.position = 'relative';
                button.style.overflow = 'hidden';
                button.appendChild(ripple);
                
                setTimeout(() => ripple.remove(), 600);
            }
        });

        // CSS animation for ripple effect
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
