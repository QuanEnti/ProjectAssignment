<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../../common/header.jsp" />

<h2>🔁 Xác nhận hoàn tiền cho đơn hàng #${order.id}</h2>

<p><strong>Ngày đặt:</strong> ${order.orderDate}</p>

<p><strong>Phương thức thanh toán:</strong>
  <c:if test="${order.paymentMethod != null}">
    ${order.paymentMethod.name}
  </c:if>
</p>

<p><strong>Phương thức giao hàng:</strong>
  <c:if test="${order.shippingMethod != null}">
    ${order.shippingMethod.name}
  </c:if>
</p>

<p><strong>Tổng tiền:</strong> ${order.total} VND</p>
<p><strong>Trạng thái hiện tại:</strong> ${order.status}</p>

<c:if test="${not empty order.transactionNo}">
    <p><strong>Mã giao dịch VNPay:</strong> ${order.transactionNo}</p>
</c:if>

<form action="${pageContext.request.contextPath}/request-refund-submit" method="post">
    <input type="hidden" name="orderId" value="${order.id}" />
    <button type="submit" style="padding:10px 20px; background-color:red; color:white; border:none;">
        ✅ Gửi yêu cầu hoàn tiền
    </button>
</form>

<p style="margin-top: 20px;">
    <a href="${pageContext.request.contextPath}/admin/dashboard">⬅ Quay lại trang quản trị</a>
</p>

<jsp:include page="../../common/footer.jsp" />
