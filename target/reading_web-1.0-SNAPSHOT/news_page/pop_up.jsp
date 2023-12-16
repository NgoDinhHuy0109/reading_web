<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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