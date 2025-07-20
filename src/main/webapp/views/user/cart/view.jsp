<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../common/header.jsp" />

<h2>🛒 Giỏ hàng của bạn</h2>

<c:choose>
    <c:when test="${empty cart}">
        <p>Giỏ hàng của bạn đang trống.</p>
    </c:when>
    <c:otherwise>
        <table border="1" cellpadding="10" cellspacing="0" width="100%">
            <thead>
                <tr style="background:#f0f0f0">
                    <th>Ảnh</th>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tổng</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="entry" items="${cart}">
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}/${entry.key.mainImage}" width="80"/>
                        </td>
                        <td>${entry.key.name}</td>
                        <td>${entry.key.price} VND</td>
                        <td>${entry.value}</td>
                        <td>${entry.key.price * entry.value} VND</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/remove-from-cart?productId=${entry.key.id}" 
                               onclick="return confirm('Xóa sản phẩm này khỏi giỏ?')">❌ Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" align="right"><strong>Tổng cộng:</strong></td>
                    <td colspan="2"><strong>${total} VND</strong></td>
                </tr>
            </tbody>
        </table>

        <br/>
        <div style="text-align: right;">
            <!-- ✅ Nút thanh toán thường -->
            <form action="${pageContext.request.contextPath}/checkout" method="get" style="display:inline;">
                <button type="submit" style="padding:10px 20px;">🧾 Tiến hành thanh toán</button>
            </form>

            <!-- ✅ Nút thanh toán qua VNPay -->
            <form action="${pageContext.request.contextPath}/vnpay" method="post" style="display:inline;">
                <input type="hidden" name="amount" value="${total}" />
                <button type="submit" 
                        style="background-color:#d81b60; color:white; padding:10px 20px; border:none; cursor:pointer;">
                    💳 Thanh toán bằng VNPay
                </button>
            </form>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="../../common/footer.jsp" />
