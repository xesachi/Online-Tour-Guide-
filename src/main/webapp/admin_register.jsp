<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 col-md-6">
    <h2 class="mb-4">Register New Admin</h2>
    <form action="AdminRegisterServlet" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Admin Username</label>
            <input type="text" class="form-control" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Admin Password</label>
            <input type="password" class="form-control" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Admin</button>
        <a href="admin_dashboard.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
