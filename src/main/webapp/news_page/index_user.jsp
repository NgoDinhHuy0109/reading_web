<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="DTO.CategoryDTO" %>
<%@ page import="Service.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.ArticleDTO" %>
<%@ page import="Service.Article" %>
<%@ page import="models.UserInfoEntity" %>
<%@ page import="Service.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="news_page/style.css">
    <title>New Reading</title>
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
</head>
<body>
<jsp:include page="/news_page/header.jsp"/>
<jsp:include page="/news_page/pop_up.jsp"/>
<div class="menu_container">
    <nav>
        <ul>
            <li><a href="#" id="">Home Page </a></li>
            <%
                List<CategoryDTO> categories = new Category().getAllCategories();
                for (CategoryDTO category : categories) {
            %>
            <li>
                <a href="news_page/index_category.jsp?categoryID=<%=category.getCategory().getCategoryId()%>"></a>
                <%= category.getCategory().getCategoryName() %>
            </li>
            <%
                }
            %>
        </ul>
    </nav>
</div>

<div class="fist_container">
    <%
        User userApplication = new User(); // Khởi tạo một đối tượng User

        // Lấy danh sách tất cả các bài báo, sắp xếp theo ngày đăng giảm dần
        List<ArticleDTO> articleDTOS = new Article().getAllArticles();

        // Biến đếm để phân loại bài báo
        int count = 0;
        for (ArticleDTO article : articleDTOS) {
            if (count == 0) {
    %>
    <div class="news_1">
        <div class="top">
            <%=article.getArticle().getTitleImage()%>
        </div>
        <div class="bottom">
            <a href="news_page/readpage.jsp?article_ID=<%=article.getArticle().getArticleId()%>&category_Name=<%=article.getArticle().getCategory().getCategoryName()%>"><h3><%=article.getArticle().getTitle()%></h3></a>
            <a href="news_page/info_user_lock.jsp?username=<%=article.getArticle().getAccountsByAccountId().getUserInfoEntityId().getFullName()%>" rel="noreferrer" class="jsx-1509373995">
                <%=article.getArticle().getAccountsByAccountId().getUserInfoEntityId().getUserImage()%>
                <span class="jsx-3594291015 author"><%=article.getArticle().getAccountsByAccountId().getUserInfoEntityId().getFullName()%>
                </span>
            </a>
        </div>
    </div>
    <% } else if (count >= 1 && count <= 2) { %>
    <div class="news_2">
        <div class="top_2">
            <%=article.getArticle().getTitleImage()%>
        </div>
        <div class="bottom_2">
            <a href="news_page/readpage.jsp?article_ID=<%=article.getArticle().getArticleId()%>"><h3><%=article.getArticle().getTitle()%></h3></a>
            <a href="news_page/info_user_lock.jsp" rel="noreferrer" class="jsx-1509373995">
                <%=article.getArticle().getAccountsByAccountId().getUserInfoEntityId().getUserImage()%>
                <span class="jsx-3594291015 author"><%=article.getArticle().getAccountsByAccountId().getUserInfoEntityId().getFullName()%></span>
            </a>
        </div>
    </div>
    <% }
        count++;
    }
    %>
</div>
<div class="second_container">
    <div class="second_1">
        <div class="top_second"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168933_cover-re.jpg"
                                     alt=""></div>
        <div class="bottom_second">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
            <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194">
                <span class="jsx-3594291015 author">P.W</span>
            </a>
        </div>
    </div>
    <div class="second_1">
        <div class="top_second"><img
                src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8164810_Cover-dat-bike.jpg" alt=""></div>
        <div class="bottom_second">
            <h3>Dat Bike Quantum - bước tiến mới trong ngành công nghiệp xe điện tại Việt Nam</h3>
            <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194">
                <span class="jsx-3594291015 author">P.W</span>
            </a>
        </div>
    </div>
    <div class="second_1">
        <div class="top_second"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168933_cover-re.jpg"
                                     alt=""></div>
        <div class="bottom_second">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
            <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194">
                <span class="jsx-3594291015 author">P.W</span>
            </a>
        </div>
    </div>
    <div class="second_1">
        <div class="top_second"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168933_cover-re.jpg"
                                     alt=""></div>
        <div class="bottom_second">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
            <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194">
                <span class="jsx-3594291015 author">P.W</span>
            </a>
        </div>
    </div>
</div>
<div class="list_container">
    <%
        User user = new User(); // Khởi tạo một đối tượng User

        // Lấy danh sách tất cả các bài báo, sắp xếp theo ngày đăng giảm dần
        List<ArticleDTO> articleDTO = new Article().getAllArticles();

        // Biến đếm để phân loại bài báo
        for (ArticleDTO article : articleDTO) {
    %>
    <div class="news_list">
        <div class="left"><%=article.getArticle().getTitleImage()%></div>
        <div class="right">
            <a href="news_page/readpage.jsp?article_ID=<%=article.getArticle().getArticleId()%>"><h3><%=article.getArticle().getTitle()%></h3></a>
            <a href="news_page/info_user_lock.jsp" rel="noreferrer" class="jsx-1509373995">
                <%=article.getArticle().getAccountsByAccountId().getUserInfoEntityId().getUserImage()%>
                <span class="jsx-3594291015 author"><%=article.getArticle().getAccountsByAccountId().getUserInfoEntityId().getFullName()%></span>
            </a>
        </div>
    </div>
    <%
        }
    %>
</div>
<jsp:include page="/news_page/footer.jsp"/>
<script src="https://unpkg.com/@xylphid/resizable/index.js"></script>
<script>
    document.querySelector('.select-image').addEventListener('click', function () {
        document.querySelector('#file').click();
    })
    document.querySelector('#file').addEventListener('change', function () {
        const image = this.files[0]
        if (image.size < 2000000) {
            const reader = new FileReader();
            reader.onload = () => {
                const allImg = document.querySelector('.img-area').querySelectorAll('img');
                allImg.forEach(item => item.remove());
                const imgUrl = reader.result;
                const img = document.createElement('img');
                img.src = imgUrl;
                document.querySelector('.img-area').appendChild(img);
                document.querySelector('.img-area').classList.add('active');
                document.querySelector('.img-area').dataset.img = image.name;
            }
            reader.readAsDataURL(image);
        } else {
            alert("Image size more than 2MB");
        }
    })
</script>
<script>
    let subMenu = document.getElementById("subMenu");
    function toggleMenu() {
        subMenu.classList.toggle("open_menu");
    }
    document.addEventListener("click", function (event) {
        if (!subMenu.contains(event.target) && event.target !== document.querySelector("#user_pic")) {
            // Kiểm tra nếu người dùng click ra ngoài menu hoặc không phải là phần tử ".user_pic"
            subMenu.classList.remove("open_menu"); // Đóng menu
        }
    });
</script>
</body>
</html>









