
    // bat dau js mau trai tim o thanh 3 nut
// JavaScript
const loveButton = document.querySelector('.love_btn');
const heartIcon = document.getElementById('heartIcon');

loveButton.addEventListener('click', function() {
    heartIcon.classList.toggle('fa-regular');
    heartIcon.classList.toggle('fa-solid');
    heartIcon.classList.toggle('loved');
});
// ket thuc js mau trai tim o thanh 3 nut


// bat dau js mau trai tim o binh luan
    // JavaScript
const heartIconTuongTac = document.getElementById('heartIconTuongTac');

heartIconTuongTac.addEventListener('click', function() {
    heartIconTuongTac.classList.toggle('fa-regular');
    heartIconTuongTac.classList.toggle('fa-solid');
    heartIconTuongTac.classList.toggle('loved');
});
//ket thuc js mau trai tim o binh luan

