<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tourist Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style type="text/css">
:root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --dark-color: #34495e;
            --light-color: #ecf0f1;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            position: relative;
            min-height: 100vh;
            padding-bottom: 60px;
        }
        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color) !important;
        }
        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 30px 0;
            margin-top: 50px;
        }
        .footer a {
            text-decoration: none;
            color: #ecf0f1;
        }
        .footer a:hover {
            color: var(--primary-color);
        }
        .user-profile-icon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            background-color: var(--primary-color);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            text-decoration: none;
        }
.profileName{
	position:relative;
	display: flex;
    justify-content: center;
    align-items: center;
    margin-top:50px;
    font-size:32px;
    font-family:'popins';
}
.profileName a .logout{
position:relative;
left:35vw;
width:70px;
height:40px;
font-size:18px;
background-color:blue; 
color:white; 
cursor:pointer;

}
h3{
	position:relative;
	display: flex;
    justify-content: center;
    align-items: center;
    font-size:24px;
    font-family:'popins';
	
}
hr{
border-color:blue;
}
label{
	position:relative;
	display: flex;
	font-size:16px;
}
.userDetails, .personalDetails{
position:relative;
margin:50px;
	}
.buttons{
	position:relative;
	display: inline-flex;
	
	margin:50px;
}
.updateButton button{
	background-color:green; 
	color:white; 
	cursor:pointer;
}
.deleteButton button{
	background-color:red; 
	color:white; 
	cursor:pointer;
	margin-left:75vw;
	}
	
	
</style>
</head>
<body>
<c:if test="${empty user}">
    <c:redirect url="login.jsp?error=session_expired"/>
</c:if>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fas fa-map-marked-alt me-2"></i>TourGuide Pro</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
    </div>
</nav>

<div class="profileName"> ${user.FName} ${user.LName}
<div class="logoutButton">
		<a href="login.jsp">
			<button class="logout">Logout</button>
		</a>
</div>
</div>
<hr>
<div class="userDetails">
	<h3>User Details</h3>
	<label>My Id: ${user.touristID}</label><br/>
	<label>Email Address: ${user.email}</label><br/>
	<label>User Name: ${user.userName}</label><br/>
	<label>Login Password:<input type="password" class="showpass" value=" ${user.password}" readonly></label><br/>
	
</div>
<hr>
<div class ="personalDetails">
	<h3>Personal Details</h3>
	<label>FirstName: ${user.FName}</label><br/>
	<label> Last Name: ${user.LName}</label><br/>
	<label>Phone Number: ${user.phoneNo}</label><br/>
</div>

<div class="buttons">
	<div class="updateButton">
		<a href="TouristUpdate.jsp?touristID=${user.touristID}&fName=${user.FName}&lName=${user.LName}&Email=${user.email}&PhoneNo=${user.phoneNo}&UserName=${user.userName}&Password=${user.password}">
			<button style="">Update data</button>
		</a>
	</div>
	<div class="deleteButton">
		<form action="DeleteTouristProfileServlet" method="post">
			<input type="hidden" name="id" value = "${user.touristID}"/>
			<button>Delete data</button>
		</form>
	</div>
</div>	

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4 mb-md-0">
                <h5>TourGuide Pro</h5>
                <p>Connecting travelers with local experts for unforgettable experiences around the world.</p>
            </div>
            <div class="col-md-2 mb-4 mb-md-0">
                <h5>Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">Home</a></li>
                    <li><a href="#guides" class="text-white">Guides</a></li>
                    <li><a href="admin_login.jsp" class="text-white">Admin</a></li>
                    <li><a href="#contact" class="text-white">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-4 mb-4 mb-md-0" id="contact">
                <h5>Contact Us</h5>
                <ul class="list-unstyled">
                    <li><i class="fas fa-map-marker-alt me-2"></i> 123 Tour Street, City</li>
                    <li><i class="fas fa-phone me-2"></i> +1 234 567 890</li>
                    <li><i class="fas fa-envelope me-2"></i> info@tourguidepro.com</li>
                </ul>
            </div>
            <div class="col-md-2">
                <h5>Follow Us</h5>
                <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-white me-2"><i class="fab fa-twitter"></i></a>
                <a href="#" class="text-white me-2"><i class="fab fa-instagram"></i></a>
                <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
        <hr class="mt-4 mb-4 bg-light">
        <div class="text-center">
            <p class="mb-0">&copy; 2023 TourGuide Pro. All rights reserved.</p>
        </div>
    </div>
</footer>


</body>
</html>