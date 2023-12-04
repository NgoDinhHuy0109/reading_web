let subMenu = document.getElementById("subMenu");
function toggleMenu() {
    subMenu.classList.toggle("open_menu");
}
document.addEventListener("click", function (event) {
    if (!subMenu.contains(event.target) && event.target !== document.querySelector(".user_pic")) {
        // Kiểm tra nếu người dùng click ra ngoài menu hoặc không phải là phần tử ".user_pic"
        subMenu.classList.remove("open_menu"); // Đóng menu
    }
});
document.getElementById("pop_up").addEventListener("click", function () {
    document.querySelector(".popup").style.display = "flex";
    document.body.style.overflow = 'hidden'; // Vô hiệu hóa cuộn trang

})
document.querySelector(".close").addEventListener("click", function () {
    document.querySelector(".popup").style.display = "none"
})
document.getElementById("pop_up_info").addEventListener("click", function () {
    document.querySelector(".popup_info").style.display = "flex";
    document.body.style.overflow = 'hidden'; // Vô hiệu hóa cuộn trang

})
document.querySelector(".close_1").addEventListener("click", function () {
    document.querySelector(".popup_info").style.display = "none"
})
document.querySelector('.select-image').addEventListener('click', function () {
    document.querySelector('#file').click();
})
document.querySelector('#file').addEventListener('change', function () {
    const image = this.files[0]
    if (image.size < 2000000) {
        const reader = new FileReader();
        reader.onload = () => {
            const allImg = document.querySelector('.img-area').querySelectorAll('img');
            allImg.forEach(item => item.remove());
            const imgUrl = reader.result;
            const img = document.createElement('img');
            img.src = imgUrl;
            document.querySelector('.img-area').appendChild(img);
            document.querySelector('.img-area').classList.add('active');
            document.querySelector('.img-area').dataset.img = image.name;
        }
        reader.readAsDataURL(image);
    } else {
        alert("Image size more than 2MB");
    }
})
function execCommand(command, value = null) {
    document.execCommand(command, false, value);
}

function insertList(type) {
    document.execCommand(type);
}

function changeFontSize(size) {
    execCommand('fontSize', size);
}

function insertImage() {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.onchange = handleImageUpload;
    input.click();
}
function handleImageUpload(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement('img');
            img.src = e.target.result;

            // Cho phép người dùng nhập kích thước
            const width = prompt("Enter width (in pixels):", "300");
            const height = prompt("Enter height (in pixels):", "200");

            // Áp dụng kích thước mong muốn
            img.style.width = `${width}px`;
            img.style.height = `${height}px`;

            document.getElementById('editor').appendChild(img);
        };
        reader.readAsDataURL(file);
    }
}

function insertLink() {
    const url = prompt("Enter the URL:");
    if (url) {
        execCommand('createLink', url);
    }
}



