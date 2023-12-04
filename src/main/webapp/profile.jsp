<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="profile" style="position: fixed; top: 1.4rem; right: 65px; width: 81vw;background: #f6f6f9;display: flex;gap: 2rem;text-align: right; justify-content: flex-end;">
    <div class="info">
        <p>Hey, <b>${sessionScope.username}</b></p>
        <small class="text-muted">Admin</small>
    </div>
    <div class="profile-photo">
        <img src="images/profile-1.jpg">
    </div>
</div>
<br>
<br>