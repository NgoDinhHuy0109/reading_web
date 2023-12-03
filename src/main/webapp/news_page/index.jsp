<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="news_page/style.css">
    <title>New Reading</title>
<!-- ............................................. -->
<!-- thu vien tuy chinh kich thuoc anh trong o nhap script -->
<link rel="stylesheet" href="https://unpkg.com/@xylphid/resizable/style.css" />
<script src="https://unpkg.com/@xylphid/resizable/index.js"></script>
<link rel="stylesheet" href="https://unpkg.com/draggabilly/dist/draggabilly.css" />
<script src="https://unpkg.com/draggabilly/dist/draggabilly.pkgd.min.js"></script>
<!-- Thêm thư viện Font Awesome vào trang của bạn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
</head>

<body>
    <!--START _ HEADER-HEADER-HEADER-HEADER-HEADER -->
    <div class="header">
        <!-- Navbar -->
        <nav>
                <a href="#" class="logo">
                    <img src="news_page/images/logo.png">
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
            
                    <a href="news_page/info_user.jsp" class="sub_menu_link" >
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

 <!-- START POP UP  PERSONAL INFO-->
 <!-- <div class="popup_info">
    <div class="popup_info-content">
        <img src="images/close.png" alt="Close" class="close_1">
            <div class="form_post_top_info">
                <h1> Personal Information</h1>
                <hr>
            </div> -->
            <!-- .................../.. -->
            <!-- <div class="user-profile">
                <img class="img_info" src="images/profile-1.jpg" alt="User Image">
                <h2>Name User</h2>
            </div>
            <div><h1 class="detail_info">Detail Information</h1></div>
            <div class="user-details">
                <table>
                    <tr>
                        <td><strong>Full Name:</strong></td>
                        <td>John Doe</td>

                    </tr>
                    <tr>
                        <td><strong>Date of Birth:</strong></td>
                        <td>January 1, 1990</td>
                    </tr>
                    <tr>
                        <td><strong>Phone Number:</strong></td>
                        <td>0981583025</td>
                    </tr>
                    <tr>
                        <td><strong>Email:</strong></td>
                        <td>demo@gmail.com</td>
                    </tr> -->
                    <!-- Các thông tin khác -->
                <!-- </table>
            </div> -->
            <!-- <div class="user-details">
                <p><strong>Full Name:</strong> John Doe</p>
                <p><strong>Date of Birth:</strong> January 1, 1990</p>
                <p><strong>Email:</strong> email@gmail.com</p>
                <p><strong>Phone Number:</strong> 0981583025</p>
            </div> -->
           
           <!-- <br> -->
             <!-- .................../.. -->
<!--            
    </div>
 </div> -->
 <!-- END POP UP PERSONAL INFO  -->


 <!-- START POP UP  ARTICLE-->
 <div class="popup">
    <div class="popup-content">
        <img src="news_page/images/close.png" alt="Close" class="close">
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
                <label for="" class="custom-label">Post</label>
             </div>
        </div>
    </div>
 </div>
 <!-- END POP UP ARTICLE  -->

 
<!-- START PHAN CAC NUT DUOI HEADER  -->
<div class="menu_container">
    <nav>
        <ul>
            <li><a href="#" id="">Home Page </a></li>
            <li><a href="#">Category </a></li>
        </ul>
    </nav>
</div>
<!-- END PHAN CAC NUT DUOI HEADER  -->

<!-- START 2 bai bao dau tien xep ngang nhau -->
<div class="fist_container">
    
    <div class="news_1">
        <div class="top"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168933_cover-re.jpg" alt=""></div>
        <div class="bottom">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
             <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
                <span class="jsx-3594291015 author">P.W</span>
             </a>
        </div>
    </div>

    <div class="news_2">
        <div class="top_2"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168452_cover-tensor-g3-snapdragon-8-gen-3.jpg" alt=""></div>
        <div class="bottom_2">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
            <p>Thế giới game bây giờ, vì áp lực doanh thu của những tập đoàn, nên chúng ta có ba kiểu làm phần kế tiếp cho một trò chơi ăn khách. Thứ nhất là tính toán trước cốt truyện, làm xong phần này …</p>
            <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
                <span class="jsx-3594291015 author">P.W</span>
             </a>
        </div>
    </div>
    <div class="news_2">
        <div class="top_2"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168452_cover-tensor-g3-snapdragon-8-gen-3.jpg" alt=""></div>
        <div class="bottom_2">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
            <p>Thế giới game bây giờ, vì áp lực doanh thu của những tập đoàn, nên chúng ta có ba kiểu làm phần kế tiếp cho một trò chơi ăn khách. Thứ nhất là tính toán trước cốt truyện, làm xong phần này …</p>
            <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
                <span class="jsx-3594291015 author">P.W</span>
             </a>
        </div>
    </div>
</div>
<!-- END 2 bai bao dau tien xep ngang nhau  -->
<!-- START 3 bai bao TIEP THEO xep ngang nhau  -->
<div class="second_container">
    <div class="second_1">
        <div class="top_second"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168933_cover-re.jpg" alt=""></div>
        <div class="bottom_second">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
             <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
                <span class="jsx-3594291015 author">P.W</span>
             </a>
        </div>
    </div>

    <div class="second_1">
        <div class="top_second"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8164810_Cover-dat-bike.jpg" alt=""></div>
        <div class="bottom_second">
            <h3>Dat Bike Quantum - bước tiến mới trong ngành công nghiệp xe điện tại Việt Nam</h3>
             <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
                <span class="jsx-3594291015 author">P.W</span>
             </a>
        </div>
    </div>

    <div class="second_1">
        <div class="top_second"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168933_cover-re.jpg" alt=""></div>
        <div class="bottom_second">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
             <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
                <span class="jsx-3594291015 author">P.W</span>
             </a>
        </div>
    </div>

    <div class="second_1">
        <div class="top_second"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168933_cover-re.jpg" alt=""></div>
        <div class="bottom_second">
            <h3>Chơi Resident Evil Village trên iPhone 15 Pro Max: Vẫn chỉ có Capcom là thương Apple nhất</h3>
             <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
                <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
                <span class="jsx-3594291015 author">P.W</span>
             </a>
        </div>
    </div>
</div>
<!-- END 3 bai bao TIEP THEO xep ngang nhau  -->
<!-- START NEWS_LIST -->
<div class="list_container">
<div class="news_list">
    <div class="left"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168401_vlcsnap-2023-10-30-13h43m04s600.jpg" alt=""></div>
    <div class="right">
        <h3>Đánh giá Alan Wake II: Game kinh dị này sẽ giữ chân anh em vì cốt truyện quá đẳng cấp</h3>
        <p>Thế giới game bây giờ, vì áp lực doanh thu của những tập đoàn, nên chúng ta có ba kiểu làm phần kế tiếp cho một trò chơi ăn khách. Thứ nhất là tính toán trước cốt truyện, làm xong phần này …</p>
         <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
            <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
            <span class="jsx-3594291015 author">P.W</span>
         </a>
    </div>
</div>

<div class="news_list">
    <div class="left"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168401_vlcsnap-2023-10-30-13h43m04s600.jpg" alt=""></div>
    <div class="right">
        <h3>Đánh giá Alan Wake II: Game kinh dị này sẽ giữ chân anh em vì cốt truyện quá đẳng cấp</h3>
        <p>Thế giới game bây giờ, vì áp lực doanh thu của những tập đoàn, nên chúng ta có ba kiểu làm phần kế tiếp cho một trò chơi ăn khách. Thứ nhất là tính toán trước cốt truyện, làm xong phần này …</p>
         <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
            <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
            <span class="jsx-3594291015 author">P.W</span>
         </a>
    </div>
</div>

<div class="news_list">
    <div class="left"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168401_vlcsnap-2023-10-30-13h43m04s600.jpg" alt=""></div>
    <div class="right">
        <h3>Đánh giá Alan Wake II: Game kinh dị này sẽ giữ chân anh em vì cốt truyện quá đẳng cấp</h3>
        <p>Thế giới game bây giờ, vì áp lực doanh thu của những tập đoàn, nên chúng ta có ba kiểu làm phần kế tiếp cho một trò chơi ăn khách. Thứ nhất là tính toán trước cốt truyện, làm xong phần này …</p>
         <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
            <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
            <span class="jsx-3594291015 author">P.W</span>
         </a>
    </div>
</div>

<div class="news_list">
    <div class="left"><img src="https://photo2.tinhte.vn/data/attachment-files/2023/10/8168401_vlcsnap-2023-10-30-13h43m04s600.jpg" alt=""></div>
    <div class="right">
        <h3>Đánh giá Alan Wake II: Game kinh dị này sẽ giữ chân anh em vì cốt truyện quá đẳng cấp</h3>
        <p>Thế giới game bây giờ, vì áp lực doanh thu của những tập đoàn, nên chúng ta có ba kiểu làm phần kế tiếp cho một trò chơi ăn khách. Thứ nhất là tính toán trước cốt truyện, làm xong phần này …</p>
         <a target="_blank" href="https://tinhte.vn/profile/pw.2452461/" rel="noreferrer" class="jsx-1509373995">
            <img src="https://photo2.tinhte.vn/data/avatars/m/2452/2452461.jpg?1653405194" >
            <span class="jsx-3594291015 author">P.W.sadhbashdhsabjh</span>
         </a>
    </div>
</div>
</div>

<footer class="footer-distributed">
    <div class="footer-left">
        <h3>NewsReading<span>HCH</span></h3>
        <br>
        <br>
        <br>
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
            <p>+9 35553433</p>
        </div>
        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="mailto:newsreadinghch@gmail.com">newsreadinghch@gmail.com</a></p>
        </div>
    </div>
    <div class="footer-right">
        <p class="footer-company-about">
            <span>About the company</span>
            <strong>HCH Developer</strong> is an agency where you can read news updated daily by all lovely
            users and besides
            post article in order to share knowledge you want
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
<script src="news_page/script.js"></script>
<script src="https://unpkg.com/@xylphid/resizable/index.js"></script>
</body>
</html>









