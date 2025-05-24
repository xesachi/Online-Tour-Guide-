
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Explore With Local Guides</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
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
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
            url('https://via.placeholder.com/1500x800?text=Your+Travel+Adventure+Starts+Here') no-repeat center center/cover;
            color: white;
            padding: 120px 0;
            margin-bottom: 50px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: 700;
            text-transform: uppercase;
        }
        .hero-section p {
            font-size: 1.25rem;
            font-weight: 400;
        }
        .guide-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 10px;
            margin-bottom: 25px;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .guide-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        .guide-card img {
            border-radius: 10px;
            height: 200px;
            object-fit: cover;
            transition: all 0.4s ease;
        }
        .guide-card img:hover {
            transform: scale(1.05);
        }
        .guide-img {
            height: 200px;
            object-fit: cover;
        }
        .rating {
            color: #f39c12;
            margin-bottom: 10px;
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        .btn-primary:hover {
            background-color: #2980b9;
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
        .guide-card .card-body {
            background-color: var(--light-color);
        }
        .card-footer {
            background-color: var(--secondary-color);
            border-radius: 0 0 10px 10px;
        }
        .guide-card h5 {
            color: var(--primary-color);
            font-weight: 600;
        }
        .guide-card .btn {
            font-size: 14px;
            padding: 12px;
            text-transform: uppercase;
        }
        .guide-card .card-footer .btn-primary {
            background-color: var(--primary-color);
            border: none;
        }
        .guide-card .card-footer .btn-outline-primary {
            border-color: var(--primary-color);
            color: var(--primary-color);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fas fa-map-marked-alt me-2"></i>TourGuide Pro</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#guides">Guides</a></li>
                <li class="nav-item"><a class="nav-link" href="admin_login.jsp">Admin</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Discover Your Next Adventure</h1>
        <p class="lead mb-5">Connect with experienced local guides who will show you the hidden gems of your destination</p>
        <div class="d-flex justify-content-center gap-3">
            <a href="#guides" class="btn btn-primary btn-lg px-4">Browse Guides</a>
            <a href="#how-it-works" class="btn btn-outline-light btn-lg px-4">How It Works</a>
        </div>
    </div>
</section>

<!-- Guides Section -->
<section id="guides" class="container mb-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold">Our Featured Guides</h2>
        <p class="text-muted">Professional guides with local expertise</p>
    </div>

    <div class="row justify-content-center">
        <!-- Guide 1 -->
        <div class="col-lg-4 col-md-6">
            <div class="guide-card card h-100">
                <img src="<%= request.getContextPath() %>/images/fernando.jpg" class="card-img-top guide-img" alt="Guide 1">
                <div class="card-body">
                    <h5 class="card-title">Michael Fernando</h5>
                    <div class="rating">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i>
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
                        <span class="ms-2">4.0</span>
                    </div>
                    <p class="card-text text-muted">LIC98765 | michael@example.com | +94 713 987 654</p>
                </div>
                <div class="card-footer bg-white">
                    <a href="insert.jsp" class="btn btn-primary w-100 mb-2">Request</a>
                    <a href="InsertReview.jsp?guideID=1" class="btn btn-outline-primary w-100">Rate Now</a>
                </div>
            </div>
        </div>

        <!-- Guide 2 -->
        <div class="col-lg-4 col-md-6">
            <div class="guide-card card h-100">
                <img src="<%= request.getContextPath() %>/images/perera.jpg" class="card-img-top guide-img" alt="Guide 2">
                <div class="card-body">
                    <h5 class="card-title">Nadeesha Perera</h5>
                    <div class="rating">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i>
                        <i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
                        <span class="ms-2">3.5</span>
                    </div>
                    <p class="card-text text-muted">LIC55555 | nadeesha@example.com | +94 714 112 233</p>
                </div>
                <div class="card-footer bg-white">
                    <a href="insert.jsp" class="btn btn-primary w-100 mb-2">Request</a>
                    <a href="InsertReview.jsp?guideID=2" class="btn btn-outline-primary w-100">Rate Now</a>
                </div>
            </div>
        </div>

        <!-- Guide 3 -->
        <div class="col-lg-4 col-md-6">
            <div class="guide-card card h-100">
                <img src="<%= request.getContextPath() %>/images/amali.jpg" class="card-img-top guide-img" alt="Guide 3">
                <div class="card-body">
                    <h5 class="card-title">Amali Gunasekara</h5>
                    <div class="rating">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i>
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                        <span class="ms-2">5.0</span>
                    </div>
                    <p class="card-text text-muted">LIC12345 | amali@example.com | +94 712 345 678</p>
                </div>
                <div class="card-footer bg-white">
                    <a href="insert.jsp" class="btn btn-primary w-100 mb-2">Request</a>
                    <a href="InsertReview.jsp?guideID=3" class="btn btn-outline-primary w-100">Rate Now</a>
                </div>
            </div>
        </div>
    </div>
</section>

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

<!-- Profile Icon -->
<a href="TouristProfileServlet" class="user-profile-icon" title="Go to Profile">
    <i class="fas fa-user"></i>
</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

