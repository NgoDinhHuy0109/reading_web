<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="style_article.css">
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
    <title>Create New Article</title>
</head>

<body>

    <div class="container">
        <!-- Sidebar Section -->
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
                <!-- class="active" dat sau "#" de to dam o dang duoc chon  -->
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
        <!-- End of Sidebar Section -->

        <!-- Main Content -->
        <main>
            <!-- .............................. -->
            <div class="profile">
                <div class="info">
                    <p>Hey, <b>Reza</b></p>
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
                <h2>Create New </h2>
                <div class="status_article">
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

                     <!-- .....dinh dang phong chu ......./.. -->
                     <label>Content: </label><br>
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
                       <!-- <li class="tooltip-container">
                        <button onclick="execCommand('underline')"><i class="fa-solid fa-underline"></i></button>
                        <div class="tooltip">Under Line</div>
                      </li> -->
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
                    <!-- .............................. -->
                    <br>
                    <!-- .............................. -->

                        <button type="submit" id="submit"
                            class=" navbar_btn"> Create </button>
                </div>
                <!-- .............................. -->
                <br>
                <a href="article_home.jsp"> 
                    <button type="#" id="#"
                       class=" btn_backtolist"> Back To List 
                   </button>
               </a>
               <!-- .............................. -->
            </div>
             <!-- .............................. -->
        </main>
        <!-- End of Main Content -->

       

    <script src="orders.js"></script>
    <script src="script_article.js"></script>
</body>

</html>