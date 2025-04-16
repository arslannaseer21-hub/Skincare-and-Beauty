<%@ page import="com.beauty.skincare.model.Product" %>
<%@ page import="com.beauty.skincare.model.User" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Beauty & Skin Care Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background: #f8f9fa;
        }
        .top-links {
            text-align: right;
            padding: 10px;
            background: #fff;
        }
        .top-links a {
            margin-left: 15px;
            color: #007bff;
            text-decoration: none;
        }
        .top-bar {
            background: #ffffff;
            padding: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            border-bottom: 1px solid #ddd;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #e83e8c;
        }
        .search-form {
            flex: 1;
            max-width: 500px;
            margin: 0 auto;
        }
        .product-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .product-image {
            height: 200px;
            object-fit: cover;
        }
        .footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 40px 0;
        }
        .footer a {
            color: #ffffff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .footer .social-icons i {
            margin-right: 15px;
            font-size: 18px;
        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
%>

<!-- Top links for login/signup or welcome -->
<div class="top-links container">
    <% if (user == null) { %>
        <a href="login.jsp">Login</a>
        <a href="register_new_customer.jsp">Sign Up</a>
    <% } else { %>
        <span class="text-muted me-3">Welcome, <%= user.getName() %>!</span>
        <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
    <% } %>
</div>

<!-- Logo + Search Bar + Cart -->
<div class="top-bar container">
    <div class="logo">Beauty & SkinCare</div>
    <form class="search-form d-flex" action="SearchServlet" method="get">
        <input class="form-control me-2" type="search" name="query" placeholder="Search for products..." aria-label="Search">
        <button class="btn btn-outline-success me-2" type="submit">Search</button>
        <a href="user_cart.jsp" class="btn btn-outline-primary">
            <i class="fas fa-shopping-cart"></i> Cart
        </a>
    </form>
</div>

<!-- Product Grid -->
<div class="container py-5">
    <h2 class="text-center mb-4">Explore Our Beauty & Skin Care Products</h2>
    <div class="row g-4">

        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
                    String base64Image = "";
                    if (product.getImage() != null) {
                        base64Image = Base64.getEncoder().encodeToString(product.getImage());
                    }
        %>
        <div class="col-sm-6 col-md-4 col-lg-3">
            <div class="card product-card h-100">
                <img src="data:image/jpeg;base64,<%= base64Image %>" class="card-img-top product-image" alt="<%= product.getName() %>">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text text-muted">₹<%= product.getPrice() %></p>
                    <p class="card-text"><%= product.getCategory() %></p>
                    <a href="product_info.jsp?id=<%= product.getId() %>" class="btn btn-primary mt-auto">View Details</a>
                    
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="col-12">
            <div class="alert alert-warning text-center">No products available at the moment. Please check back later.</div>
        </div>
        <%
            }
        %>

    </div>
</div>

<!-- Footer -->
<footer class="footer mt-auto">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>About Beauty & SkinCare</h5>
                <p>Your one-stop destination for all things beauty and skincare. Quality products, trusted brands, and glowing skin guaranteed!</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="terms.jsp">Terms & Conditions</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Follow Us</h5>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f text-white"></i></a>
                    <a href="#"><i class="fab fa-twitter text-white"></i></a>
                    <a href="#"><i class="fab fa-instagram text-white"></i></a>
                    <a href="#"><i class="fab fa-pinterest text-white"></i></a>
                </div>
                <p class="mt-3">© 2025 Beauty & SkinCare. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
