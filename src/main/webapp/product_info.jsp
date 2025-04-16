<%@ page import="com.beauty.skincare.model.Product" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%
    String idParam = request.getParameter("id");
    Product product = null;

    if (idParam != null) {
        try {
            int productId = Integer.parseInt(idParam);

            // Sample code: you should use your DAO or service class here
            // Assuming you have a ProductDAO with a method: getProductById(int id)
            com.beauty.skincare.dao.ProductDAO dao = new com.beauty.skincare.dao.ProductDAO();
            product = dao.getProductByID(productId);
            request.setAttribute("product", product);
        } catch (NumberFormatException e) {
            e.printStackTrace(); // handle invalid id
        }
    }
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details - Beauty & Skin Care</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .product-image {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 8px;
        }
        .back-btn {
            margin-top: 20px;
        }
        .product-details {
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <%
        if(product==null)
         product = (Product) request.getAttribute("product");

        if (product != null) {
            String base64Image = "";
            if (product.getImage() != null) {
                base64Image = Base64.getEncoder().encodeToString(product.getImage());
            }
        
            
    %>
    <div class="row">
        <div class="col-md-6">
            <img src="data:image/jpeg;base64,<%= base64Image %>" class="product-image" alt="<%= product.getName() %>">
        </div>
        <div class="col-md-6 product-details">
            <h2><%= product.getName() %></h2>
            <p class="text-muted"><strong>Category:</strong> <%= product.getCategory() %></p>
            <h4 class="text-danger mb-3">₹<%= product.getPrice() %></h4>
            <p><strong>Description:</strong> <%= product.getDescription() != null ? product.getDescription() : "No description available." %></p>

            <form action="AddToCartServlet" method="get" class="mt-4">
    <input type="hidden" name="productId" value="<%= product.getId() %>">

    <div class="input-group mb-3" style="width: 160px;">
        <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(-1)">−</button>
        <input type="text" class="form-control text-center" name="quantity" id="quantityInput" value="1" readonly>
        <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(1)">+</button>
    </div>

    <div id="stockWarning" class="text-danger small mb-2" style="display: none;">
        Not enough stock available!
    </div>

    <button type="submit" class="btn btn-success" id="addToCartBtn">
        <i class="fas fa-cart-plus"></i> Add to Cart
    </button>
      </form>

<script>
    const maxStock = <%= product.getStock() %>;

    function changeQuantity(change) {
        const input = document.getElementById("quantityInput");
        let current = parseInt(input.value);
        current += change;

        if (current < 1) current = 1;
        if (current > maxStock) {
            current = maxStock;
            document.getElementById("stockWarning").style.display = "block";
        } else {
            document.getElementById("stockWarning").style.display = "none";
        }

        input.value = current;
    }
</script>

<% } else { %>
    <div class="alert alert-danger text-center">Product not found!</div>
    <% } %>

    <a href="<%=request.getContextPath()%>/HomePageProductsServlet" class="btn btn-outline-secondary back-btn"><i class="fas fa-arrow-left"></i> Back to Products</a>
        </div>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
