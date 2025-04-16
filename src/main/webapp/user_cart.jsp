<%@ page import="java.util.List" %>
<%@ page import="com.beauty.skincare.model.Cart" %>
<%@ page import="com.beauty.skincare.model.CartItem" %>
<%@ page import="com.beauty.skincare.model.Product" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart - Beauty & Skin Care</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .cart-item img {
            width: 100px;
            height: auto;
            border-radius: 8px;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Your Shopping Cart</h2>

    <% if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) { %>
        <div class="alert alert-info">Your cart is empty.</div>
          <a href="<%= request.getContextPath() %>/HomePageProductsServlet" class="btn btn-outline-primary">← Back to Products</a>
               
    <% } else { %>
        <table class="table table-bordered">
            <thead class="table-light">
            <tr>
                <th>Product</th>
                <th>Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                double total = 0.0;
                for (CartItem item : cart.getItems()) {
                    Product product = item.getProduct();
                    int quantity = item.getQuantity();
                    double subtotal = product.getPrice() * quantity;
                    total += subtotal;

                    String base64Image = "";
                    if (product.getImage() != null) {
                        base64Image = Base64.getEncoder().encodeToString(product.getImage());
                    }
            %>
            <tr class="cart-item">
                <td><%= product.getName() %></td>
                <td><img src="data:image/jpeg;base64,<%= base64Image %>" alt="product"></td>
                <td>₹<%= product.getPrice() %></td>
                <td><%= quantity %></td>
                <td>₹<%= subtotal %></td>
                <td class="action-buttons">
                    <form action="RemoveCartItemServlet" method="post">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <button type="submit" class="btn btn-sm btn-danger">Remove</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <div class="d-flex justify-content-between align-items-center">
            <h4>Total: ₹<%= total %></h4>

            <div>
                <a href="<%= request.getContextPath() %>/HomePageProductsServlet" class="btn btn-outline-primary">← Back to Products</a>
                <form action="checkout.jsp" method="post" style="display:inline;">
                    <button type="submit" class="btn btn-success">Checkout</button>
                </form>
            </div>
        </div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
