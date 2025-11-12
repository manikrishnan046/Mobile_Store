<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Mobile Store</title>

<!-- ====== CSS SECTION ====== -->
<style>
/* General Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Background and font */
body {
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(135deg, #e3f2fd, #bbdefb);
	color: #333;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

/* Header styling */
header {
	background: linear-gradient(90deg, #2196f3, #1976d2);
	color: white;
	text-align: center;
	padding: 25px 0;
	font-size: 32px;
	letter-spacing: 1px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Main container */
main {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 40px;
}

/* Intro text */
h2 {
	color: #0d47a1;
	font-size: 26px;
	margin-bottom: 30px;
}

/* Box container */
.card-container {
	display: flex;
	gap: 30px;
	flex-wrap: wrap;
	justify-content: center;
}

/* Stylish box design */
.card {
	width: 260px;
	height: 180px;
	background: white;
	border-radius: 16px;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	transition: all 0.3s ease;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-8px);
	box-shadow: 0 10px 24px rgba(0, 0, 0, 0.2);
}

.card h3 {
	color: #1565c0;
	margin-bottom: 15px;
}

.card p {
	color: #555;
	font-size: 14px;
	margin-bottom: 15px;
}

.card a {
	background-color: #1976d2;
	color: white;
	padding: 10px 18px;
	border-radius: 8px;
	text-decoration: none;
	transition: 0.3s;
	font-weight: 500;
}

.card a:hover {
	background-color: #0d47a1;
}

/* Footer styling */
footer {
	background-color: #1565c0;
	color: white;
	text-align: center;
	padding: 15px;
	font-size: 14px;
	letter-spacing: 0.5px;
}

/* Simple animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
main, .card {
	animation: fadeIn 0.6s ease;
}

/* Responsive design */
@media ( max-width : 600px) {
	.card {
		width: 90%;
	}
}
</style>

<!-- ====== JavaScript SECTION ====== -->
<script>
        function showMessage(action) {
            const colors = ['#1976d2', '#2e7d32', '#f9a825', '#d32f2f'];
            const randomColor = colors[Math.floor(Math.random() * colors.length)];
            document.body.style.background = linear-gradient(135deg, ${randomColor}, #ffffff);
            alert(You selected: " + action);
        }
    </script>
</head>

<body>
	<header>MOBILE STORE MANAGEMENT</header>

	<main>
		<h2>Welcome! Choose an option to get started:</h2>

		<div class="card-container">
			<!-- Card 1 -->
			<div class="card" onclick="showMessage('Add New Mobile')">
				<h3>Add New Mobile</h3>
				<p>Enter details for a new mobile and save it to the database.</p>
				<a href="AddMobile.jsp">Go</a>
			</div>

			<!-- Card 2 -->
			<div class="card" onclick="showMessage('Display All Mobiles')">
				<h3>Display All Mobiles</h3>
				<p>View all mobiles currently stored in the database.</p>
				<a href="DisplayAllMobiles.jsp">View</a>
			</div>

			<!-- Card 3 -->
			<div class="card" onclick="showMessage('About Mobile Store')">
				<h3>About</h3>
				<p>Learn more about the Mobile Store Management System.</p>
				<a href="#">Info</a>
			</div>
		</div>
	</main>
</body>
</html>