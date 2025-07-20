<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/views/admin/common/header.jsp" />

<div class="container mt-4 mb-5">
    <h2 class="mb-4">📊 Thống kê tổng quan</h2>

    <div class="row text-center mb-4">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">📦 Sản phẩm</h5>
                    <p class="display-6 text-primary">${productCount}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">🧾 Đơn hàng</h5>
                    <p class="display-6 text-success">${orderCount}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">👥 Người dùng</h5>
                    <p class="display-6 text-warning">${customerCount}</p>
                </div>
            </div>
        </div>
    </div>

    <hr/>
    <h3 class="mb-3">📈 Doanh thu 6 tháng gần nhất</h3>

    <c:choose>
        <c:when test="${not empty revenueMap}">
            <canvas id="revenueChart" width="800" height="300"></canvas>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                const ctx = document.getElementById('revenueChart').getContext('2d');
                const revenueChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: [
                            <c:forEach var="entry" items="${revenueMap}" varStatus="loop">
                                '${entry.key}'<c:if test="${!loop.last}">,</c:if>
                            </c:forEach>
                        ],
                        datasets: [{
                            label: 'Doanh thu (VND)',
                            data: [
                                <c:forEach var="entry" items="${revenueMap}" varStatus="loop">
                                    ${entry.value}<c:if test="${!loop.last}">,</c:if>
                                </c:forEach>
                            ],
                            backgroundColor: 'rgba(75, 192, 192, 0.6)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function(value) {
                                        return value.toLocaleString('vi-VN') + ' ₫';
                                    }
                                }
                            }
                        }
                    }
                });
            </script>
        </c:when>
        <c:otherwise>
            <p><i>Không có dữ liệu doanh thu.</i></p>
        </c:otherwise>
    </c:choose>

    <hr/>
    <h3 class="mt-5 mb-3">📋 Quản lý hoàn tiền VNPay</h3>
    <div class="text-center">
        <a href="${pageContext.request.contextPath}/admin/pending-refunds" class="btn btn-warning btn-lg">
            🔁 Danh sách yêu cầu hoàn tiền
        </a>
    </div>
</div>

<jsp:include page="/views/admin/common/footer.jsp" />
