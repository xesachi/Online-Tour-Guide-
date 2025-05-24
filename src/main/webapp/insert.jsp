<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tour Booking Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        /* ===== Basic Reset ===== */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background: #f9f9f9;
            color: #333;
        }

        /* ===== Header Bar ===== */
        .header-bar {
            height: 50px;
            background-color: #004d40;
        }

        /* ===== Main Content ===== */
        .main-content {
            max-width: 900px;
            margin: 20px auto;
            padding: 0 20px 40px;
        }

        /* ===== Banner ===== */
        .banner {
            background-color: #00796b;
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.5rem;
            position: relative;
        }

        .request-form-btn {
            margin-top: 15px;
            background-color: #004d40;
            color: white;
            border: none;
            padding: 10px 25px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        .request-form-btn:hover {
            background-color: #00332f;
        }

        .arrow {
            font-weight: bold;
            margin-left: 8px;
        }

        /* ===== Image Placeholder ===== */
        .image-placeholder {
            margin: 30px 0;
            text-align: center;
        }

        #tour-image {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        /* ===== Form Section ===== */
        .form-section {
            background: white;
            padding: 30px 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .inquiry-note {
            font-style: italic;
            color: #555;
            margin-bottom: 10px;
        }

        .elegant-heading {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 5px;
            color: #00796b;
        }

        .subtitle {
            font-size: 1.1rem;
            margin-bottom: 25px;
            color: #555;
        }

        /* ===== Form Styling ===== */
        form.booking-form {
            display: flex;
            flex-direction: column;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 6px;
            font-weight: 600;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="number"],
        textarea {
            padding: 10px;
            border: 1.5px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            resize: vertical;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus,
        textarea:focus {
            outline: none;
            border-color: #00796b;
            box-shadow: 0 0 5px rgba(0,121,107,0.5);
        }

        .form-submit-row {
            text-align: center;
            margin-top: 15px;
        }

        .submit-btn {
            background-color: #00796b;
            color: white;
            border: none;
            padding: 12px 35px;
            font-size: 1.1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        .submit-btn:hover {
            background-color: #004d40;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="header-bar"></div>

    <div class="main-content">
        <div class="banner">
            <span class="banner-title">Customize your ultimate family adventure!!</span>
            <button class="request-form-btn" id="requestFormBtn">Request form <span class="arrow">&#8595;</span></button>
        </div>
        <div class="image-placeholder">
            <img src="<%= request.getContextPath() %>/images/tour-banner.jpg" alt="Tour visual" id="tour-image">
        </div>

        <div class="form-section" id="bookingFormSection">
            <p class="inquiry-note"><em>MAKE A INQUIRY ~~~</em></p>
            <h1 class="elegant-heading">Book your holiday with us!</h1>
            <p class="subtitle">Craft Your Perfect Tour, Designed Just for You!</p>
            <form action= "InsertServlet" method= "post" class="booking-form">
                <div class="form-row">
                    <div class="form-group">
                        <label for="first-name">First name</label>
                        <input type="text" id="first-name" name="FirstName" required>
                    </div>
                    <div class="form-group">
                        <label for="last-name">Last name</label>
                        <input type="text" id="last-name" name="LastName" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="Email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" id="phone" name="Phone" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="arrival-date">Expected arrival date</label>
                        <input type="date" id="arrival-date" name="ExpectedArrivalDate" required>
                    </div>
                    <div class="form-group">
                        <label for="departure-date">Expected departure date</label>
                        <input type="date" id="departure-date" name="ExpectedDepartureDate" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="travellers">Number of travellers</label>
                        <input type="number" id="travellers" name="NoOfTravellers" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="budget">Budget per person</label>
                        <input type="text" id="budget" name="BudgetPerPerson" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="locations">Location (Areas need to be covered)</label>
                    <input type="text" id="locations" name="Location" required>
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="Message" rows="3"></textarea>
                </div>
                <div class="form-submit-row">
                    <button type="submit" class="submit-btn">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('requestFormBtn').addEventListener('click', function() {
            document.getElementById('bookingFormSection').scrollIntoView({ behavior: 'smooth' });
        });
    </script>
</body>
</html>
