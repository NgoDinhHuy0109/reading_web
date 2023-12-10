<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link rel="stylesheet" href="reset_password.css">
</head>
<body>
    <div class="box">
        <form>
            <h2>Reset Password</h2>
            <div class="inputBox">
                <input type="text" required>
                <span>Enter new password</span>
                <i></i>
            </div>
            
            <div class="inputBox">
                <input type="password" required>
                <span>Retype new password</span>
                <i></i>
            </div>
         
            <input class="confirm" type="submit" value="Confirm">
        </form>
    </div>
</body>
</html>