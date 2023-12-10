<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.CategoryDTO" %>
<%@ page import="Service.Category" %>
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
    <title>Create New Article</title>
</head>
<body>
<div class="container">
    <jsp:include page="aside.jsp"/>
    <main>
        <jsp:include page="profile.jsp"/>
        <h1>Article</h1>
        <div class="analyse_article">
            <h2>Create New </h2>
            <div class="status_article">
                <form class="article_form" action="article" method="post">
                    <input type="hidden" name="action" value="createNew">
                    <label>Title Article: </label><br>
                    <input type="text" name="title" required><br>
                    <div class="container_img">
                        <input type="file" id="titleImage" accept="image/*" hidden >
                        <div class="img-area" data-img=""></div>
                        <input type="hidden" id="titleImg" name="titleImg">
                        <label class="select-image">Select Image</label>
                    </div><br>
                    <label>Category Name:</label><br>
                    <select class="bx-category" name="categoryName" required>
                        <%
                            List<CategoryDTO> categories = new Category().getAllCategories();
                            for (CategoryDTO category : categories) {
                        %>
                        <option value="<%= category.getCategory().getCategoryName() %>">
                            <%= category.getCategory().getCategoryName() %>
                        </option>
                        <%
                            }
                        %>
                    </select><br>
                    <label>Content: </label><br>
                    <div class="edit_word">
                        <ul class="icon_editw">
                            <div class="font-size-dropdown">
                                <label for="fontSize">Font Size:</label>
                                <select id="fontSize" onchange="changeFontSize(this.value)">
                                    <option value="2">Small</option>
                                    <option value="3">Normal</option>
                                    <option value="4">Large</option>
                                    <option value="5">Large_1</option>
                                    <option value="6">Large_2</option>
                                </select>
                            </div>
                            <li class="tooltip-container">
                                <div onclick="execCommand('bold')"><i class="fa-solid fa-bold"></i></div>
                                <div class="tooltip">Bold</div>
                            </li>
                            <li class="tooltip-container">
                                <div onclick="execCommand('italic')"><i class="fa-solid fa-italic"></i></div>
                                <div class="tooltip">Italic</div>
                            </li>
                            <li class="tooltip-container">
                                <div onclick="insertImage()"><i class="fa-solid fa-image"></i></div>
                                <div class="tooltip">Insert Image</div>
                            </li>
                            <li class="tooltip-container">
                                <div onclick="insertLink()"><i class="fa-solid fa-link"></i></div>
                                <div class="tooltip">Insert Link</div>
                            </li>
                        </ul>
                    </div>
                    <div class="content_post">
                        <div id="editor" contenteditable="true"></div>
                    </div>
                    <input type="hidden" id="editorContent" name="editorContent">
                    <br>
                    <button type="submit" id="create" class="navbar_btn" onclick="submitAll()">Create</button>
                    <br>
                    <br>
                </form>
            </div>
            <form class="article_form" action="article" method="post">
                <input type="hidden" name="action" value="back">
                <button type="submit" id="backtolist" class=" btn_backtolist"> Back To List</button>
            </form>
        </div>
    </main>
    <script src="script_article.js"></script>
    <script src="script_title.js"></script>
    <script src="https://sdk.amazonaws.com/js/aws-sdk-2.726.0.min.js"></script>
</div>
</body>
</html>