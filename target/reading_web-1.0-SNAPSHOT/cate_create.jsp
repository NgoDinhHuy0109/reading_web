<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <a href="index_cate.html"><h2 class="h2_header">Admin<span class="danger">Page</span></h2>
                    </a>
                </div>
                <div class="close" id="close-btn">
                    <span class="material-icons-sharp">
                        close
                    </span>
                </div>
            </div>
            <div class="sidebar">
                <a href="analyse.html" target="Loadpage" >
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
                <a href="user.html" target="Loadpage">
                    <span class="material-icons-sharp">
                        person_outline
                    </span>
                    <h3>User</h3>
                </a>
                <a href="index_category.html" target="Loadpage">
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
                        <button type="submit" id="create" class=" navbar_btn"> Create </button>
                    </form>
                </div>
                <br>
                <a href="cate_home.jsp"> 
                    <button type="#" id="#" class=" btn_backtolist"> Back To List
                   </button>
               </a>
            </div>
        </main>
    <script src="orders.js"></script>
    <script src="index.js"></script>
    </div>
</body>
</html>