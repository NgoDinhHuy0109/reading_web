
document.getElementById("pop_up").addEventListener("click", function () {
    popUp.style.display = "flex";
    document.body.style.overflow = 'hidden'; // Vô hiệu hóa cuộn trang
    adjustPopupPosition();
})
document.querySelector(".close").addEventListener("click", function () {
    popUp.style.display = "none"
})
document.addEventListener("scroll", function () {
    adjustPopupPosition();
});
function adjustPopupPosition() {
    // Adjust the popup position based on the scroll offset
    let scrollTop = window.scrollY || document.documentElement.scrollTop;
    popUp.style.top = `${scrollTop}px`;
}
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
        handleImageUpload1(image, function (img) {
            const allImg = document.querySelector('.img-area').querySelectorAll('img');
            allImg.forEach(item => item.remove());
            document.querySelector('.img-area').appendChild(img);
            document.querySelector('.img-area').classList.add('active');
            document.querySelector('.img-area').dataset.img = image.name;
            // Call the function to upload the image to S3
            //uploadImageToS3(image);
        });
    } else {
        alert("Image size more than 2MB");
    }
})
function uploadImageToS31(image,callback) {
    // Set up AWS S3 client
    const s3 = new AWS.S3({
        accessKeyId: 'AKIA6GKZUZAHRQILCGV6', // Replace with your AWS access key
        secretAccessKey: 'SJvJXIkATESQQAW/QWhEN+UFOe7hlUDc4eRrOGwU', // Replace with your AWS secret key
        region: 'ap-southeast-2' // Replace with your AWS region
    });
    // Generate a unique key using a timestamp and the image name
    const timestamp = new Date().getTime();
    const key = `${timestamp}_${image.name}`;
    // Prepare the S3 parameters
    const params = {
        Bucket: 'news-hch', // Replace with your S3 bucket name
        Key : key, // Replace with the desired object key
        Body: image,
        ContentType: image.type
    };
    // Upload the file to S3
    s3.upload(params, (err, data) => {
        if (err) {
            console.error('Error uploading image to S3:', err);
            if (callback && typeof callback === 'function') {
                callback(null);
            }
        } else {
            // Use the S3 object URL returned from the upload
            const s3ObjectUrl = data.Location;
            console.log('Object URL from S3:', s3ObjectUrl);
            // Build the complete S3 object URL
            const s3BucketUrl = `https://news-hch.s3.ap-southeast-2.amazonaws.com`;
            const fullS3ObjectUrl = s3BucketUrl + '/' + key;
            console.log('Full object URL',fullS3ObjectUrl);
            // Notify that upload is successful
            if (callback && typeof callback === 'function') {
                callback(fullS3ObjectUrl);
            }
        }
    });
}
function execCommand(command, value = null) {
    document.execCommand(command, false, value);
}
function changeFontSize(size) {
    execCommand('fontSize', size);
}
function insertImage() {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.onchange = handleImageUpload1;
    input.click();
}
function insertLink() {
    const url = prompt("Enter the URL:");
    if (url) {
        execCommand('createLink', url);
    }
}
function handleImageUpload1(event, callback){
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
            // Cho phép kéo ảnh đi lòng vòng
            //const draggable = new Draggabilly(img);
            //document.getElementById('editor').appendChild(img);
            uploadImageToS31(file, (fullS3ObjectUrl) => {
                if (fullS3ObjectUrl) {
                    console.log('S3 Object URL:', fullS3ObjectUrl);
                    img.src = fullS3ObjectUrl;
                    console.log('Updated img.src:', img.src);
                    console.log(img.src);
                    document.getElementById('editor').appendChild(img);
                    console.log('Image appended to editor');
                    if (callback && typeof callback === 'function') {
                        callback(img); // Pass the img element to the callback
                    }
                }
            });
        };
        reader.readAsDataURL(file);
    }
}
function convertEditorContentToString() {
    return document.getElementById('editor').innerHTML;
}
function submitForm() {
    // Đặt giá trị của trường ẩn
    document.getElementById('editorContent').value = convertEditorContentToString();
    // Gửi form
    document.querySelector('.article_form').submit();
}
function submitAll(){
    submitFormTitle();
    submitForm();

}


