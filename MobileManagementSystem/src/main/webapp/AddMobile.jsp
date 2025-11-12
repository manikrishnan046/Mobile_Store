<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add New Mobile</title>

<!-- ===== CSS ===== -->
<style>
    /* Basic Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: #fff;
        overflow: hidden;
    }

    /* Animated Background */
    body::before {
        content: "";
        position: absolute;
        width: 200%;
        height: 200%;
        background: conic-gradient(from 180deg at 50% 50%, #6a11cb, #2575fc, #00c6ff, #6a11cb);
        animation: spin 8s linear infinite;
        z-index: 0;
        opacity: 0.2;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* Header */
    h1 {
        position: relative;
        z-index: 1;
        background: rgba(0, 0, 0, 0.4);
        padding: 15px 30px;
        border-radius: 12px;
        font-size: 2.2em;
        text-transform: uppercase;
        letter-spacing: 1px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        margin-bottom: 30px;
    }

    /* Form Container */
    form {
        position: relative;
        z-index: 1;
        background: rgba(255, 255, 255, 0.15);
        padding: 40px 35px;
        border-radius: 16px;
        backdrop-filter: blur(12px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
        width: 350px;
        animation: fadeIn 1s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Floating Labels */
    .input-group {
        position: relative;
        margin-bottom: 25px;
    }

    .input-group input {
        width: 100%;
        padding: 12px;
        background: rgba(255, 255, 255, 0.2);
        border: 1px solid rgba(255, 255, 255, 0.3);
        border-radius: 8px;
        font-size: 1em;
        color: #fff;
        outline: none;
        transition: 0.3s;
    }

    .input-group label {
        position: absolute;
        top: 12px;
        left: 14px;
        color: #ddd;
        font-size: 0.95em;
        pointer-events: none;
        transition: 0.3s ease;
    }

    .input-group input:focus {
        border-color: #00c6ff;
        box-shadow: 0 0 8px #00c6ff;
        background: rgba(255, 255, 255, 0.25);
    }

    .input-group input:focus + label,
    .input-group input:valid + label {
        top: -10px;
        left: 10px;
        font-size: 0.8em;
        color: #00c6ff;
        background: rgba(30, 60, 114, 0.9);
        padding: 0 6px;
        border-radius: 5px;
    }

    /* Submit Button */
    input[type="submit"] {
        width: 100%;
        background: linear-gradient(90deg, #ff9800, #ff5722);
        color: #fff;
        border: none;
        padding: 12px;
        border-radius: 8px;
        font-size: 1em;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        letter-spacing: 1px;
    }

    input[type="submit"]:hover {
        background: linear-gradient(90deg, #ff5722, #e65100);
        transform: scale(1.05);
        box-shadow: 0 0 10px #ff9800;
    }

    /* Back to Home */
    a {
        position: relative;
        z-index: 1;
        color: #fff;
        text-decoration: none;
        display: inline-block;
        margin-top: 20px;
        font-weight: bold;
        opacity: 0.9;
        transition: 0.3s;
    }

    a:hover {
        opacity: 1;
        text-shadow: 0 0 8px #00c6ff;
    }

    /* Footer */
    footer {
        position: fixed;
        bottom: 10px;
        text-align: center;
        color: #eee;
        font-size: 0.85em;
        z-index: 1;
    }
</style>

<!-- ===== JAVASCRIPT ===== -->
<script>
    //Form Validation
    function validateForm() {
        const id = document.forms["mobileForm"]["mobileId"].value.trim();
        const price = document.forms["mobileForm"]["mobilePrice"].value.trim();

        if (isNaN(id) || id === "") {
            alert("Mobile ID must be a number!");
            return false;
        }
        if (isNaN(price) || price <= 0) {
            alert("Enter a valid positive price!");
            return false;
        }

        alert("Mobile successfully added!");
        return true;
    }
</script>

</head>

<body>

    <h1> Add New Mobile</h1>

    <form name="mobileForm" action="AddMobile" method="post" onsubmit="return validateForm()">
        <div class="input-group">
            <input type="text" name="mobileId" required>
            <label>Mobile ID</label>
        </div>

        <div class="input-group">
            <input type="text" name="mobileModel" required>
            <label>Model</label>
        </div>

        <div class="input-group">
            <input type="text" name="mobileBrand" required>
            <label>Brand</label>
        </div>

        <div class="input-group">
            <input type="text" name="mobilePrice" required>
            <label>Price (₹)</label>
        </div>

        <input type="submit" value="Add Mobile">
    </form>

    <a href="index.jsp">Back to Home</a>

    <footer>Mobile Store</footer>

</body>
</html>