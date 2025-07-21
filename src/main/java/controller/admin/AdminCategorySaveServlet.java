package controller.admin;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import model.Category;

import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(name = "AdminCategorySaveServlet", urlPatterns = {"/admin/category/save"})
@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // Giới hạn ảnh 2MB

public class AdminCategorySaveServlet extends HttpServlet {

    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int id = request.getParameter("id") == null || request.getParameter("id").isEmpty()
                ? 0 : Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
        String slug = request.getParameter("slug");
        String description = request.getParameter("description");
        boolean active = request.getParameter("active") != null;

        // Xử lý ảnh upload
        Part imagePart = request.getPart("image");
        String imageUrl = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String savePath = request.getServletContext().getRealPath("/images/category");
            File uploadDir = new File(savePath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            imagePart.write(savePath + File.separator + fileName);
            imageUrl = "images/category/" + fileName;
        }

        // Nếu cập nhật → lấy category cũ
        Category c = id == 0 ? new Category() : categoryDAO.findById(id);
        c.setName(name);
        c.setSlug(slug);
        c.setDescription(description);
        c.setActive(active);
        if (imageUrl != null) c.setImageUrl(imageUrl); // chỉ set ảnh mới nếu upload
        // updatedAt tự set trong @PreUpdate

        if (id == 0) {
            categoryDAO.insert(c);
        } else {
            categoryDAO.update(c);
        }

        response.sendRedirect(request.getContextPath() + "/admin/categories");
    }
}
