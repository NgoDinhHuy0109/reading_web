<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
    <title>Read Page</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <!-- Thêm thư viện Font Awesome vào trang của bạn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">


</head>

<body>
    <!--START _ HEADER-HEADER-HEADER-HEADER-HEADER -->
    <div class="header">
        <!-- Navbar -->
        <nav>
                <a href="#" class="logo">
                    <img src="images/logo.png">
                    <div class="logo-name"><span>NewsReading</span> 
                        <span class="hch">HCH</span>
                    </div>
                </a>  
            <form action="#">
                <div class="form-input">
                    <input type="search" placeholder="Search...">
                    <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
                </div>
            </form>
            <!-- start nut dang bai viet  -->
            <button type="#" id="pop_up"
            class=" navbar_btn">Write Posts</button>
            <!-- end nut dang bai  -->
          
            <a href="#" class="profile">
                <img src="https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/240678687_104504855343775_2646762940003537912_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFNhwymFlAQ6xx5OxgdlK5k3boizSXug97duiLNJe6D3h3d7IkA8JTdvIQ2k7lHaLgROpNV3Ad5xcNblQEG4gLS&_nc_ohc=WVdZhtAb810AX9FnZOf&_nc_ht=scontent.fsgn2-6.fna&oh=00_AfCKtQ74hZbCX1xJ3C9sMW_duSPukLQ3MSNxQbbQrPwrog&oe=65478F37" class="user_pic" onclick="toggleMenu()">
            </a>
            <div class="sub_menu_wrap" id="subMenu">
                <div class="sub_menu">
                    <div class="user_info">
                        <!-- <img src="#"> them hinh anh  -->
                        <h2>Huy Bắp </h2>
                    </div>
                    <hr>
                       <!-- cac muc duoi menu -->
                       <a href="info_user.jsp" class="sub_menu_link" >
                        <p>Personal Info</p>
                        <span>></span>
                    </a>
                    <a href="" class="sub_menu_link">
                        <p>Sign In</p>
                        <span>></span>
                    </a>
                    <a href="" class="sub_menu_link">
                        <p>Sign Up </p>
                        <span>></span>
                    </a>
                </div>
            </div>
        </nav>
        <!-- End of Navbar -->
    </div>
 <!--END _ HEADER-HEADER-HEADER-HEADER-HEADER -->

    <!-- START BAI BAO BEN TRAI  -->
 <div class="main_article">  <!-- /*phan nen mau xam to ben ngoai*/ -->
    <div class="container_article">  <!-- phan ben trong nen mau trang bao  -->
        <!-- phan ben trai cho noi dung doc bao  -->
        <div class="container_article_left">
            <div class="fist_link">
                <div class="fist_link_wrapper">
                        <a href="#" class="jsx-89440 label">Trang Chủ</a> <i class="fa-solid fa-caret-right"></i>
                        <a href="#" class="jsx-89440 label">Xe hai bánh</a>
                </div>
            </div>
            <!-- .................../.. -->
            <div class="title_rp">
                    <h1 >[Có thể bạn chưa biết] Độ tuổi nào thông minh nhất?</h1>
            </div>
            <!-- .................../.. -->
            <div class="author_form">
                <div class="left_author"><img src="https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/244517587_105687951892132_8038566585476487629_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHakrwAAfm3KKwzAoB1phbAc8fWGnRkts9zx9YadGS2z9EdIgBFn80kTG827UJMgu6DpnDN_VToeXcgVe51rBf3&_nc_ohc=Cz93sMuFm30AX_bvhug&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfBHu2tzjRf1b76PhOCXIRkYy1rCsaYZsCaFDGfmBXXv4Q&oe=65495F00" alt=""></div>
                <div class="right_author">
                    <a  href="https://www.facebook.com/profile.php?id=100073527816504" class="name_author">Huy Ga<i class="fa-solid fa-circle-check"></i></a> 
                    <div class="date_update">
                       <span>2/11/2023 16:56</span>
                    </div>
                </div>
            </div>
               <!-- .................../.. -->
            <div class="emotion_form">
                <div class="emotion_left">
                    <div class="total_reactions">
                        <div class="icon_emotion ">
                       
                            <img width="30px" src="https://tinhte.vn/styles/default/Tinhte/Reactions/love.png" alt="Thích"><span>12</span>
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
                        <i class="fa-regular fa-heart"></i><span>Love</span>
                    </button>
                </div>

                <div class="love_emotion">
                    <button class="love_btn">
                        <i class="fa-regular fa-comment"></i></i><span>Comment</span>
                    </button>
                </div>
                <div class="love_emotion">
                    <button class="love_btn">
                        <i class="fa-regular fa-share-from-square"></i></i><span>Share</span>
                    </button>
                </div>
              </div>
               <!-- ...ENDDDDDDD .start phan love cmt share. ................/.. -->

               <!-- START PHAN VIET COMMENT  -->
               <div class="cmt_form">
                <div class="leftcmt_form">
                    <img alt="chien_2k3" src="https://scontent.fsgn5-13.fna.fbcdn.net/v/t39.30808-6/327191139_563957622275677_5403034852511935724_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHh8rlL3wZb0EFrXzfSQqK5w0qPGOIvWiDDSo8Y4i9aID9Y4YRDFYtpLQDWfLbQYvWAeOxaoMFGMSgoXked0BuZ&_nc_ohc=1S74QODH3owAX8plHzN&_nc_ht=scontent.fsgn5-13.fna&oh=00_AfCgqHWmamW9bXBuZmDUnKofo0AQnYCe7xWbIgwcmpHUUg&oe=654F158B">
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
                        <img alt="chien_2k3" src="https://scontent.fsgn5-13.fna.fbcdn.net/v/t39.30808-6/327191139_563957622275677_5403034852511935724_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHh8rlL3wZb0EFrXzfSQqK5w0qPGOIvWiDDSo8Y4i9aID9Y4YRDFYtpLQDWfLbQYvWAeOxaoMFGMSgoXked0BuZ&_nc_ohc=1S74QODH3owAX8plHzN&_nc_ht=scontent.fsgn5-13.fna&oh=00_AfCgqHWmamW9bXBuZmDUnKofo0AQnYCe7xWbIgwcmpHUUg&oe=654F158B">
                     </div>
                    <div class="righttlcmt_form">
                        <div class="tl_cmt">
                            <div class="name_author">
                                <a href="https://www.facebook.com/profile.php?id=100073527816504"><p>Minh Chiến</p></a>
                            </div>
                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab et consequuntur a ipsum, incidunt, commodi praesentium quo sit ipsa provident similique vero dolor ad nihil placeat distinctio. Consequuntur, minus laboriosam? fgfdgfgfdggggggggggggggggggggggggggggggggg</p>
                         </div>
                         <div class="tuongtac_cmt">
                            <i class="fa-regular fa-heart"></i><span>Love</span>
                         </div>


                    </div>
                    
               </div>
                <!--END PHAN hien thi  COMMENT  -->

                <!-- LINH TINH -->

        </div>
        <!-- end phan ben TRAI PHAN DOC BAO   -->

        <!-- START phan ben phai bao gom xu huong va bao moi  -->
        <div class="container_article_right">
            <h3>New Article</h3>
            <br>
            <!-- .............. -->
            <div class="news_list_right">
                <div class="left_article"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8170521_cover-thu-nghiem-intel-core-i5-14600k-tinhte.jpg" alt=""></div>
                <div class="right_article">
                    <p>Thử nghiệm Intel Core i5-14600K - Cải thiện nhẹ hiệu năng so với Raptor Lake…</p>
                    
                </div>
            </div>
              <!-- .............. -->
            <div class="news_list_right">
                <div class="left_article"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8170714_tinhte-apple4.jpg" alt=""></div>
                <div class="right_article">
                    <p>"Quay sự kiện bằng iPhone đẹp lắm", nhưng chỉ có iPhone thì liệu có đủ?…</p>
                    
                </div>
            </div>
            <!-- .............. -->
            <div class="news_list_right">
                <div class="left_article"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8170614_yamaha-mt-09-2024-30-cover.jpg" alt=""></div>
                <div class="right_article">
                    <p>Yamaha ra mắt MT-09 2024: Thay đổi đầu đèn và thêm vài nâng cấp nhỏ…</p>
                    
                </div>
            </div>
            <!-- .............. -->
            <!-- end phan ben phai bao gom xu huong va bao moi  -->

        </div>
    </div>

</div>


    <!-- END BAI BAO BEN TRAI  -->
    
    
 <!-- START POP UP  ARTICLE-->
 <div class="popup">
    <div class="popup-content">
        <img src="images/close.png" alt="Close" class="close">
        <div class="form_post">
            <div class="form_post_top">
                <h1> Create Articles</h1>
                <hr>
            </div>
            <!-- .................../.. -->
           <div class="title_post">
            <input type="text" placeholder="Enter post title.....">
           </div>
             <!-- ..phan them anh thumnail ./.. -->
             <div class="container">
                <input type="file" id="file" accept="image/*" hidden >
                <div class="img-area" data-img="">
                    <i class='bx bxs-cloud-upload icon'></i>
                    <h3>Upload Image Thumbnails</h3>
                    <p>Image size must be less than <span>2MB</span></p>
            
                </div>
                <button class="select-image">Select Image</button>
            </div>
           
             <!-- .....dinh dang phong chu ......./.. -->
             <div class="edit_word">
                <ul class="icon_editw" >
                    <!-- ........................................... -->
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
                         <!-- ........................................... -->
                    <li class="tooltip-container" >
                        <button onclick="execCommand('bold')"><i class="fa-solid fa-bold"></i></button>
                        <div class="tooltip">Bold</div>
                      </li>
                      <!-- ........................................... -->
                      <li class="tooltip-container">
                        <button onclick="execCommand('italic')"><i class="fa-solid fa-italic"></i></button>
                        <div class="tooltip">Italic</div>
                      </li>
                       <!-- ........................................... -->
                       <li class="tooltip-container">
                        <button onclick="execCommand('underline')"><i class="fa-solid fa-underline"></i></button>
                        <div class="tooltip">Under Line</div>
                      </li>
                       <!-- ........................................... -->
                       <li class="tooltip-container">
                        <button onclick="insertImage()"><i class="fa-solid fa-image"></i></button>
                        <div class="tooltip">Insert Image</div>
                      </li>
                      <!-- ........................................... -->
                      <li class="tooltip-container">
                        <button onclick="insertLink()"><i class="fa-solid fa-link"></i></button>
                        <div class="tooltip">Insert Link</div>
                      </li>
                      <!-- ........................................... -->
                      <!-- <li class="tooltip-container" onclick="insertList('ul')">
                        <button onclick="execCommand('insertunorderedlist')"><img src="images/list.png" alt=""></button>
                        <div class="tooltip">Bulleted List</div>
                      </li> -->
                       <!-- ........................................... -->
                       <!-- <li class="tooltip-container" onclick="insertNumberedList()">
                        <button><i class="fa-solid fa-list-ol"></i></button>
                        <div class="tooltip">Numbered List</div>
                      </li> -->
                       <!-- ........................................... -->
                       
                </ul>
             </div>
              <!-- ...............ô nhập văn bản ..../.. -->
           <div class="content_post">
            <div id="editor" contenteditable="true"></div>
           </div>
           <br>
             <!-- .................../.. -->
             <div class="bottom_post">
                <label class="custom-label">Post</label>
             </div>
        </div>
    </div>
 </div>
 <!-- END POP UP ARTICLE  -->
 <!-- START FOOTER -->
 
 <footer class="footer-distributed">
    <div class="footer-left">
        
        <h3>NewsReading<span>HCH</span></h3>

        <p class="footer-links">
            <a href="#">Home</a>
            |
            <a href="#">About</a>
            |
            <a href="#">Contact</a>
            |
            <a href="#">Blog</a>
        </p>
        <p class="footer-company-name">Copyright © 2023 <strong>NewsReadingHCH</strong> All rights reserved</p>
    </div>
    <div class="footer-center">
        <div>
            <i class="fa fa-map-marker"></i>
            <p><span>Ho Chi Minh City</span>
                HCMUTE</p>
        </div>

        <div>
            <i class="fa fa-phone"></i>
            <p>+91 74**9**258</p>
        </div>
        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="mailto:sagar00001.co@gmail.com">xyz@gmail.com</a></p>
        </div>
    </div>
    <div class="footer-right">
        <p class="footer-company-about">
            <span>About the company</span>
            <strong>Sagar Developer</strong> is a Youtube channel where you can find more creative CSS Animations
            and
            Effects along with
            HTML, JavaScript and Projects using C/C++.
        </p>
        <div class="footer-icons">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-youtube"></i></a>
        </div>
    </div>
</footer>
 
 
 <!-- END FOOTER -->




 <script src="https://kit.fontawesome.com/a99fda8b90.js" crossorigin="anonymous"></script> 
<script src="script.js"></script>



</body>

</html>









