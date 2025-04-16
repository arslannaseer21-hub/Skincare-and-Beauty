<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.beauty.skincare.model.Cart" %>
<%@ page import="java.util.*" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.getItems().isEmpty()) {
        response.sendRedirect("user_cart.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - Beauty & Skin Care</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .checkout-box {
            margin-top: 80px;
            padding: 40px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="checkout-box mx-auto col-md-6">
        <h3 class="mb-4">Choose Payment Method</h3>

        <form action="CheckoutServlet" method="post">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="CASH" checked>
                <label class="form-check-label" for="cod">
                    Cash on Delivery
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="card" value="CREDIT_CARD">
                <label class="form-check-label" for="card">
                    Credit Card
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="debit" value="DEBIT_CARD">
                <label class="form-check-label" for="paypal">
                    Debit Card
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="E_WALLET" value="E_WALLET">
                <label class="form-check-label" for="paypal">
                   E Wallet
                </label>
            </div>
            
            <br><!-- comment -->
            <br><!-- comment -->
            <input type="text" name="address" placeholder="Shipping address" required/>

            <div class="mt-4 d-flex justify-content-between">
                <a href="user_cart.jsp" class="btn btn-outline-secondary">← Back to Cart</a>
                <button type="submit" class="btn btn-success">Place Order</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
