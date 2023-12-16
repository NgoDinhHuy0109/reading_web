<%@ page import="DTO.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Service.Category" %>
<%@ page import="models.CategoriesEntity" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="DTO.CategoryDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="style_cate.css">
    <title>Create New Category</title>
</head>
<body>
<div class="container">
    <jsp:include page="aside.jsp"/>
    <main>
        <jsp:include page="profile.jsp"/>
        <h1>Category</h1>
        <div class="analyse_cate">
            <h2>Create New </h2>
            <div class="status_cate">
                <form class="contact_form_cate" action="category" method="post">
                    <input type="hidden" name="action" value="createNew">
                    <label>Category name: </label> <br>
                    <input type="text" name="categoryName" required><br>
                    <label>Description: </label> <br>
                    <input type="text" name="description" required><br>
                    <br>
                    <c:if test="${not empty requestScope.error}">
                        <div class="error-message" style="color: #fa5652">${requestScope.error}</div>
                    </c:if>
                    <button type="submit" id="create" class=" navbar_btn"> Create</button>
                </form>

            </div>
            <br>
            <form class="contact_form_cate" action="category" method="post">
                <input type="hidden" name="action" value="back">
                <button type="submit" id="backtolist" class="btn_backtolist"> Back To List</button>
            </form>
        </div>
    </main>
    <script src="index.js"></script>
</div>
</body>
</html>