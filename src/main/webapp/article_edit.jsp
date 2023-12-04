<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>Edit Article</title>
</head>
<body>
<div class="container">
    <jsp:include page="aside.jsp"/>

    <main>
       <jsp:include page="profile.jsp"/>
        <h1>Article</h1>
        <div class="analyse_article">
            <h2>Edit </h2>
            <div class="status_article">
                <form class="article_form" action="" method="post">
                    <label>Article ID:</label><br>
                    <input type="text" name="categoryName"
                           required><br>
                </form>
                <form class="article_form" action="" method="post">
                    <label>Title Article: </label><br>
                    <input type="text" name="title"
                           required><br>
                </form>
                <form class="article_form" action="" method="post">
                    <label>Category Name:</label><br>
                    <input type="text" name="categoryName"
                           required><br>
                </form>
                <form class="article_form" action="" method="post">
                    <label>Author Name: </label><br>
                    <input type="text" name="author"
                           required><br>
                </form>
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
                            <button onclick="execCommand('bold')"><i class="fa-solid fa-bold"></i></button>
                            <div class="tooltip">Bold</div>
                        </li>
                        <li class="tooltip-container">
                            <button onclick="execCommand('italic')"><i class="fa-solid fa-italic"></i></button>
                            <div class="tooltip">Italic</div>
                        </li>
                        <li class="tooltip-container">
                            <button onclick="insertImage()"><i class="fa-solid fa-image"></i></button>
                            <div class="tooltip">Insert Image</div>
                        </li>
                        <li class="tooltip-container">
                            <button onclick="insertLink()"><i class="fa-solid fa-link"></i></button>
                            <div class="tooltip">Insert Link</div>
                        </li>
                    </ul>
                </div>
                <div class="content_post">
                    <div id="editor" contenteditable="true"></div>
                </div>
                <br>
                <button type="submit" id="submit"
                        class=" navbar_btn"> Create
                </button>
            </div>
            <br>
            <a href="article_home.jsp">
                <button type="#" id="#"
                        class=" btn_backtolist"> Back To List
                </button>
            </a>
        </div>
    </main>
    <script src="index.js"></script>
    <script src="https://unpkg.com/@xylphid/resizable/index.js"></script>
    <script src="script_article.js"></script>
</body>
</html>