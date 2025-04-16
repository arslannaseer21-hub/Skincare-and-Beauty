<%-- 
    Document   : register_new_customer
    Created on : Apr 10, 2025, 8:05:40 PM
    Author     : 120123
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Customer</title>
    </head>
    <body>
       
        <div class="login-container">
            
            <h2>Register Customer</h2>
              <form action="CreateCustomerServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" id="userRole" name="userRole" value="CUSTOMER"> <!-- Default to manager -->
            <br>
            <input type="text" name="fullname" placeholder="Full Name" required><!-- comment -->
             <br><br>
            <input type="text" name="email" placeholder="Email" required>
            <br><br>
             <br><br>
            <input type="text" name="phone" placeholder="phone" required>
            <br><br>
            <input type="text" name="username" placeholder="Username" required>
            <br><br>
            <input type="password" name="password" placeholder="Password" required>
            <br><br>
            <p><a href="login.jsp"  id="createCustomer">Login?</a></p> 
            <br>
            
            <button class="btn-success" type="submit">Register</button>
        </form>
        </div>
    </body>
    
    <script>
        
        
    </script>
</html>
