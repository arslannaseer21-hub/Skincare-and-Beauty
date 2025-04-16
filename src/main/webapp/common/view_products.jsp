<%-- 
    Document   : view_staff
    Created on : Apr 13, 2025, 11:48:11 AM
    Author     : 120123
--%>

<%@page import="com.beauty.skincare.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.beauty.skincare.model.Product"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <!-- Link to Bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        
        <!-- Link to External css file -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

        <title>All Products</title>
    </head>
    <body>
                        <div class="section mt-5">
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

                            </tr>
                            <%
                                }
                            else
                            {
                                    
                                    
                                    
                            %>
                            <tr><td colspan="5" class="text-center">No Staff Member Found</tr>
                            <%}%>
                        </tbody>
                        
                    </table>
                </div>
       
    </body>
</html>
