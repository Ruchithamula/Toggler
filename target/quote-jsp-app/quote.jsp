<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quote Generator - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            text-align: center;
            padding: 50px;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 20px;
            margin: 50px auto;
            width: 50%;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }
        button {
            background: #fff;
            color: #2575fc;
            font-size: 16px;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background: #eee;
        }
        .logout {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <h1>✨ Welcome to Random Quote Generator ✨</h1>
    <div class="card">
        <p id="quote">Click the button to see a quote</p>
        <button onclick="newQuote()">Get Quote</button>
    </div>

    <div class="logout">
        <form action="login.jsp" method="get">
            <button type="submit">Logout</button>
        </form>
    </div>

    <script>
        const quotes = [
            "The best way to predict the future is to invent it. – Alan Kay",
            "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
            "Believe you can and you're halfway there. – Theodore Roosevelt",
            "Don't watch the clock; do what it does. Keep going. – Sam Levenson",
            "Act as if what you do makes a difference. It does. – William James"
        ];

        function newQuote() {
            const randomIndex = Math.floor(Math.random() * quotes.length);
            document.getElementById("quote").innerText = quotes[randomIndex];
        }
    </script>
</body>
</html>
