<%@ page import="DTO.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>Category</title>
</head>
<body>
<div class="container">
    <jsp:include page="aside.jsp"/>
    <main>
        <%--        <div class="profile">--%>
        <%--            <% List<UserDTO> userList = (List<UserDTO>) request.getAttribute("userList"); %>--%>
        <%--            <% for (UserDTO user : userList) { %>--%>
        <%--            <div class="info">--%>
        <%--                <p>Hey, <b><%= user.getUserInfo().getFullName() %></b></p>--%>
        <%--                <small class="text-muted">Admin</small>--%>
        <%--            </div>--%>
        <%--            <% } %>--%>
        <%--            <div class="profile-photo">--%>
        <%--                <img src="images/profile-1.jpg">--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <jsp:include page="profile.jsp"/>
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
                                <form action="category" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="categoryId"
                                           value="<%= category.getCategory().getCategoryId() %>">
                                    <button class="button_table" type="submit" id="delete"> Delete</button>
                                </form>
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
    <script src="index.js"></script>
</div>
</body>
</html>