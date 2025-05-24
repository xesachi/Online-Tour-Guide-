<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Tourist</title>
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
<div class="login">
	<div class="content">
		<h2>Register</h2>
		<form action="TouristInsertServlet" method="post">
			<table>
				<tr>
					<td>Enter Your First Name: <br/>
					<input type = "text" name="FName" required></td>
				</tr>
				<tr>
					<td>Enter Your Last Name: <br/>
					<input type = "text" name="LName" required></td>
				</tr>
				<tr>
					<td>Enter Your Email: <br/>
					<input type = "email" name="Email" required></td>
				</tr>
				<tr>
					<td>Enter Your Phone Number: <br/>
					<input type = "text" name="PhoneNo" required></td>
				</tr>
				<tr>
					<td>Enter Your User Name: <br/>
					<input type = "text" name="UserName" required></td>
				</tr>
				<tr>
					<td>Enter Your Password: <br/>
					<input type = "password" name="Password" id="mypass" required><br/>
					<input type="checkbox" onclick="dispass()"> <label> Show Password</label> <br/></td>
				</tr>
		
				<tr>
					<td><input type="Submit" Value="Register"></td>
				</tr>
			</table>
		</form>
	</div>
</div>

 <script type="text/javascript" defer="defer">
 document.querySelector("form").addEventListener("submit", function(e) {
	    const password = document.querySelector("[name='Password']").value;
	    if (password.length < 8) {
	        e.preventDefault();
	        alert("Password must be at least 8 characters");
	    }
	});
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