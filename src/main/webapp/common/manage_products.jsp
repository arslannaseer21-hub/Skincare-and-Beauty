<%@page import="com.beauty.skincare.model.UserRole"%>
<%@page import="com.beauty.skincare.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user==null)
     {
      response.sendRedirect("error_pages/unauthorized.jsp");
     }
     else  if (!"MANAGER".equalsIgnoreCase(user.getRole().name()) && !"STAFF".equalsIgnoreCase(user.getRole().name())) {
    response.sendRedirect("error_pages/unauthorized.jsp");
  
    }
%>
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
<body>
       <!-- Sidebar -->
        <div class="sidebar">
             <h2 style="color:white"> Dashboard</h2>
            <ul>
                <li><a href="${pageContext.request.contextPath}/ViewProductServlet" >View Products</a></li>
                <li><a href="${pageContext.request.contextPath}/UpdateDeleteProductServlet" >Update/delete</a></li>
                <li><a href="<%
                          user = (User) session.getAttribute("user");
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
            <form action="${pageContext.request.contextPath}/ManageProductServlet" method="post" enctype="multipart/form-data">
                <h2>Add New Product</h2>
                <br>
                <input type="text" name="p_name" id="p_name" placeholder="Product Name" class="form-control mb-2" required/>
                <input type="number" step="0.01" name="p_price" id="p_price" placeholder="Price" class="form-control mb-2" required/>
                <input type="text" name="p_desc" id="p_desc" placeholder="Description" class="form-control mb-2" required/>
                <input type="number" name="p_stock" id="p_stock" placeholder="Items in Stock" class="form-control mb-2" required/>
                <input type="text" name="p_category" id="p_category" placeholder="Category" class="form-control mb-2" required/>

                <!-- Upload Image -->
                <label for="p_image">Upload Image:</label><br>
                <input type="file" id="p_image" name="p_image" class="form-control" accept="image/*" onchange="handleImageSelect()" required>
                <p id="file-name" style="margin-top: 5px; font-style: italic;"></p>

                <br>
                <button type="submit" class="btn btn-primary">Add Product</button>
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
