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
        <a href="#" class="profile">
            <img src="https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/240678687_104504855343775_2646762940003537912_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFNhwymFlAQ6xx5OxgdlK5k3boizSXug97duiLNJe6D3h3d7IkA8JTdvIQ2k7lHaLgROpNV3Ad5xcNblQEG4gLS&_nc_ohc=WVdZhtAb810AX9FnZOf&_nc_ht=scontent.fsgn2-6.fna&oh=00_AfCKtQ74hZbCX1xJ3C9sMW_duSPukLQ3MSNxQbbQrPwrog&oe=65478F37"
                 id="user_pic" onclick="toggleMenu()">
        </a>
        <div class="sub_menu_wrap" id="subMenu">
            <div class="sub_menu">
                <hr>
                <a href="./info_user.jsp" class="sub_menu_link">
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
</div>