<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="stylesheet" href="sign_up.css">
</head>
<body>
<div class="box">
    <form action="register" method="post">
        <input type="hidden" name="action" value="SignUp">

        <h2>Sign Up</h2>
        <div class="inputBox">
            <input type="text" name="fullName" required>
            <span>Username</span>
            <i></i>
        </div>
        <div class="inputBox">
            <input type="text" name="dateOfBirth" required>
            <span>Date of Birth</span>
            <i></i>
        </div>
        <div class="inputBox">
            <input type="email" name="email" required>
            <span>Email</span>
            <i></i>
        </div>
        <div class="inputBox">
            <input type="text" name="phoneNumber" required>
            <span>Phone</span>
            <i></i>
        </div>
        <div class="inputBox">
            <input type="text" name="userName" required>
            <span>Account</span>
            <i></i>
        </div>
        <div class="inputBox">
            <input type="password" name="password" required>
            <span>Password</span>
            <i></i>
        </div>
        <div class="links">
            <a href="sign_in.jsp">Already Account</a>
        </div>
        <input type="submit" id="create">
    </form>
</div>
</body>
</html>
