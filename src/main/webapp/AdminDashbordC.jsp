<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
        }

        .sidebar a {
            color: white;
            padding: 10px 20px;
            display: block;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .content {
            padding: 30px;
        }

        .dashboard-header {
            background-color: #f8f9fa;
            padding: 15px 30px;
            margin-bottom: 20px;
            border-bottom: 1px solid #dee2e6;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 sidebar">
            <h4 class="text-center">Admin Panel</h4>
            <hr>
            <a href="InsertC.jsp">➕ Add Tour Guide</a>
            <a href="GetAllGuidesServletC">📋 View All Guides</a>
            <a href="#">⚙️ Settings</a>
            <a href="admin_login.jsp">🚪 Logout</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-9">
            <div class="dashboard-header">
                <h2>Welcome to the Admin Dashboard</h2>
                <p>Manage tour guides and system settings.</p>
            </div>

            <div class="content">
                <h4>Dashboard Overview</h4>
                <p>Use the sidebar to navigate through management options such as adding or viewing tour guides.</p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
