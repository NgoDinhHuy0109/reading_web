<%@ page import="java.util.UUID" %>
<%@ page import="Service.Article" %>
<%@ page import="models.ArticlesEntity" %>
<%@ page import="DTO.ArticleDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.UserDTO" %>
<%@ page import="models.CommentsEntity" %>
<%@ page import="Service.Comment" %>
<%@ page import="DTO.CommentDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <title>Read Page</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <!-- Thêm thư viện Font Awesome vào trang của bạn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="style_readpage_update.css">

</head>

<body>
<!--START _ HEADER-HEADER-HEADER-HEADER-HEADER -->
<jsp:include page="/news_page/header.jsp"/>
<!--END _ HEADER-HEADER-HEADER-HEADER-HEADER -->

<!-- START BAI BAO BEN TRAI  -->
<div class="main_article">  <!-- /*phan nen mau xam to ben ngoai*/ -->
    <div class="container_article">  <!-- phan ben trong nen mau trang bao  -->
        <%
            String article_ID = request.getParameter("article_ID");
            String cateName = request.getParameter("category_Name");
            UUID articleId = UUID.fromString(article_ID);
            Article article = new Article();
            ArticlesEntity articlesEntity = article.getArticleById(articleId);
            // Create a CategoryDTO for the retrieved category
            ArticleDTO articleDTO = new ArticleDTO(articlesEntity, cateName);
            // Assuming you have an instance of Category available, replace 'categoryInstance' with your actual instance
            // Sử dụng giá trị categoryID ở đây để thực hiện các xử lý cần thiết

        %>
        <!-- phan ben trai cho noi dung doc bao  -->
        <div class="container_article_left">
            <div class="fist_link">
                <div class="fist_link_wrapper">
                    <a href="#" class="jsx-89440 label">Trang Chủ</a> <i class="fa-solid fa-caret-right"></i>
                    <a href="#" class="jsx-89440 label"><%= articleDTO.getArticle().getCategory().getCategoryName() %>
                    </a>
                </div>
            </div>
            <!-- .................../.. -->
            <div class="title_rp">
                <h1><%= articleDTO.getArticle().getTitle() %>
                </h1>
            </div>
            <!-- .................../.. -->
            <div class="author_form">
                <div class="left_author"><%=articleDTO.getArticle().getAccountsByAccountId().getUserInfoEntityId().getUserImage()%>
                </div>
                <div class="right_author">
                    <a href="https://www.facebook.com/profile.php?id=100073527816504"
                       class="name_author"><%=articleDTO.getArticle().getAccountsByAccountId().getUserInfoEntityId().getFullName()%><i
                            class="fa-solid fa-circle-check"></i></a>
                    <div class="date_update">
                        <span><%= articleDTO.getUpdatedAtString() %></span>
                    </div>
                </div>
            </div>
            <div class="content_info">
                <%= articleDTO.getArticle().getContent() %>
            </div>
            <!-- .................../.. -->
            <div class="emotion_form">
                <div class="emotion_left">
                    <div class="total_reactions">
                        <div class="icon_emotion ">
                            <i class="fa-solid fa-heart" id="redHeart"></i>
                            <span>12</span>
                        </div>
                    </div>
                </div>
                <div class="emotion_right">
                    <i class="fa-solid fa-circle"></i> <!-- dau Cham  -->
                    <span class="jsx-89440"><span>19</span></span> bình luận
                </div>
            </div>
            <!-- .......start phan love cmt share........../.. -->
            <div class="interact_form">
                <div class="love_emotion">
                    <button class="love_btn">
                        <i class="fa-regular fa-heart" id="heartIcon"></i><span>Love</span>
                    </button>
                </div>


                <div class="love_emotion">
                    <button class="love_btn">
                        <i class="fa-regular fa-comment"></i><span>Comment</span>
                    </button>
                </div>

            </div>

            <%
                List<CommentDTO> commentsDTO = new Comment().getCommentsByArticleId(articleId);
                for (CommentDTO commentDTO : commentsDTO) {
            %>
            <div class="cmt_form">

                <div class="leftcmt_form">
                    <%=commentDTO.getComment().getAccount().getUserInfoEntityId().getUserImage()%>
                </div>
                <div class="righttlcmt_form">
                    <div class="tl_cmt">
                        <div class="name_author">
                            <a href="https://www.facebook.com/profile.php?id=100073527816504">
                                <p><%=commentDTO.getComment().getAccount().getUserInfoEntityId().getFullName()%>
                                </p></a>
                        </div>
                        <p><%=commentDTO.getComment().getContent()%>
                        </p>
                    </div>
                    <div class="tuongtac_cmt">
                        <i class="fa-regular fa-heart" id="heartIconTuongTac"></i><span>Love</span>
                    </div>
                </div>

            </div>
            <%
                }
            %>
            <!--END PHAN hien thi  COMMENT  -->

            <!-- LINH TINH -->
        </div>
        <!-- end phan ben TRAI PHAN DOC BAO   -->

        <!-- START phan ben phai bao gom xu huong va bao moi  -->
        <div class="container_article_right">
            <h3>Aritcle by Category</h3>
            <%
                List<ArticleDTO> articlesDTO = new Article().getArticlesByCategoryID(articleDTO.getArticle().getCategory().getCategoryId());
                for (ArticleDTO articleDTO1 : articlesDTO) {
                    // Assuming you have an instance of Category available, replace 'categoryInstance' with your actual instance
                    // Sử dụng giá trị categoryID ở đây để thực hiện các xử lý cần thiết
            %>

            <br>
            <!-- .............. -->
            <div class="news_list_right">
                <div class="left_article"><%=articleDTO1.getArticle().getTitleImage()%>
                </div>
                <div class="right_article">
                    <a href="./readpage2.jsp?article_ID=<%=articleDTO1.getArticle().getArticleId()%>">
                        <h3><%=articleDTO1.getArticle().getTitle()%>
                        </h3></a>
                </div>
            </div>
            <%}%>
            <!-- .............. -->
            <!-- end phan ben phai bao gom xu huong va bao moi  -->

        </div>
    </div>

</div>


<!-- END BAI BAO BEN TRAI  -->

<!-- START POP UP  ARTICLE-->
<div class="popup">
    <div class="popup-content">
        <img src="news_page/images/close.png" alt="Close" class="close">
        <div class="form_post">
            <div class="form_post_top">
                <h1> Create Articles</h1>
                <hr>
            </div>
            <div class="title_post">
                <input type="text" placeholder="Enter post title.....">
            </div>
            <!-- ..phan them anh thumnail ./.. -->
            <div class="container">
                <input type="file" id="file" accept="image/*" hidden>
                <div class="img-area" data-img="">
                    <i class='bx bxs-cloud-upload icon'></i>
                    <h3>Upload Image Thumbnails</h3>
                    <p>Image size must be less than <span>2MB</span></p>

                </div>
                <button class="select-image">Select Image</button>
            </div>
            <div class="edit_word">
                <ul class="icon_editw">
                    <div class="font-size-dropdown">
                        <label for="fontSize">Font Size:</label>
                        <select id="fontSize" onchange="changeFontSize(this.value)">
                            <option value="3">Normal</option>
                            <option value="2">Small</option>
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
                        <button onclick="execCommand('underline')"><i class="fa-solid fa-underline"></i></button>
                        <div class="tooltip">Under Line</div>
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
            <div class="bottom_post">
                <button class="btn_post">Post</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="https://kit.fontawesome.com/a99fda8b90.js" crossorigin="anonymous"></script>
<script src="script.js"></script>
<script src="color_heart.js"></script>
</body>
</html>









