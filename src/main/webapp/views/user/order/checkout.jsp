<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../common/header.jsp" />

<div style="max-width: 800px; margin: 0 auto;">
    <h2>💳 Thanh toán đơn hàng</h2>

    <p><strong>Tổng tiền:</strong>
        <c:choose>
            <c:when test="${not empty total}">
                <fmt:formatNumber value="${total}" type="number" groupingUsed="true"/> VND
            </c:when>
            <c:otherwise>
                <i>Không xác định</i>
            </c:otherwise>
        </c:choose>
    </p>

    <!-- ✅ Form đặt hàng thông thường (COD / Chuyển khoản) -->
    <form action="${pageContext.request.contextPath}/checkout" method="post" style="margin-bottom: 30px;">
        <input type="hidden" name="paymentType" value="cod"/>

        <div style="margin-bottom: 15px;">
            <label for="shippingMethod">🚚 Phương thức giao hàng:</label>
            <select name="shippingMethod" id="shippingMethod" required>
                <c:forEach var="s" items="${shippingMethods}">
                    <option value="${s.id}">${s.name}</option>
                </c:forEach>
            </select>
        </div>

        <div style="margin-bottom: 15px;">
            <label for="paymentMethod">💰 Phương thức thanh toán:</label>
            <select name="paymentMethod" id="paymentMethod" required>
                <c:forEach var="p" items="${paymentMethods}">
                    <option value="${p.id}">${p.name}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" style="padding: 10px 20px; background: green; color: white; border: none;">
            ✅ Xác nhận đặt hàng COD / Chuyển khoản
        </button>
    </form>

    <!-- 🔴 Form thanh toán VNPay – TÁCH RIÊNG HOÀN TOÀN -->
    <form action="${pageContext.request.contextPath}/vnpay" method="post" style="margin-top: 20px;">
        <input type="hidden" name="amount" value="${total}" />
        <button type="submit" style="background:#d81b60; color:white; padding:10px;">
            🔴 Thanh toán VNPay
        </button>
    </form>
</div>

<jsp:include page="../../common/footer.jsp" />
