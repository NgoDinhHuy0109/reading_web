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
            <!-- .................../.. -->
            <div class="user-profile">
                <img class="img_info" src="images/profile-1.jpg" alt="User Image">
                <h2>Name User</h2>
            </div>
        
             <!-- .................../.. -->
        </div>
        
        <!-- start phan ben phai cua infomation user -->
        <div class="container_info_user_right">
          <div class="main_right_info_user">

            <h1> List of published articles</h1>
            <!-- ....................START MOT BAI DANG............................................. -->
            <div class="author_form">
                <div class="left_author"><img src="images/profile-1.jpg" alt=""></div>
                <div class="right_author">
                    <a  href="https://www.facebook.com/profile.php?id=100073527816504" class="name_author">Huy Ga<i class="fa-solid fa-circle-check"></i></a> 
                    <div class="date_update">
                       <span>2/11/2023 16:56</span>
                    </div>
                </div>
            </div>
            <div class="title_info">
                <h1 >Day la tieu de</h1>
            </div>
            <div class="p_info">
            <p> Day la noi dung Giữ đúng lời hứa, Tesla đã bắt đầu bàn giao những chiếc Cybertruck đầu tiên tới một nhóm khách hàng trong một sự kiện kéo dài 30 phút. Đích thân Elon Musk là người bàn giao những chiếc Cybertruck đầu tiên. Hiện Tesla đã cho khách hàng đặt mua trước trên trang web với ba phiên bản, bản rẻ nhất thì 2025 mới mở bán.
                Như vậy sau vài lần trễ hẹn thì Cybertruck chính thức sẵn sàng, chiếc xe bán tải chạy điện có thiết kế khác người. Nó được bàn giao cho người mua sau khoảng 6 năm kể từ khi Elon Musk hé lộ ý tưởng xe tải điện và khoảng 4 năm sau khi công bố những hình ảnh đầu tiên.</p>    
            </div>
            <div class="image_info">
                <img class="img_content" src="images/logo.png" alt="">    
             </div>
             <div class="p_info">
                <p> Day la noi dung Giữ đúng lời hứa, Tesla đã bắt đầu bàn giao những chiếc Cybertruck đầu tiên tới một nhóm khách hàng trong một sự kiện kéo dài 30 phút. Đích thân Elon Musk là người bàn giao những chiếc Cybertruck đầu tiên. Hiện Tesla đã cho khách hàng đặt mua trước trên trang web với ba phiên bản, bản rẻ nhất thì 2025 mới mở bán.
                    Như vậy sau vài lần trễ hẹn thì Cybertruck chính thức sẵn sàng, chiếc xe bán tải chạy điện có thiết kế khác người. Nó được bàn giao cho người mua sau khoảng 6 năm kể từ khi Elon Musk hé lộ ý tưởng xe tải điện và khoảng 4 năm sau khi công bố những hình ảnh đầu tiên.</p>    
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

               <!-- START PHAN VIET COMMENT  -->
               <div class="cmt_form_input">
                <div class="leftcmt_form">
                    <img alt="chien_2k3" src="images/profile-1.jpg">
                </div>
                <div class="rightcmt_form">
                    <input type="text" placeholder="Please enter your commnet...." name="categoryName"
                                required><br>
                                <a href="#footer"><button>SEND</button></a>

                </div>

               </div>
                <!--END PHAN VIET COMMENT  -->

                 <!-- START hien thi COMMENT  -->
               <div class="cmt_form">
                    <div class="leftcmt_form">
                        <img alt="chien_2k3" src="images/profile-1.jpg ">
                     </div>
                    <div class="righttlcmt_form">
                        <div class="tl_cmt">
                            <div class="name_author">
                                <a href="https://www.facebook.com/profile.php?id=100073527816504"><p>Minh Chiến</p></a>
                            </div>
                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab et consequuntur a ipsum, incidunt, commodi praesentium quo sit ipsa provident similique vero dolor ad nihil placeat distinctio. Consequuntur, minus laboriosam? fgfdgfgfdggggggggggggggggggggggggggggggggg</p>
                         </div>
                         <div class="tuongtac_cmt">
                            <i class="fa-regular fa-heart" id="heartIconTuongTac"></i><span>Love</span>
                        </div>
                    </div>
               </div>
                <!--END PHAN hien thi  COMMENT  -->
                  <!-- START hien thi COMMENT  -->
               <div class="cmt_form">
                <div class="leftcmt_form">
                    <img alt="chien_2k3" src="images/profile-1.jpg ">
                 </div>
                <div class="righttlcmt_form">
                    <div class="tl_cmt">
                        <div class="name_author">
                            <a href="https://www.facebook.com/profile.php?id=100073527816504"><p>Minh Chiến</p></a>
                        </div>
                         <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab et consequuntur a ipsum, incidunt, commodi praesentium quo sit ipsa provident similique vero dolor ad nihil placeat distinctio. Consequuntur, minus laboriosam? fgfdgfgfdggggggggggggggggggggggggggggggggg</p>
                     </div>
                     <div class="tuongtac_cmt">
                        <i class="fa-regular fa-heart" id="heartIconTuongTac"></i><span>Love</span>
                    </div>
                </div>
           </div>
            <!--END PHAN hien thi  COMMENT  -->
                 <!-- .......HET MOT BAI DANG................................. -->



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









