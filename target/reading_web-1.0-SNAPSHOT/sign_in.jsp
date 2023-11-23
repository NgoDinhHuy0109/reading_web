<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in</title>
    <link rel="stylesheet" href="sign_in.css">
</head>
<body>
    <div class="box">
        <form>
            <h2>Sign in</h2>
            <div class="inputBox">
                <input type="text" required>
                <span>Username</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="password" required>
                <span>Password</span>
                <i></i>
            </div>
            <div class="links">
                <a href="#">Forgot Password</a>
                <a href="sign_up.jsp">Sign Up</a>
            </div>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>