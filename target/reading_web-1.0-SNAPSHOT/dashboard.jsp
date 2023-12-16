<%@ page import="DTO.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="Service.*" %>
<%@ page import="models.CategoriesEntity" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="DTO.*" %>
<%
    Category categoryService = new Category();
    long totalCategories = categoryService.countCategories();
    Article articleService = new Article();
    long totalArticles = articleService.countArticles();
    User userService = new User();
    long totalUsers = userService.countUsers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="style_dashboard.css">
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
    <title>Dashboard</title>
</head>
<body>
<div class="container">
    <jsp:include page="aside.jsp"/>
    <main>
        <jsp:include page="profile.jsp"/>
        <h1>Analytics</h1>
        <div class="analyse">
            <div class="sales">
                <div class="status">
                    <div class="info">
                        <a href="cate_home.jsp"><h3 class="name_left">Total Categories</h3></a>
                    </div>
                    <div class="progresss">
                        <h3 class="name_right"><%= totalCategories %></h3>
                    </div>
                </div>
            </div>
            <div class="visits">
                <div class="status">
                    <div class="info">
                        <a href="article_home.jsp"><h3 class="name_left">Total Articles</h3></a>
                    </div>
                    <div class="progresss">
                        <h3 class="name_right"><%= totalArticles %></h3>
                    </div>
                </div>
            </div>

            <div class="searches">
                <div class="status">
                    <div class="info">
                        <a href=""><h3 class="name_left">Total Users</h3></a>
                    </div>
                    <div class="progresss">
                        <h3 class="name_right"><%= totalUsers %></h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="new-users">
            <h2>New Users</h2>
            <div class="user-list">
                <div class="user">
                    <img src="/images/profile-2.jpg">
                    <h2>Jack</h2>
                    <p>54 Min Ago</p>
                </div>
                <div class="user">
                    <img src="/images/profile-3.jpg">
                    <h2>Amir</h2>
                    <p>3 Hours Ago</p>
                </div>
                <div class="user">
                    <img src="/images/profile-4.jpg">
                    <h2>Ember</h2>
                    <p>6 Hours Ago</p>
                </div>
                <div class="user">
                    <img src="/images/plus.png">
                    <h2>More</h2>
                    <p>New User</p>
                </div>
            </div>
        </div>

    </main>
    <!-- End of Main Content -->
    <script src="script_article.js"></script>
    <script src="index.js"></script>
    <script>
        function toggleCategoryLink() {
            var currentHref = '<%= request.getContextPath() %>/category';
            var currentPage = window.location.href;

            // Check if the current page is the category path
            if (currentPage.includes(currentHref)) {
                // Check if the target page is different from the current one
                var dashboardPage = '<%= request.getContextPath() %>/dashboard.jsp';
                if (currentPage !== dashboardPage) {
                    // Navigate to the dashboard page without opening a new tab
                    window.location.href = dashboardPage;
                }
            } else {
                // Store the current page URL as the previous page in session storage
                sessionStorage.setItem('previousPage', currentPage);
                // Navigate to the category path
                window.location.href = currentHref;
            }
        }
    </script>
</div>
</body>
</html>