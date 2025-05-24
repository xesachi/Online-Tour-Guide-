<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Tour Request</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&family=Poppins:wght@400;500;600&display=swap">
    <style>
        :root {
            --primary-color: #00796b;
            --secondary-color: #005f56;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4bb543;
            --warning-color: #f0ad4e;
            --danger-color: #d9534f;
            --border-radius: 8px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7ff;
            color: var(--dark-color);
            line-height: 1.6;
            padding: 2rem;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }
        
        h1 {
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            margin-bottom: 1rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }
        
        input, textarea, select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-family: inherit;
        }
        
        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            margin-right: 1rem;
        }
        
        .btn:hover {
            background-color: var(--secondary-color);
        }
        
        .btn-secondary {
            background-color: #6c757d;
        }
        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        
        .form-row {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .alert {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: var(--border-radius);
        }
        
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Tour Request</h1>
        
        <c:if test="${not empty param.error}">
            <div class="alert alert-error">
                <c:choose>
                    <c:when test="${param.error == 'update_failed'}">
                        Failed to update request. Please try again.
                    </c:when>
                    <c:when test="${param.error == 'invalid_number_format'}">
                        Invalid number format. Please check your input and try again.
                    </c:when>
                    <c:when test="${param.error == 'invalid_date_format'}">
                        Invalid date format. Please use the correct date format.
                    </c:when>
                    <c:when test="${param.error == 'Missing_request_ID'}">
                        Request ID is missing. Please try again.
                    </c:when>
                    <c:when test="${param.error == 'Invalid_number_of_travelers'}">
                        Number of travelers must be a positive integer.
                    </c:when>
                    <c:when test="${param.error == 'Invalid_budget_amount'}">
                        Budget must be a non-negative number.
                    </c:when>
                    <c:when test="${param.error == 'Arrival_date_is_required'}">
                        Arrival date is required.
                    </c:when>
                    <c:when test="${param.error == 'Departure_date_is_required'}">
                        Departure date is required.
                    </c:when>
                    <c:when test="${param.error == 'server_error'}">
                        A server error occurred. Please try again later.
                    </c:when>
                    <c:otherwise>
                        An error occurred. Please try again.
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
        
        <form action="UpdateServlet" method="post">
            <input type="hidden" name="requestId" value="${requestDetails.requestID}">
            
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First name</label>
                    <input type="text" id="firstName" name="firstName" 
                           value="${requestDetails.firstName}" required>
                    <input type="text" id="firstName" name="firstName" 
                           value="${requestDetails.requestID}" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last name</label>
                    <input type="text" id="lastName" name="lastName" 
                           value="${requestDetails.lastName}" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" 
                           value="${requestDetails.email}" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" 
                           value="${requestDetails.phone}" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="arrivalDate">Arrival date</label>
                    <input type="date" id="arrivalDate" name="arrivalDate" 
                           value="${requestDetails.expectedArrivalDate}" required>
                </div>
                <div class="form-group">
                    <label for="departureDate">Departure date</label>
                    <input type="date" id="departureDate" name="departureDate" 
                           value="${requestDetails.expectedDepartureDate}" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="travelers">Number of travellers</label>
                    <input type="number" id="travelers" name="travelers" min="1" 
                           value="${requestDetails.noOfTravellers}" required>
                </div>
                <div class="form-group">
                    <label for="budget">Budget per person ($)</label>
                    <input type="number" id="budget" name="budget" step="0.01" min="0" 
                           value="${requestDetails.budgetPerPerson}" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" 
                       value="${requestDetails.location}" required>
            </div>
            
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="3">${requestDetails.message}</textarea>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn">Update Request</button>
                <a href="RequestGetAll" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
