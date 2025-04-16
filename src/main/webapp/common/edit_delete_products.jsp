<%-- 
    Document   : view_staff
    Created on : Apr 13, 2025, 11:48:11 AM
    Author     : 120123
--%>

<%@page import="com.beauty.skincare.model.UserRole"%>
<%@page import="com.beauty.skincare.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.beauty.skincare.model.Product"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <!-- Link to Bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        
        <!-- Link to External css file -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

        <title>All Products</title>
    </head>
    <body>
         <!-- Sidebar -->
        <div class="sidebar">
             <h2 style="color:white">Manager Dashboard</h2>
            <ul>
               
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
        
                        <div class="section mt-5">
                               <h2 style="color:<%
                    
                    if(request.getAttribute("msg")!=null)
                    {
                    String msg=(String)request.getAttribute("msg");
                    if(msg.contains("Error"))
                    out.print("red");
                    else
                     out.print("green");
                   }
                   else
                    out.print("green");
                    
                    %> "><% 
                    if(request.getAttribute("msg")!=null)
                    out.print(request.getAttribute("msg"));
                    
                    %></h2>
                    
                    
                    <h2 class="mb-4">All Products </h2>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Stock</th>
                            <th>Image</th>
                            <th>Action</th>
                             <th>Action</th>
                        </tr>
                        </thead>
                        
                        <tbody>
                            <%
                            int index=1;
                            List<Product> list=(List)request.getAttribute("productList");
                            if(list!=null)
                            for(Product p:list)
                            {
                            %>
                            <tr>
                                <td><%=index++%></td>
                                <td><%=p.getName()%></td>
                                <td><%= p.getPrice()%></td>
                                <td><%= p.getDescription()%></td>
                                <td><%=p.getStock()%></td>
                                 <td>
                                  <img src="image?id=<%=p.getId()%>" width="100" height="100" class="img-thumbnail" alt="Product Image">
                                 </td>
                                 <td><h2><a href="${pageContext.request.contextPath}/DeleteProductServlet?id=<%=p.getId()%>" class="btn btn-primary">Delete</a></h2></td>
                                 <td><h2><a href="${pageContext.request.contextPath}/UpdateProductServlet?id=<%=p.getId()%>" class="btn btn-primary">Edit</a></h2></td>

                            </tr>
                            <%
                                }
                            else
                            {
                                    
                                    
                                    
                            %>
                            <tr><td colspan="5" class="text-center">No Product  Found</tr>
                            <%}%>
                        </tbody>
                        
                    </table>
                </div>
        </div>
       
    </body>
</html>
