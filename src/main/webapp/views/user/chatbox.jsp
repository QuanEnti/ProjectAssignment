<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>AI Assistant</title>
    <style>
        #chat { max-height: 400px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; }
        .user { color: blue; }
        .bot { color: green; }
    </style>
</head>
<body>
<h2>🤖 AI Chat Assistant</h2>
<div id="chat">
    <c:forEach var="msg" items="${chatHistory}">
        <div class="${msg.sender}">
            <b>${msg.sender}:</b> <pre>${msg.message}</pre>
        </div>
    </c:forEach>
</div>
<form method="post" action="${pageContext.request.contextPath}/user/chat">
    <input type="text" name="message" placeholder="Ask me something..." required size="50"/>
    <button type="submit">Send</button>
</form>
</body>
</html>