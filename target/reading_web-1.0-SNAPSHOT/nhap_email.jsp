<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Email</title>
    <link rel="stylesheet" href="nhap_email.css">
</head>
<body>
    <div class="box">
        <form action="ForgotPass" method="post">
            <input type="hidden" name="action" value="EnterEmail">
            <h2>Lost password<h2>
            <h3>If you forget your password, you can use the following form to reset your password. You will receive an email with password reset instructions.</h3>
            <div class="inputBox">
                <input type="text" name="email" required>
                <span>Enter Email</span>
                <i></i>
            </div>
      
            <input type="submit" value="Confirm">
        </form>
    </div>
</body>
</html>