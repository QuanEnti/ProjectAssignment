

package service;

import dao.CartItemDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dao.WishlistDAO;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.CartItem;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Review;
import util.GeminiClient;
import util.GeminiClientBestSelling;
import util.GeminiClientForRecommend;
import util.GeminiClientRecommendForYou;



public class AIService {
    private final ProductDAO productDAO = new ProductDAO();
    private final ReviewDAO reviewDAO = new ReviewDAO();
    private final OrderDAO orderDAO = new OrderDAO();
    private final OrderDetailDAO detailDAO = new OrderDetailDAO();
    private final CartItemDAO cartItemDAO = new CartItemDAO();
    private final WishlistDAO wishlistDAO = new WishlistDAO();

    public String askAI(String userInput) {
        List<Product> products = productDAO.findAllProductDetail();
        StringBuilder menu = new StringBuilder("Handmade Product List:\n");

        for (Product p : products) {
            menu.append("🛍️ ").append(p.getName()).append("\n")
                .append("ProductID: ").append(p.getId()).append("\n")
                .append("📝 ").append(p.getDescription()).append("\n")
                .append("🏷️ Category: ").append(p.getCategory().getName()).append("\n");

            menu.append("🔍 Variations: (Placeholder)\n");

            List<Review> reviews = p.getReviewList();
            if (reviews != null && !reviews.isEmpty()) {
                double avg = reviews.stream().mapToInt(Review::getRating).average().orElse(0);
                menu.append("⭐ Rating: ").append(String.format("%.1f/5", avg))
                    .append(" (" + reviews.size() + " reviews)\n");
            }
            menu.append("\n");
        }

        String prompt = """
        You are an enthusiastic sales assistant for a handmade store.
        🔹 When customer wants to add to cart, confirm and respond using:
        ```json
        {"isCartAction":true,"productId":"...","quantity":1,"name":"..."}
        ```
        Then wait for Yes/No:
        ```json
        {"needsConfirmation":true}
        ```
        Product Catalog:
        %s
        Customer says: %s
        """.formatted(menu.toString(), userInput);

        try {
            return GeminiClient.sendPrompt(prompt);
        } catch (IOException e) {
            return e.getMessage();
        }
    }

    public String recommendForUser(Customer customer) {
        List<Product> all = productDAO.getAllProducts();
        List<Product> wishlist = wishlistDAO.getWishlistedProducts(customer);
        List<CartItem> cart = cartItemDAO.getCartItemsByCustomer(customer);
        List<Order> orders = orderDAO.getOrdersByCustomerId(customer.getId());

        StringBuilder prompt = new StringBuilder("Recommend products for this user:\n\n");

        prompt.append("🛒 Cart:\n");
        for (CartItem c : cart)
            prompt.append("- ").append(c.getProduct().getName()).append("\n");
        if (cart.isEmpty()) prompt.append("- [Empty]\n");

        prompt.append("\n❤️ Wishlist:\n");
        for (Product p : wishlist)
            prompt.append("- ").append(p.getName()).append("\n");
        if (wishlist.isEmpty()) prompt.append("- [Empty]\n");

        prompt.append("\n📦 Orders:\n");
        for (Order o : orders)
            for (OrderDetail d : o.getOrderDetailsList())
                prompt.append("- ").append(d.getProduct().getName()).append("\n");
        if (orders.isEmpty()) prompt.append("- [Empty]\n");

        prompt.append("\n📋 All Products:\n");
        for (Product p : all)
            prompt.append("- ").append(p.getName()).append(" (ID: ").append(p.getId()).append(")\n");

        try {
            return GeminiClientRecommendForYou.sendPrompt(prompt.toString());
        } catch (IOException e) {
            return e.getMessage();
        }
    }

    public String recommendByProductAi(int productId) {
        Product current = productDAO.getProductById(productId);
        List<Product> all = productDAO.getAllProducts();

        StringBuilder prompt = new StringBuilder("Based on this product, recommend 5 similar:\n");
        prompt.append("Current: ").append(current.getName()).append("\n");

        for (Product p : all) {
            if (p.getId() == productId) continue;
            prompt.append("- ").append(p.getName()).append(" (ID: ").append(p.getId()).append(")\n");
        }

        try {
            return GeminiClientForRecommend.sendPrompt(prompt.toString());
        } catch (IOException e) {
            return e.getMessage();
        }
    }

    public String bestSellingAI() {
        List<OrderDetail> details = detailDAO.findAll();
        Map<Product, Integer> map = new HashMap<>();
        for (OrderDetail d : details) {
            Product p = d.getProduct();
            map.put(p, map.getOrDefault(p, 0) + d.getQuantity());
        }

        StringBuilder prompt = new StringBuilder("Top best-sellers by quantity:\n");
        map.entrySet().stream()
           .sorted(Map.Entry.<Product, Integer>comparingByValue().reversed())
           .limit(10)
           .forEach(e -> prompt.append("**").append(e.getKey().getName())
               .append(" (ID: ").append(e.getKey().getId()).append(")**\n")
               .append("Quantity Sold: ").append(e.getValue()).append("\n")
               .append("Description: ").append(e.getKey().getDescription()).append("\n\n"));

        try {
            return GeminiClientBestSelling.sendPrompt(prompt.toString());
        } catch (IOException e) {
            return e.getMessage();
        }
    }

    public String recommendPopularAi() {
        List<Review> feedback = reviewDAO.getAll();
        List<Product> products = productDAO.findAllProductDetail();

        Map<Product, Double> scores = new HashMap<>();
        for (Product p : products) {
            double avg = feedback.stream()
                .filter(f -> f.getProduct().equals(p))
                .mapToInt(Review::getRating)
                .average().orElse(0.0);
            long count = feedback.stream().filter(f -> f.getProduct().equals(p)).count();
            scores.put(p, avg * 2 + (count > 0 ? Math.log(count) : 0));
        }

        List<Product> sorted = scores.entrySet().stream()
            .sorted(Map.Entry.<Product, Double>comparingByValue().reversed())
            .limit(10)
            .map(Map.Entry::getKey)
            .collect(Collectors.toList());

        StringBuilder prompt = new StringBuilder("Recommend popular handmade products:\n\n");
        for (Product p : sorted) {
            double avg = feedback.stream().filter(f -> f.getProduct().equals(p)).mapToInt(Review::getRating).average().orElse(0);
            long count = feedback.stream().filter(f -> f.getProduct().equals(p)).count();
            prompt.append("ID: ").append(p.getId())
                .append(", Rating: ").append(String.format("%.1f", avg))
                .append(", Reason: Top rated with ").append(count).append(" reviews\n");
        }

        try {
            return GeminiClientForRecommend.sendPrompt(prompt.toString());
        } catch (IOException e) {
            return e.getMessage();
        }
    }
}
