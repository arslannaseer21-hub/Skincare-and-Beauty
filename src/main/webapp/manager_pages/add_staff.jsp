<%-- 
    Document   : manage_staff
    Created on : Apr 12, 2025, 2:17:45 PM
    Author     : 120123
--%>
<%@page import="com.beauty.skincare.model.User"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Link to Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        
        <!-- Link to Bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        
        <!-- Link to External css file -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

        <title>Staff Management</title>
    </head>
    <body>
        <div class="container">
            
            
            <div class="section">
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
                <form action="${pageContext.request.contextPath}/ManageStaffServlet" onsubmit="return validateForm()" method="post">
                <h2>Add New Staff</h2> 
                <br>
                <input type="text" name="s_name" id="s_name" placeholder="Full Name"/>
                <input type="text" name="s_userName" id="s_userName" placeholder="User name"/>
                <input type="text" name="s_password" id="s_password" placeholder="new password"/>
                <input type="email" name="s_email" id="s_email" placeholder="email"/>
                <input type="phone" name="s_phone" id="s_phone" placeholder="Phone"/>
                <button class="btn-success" type="submit">Add Staff</button>
                </form>
            </div>
                

                <div class="Section">
                    <h2>   <a href="${pageContext.request.contextPath}/ViewStaffServlet" class="btn btn-primary">View Staff</a></h2>

                </div>
                    
            
            
        </div>
    </body>
    
    
    <script>
        function validateForm()
        {
            var name = document.getElementById('s_name').value;
            var  userName= document.getElementById('s_userName').value;
            var  pswd=document.getElementById('s_password').value;
            var email=document.getElementById('s_email').value;
            var phone = document.getElementById('s_phone').value;
            
            if(!name || !userName || !pswd || !email || !phone)
            {
                alert("Please enter data in all fields!");
                return false;
            }
            return true;
            
        }
        </script>
</html>
