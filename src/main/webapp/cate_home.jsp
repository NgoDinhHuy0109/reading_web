<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="utils.Service.Category" %>
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
    <title>Category</title>
</head>
<body>
<div class="container">
    <aside>
        <div class="toggle">
            <div class="logo">
                <img src="images/logo.png">
                <h2 class="h2_header">Admin<span class="danger">Page</span></h2>
            </div>
            <div class="close" id="close-btn">
                    <span class="material-icons-sharp">
                        close
                    </span>
            </div>
        </div>
        <div class="sidebar">
            <a href="analyse.jsp" target="Loadpage">
                    <span class="material-icons-sharp">
                        dashboard
                    </span>
                <h3>Dashboard</h3>
            </a>
            <a href="cate_home.jsp" target="Loadpage">
                    <span class="material-icons-sharp">
                        receipt_long
                    </span>
                <h3>Category</h3>
            </a>
            <a href="article_home.jsp" target="Loadpage">
                    <span class="material-icons-sharp">
                        insights
                    </span>
                <h3>Article</h3>
            </a>
            <a href="user.jsp" target="Loadpage">
                    <span class="material-icons-sharp">
                        person_outline
                    </span>
                <h3>User</h3>
            </a>
            <a href="user.jsp" target="Loadpage">
                    <span class="material-icons-sharp">
                        inventory
                    </span>
                <h3>Interact</h3>
            </a>
            <a href="">
                    <span class="material-icons-sharp">
                        add
                    </span>
                <h3>Create New</h3>
            </a>
            <a href="sign_in.jsp">
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
                <p>Hey, <b>User</b></p>
                <small class="text-muted">Admin</small>
            </div>
            <div class="profile-photo">
                <img src="images/profile-1.jpg">
            </div>
        </div>
        <h1>Category</h1>
        <div class="analyse_cate">
            <div class="btn_createnew">
                <a href="cate_create.jsp">
                    <span class="material-icons-sharp">add</span>
                    <h3>Create New</h3>
                </a>
                <br><br>
                <div class="entries">
                    <label for="entries-select">Entries:</label>
                    <select id="entries-select">
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>
                <% List<CategoryDTO> categoriesList = (List<CategoryDTO>) request.getAttribute("categoriesList"); %>
                <% if (categoriesList != null && !categoriesList.isEmpty()) { %>
                <table>
                    <tr>
                        <th>Category Name</th>
                        <th>Description</th>
                        <th>Created Time</th>
                        <th>Updated Time</th>
                        <th>Actions</th>
                    </tr>
                    <% for (CategoryDTO category : categoriesList) { %>
                    <tr>
                        <td><%= category.getCategory().getCategoryName() %>
                        </td>
                        <td><%= category.getCategory().getDescription() %>
                        </td>
                        <td><%= category.getCreatedAtString() %>
                        </td>
                        <td><%= category.getUpdatedAtString() %>
                        </td>
                        <td>
                            <div class="btn_table">
                                <a href="cate_edit.jsp?categoryId=<%= category.getCategory().getCategoryId() %>">
                                    <button class="button_table" type="button" id="edit"> Edit</button>
                                </a>
                                <a href="delete_category.jsp">
                                    <button class="button_table" type="button" id="delete"> Delete</button>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </table>
                <% } else { %>
                <p>No categories available.</p>
                <% } %>
            </div>
        </div>
    </main>
    <script src="orders.js"></script>
    <script src="index.js"></script>
</div>
</body>
</html>