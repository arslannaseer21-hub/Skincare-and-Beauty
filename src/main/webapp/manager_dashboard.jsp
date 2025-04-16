<%@page import="com.beauty.skincare.model.User"%>
<%
    User user = (User) session.getAttribute("user");
     if(user==null)
     {
      response.sendRedirect("error_pages/unauthorized.jsp");
     }
      else if (!"MANAGER".equalsIgnoreCase(user.getRole().name())) {
    response.sendRedirect("error_pages/unauthorized.jsp");
  
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manager Dashboard</title>
        
        <!-- Link to Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        
        <!-- Link to Bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        
        <!-- Link to External css file -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

        <style>
            /* Sidebar Styling */
            .sidebar {
                width: 250px;
                height: 100vh;
                position: fixed;
                background: #343a40;
                padding-top: 20px;
                color: white;
            }

            .sidebar h2 {
                text-align: center;
                padding-bottom: 20px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            }

            .sidebar ul {
                list-style: none;
                padding: 0;
            }

            .sidebar ul li {
                padding: 15px 20px;
            }

            .sidebar ul li a {
                color: white;
                text-decoration: none;
                display: block;
                transition: 0.3s;
            }

            .sidebar ul li a:hover {
                background: #007bff;
                border-radius: 5px;
            }

            /* Main Content */
            .main-content {
                margin-left: 270px;
                padding: 30px;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .sidebar {
                    width: 100%;
                    height: auto;
                    position: relative;
                }

                .main-content {
                    margin-left: 0;
                }
            }
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
             <h2 style="color:white">Manager Dashboard</h2>
            <ul>
                <li><a href="manager_pages/add_staff.jsp"><i class="fa-solid fa-users"></i> Manage Staff</a></li>
                <li><a href="common/manage_products.jsp"><i class="fa-brands fa-product-hunt"></i> Manage Products</a></li>
                <li><a href="manager_pages/manage_sales.jsp"><i class="fa-solid fa-chart-line"></i> View Sales</a></li>
                 <li><a href="${pageContext.request.contextPath}/LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i></i> Logout</a></li>
            </ul>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <h1 class="mb-4">Welcome <%
                
                 user=(User)session.getAttribute("user");
                if(user!=null)
                {
                
                out.print(user.getName());
                }
                else
                {
                response.sendRedirect("error_pages/unauthorized.jsp");
            }
                
                
                %></h1>
                
                
                
        </div>
    </body>
</html>
