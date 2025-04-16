<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
    #createCustomer {
        display: none; /* Initially hide the link */
    }
</style>

</head>
<body>

    <div class="login-container">
        <h2>Login</h2>
        
        <button class="manager-btn selected" onclick="selectButton(this)">Manager Login</button>
        <button class="staff-btn" onclick="selectButton(this)">Staff Login</button>
         <button class="customer-btn" onclick="selectButton(this)">Customer Login</button>
        
         <form action="LoginServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" id="userRole" name="userRole" value="MANAGER"> <!-- Default to manager -->
            <br>
            <input type="text" name="username" placeholder="Username" required>
            <br><br>
            <input type="password" name="password" placeholder="Password" required>
            <br><br>
            <p><a href="register_new_customer.jsp"  id="createCustomer">Create Account?</a></p> 
            <br>
            
            <button class="btn-success" type="submit">Login</button>
        </form>
         
         <br>
         <form id='guestForm' action="LoginServlet" method="post" >
             <p> <a href="#" id='guestLogin'>Guest Login</a></p>
         </form>
    </div>

    <script>
        // Function to handle button selection
        function selectButton(button) {
            // Remove 'selected' class from all buttons
            document.querySelectorAll('.manager-btn, .staff-btn, .customer-btn').forEach(btn => btn.classList.remove('selected'));
            // Add 'selected' class to clicked button
            button.classList.add('selected');
            // Set the hidden input value based on selection
           
            var text;
            if(button.innerText.includes('Manager'))
            {
                text='MANAGER';
                  document.getElementById('createCustomer').style.display = 'none';
                  
            }
            else if(button.innerText.includes('Staff'))
            {
                text='STAFF';
              document.getElementById('createCustomer').style.display = 'none';
          }
            else if(button.innerText.includes('Customer'))
            {
                text='CUSTOMER';
                 document.getElementById('createCustomer').style.display = 'inline';
            }
            else
            {
                 text='GUEST';
                  document.getElementById('createCustomer').style.display = 'none'; 
            }
            
            
            document.getElementById('userRole').value =text;
        }
        
         // Custom form validation function
        function validateForm() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;

            if (!username || !password) {
                alert('Both username and password are required.');
                return false; // Prevent form submission if validation fails
            }
            return true; // Proceed with form submission if validation passes
        }
        
        
         document.getElementById("guestLogin").addEventListener("click", function () {
                document.getElementById('userRole').value ='GUEST';
        document.getElementById("guestForm").submit();
    });
    </script>
    

</body>
</html>
