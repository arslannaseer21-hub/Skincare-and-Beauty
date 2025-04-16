

<%@page import="java.util.List"%>
<%@page import="com.beauty.skincare.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if(user==null)
     {
      response.sendRedirect("error_pages/unauthorized.jsp");
     }
     else  if (!"MANAGER".equalsIgnoreCase(user.getRole().name()) ) {
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

        <title>All Staff</title>
    </head>
    <body>
                        <div class="section mt-5">
                    <h2 class="mb-4">All Staff </h2>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                        </tr>
                        </thead>
                        
                        <tbody>
                            <%
                            int index=1;
                            List<User> staff=(List)request.getAttribute("staffList");
                            if(staff!=null)
                            for(User u:staff)
                            {
                            %>
                            <tr>
                                <td><%=index++%></td>
                                <td><%=u.getName()%></td>
                                <td><%= u.getUsername()%></td>
                                <td><%= u.getEmail()%></td>
                                <td><%=u.getContactNumber()%></td>
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
