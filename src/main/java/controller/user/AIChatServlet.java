package controller.user;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.ChatMessage;
import model.Customer;
import model.Product;
import service.AIService;
import service.AIParser;
import dao.ProductDAO;
import dao.CartItemDAO;

import java.io.IOException;
import java.util.*;

@WebServlet("/user/chat")
public class AIChatServlet extends HttpServlet {
    private final AIService aiService = new AIService();
    private final AIParser parser = new AIParser(new ProductDAO());
    private final CartItemDAO cartDAO = new CartItemDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        String userInput = request.getParameter("message");

        List<ChatMessage> history = (List<ChatMessage>) session.getAttribute("chatHistory");
        if (history == null) history = new ArrayList<>();
        history.add(new ChatMessage("user", userInput));

        Map<String, Object> pendingCart = (Map<String, Object>) session.getAttribute("pendingCart");
        String aiReply;

        if (pendingCart != null && userInput.equalsIgnoreCase("yes") && customer != null) {
            int productId = Integer.parseInt(pendingCart.get("productId").toString());
            int quantity = Integer.parseInt(pendingCart.get("quantity").toString());
            Product product = new ProductDAO().getProductById(productId);

            cartDAO.saveOrUpdate(customer, product, quantity);
            session.removeAttribute("pendingCart");
            aiReply = "✅ The product has been added to your cart.";
        } else {
            aiReply = aiService.askAI(userInput);

            Map<String, Object> cartAction = parser.extractCartAction(aiReply);
            if (cartAction != null) {
                session.setAttribute("pendingCart", cartAction);
            }
        }

        history.add(new ChatMessage("bot", aiReply));
        session.setAttribute("chatHistory", history);
        request.setAttribute("chatHistory", history);
        request.getRequestDispatcher("/views/user/chatbox.jsp").forward(request, response);
    }
}
