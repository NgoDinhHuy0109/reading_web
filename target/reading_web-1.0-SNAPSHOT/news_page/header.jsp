<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="header">
    <nav>
        <a href="../" class="logo">
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
            <img src="https://news-hch.s3.ap-southeast-2.amazonaws.com/login.png"
                 id="user_pic" onclick="toggleMenu()">
        </a>
        <div class="sub_menu_wrap" id="subMenu">
            <div class="sub_menu">
                <hr>
                <a href="sign_in.jsp" class="sub_menu_link">
                    <p>Sign In</p>
                    <span>></span>
                </a>
                <a href="sign_up.jsp" class="sub_menu_link">
                    <p>Sign Up </p>
                    <span>></span>
                </a>
            </div>
        </div>
    </nav>
</div>