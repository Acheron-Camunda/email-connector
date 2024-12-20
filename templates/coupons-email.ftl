<#-- Simple New User Registration Email Template with Embedded CSS -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Platform!</title>
    <style>

        body, h1, h2, p, ul {
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #f4f7fc;
            line-height: 1.6;
            padding: 20px;
        }

        .email-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            font-size: 24px;
            color: #4CAF50;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 20px;
            color: #333;
            margin-top: 20px;
            margin-bottom: 15px;
        }

        p {
            font-size: 16px;
            color: #555;
            margin-bottom: 15px;
        }

        ul {
            list-style-type: none;
            padding-left: 0;
        }

        li {
            font-size: 16px;
            color: #444;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }

        li:hover {
            background-color: #f1f1f1;
        }

        .cta-button {
            display: inline-block;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 5px;
            margin-top: 20px;
            font-size: 18px;
        }

        .cta-button:hover {
            background-color: #45a049;
        }

        footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: #aaa;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <h1>Welcome, ${name}!</h1>
        <p>Thank you for registering on our platform. We are thrilled to have you with us.</p>
        <p>We see that you are based in ${city}. Here are some exclusive offers available near you:</p>

        <h2>Your Exclusive Coupons:</h2>
        <ul>
            <li>Coupon 1: 20% off on your next purchase</li>
            <li>Coupon 2: Free shipping on orders over $50</li>
            <li>Coupon 3: Buy 1 Get 1 Free on selected items</li>
            <li>Coupon 4: $10 off your next meal at our partner restaurants</li>
            <li>Coupon 5: 30% off on all electronics</li>
        </ul>

        <p>Dont miss out on these amazing offers. Start shopping today!</p>

        <a href="http://acheron-tech.com" class="cta-button">Start Shopping</a>

        <footer>
            <p>If you have any questions or need assistance, feel free to contact us. We are here to help!</p>
            <p>&copy; 20XX Offers Point. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
