<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tourist Profile Update</title>
<style type="text/css">
	body {
    display: flex;
    justify-content: center;
    align-items: center;
    /* background: linear-gradient(30deg, #6cb2f8, #142536); */
    background: #ccccff;
    background-repeat: no-repeat;
    
    .login {
    position: relative;
    left: 0;
    top: 80px;
    background: #fff;
    width: 580px;
    height: 720px;
    border-radius: 20px;
    box-shadow: 0 0 3px 5px rgba(0, 0, 0, 0.2), 0 0 3px 5px rgba(0, 0, 0, 0.2), 0 0 4px 6px rgba(0, 0, 0, 0.1), 0 0 5px 7px rgba(0, 0, 0, 0.1);
    
     .content {
    position: relative;
    left: 15%;
    top: 60px;
}

input[type=text],
input[type=password],input[type=email] {
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
<%
String touristid = request.getParameter("touristID");
String fname = request.getParameter("fName");
String lname = request.getParameter("lName");
String email = request.getParameter("Email");
String phone = request.getParameter("PhoneNo");
String username = request.getParameter("UserName");
String password = request.getParameter("Password");

%>
<div class="login">
	<div class="content">
		<h2> Profile Update</h2>

		<form action="UpdateTouristProfileServlet" method="post">
			<input type="hidden" name="TouristID" value="<%=touristid%>">
			<table>
				<tr>
					<td>Change Your First Name: </td>
					<td><input type = "text" name="FName" value="<%=fname%>" required></td>
				</tr>
				<tr>
					<td>Change Your Last Name: </td>
					<td><input type = "text" name="LName" value="<%=lname%>" required></td>
				</tr>
				<tr>
					<td>Change Your Email: </td>
					<td><input type = "email" name="Email" value="<%=email%>"required></td>
				</tr>
				<tr>
					<td>Change Your Phone Number: </td>
					<td><input type = "text" name="PhoneNo" value="<%=phone%>" required></td>
				</tr>
				
				<tr>
					<td>Change Your User Name: </td>
					<td><input type = "text" name="UserName" value="<%=username%>" required></td>
				</tr>
				
				<tr>
					<td>Change Your Password: </td>
					<td><input type = "password" name="Password" id="mypass" value="<%=password%>" required><br/>
					<input type="checkbox" onclick="dispass()"> <label> Show Password</label> <br/></td>
				</tr>
		
				<tr>
					<td><input type="Submit" Value="Update Profile"></td>
				</tr>
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