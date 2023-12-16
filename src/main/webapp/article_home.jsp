<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DTO.CategoryDTO" %>
<%@ page import="DTO.ArticleDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.Article" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="style_article.css">
    <link rel="stylesheet" href="https://unpkg.com/@xylphid/resizable/style.css"/>
    <script src="https://unpkg.com/@xylphid/resizable/index.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/draggabilly/dist/draggabilly.css"/>
    <script src="https://unpkg.com/draggabilly/dist/draggabilly.pkgd.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <title>Article</title>
</head>
<body>
<div class="container">
    <jsp:include page="aside.jsp"/>
    <main>
        <jsp:include page="profile.jsp"/>
        <h1>Article</h1>
        <div class="analyse_article">
            <div class="btn_createnew">
                <a href="article_create.jsp">
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
                <% List<ArticleDTO> articlesList = (List<ArticleDTO>) request.getAttribute("articlesList"); %>
                <% if (articlesList != null && !articlesList.isEmpty()) { %>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Title Image</th>
                        <th>Content</th>
                        <th>Category</th>
                        <th>Created Time</th>
                        <th>Updated Time</th>
                        <th>Actions</th>
                    </tr>
                    <% for (ArticleDTO article : articlesList) { %>
                    <tr>
                        <td><%= article.getArticle().getTitle() %>
                        </td>
                        <td><%= article.getArticle().getTitleImage() %>
                        </td>
                        <td><%= article.getArticle().getContent() %>
                        </td>
                        <td><%= new Article().getCategoryNameByCategoryId(article.getArticle().getCategoriesByCategoryId().getCategoryId()) %>
                        </td>
                        <td><%= article.getCreatedAtString() %>
                        </td>
                        <td><%= article.getUpdatedAtString() %>
                        </td>
                        <td>
                            <div class="btn_table">
                                <a href="article_edit.jsp?articleId=<%= article.getArticle().getArticleId() %>">
                                    <button class="button_table" type="button" id="edit"> Edit</button>
                                </a>
                                <form action="article" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="articleId"
                                           value="<%= article.getArticle().getArticleId() %>">
                                    <button class="button_table" type="submit" id="delete"> Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <% } else { %>
            <p>No articles available.</p>
            <% } %>
        </div>
    </main>
    <script src="script_article.js"></script>
    <script src="index.js"></script>
</body>
</html>