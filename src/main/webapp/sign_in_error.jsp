<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <form action="SignInn" method="post">
        <input type="hidden" name="action" value="SignIn">
        <h2>Sign in</h2>
        <div class="inputBox">
            <input type="text" name="userName" required>
            <span>Username</span>
            <i></i>
        </div>
        <div class="inputBox">
            <input type="password" name="password" required>
            <span>Password</span>
            <i></i>
        </div>
        <br>
        <c:if test="${not empty requestScope.error}">
            <div class="error-message" style="color: #fa5652">${requestScope.error}</div>
        </c:if>
        <div class="links">
            <a href="#">Forgot Password</a>
            <a href="sign_up.jsp">Sign Up</a>
        </div>
        <input type="submit" id="signin" value="Login">
    </form>
</div>
</body>
</html>