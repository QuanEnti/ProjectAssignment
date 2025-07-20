<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../../common/header.jsp" />

<h2>📦 Chi tiết đơn hàng #${order.id}</h2>

<p><strong>Ngày đặt:</strong> ${order.orderDate}</p>
<p><strong>Trạng thái:</strong> ${order.status}</p>
<p><strong>Phương thức thanh toán:</strong>
  <c:if test="${order.paymentMethod != null}">${order.paymentMethod.name}</c:if>
</p>

<p><strong>Phương thức giao hàng:</strong>
  <c:if test="${order.shippingMethod != null}">${order.shippingMethod.name}</c:if>
</p>

<p><strong>Tổng tiền:</strong> ${order.total} VND</p>

<hr/>
<h3>🛍️ Sản phẩm trong đơn</h3>
<table border="1" cellpadding="10" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${order.orderDetails}">
            <tr>
                <td>
  <c:if test="${item.product != null}">
    ${item.product.name}
  </c:if>
</td>
                <td>${item.price} VND</td>
                <td>${item.quantity}</td>
                <td>${item.price * item.quantity} VND</td>
            </tr>
        </c:forEach>
    </tbody>
</table>


       <c:if test="${order.status eq 'Đã thanh toán'}">
        <form action="${pageContext.request.contextPath}/request-refund" method="post">
            <input type="hidden" name="orderId" value="${order.id}" />
            <button type="submit" style="padding:10px;background:red;color:white;">
                🔁 Yêu cầu hoàn tiền
            </button>
        </form>
        </c:if>

<jsp:include page="../../common/footer.jsp" />
