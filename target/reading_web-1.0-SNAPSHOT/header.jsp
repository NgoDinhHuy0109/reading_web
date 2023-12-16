<%@ page import="DTO.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="header">
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
        <a href="createArticle">
            <button type="#" class=" navbar_btn">Write Posts
            </button>
        </a>
        <a href="#" class="profile"  >
            <%
                List<UserDTO> userList = (List<UserDTO>) session.getAttribute("UserInformation");
                if(userList != null && !userList.isEmpty()) {
                    for (UserDTO user : userList) {
            %>
            <%=user.getUserInfo().getUserImage()%>
            <%
                    }
                }

            %>
            <i id="user_pic" onclick="toggleMenu()" class="fa-solid fa-caret-down"></i>
        </a>
        <div class="sub_menu_wrap" id="subMenu">
            <div class="sub_menu">
                <div class="user_info">


                    <h2>${sessionScope.fullName}</h2>
                </div>
                <hr>
                <a href="./info_user.jsp" class="sub_menu_link">
                    <p>Personal Info</p>
                    <span>></span>
                </a>
                <a href="" class="sub_menu_link">
                    <p>Logout</p>
                    <span>></span>
                </a>
            </div>
        </div>
    </nav>
</div>