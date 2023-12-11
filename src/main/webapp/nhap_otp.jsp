<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="nhap_otp.css">
</head>
<body>
    <div class="box">
        <form action="ForgotPass" method="post">
            <input type="hidden" name="action" value="EnterOtp">
            <h2>Your authentication code<h2>
            <p></p>
            <div class="inputBox">
                <input type="text" name="otp" required>
                <span>Enter Code</span>
                <i></i>
            </div>
      
            <input type="submit" value="Confirm">
        </form>
    </div>
</body>
</html>