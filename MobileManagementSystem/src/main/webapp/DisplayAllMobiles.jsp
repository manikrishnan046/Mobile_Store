<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Mobile Store</title>

<!-- ===== CSS DESIGN ===== -->
<style>
    /* Reset and base */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: "Poppins", sans-serif;
        background: url('https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
        background-size: cover;
        color: #333;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* Overlay */
    body::before {
        content: "";
        position: absolute;
        inset: 0;
        background: rgba(0, 0, 0, 0.5);
        z-index: 0;
    }

    /* Header */
    header {
        position: relative;
        z-index: 1;
        text-align: center;
        background: rgba(0, 123, 255, 0.85);
        color: white;
        padding: 25px;
        font-size: 30px;
        font-weight: 600;
        letter-spacing: 1px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }

    /* Container */
    .container {
        position: relative;
        z-index: 1;
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 40px 20px;
    }

    /* Search box */
    .search-box {
        margin-bottom: 25px;
    }

    input[type="text"] {
        width: 300px;
        padding: 10px 15px;
        border-radius: 8px;
        border: none;
        outline: none;
        font-size: 15px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        transition: 0.3s;
    }

    input[type="text"]:focus {
        transform: scale(1.03);
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.4);
    }

    /* Table */
    table {
        width: 85%;
        border-collapse: collapse;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        backdrop-filter: blur(10px);
    }

    th, td {
        padding: 14px 20px;
        text-align: center;
    }

    th {
        background: linear-gradient(90deg, #28a745, #2ecc71);
        color: white;
        font-size: 16px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    td {
        font-size: 15px;
        background-color: rgba(255, 255, 255, 0.85);
    }

    tr:hover td {
        background-color: rgba(0, 123, 255, 0.1);
    }

    /* Buttons */
    .btn {
        background: linear-gradient(90deg, #007bff, #0056b3);
        color: white;
        padding: 8px 14px;
        border-radius: 8px;
        text-decoration: none;
        transition: 0.3s;
        font-weight: bold;
        border: none;
        cursor: pointer;
    }

    .btn:hover {
        background: linear-gradient(90deg, #0056b3, #003f7f);
        transform: scale(1.05);
    }

    /* Footer */
    footer {
        position: relative;
        z-index: 1;
        text-align: center;
        color: white;
        background: rgba(0, 0, 0, 0.7);
        padding: 15px;
        font-size: 14px;
        letter-spacing: 0.5px;
    }

    /* Responsive */
    @media (max-width: 700px) {
        table {
            width: 95%;
        }
        input[type="text"] {
            width: 90%;
        }
    }
</style>

<!-- ===== JAVASCRIPT ===== -->
<script>
    // Filter rows in the table based on search input
    function filterTable() {
        let input = document.getElementById("searchInput");
        let filter = input.value.toLowerCase();
        let rows = document.querySelectorAll("tbody tr");

        rows.forEach(row => {
            let text = row.textContent.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    }

    // Show alert when a model is selected
    function showAlert(model) {
        alert("You selected: " + model);
    }
</script>

</head>
<body>

<header>Mobile Store — All Available Mobiles</header>

<div class="container">
    <!-- Search box -->
    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search Mobile Model or Brand..." onkeyup="filterTable()">
    </div>

    <%
        ArrayList<String[]> mobilelist = (ArrayList<String[]>) request.getAttribute("mobilelist");
        if (mobilelist != null && !mobilelist.isEmpty()) {
    %>

    <!-- Data Table -->
    <table>
        <thead>
            <tr>
                <th>Mobile ID</th>
                <th>Model</th>
                <th>Brand</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (String[] mobile : mobilelist) {
        %>
            <tr>
                <td><%= mobile[0] %></td>
                <td><%= mobile[1] %></td>
                <td><%= mobile[2] %></td>
                <td>₹<%= mobile[3] %></td>
                <td><button class="btn" onclick="showAlert('<%= mobile[1] %>')">Select</button></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <%
        } else {
    %>
        <h2 style="color:white; margin-top:40px;">No Mobiles Found in Database</h2>
    <%
        }
    %>

    <div style="margin-top:30px;">
        <a href="index.jsp" class="btn"> Back to Home</a>
    </div>
</div>
</body>
</html>