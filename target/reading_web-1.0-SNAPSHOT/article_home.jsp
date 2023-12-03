<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="style_article.css">
    <!-- thu vien tuy chinh kich thuoc anh trong o nhap script -->
    <link rel="stylesheet" href="https://unpkg.com/@xylphid/resizable/style.css"/>
    <script src="https://unpkg.com/@xylphid/resizable/index.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/draggabilly/dist/draggabilly.css"/>
    <script src="https://unpkg.com/draggabilly/dist/draggabilly.pkgd.min.js"></script>
    <!-- Thêm thư viện Font Awesome vào trang của bạn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <!-- ............................................. -->
    <title>Article</title>
</head>

<body>

<div class="container">
    <!-- Sidebar Section -->
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
            <!-- class="active" dat sau "#" de to dam o dang duoc chon  -->
            <a href="index_cate_add.html" target="Loadpage">
                    <span class="material-icons-sharp">
                        dashboard
                    </span>
                <h3>Dashboard</h3>
            </a>
            <a href="category" target="Loadpage">
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
    <!-- End of Sidebar Section -->

    <!-- Main Content -->
    <main>
        <!-- .............................. -->
        <div class="profile">
            <div class="info">
                <p>Hey, <b>User</b></p>
                <small class="text-muted">Admin</small>
            </div>
            <div class="profile-photo">
                <img src="images/profile-1.jpg">
            </div>
        </div>
        <!-- .............................. -->
        <h1>Article</h1>
        <!-- .............................. -->
        <div class="analyse_article">
            <div class="btn_createnew">
                <a href="article_create.jsp">
                    <button type="submit" id="submit"
                            class=" btn_create"> Create New
                    </button>
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
                <!-- .............................. -->
                <table>
                    <tr>
                        <th>Article Name</th>
                        <th>Description</th>
                        <th>Created Time</th>
                        <th>Updated Time</th>
                        <th>

                        </th>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th>
                            <div class="btn_table">
                                <a href="article_edit.jsp">
                                    <button class="button_table" type="submit" id="edit"> Edit</button>
                                </a>
                                <button class="button_table" type="submit" id="delete"> Delete</button>
                            </div>
                        </th>

                    </tr>
                    <!-- Backend data will be inserted here dynamically -->

                    <!-- Add more rows for additional data as needed -->
                </table>
            </div>
        </div>
        <!-- .............................. -->
    </main>
</div>
<!-- End of Main Content -->
</body>

</html>