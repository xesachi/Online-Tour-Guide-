<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Tour Requests</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&family=Poppins:wght@400;500;600&display=swap">
    <style>
        :root {
            --primary-color: #00796b;
            --secondary-color: #3f37c9;
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
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7ff;
            color: var(--dark-color);
            line-height: 1.6;
            padding: 0;
            margin: 0;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        header {
            background-color: white;
            box-shadow: var(--box-shadow);
            padding: 1rem 0;
            margin-bottom: 2rem;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        h1 {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.8rem;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.7rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
            transition: var(--transition);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        
        .table-container {
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }
        
        th, td {
            padding: 1rem 1.5rem;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
        }
        
        th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.05em;
            position: sticky;
            top: 0;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        tr:hover {
            background-color: #edf2ff;
        }
        
        .no-data {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
            font-size: 1.1rem;
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-approved {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-rejected {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .message-cell {
            max-width: 250px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
		.action-btn {
		  display: inline-block;
		  padding: 6px 16px;
		  margin: 2px 0;
		  font-size: 0.95rem;
		  font-weight: 600;
		  border: none;
		  border-radius: 5px;
		  color: #fff;
		  cursor: pointer;
		  transition: background 0.18s, box-shadow 0.18s, transform 0.12s;
		  box-shadow: 0 2px 6px rgba(0,0,0,0.07);
		  outline: none;
		  width: 120px;
		  text-align:center;
		}
		
		.update-btn {
		  background: #009688 ;
		}
		.update-btn:hover, .update-btn:focus {
		  background: #00796b;
		  transform: translateY(-2px) scale(1.04);
		  box-shadow: 0 4px 12px rgba(2,136,209,0.15);
		}
		
		.delete-btn {
		  background: #d32f2f;
		}
		.delete-btn:hover, .delete-btn:focus {
		  background: #b71c1c;
		  transform: translateY(-2px) scale(1.04);
		  box-shadow: 0 4px 12px rgba(211,47,47,0.15);
		}

        
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .header-content {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
                padding: 1rem;
            }
            
            th, td {
                padding: 0.75rem 1rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>My Tour Requests</h1>
            <a href="insert.jsp" class="btn">
                <i>←</i> Back to Request Form
            </a>
        </div>
    </header>

    <div class="container">
        <div class="card">
            <div class="table-container">
                <c:choose>
                    <c:when test="${empty allRequests}">
                        <div class="no-data">
                            <p>You haven't made any tour requests yet.</p>
                            <p>Start by creating your first travel request!</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <thead>
                                <tr>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Arrival Date</th>
                                    <th>Departure Date</th>
                                    <th>Travellers</th>
                                    <th>Budget</th>
                                    <th>Location</th>
                                    <th>Message</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="req" items="${allRequests}">
                                    <tr>
                                        <td>${req.firstName}</td>
                                        <td>${req.lastName}</td>
                                        <td>${req.phone}</td>
                                        <td>${req.email}</td>
                                        <td>${req.expectedArrivalDate}</td>
                                        <td>${req.expectedDepartureDate}</td>
                                        <td>${req.noOfTravellers}</td>
                                        <td>$${req.budgetPerPerson}</td>
                                        <td>${req.location}</td>
                                        <td class="message-cell"><c:out value="${req.message}" default="-" /></td>
                                        <td>
                                           	<a href="UpdateServlet?id=${req.requestID}">
                                             	<button class="action-btn update-btn">Update</button>
											</a>
											<form action="DeleteServlet" method="post">
											<input type="hidden" name="requestid" value="${req.requestID}"/>
											    <button class="action-btn delete-btn">Delete</button>
											</form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>