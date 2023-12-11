<%@ page import="DTO.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.User" %>
<%@ page import="models.UserInfoEntity" %>
<%@ page import="DTO.ArticleDTO" %>
<%@ page import="Service.Article" %>
<%@ page import="java.util.UUID" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="info_user_update.css">
    <title>Information User Page</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <!-- Thêm thư viện Font Awesome vào trang của bạn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">


</head>

<body>
    <!--START _ HEADER-HEADER-HEADER-HEADER-HEADER -->
    <jsp:include page="header.jsp"/>
 <!--END _ HEADER-HEADER-HEADER-HEADER-HEADER -->

    <!-- START BAI BAO BEN TRAI  -->
 <div class="main_info_user">  <!-- /*phan nen mau xam to ben ngoai*/ -->
         <div class="container_info_user_left">
            <div class="form_post_top_info">
                <h1> Personal Information</h1>
                <hr>
            </div>
             <%
                 String users = request.getParameter("username");
                 User user = new User();
                 UserInfoEntity userInfo = new UserInfoEntity();
                 userInfo = user.getUser(users);
             %>
            <!-- .................../.. -->
            <div class="user-profile">
                <img class="img_info" <%= userInfo.getUserImage()%>
                <h2><%= userInfo.getFullName() %></h2>
            </div>

             <!-- .................../.. -->
        </div>

        <!-- start phan ben phai cua infomation user -->
        <div class="container_info_user_right">
          <div class="main_right_info_user">

            <h1> List of published articles</h1>
            <!-- ....................START MOT BAI DANG............................................. -->
              <%
                  String author = String.valueOf(userInfo.getAccountsEntity().getAccountId());
                  List<ArticleDTO> articlesDTO = new Article().getArticlesByUserID(UUID.fromString(author));
                  for (ArticleDTO articleDTO1 : articlesDTO) {
                      // Assuming you have an instance of Category available, replace 'categoryInstance' with your actual instance
                      // Sử dụng giá trị categoryID ở đây để thực hiện các xử lý cần thiết
              %>
            <div class="author_form">
                <div class="left_author"><%=articleDTO1.getArticle().getAccountsByAccountId().getUserInfoEntityId().getUserImage()%></div>
                <div class="right_author">
                    <a  href="https://www.facebook.com/profile.php?id=100073527816504" class="name_author"><%=articleDTO1.getArticle().getAccountsByAccountId().getUserInfoEntityId().getFullName()%><i class="fa-solid fa-circle-check"></i></a>
                    <div class="date_update">
                       <span><%=articleDTO1.getUpdatedAtString()%></span>
                    </div>
                </div>
            </div>
            <div class="title_info">
                <h1 ><%=articleDTO1.getArticle().getTitle()%></h1>
            </div>
            <div class="p_info">
                <%=articleDTO1.getArticle().getContent()%>
            </div>
               <!-- .................../.. -->
            <div class="emotion_form">
                <div class="emotion_left">
                    <div class="total_reactions">
                        <div class="icon_emotion ">
                            <img width="30px" src="images/heart.png" alt="Thích">
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
                        <i class="fa-regular fa-comment"></i></i><span>Comment</span>
                    </button>
                </div>

              </div>
               <!-- ...ENDDDDDDD .start phan love cmt share. ................/.. -->
              <%
                  }
              %>
        </div>  <!-- ..the div bao boc tat ca bai dang ................ -->

    </div>
      <!-- END zhan ben phai cua infomation user -->
 </div>
        <!-- END main infomation user -->


 <!-- START FOOTER -->
  <jsp:include page="footer.jsp"/>
 <!-- END FOOTER -->




 <script src="https://kit.fontawesome.com/a99fda8b90.js" crossorigin="anonymous"></script>
<script src="script.js"></script>
<script src="color_heart.js"></script>



</body>

</html>









