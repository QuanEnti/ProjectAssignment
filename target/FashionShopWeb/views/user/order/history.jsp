<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../common/header.jsp" />

<h2>📜 Lịch sử đơn hàng của bạn</h2>

<c:choose>
    <c:when test="${empty orders}">
        <p>Bạn chưa có đơn hàng nào.</p>
    </c:when>
    <c:otherwise>
        <table border="1" cellpadding="10" cellspacing="0" width="100%">
            <thead>
                <tr style="background:#f0f0f0">
                    <th>Mã đơn</th>
                    <th>Ngày đặt</th>
                    <th>Tổng tiền</th>
                    <th>Thanh toán</th>
                    <th>Giao hàng</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${orders}">
                    <tr>
                        <td>#${o.id}</td>
                        <td>${o.orderDate}</td>
                        <td>${o.total} VND</td>
                        <td>
                            <c:if test="${o.paymentMethod != null}">
                                ${o.paymentMethod.name}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${o.shippingMethod != null}">
                                ${o.shippingMethod.name}
                            </c:if>
                        </td>
                        <td>
                            ${o.status}
                            <c:if test="${o.requestRefund}">
                                <br><span style="color: orange;">(Đã yêu cầu hoàn tiền)</span>
                            </c:if>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/order/detail?id=${o.id}">
                                🔍 Xem chi tiết
                            </a>

                            <c:if test="${o.status eq 'Đã thanh toán' and not o.requestRefund}">
                                <form action="${pageContext.request.contextPath}/request-refund" method="post" style="display:inline;">
                                    <input type="hidden" name="orderId" value="${o.id}" />
                                    <button type="submit" style="background:none; border:none; color:red; cursor:pointer;">
                                        💸 Yêu cầu hoàn tiền
                                    </button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<jsp:include page="../../common/footer.jsp" />
