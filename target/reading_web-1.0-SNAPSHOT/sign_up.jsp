<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="sign_up.css">
</head>
<body>
    <div class="box">
        <form>
            <h2>Sign Up</h2>
            <div class="inputBox">
                <input type="text" required>
                <span>Username</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="email" required>
                <span>Email</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="text" required>
                <span>Description</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="text" required>
                <span>Account</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="password" required>
                <span>Password</span>
                <i></i>
            </div>
            <div class="links">
                <a href="sign_in.jsp">Already Account</a>
            </div>
            <input type="submit" value="Sign up">
        </form>
    </div>
</body>
</html>