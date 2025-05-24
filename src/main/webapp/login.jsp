<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>

<style>
	body {
    display: flex;
    justify-content: center;
    align-items: center;
    /* background: linear-gradient(30deg, #6cb2f8, #142536); */
    background: #ddeeff;
    background-repeat: no-repeat;
    
    .login {
    position: relative;
    left: 0;
    top: 120px;
    background: #fff;
    width: 350px;
    height: 450px;
    border-radius: 20px;
    box-shadow: 0 0 3px 5px rgba(0, 0, 0, 0.2), 0 0 3px 5px rgba(0, 0, 0, 0.2), 0 0 4px 6px rgba(0, 0, 0, 0.1), 0 0 5px 7px rgba(0, 0, 0, 0.1);
    
    .pic {
    position: absolute;
    left: 27%;
    top: -70px;
    background: #000;
    width: 150px;
    height: 150px;
    border-radius: 100%;
    box-shadow: 0 0 3px 5px rgba(0, 0, 0, 0.2), 0 0 1px 3px rgba(0, 0, 0, 0.2), 0 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 3px 5px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.pic img {
    object-fit: cover;
    width: 100%;
    height: 100%;
}
    
    .content {
    position: relative;
    left: 15%;
    top: 80px;
}

input[type=text],
input[type=password] {
    padding: 10px;
    margin-top: 10px;
    width: 120%;
    border-radius: 15px;
}

input[type=submit] {
    position: absolute;
    
    margin-top: 30px;
    width: 60%;
    padding: 15px;
    background: linear-gradient(#0abbe7, #2f0687);
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    border-radius: 20px;
}


</style>
</head>
<body>
<div class="login">
	<!--<div class="pic">
            <img src="medialogo.png" alt="">
    </div>-->
	<div class="content">
		<h2>LogIn</h2>
		<% if (request.getParameter("error") != null) { %>
		    <div class="error-message">
		        <%= request.getParameter("error").equals("invalid_credentials") ? 
		            "Invalid username/password" : "Login error occurred" %>
		    </div>
		<% } %>
		<form action="LoginServlet" method="post">
			<table>
				<tr>
					<td>UserName:<br/> 
					<input type = "text" name="UserName" required></td>
				</tr>
				<tr>
					<td>Password:<br/>
					<input type = "password" name="Password" id="mypass" required><br/>
					<input type="checkbox" onclick="dispass()"> <label> Show Password</label> <br/></td>
				</tr>
				<tr>
					<td><input type="Submit" Value="Login"></td>
				</tr>
				<tr><td><a href="TouristRegister.jsp">User Register</a></td></tr>
			</table>
		
		</form>
	</div>
</div>

 <script type="text/javascript" defer="defer">
        function dispass() {
            var showpass = document.getElementById('mypass');
            if (showpass.type == "password") {
                showpass.type = "text";
            } else {
                showpass.type = "password";
            }
        }
 </script>
</body>
</html>