<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<h2>🖼️ Danh sách banner</h2>

<a href="${pageContext.request.contextPath}/admin/banners?action=add">➕ Thêm banner mới</a>

<table border="1" cellspacing="0" cellpadding="8" width="100%" style="margin-top:10px;">
    <tr>
        <th>ID</th>
        <th>Tiêu đề</th>
        <th>Hình ảnh</th>
        <th>Liên kết</th>
        <th>Thao tác</th>
    </tr>

    <c:forEach var="b" items="${bannerList}">
        <tr>
            <td>${b.id}</td>
            <td>${b.title}</td>
            <td><img src="${pageContext.request.contextPath}/${b.image}" width="150"/></td>
            <td><a href="${b.link}" target="_blank">${b.link}</a></td>
            <td>
                <a href="banners?action=edit&id=${b.id}">✏️ Sửa</a> |
                <a href="banners?action=delete&id=${b.id}" onclick="return confirm('Xoá banner này?')">🗑 Xoá</a>
            </td>
        </tr>
    </c:forEach>
</table>

<jsp:include page="/views/admin/common/footer.jsp" />
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2"><i class="bi bi-images text-warning me-2"></i>Quản lý Banner</h2>
            <p class="mb-0 opacity-75">Quản lý và cấu hình banner hiển thị trên website</p>
        </div>
        <div class="d-flex gap-2">
            <a href="banners?action=add" class="btn btn-light btn-sm shadow-sm">
                <i class="bi bi-plus-circle me-1"></i> Thêm Banner
            </a>
            <button class="btn btn-success btn-sm shadow-sm">
                <i class="bi bi-download me-1"></i> Xuất Excel
            </button>
        </div>
    </div>
</div>

<!-- Statistics Cards -->
<div class="row mb-4">
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-primary text-white">
            <div class="card-body text-center">
                <i class="bi bi-images display-6 mb-2"></i>
                <h4>${banners.size()}</h4>
                <p class="mb-0">Tổng Banner</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-success text-white">
            <div class="card-body text-center">
                <i class="bi bi-eye-fill display-6 mb-2"></i>
                <h4>
                    <c:set var="homeCount" value="0"/>
                    <c:forEach var="b" items="${banners}">
                        <c:if test="${b.position == 'home'}">
                            <c:set var="homeCount" value="${homeCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${homeCount}
                </h4>
                <p class="mb-0">Trang chủ</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-warning text-white">
            <div class="card-body text-center">
                <i class="bi bi-grid-3x3-gap-fill display-6 mb-2"></i>
                <h4>
                    <c:set var="categoryCount" value="0"/>
                    <c:forEach var="b" items="${banners}">
                        <c:if test="${b.position == 'category'}">
                            <c:set var="categoryCount" value="${categoryCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${categoryCount}
                </h4>
                <p class="mb-0">Danh mục</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-info text-white">
            <div class="card-body text-center">
                <i class="bi bi-layout-sidebar display-6 mb-2"></i>
                <h4>
                    <c:set var="sidebarCount" value="0"/>
                    <c:forEach var="b" items="${banners}">
                        <c:if test="${b.position == 'sidebar'}">
                            <c:set var="sidebarCount" value="${sidebarCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${sidebarCount}
                </h4>
                <p class="mb-0">Thanh bên</p>
            </div>
        </div>
    </div>
</div>

<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="bi bi-table me-2 text-primary"></i>Danh sách Banner</h5>
            <small class="text-muted">${banners.size()} banner</small>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="bg-light">
                    <tr>
                        <th scope="col" class="border-0 ps-4">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-hash me-1 text-muted"></i>ID
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-card-image me-1 text-muted"></i>Banner
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-type me-1 text-muted"></i>Tiêu đề
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-geo-alt me-1 text-muted"></i>Vị trí
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-link-45deg me-1 text-muted"></i>Liên kết
                            </div>
                        </th>
                        <th scope="col" class="border-0 text-center pe-4">
                            <div class="d-flex align-items-center justify-content-center">
                                <i class="bi bi-gear me-1 text-muted"></i>Thao tác
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${banners}" varStatus="status">
                        <tr class="border-bottom">
                            <td class="ps-4 py-3">
                                <span class="badge bg-light text-dark fw-bold">#${b.id}</span>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="position-relative me-3">
                                        <img src="${pageContext.request.contextPath}/images/banners/${b.image}"
                                             alt="${b.title}" class="rounded-3 shadow-sm"
                                             width="80" height="50" style="object-fit: cover;">
                                        <div class="position-absolute top-0 start-100 translate-middle">
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check2"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="fw-semibold text-dark">${b.image}</div>
                                        <small class="text-muted">Hình ảnh banner</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="fw-semibold text-dark">${b.title}</div>
                                <small class="text-muted">Tiêu đề hiển thị</small>
                            </td>
                            <td class="py-3">
                                <span class="badge ${b.position == 'home' ? 'bg-primary' :
                                                   b.position == 'category' ? 'bg-warning' :
                                                   b.position == 'sidebar' ? 'bg-info' : 'bg-secondary'} rounded-pill">
                                    <i class="bi bi-${b.position == 'home' ? 'house' :
                                                     b.position == 'category' ? 'grid-3x3-gap' :
                                                     b.position == 'sidebar' ? 'layout-sidebar' : 'question'} me-1"></i>
                                    ${b.position == 'home' ? 'Trang chủ' :
                                      b.position == 'category' ? 'Danh mục' :
                                      b.position == 'sidebar' ? 'Thanh bên' : b.position}
                                </span>
                            </td>
                            <td class="py-3">
                                <c:choose>
                                    <c:when test="${not empty b.link}">
                                        <div class="d-flex align-items-center">
                                            <i class="bi bi-link-45deg text-primary me-1"></i>
                                            <a href="${b.link}" target="_blank" class="text-primary text-decoration-none small"
                                               title="${b.link}">
                                                ${b.link.length() > 30 ? b.link.substring(0, 30).concat('...') : b.link}
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-muted small">
                                            <i class="bi bi-dash-circle me-1"></i>Không có liên kết
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center py-3 pe-4">
                                <div class="btn-group shadow-sm" role="group">
                                    <button type="button" class="btn btn-outline-info btn-sm rounded-start-3"
                                            data-bs-toggle="modal" data-bs-target="#viewModal${b.id}"
                                            data-bs-toggle="tooltip" title="Xem chi tiết">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <a href="banners?action=edit&id=${b.id}"
                                       class="btn btn-outline-warning btn-sm"
                                       data-bs-toggle="tooltip" title="Chỉnh sửa">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="banners?action=delete&id=${b.id}"
                                       class="btn btn-outline-danger btn-sm rounded-end-3"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa banner này?')"
                                       data-bs-toggle="tooltip" title="Xóa banner">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Enhanced View Modal -->
                        <div class="modal fade" id="viewModal${b.id}" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content border-0 shadow-lg">
                                    <div class="modal-header bg-gradient-primary text-white border-0">
                                        <div class="d-flex align-items-center">
                                            <div class="me-3">
                                                <div class="bg-white bg-opacity-25 rounded-circle p-2">
                                                    <i class="bi bi-images"></i>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="modal-title mb-0">Chi tiết Banner #${b.id}</h5>
                                                <small class="opacity-75">Thông tin chi tiết về banner</small>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <!-- Banner Preview -->
                                        <div class="text-center mb-4">
                                            <div class="card border-0 bg-light">
                                                <div class="card-body">
                                                    <div class="mb-2">
                                                        <i class="bi bi-card-image text-primary me-1"></i>
                                                        <strong>Preview Banner</strong>
                                                    </div>
                                                    <img src="${pageContext.request.contextPath}/images/banners/${b.image}"
                                                         alt="${b.title}" class="img-fluid rounded shadow-sm"
                                                         style="max-height: 200px; object-fit: cover;">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Banner Details -->
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-light h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-type text-primary me-2"></i>
                                                            <strong>Tiêu đề</strong>
                                                        </div>
                                                        <div class="fw-semibold">${b.title}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-light h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-geo-alt text-success me-2"></i>
                                                            <strong>Vị trí hiển thị</strong>
                                                        </div>
                                                        <span class="badge ${b.position == 'home' ? 'bg-primary' :
                                                                           b.position == 'category' ? 'bg-warning' :
                                                                           b.position == 'sidebar' ? 'bg-info' : 'bg-secondary'} fs-6">
                                                            ${b.position == 'home' ? 'Trang chủ' :
                                                              b.position == 'category' ? 'Danh mục' :
                                                              b.position == 'sidebar' ? 'Thanh bên' : b.position}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="card border-0 bg-light">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-link-45deg text-info me-2"></i>
                                                            <strong>Liên kết</strong>
                                                        </div>
                                                        <c:choose>
                                                            <c:when test="${not empty b.link}">
                                                                <a href="${b.link}" target="_blank" class="text-primary">
                                                                    <i class="bi bi-box-arrow-up-right me-1"></i>${b.link}
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="text-muted">
                                                                    <i class="bi bi-dash-circle me-1"></i>Không có liên kết
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0 bg-light">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                            <i class="bi bi-x-circle me-1"></i>Đóng
                                        </button>
                                        <a href="banners?action=edit&id=${b.id}" class="btn btn-warning">
                                            <i class="bi bi-pencil me-1"></i>Chỉnh sửa
                                        </a>
                                        <a href="banners?action=delete&id=${b.id}"
                                           class="btn btn-danger"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa banner này?')">
                                            <i class="bi bi-trash me-1"></i>Xóa Banner
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty banners}">
            <div class="text-center py-5">
                <div class="empty-state-illustration mb-4">
                    <div class="position-relative d-inline-block">
                        <div class="bg-light rounded-circle p-4 shadow-sm">
                            <i class="bi bi-images display-1 text-muted"></i>
                        </div>
                        <div class="position-absolute top-0 end-0">
                            <div class="bg-primary text-white rounded-circle p-2">
                                <i class="bi bi-plus"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="text-muted mb-2">Chưa có banner nào</h4>
                <p class="text-muted mb-4">Tạo banner đầu tiên để hiển thị quảng cáo và thông tin quan trọng trên website.</p>
                <div class="d-flex justify-content-center gap-2">
                    <a href="banners?action=add" class="btn btn-primary btn-sm">
                        <i class="bi bi-plus-circle me-1"></i>Thêm Banner
                    </a>
                    <button class="btn btn-outline-secondary btn-sm">
                        <i class="bi bi-arrow-clockwise me-1"></i>Làm mới
                    </button>
                </div>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="/views/admin/common/footer.jsp" />
