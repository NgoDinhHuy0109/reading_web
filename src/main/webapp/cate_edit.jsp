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
        <<jsp:include page="profile.jsp"/>
        <h1>Category</h1>
        <%
            String categoryIdParam = request.getParameter("categoryId");
            UUID categoryId = UUID.fromString(categoryIdParam);
            // Assuming you have an instance of Category available, replace 'categoryInstance' with your actual instance
            Category categoryInstance = new Category();
            CategoriesEntity categoryEntity = categoryInstance.getCategoryById(categoryId);
            // Create a CategoryDTO for the retrieved category
            CategoryDTO categoryDTO = new CategoryDTO(categoryEntity);
        %>
        <div class="analyse_cate">
            <h2>Edit </h2>
            <div class="status_cate">
                <form class="contact_form_cate" action="category" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="categoryId" value="<%= categoryId %>">
                    <label>Category name: </label> <br>
                    <input type="text" name="categoryName" value="<%= categoryDTO.getCategory().getCategoryName() %>" required><br>
                    <label>Description: </label> <br>
                    <input type="text" name="description" value="<%= categoryDTO.getCategory().getDescription() %>" required><br>
                    <br>
                    <button type="submit" id="update" class=" navbar_btn"> update </button>
                </form>
            </div>
            <br>
            <form class="contact_form_cate" action="category" method="post">
                <input type="hidden" name="action" value="back">
                <button type="submit" id="backtolist" class="btn_backtolist"> Back To List</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>