<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../common/header.jsp" />

<div style="max-width: 700px; margin: 0 auto; text-align: center;">
    <h2 style="color: green;">🎉 Đặt hàng thành công!</h2>
    <p>Cảm ơn bạn đã mua sắm tại <strong>FashionShop</strong>!</p>
    <p>Đơn hàng của bạn đang được xử lý. Chúng tôi sẽ liên hệ trong thời gian sớm nhất.</p>

    <br/>
    <a href="${pageContext.request.contextPath}/home" 
       style="padding: 10px 20px; background: #2196f3; color: white; text-decoration: none; border-radius: 5px;">
        ⬅️ Quay lại trang chủ
    </a>
</div>

<jsp:include page="../../common/footer.jsp" />
