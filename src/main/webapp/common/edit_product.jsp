<%@page import="com.beauty.skincare.model.Product"%>
<%@page import="com.beauty.skincare.model.UserRole"%>
<%@page import="com.beauty.skincare.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- External CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Products</title>
</head>
<%Product product=(Product)request.getAttribute("product");%>
<body>
       <!-- Sidebar -->
        <div class="sidebar">
             <h2 style="color:white"> Menu</h2>
            <ul>
               <li><a href="<%
                         User user = (User) session.getAttribute("user");
                         if(user!=null )
                         {
                         if(user.getRole().equals(UserRole.STAFF))
                         out.print(request.getContextPath()+"/staff_dashboard.jsp");
                         else if(user.getRole().equals(UserRole.MANAGER))
                          out.print(request.getContextPath()+"/manager_dashboard.jsp");
                          }
                       
                       %>" >Back To Dashboard</a></li> 
                
            </ul>
        </div>
    <div class="main-content">
        <div class="section">
            <form action="${pageContext.request.contextPath}/SaveUpdatedProductServlet" method="post" enctype="multipart/form-data">
                <h2>Update Product</h2>
                <br>
                 <input type="hidden" name="id" id="id" value="<%=product.getId()%>"  />
               
                <input type="text" name="p_name" id="p_name" placeholder="Product Name" class="form-control mb-2" value="<%=product.getName()%>" required />
                <input type="number" step="0.01" name="p_price" id="p_price" placeholder="Price" class="form-control mb-2" value="<%=product.getPrice()%>" required/>
                <input type="text" name="p_desc" id="p_desc" placeholder="Description" class="form-control mb-2" value="<%=product.getDescription()%>" required/>
                <input type="number" name="p_stock" id="p_stock" placeholder="Items in Stock" class="form-control mb-2" value="<%=product.getStock()%>" required/>
                <input type="text" name="p_category" id="p_category" placeholder="Category" class="form-control mb-2" value="<%=product.getCategory()%>" required/>

                <!-- Upload Image -->
                <img src="image?id=<%=product.getId()%>&v=<%=System.currentTimeMillis()%>" width="100" height="100" class="img-thumbnail" alt="Product Image">

                <label for="p_image">Change Image:</label><br>
                <input type="file" id="p_image" name="p_image" class="form-control" accept="image/*" onchange="handleImageSelect()" >
                <p id="file-name" style="margin-top: 5px; font-style: italic;"></p>
                
                <br>
                <button type="submit" class="btn btn-primary">Update Product</button>
            </form>
        </div>

       
    </div>

    <!-- JavaScript to Display File Name -->
    <script>
        function handleImageSelect() {
            const input = document.getElementById('p_image');
            const fileNameDisplay = document.getElementById('file-name');
            if (input.files.length > 0) {
                fileNameDisplay.textContent = "Selected: " + input.files[0].name;
            } else {
                fileNameDisplay.textContent = "No file selected";
            }
        }
    </script>
</body>
</html>
