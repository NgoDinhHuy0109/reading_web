<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/2/2023
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
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
        <br>
        <c:if test="${not empty requestScope.error}">
            <div class="error-message" style="color: #fa5652">${requestScope.error}</div>
        </c:if>
        <div class="inputBox">
            <input type="text" name="phoneNumber" required>
            <span>Phone</span>
            <i></i>
        </div>
        <c:if test="${not empty requestScope.error1}">
            <div class="error-message" style="color: #fa5652">${requestScope.error1}</div>
        </c:if>
        <div class="inputBox">
            <input type="text" name="userName" required>
            <span>Account</span>
            <i></i>
        </div>
        <c:if test="${not empty requestScope.error2}">
            <div class="error-message" style="color: #fa5652">${requestScope.error2}</div>
        </c:if>
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

