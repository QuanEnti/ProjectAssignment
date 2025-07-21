<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp" />

<h2 style="color:red;">❌ Đã xảy ra lỗi!</h2>

<p>Vui lòng kiểm tra lại thao tác của bạn.</p>

<c:if test="${not empty error}">
    <p style="color:red;"><strong>Lỗi chi tiết:</strong> ${error}</p>
</c:if>

<c:if test="${not empty exception}">
    <p style="color:red;"><strong>Exception:</strong> ${exception.message}</p>
    <pre>${exception}</pre>
</c:if>

<p><a href="${pageContext.request.contextPath}/home">🔙 Quay về trang chủ</a></p>

<jsp:include page="../common/footer.jsp" />
