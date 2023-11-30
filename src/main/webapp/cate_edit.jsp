<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.CategoryDTO" %>
<%@ page import="models.CategoriesEntity" %>
<%@ page import="utils.Service.Category" %>
<%@ page import="java.util.UUID" %>
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
    <aside>
        <div class="toggle">
            <div class="logo">
                <img src="images/logo.png">
                <a href="index_cate.html"><h2 class="h2_header">Admin<span class="danger">Page</span></h2></a>
            </div>
            <div class="close" id="close-btn">
                    <span class="material-icons-sharp">
                        close
                    </span>
            </div>
        </div>
        <div class="sidebar">
            <a href="dashboard.jsp" >
                    <span class="material-icons-sharp">
                        dashboard
                    </span>
                <h3>Dashboard</h3>
            </a>
            <a href="category">
                    <span class="material-icons-sharp">
                        receipt_long
                    </span>
                <h3>Category</h3>
            </a>
            <a href="article_home.jsp">
                    <span class="material-icons-sharp">
                        insights
                    </span>
                <h3>Article</h3>
            </a>
            <a href="user.html">
                    <span class="material-icons-sharp">
                        person_outline
                    </span>
                <h3>User</h3>
            </a>
            <a href="index_category.html">
                    <span class="material-icons-sharp">
                        inventory
                    </span>
                <h3>Interact</h3>
            </a>
            <a href="" >
                    <span class="material-icons-sharp">
                        add
                    </span>
                <h3>Create New</h3>
            </a>
            <a href="sign_in.jsp" >
                    <span class="material-icons-sharp">
                        logout
                    </span>
                <h3>Logout</h3>
            </a>
        </div>
    </aside>
    <main>
        <div class="profile">
            <div class="info">
                <p>Hey, <b>Reza</b></p>
                <small class="text-muted">Admin</small>
            </div>
            <div class="profile-photo">
                <img src="images/profile-1.jpg">
            </div>
        </div>
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