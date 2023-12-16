<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="sign_up.css">
</head>
<body>
<div class="box" aria-hidden="true">
    <form action= "register" class="box_container" method="post">
        <input type="hidden" name="action" value="SignUp">
        <div class="left_form">
            <h2>Sign Up</h2>
            <div class="inputBox">
                <input type="text" name="fullName" required>
                <span>Full Name</span>
                <i></i>
            </div>
            <div class="inputBox">
                <label class="namsinh" for="dob">Date of birth:</label>
                <input type="date" id="dob" name="dateOfBirth">
            </div>
            <div class="inputBox">
                <input type="text" name="email" required>
                <span>Email</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="text" name="phoneNumber" required>
                <span>Phone</span>
                <i></i>
            </div>

            <div class="inputBox">
                <input type="text" name="userName" required>
                <span>Account</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="text" name="password" required>
                <span>Password</span>
                <i></i>
            </div>
            <div class="links">
                <a href="sign_in.jsp">Already Account</a>
            </div>
            <input type="submit" value="Sign up" onclick="submitFormTitle()">
        </div>
        <div class="right_form">
            <div class="container_img">
                <input type="file" id="titleImage" accept="image/*" hidden>
                <div class="img-area" data-img=""></div>
                <input type="hidden" id="titleImg" name="titleImg">
                <label class="select-image">Select Image Avatar</label>
            </div>
        </div>
    </form>
</div>
<script>
    document.querySelector('.select-image').addEventListener('click', function () {
        document.querySelector('#titleImage').click();
    })
    document.querySelector('#titleImage').addEventListener('change', function () {
        const image = this.files[0];
        if (image.size < 2000000) {
            handleImage(image, function (img) {
                const allImg = document.querySelector('.img-area').querySelectorAll('img');
                allImg.forEach(item => item.remove());
                document.querySelector('.img-area').appendChild(img);
                document.querySelector('.img-area').classList.add('active');
                document.querySelector('.img-area').dataset.img = image.name;
            });
        } else {
            alert("Image size more than 2MB");
        }
    });
    function handleImage(image, callback) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement('img');
            img.src = e.target.result;
            // Add CSS classes to set fixed width and height
            img.classList.add('fixed-width');
            img.classList.add('fixed-height');
            uploadToS3(image, function (fullS3ObjectUrl) {
                if (fullS3ObjectUrl) {
                    console.log('S3 Object URL:', fullS3ObjectUrl);
                    img.src = fullS3ObjectUrl;
                    console.log('Updated img.src:', img.src);
                    document.querySelector('.img-area').appendChild(img);
                    console.log('Image appended to .img-area');
                    if (callback && typeof callback === 'function') {
                        callback(img);
                    }
                }
            });
        };
        reader.readAsDataURL(image);
    }

    function uploadToS3(image, callback) {
        const s3 = new AWS.S3({
            accessKeyId: 'AKIA6GKZUZAHRQILCGV6', // Replace with your AWS access key
            secretAccessKey: 'SJvJXIkATESQQAW/QWhEN+UFOe7hlUDc4eRrOGwU', // Replace with your AWS secret key
            region: 'ap-southeast-2'
        });
        const timestamp = new Date().getTime();
        const key = `${timestamp}_${image.name}`;
        const params = {
            Bucket: 'news-hch',
            Key: key,
            Body: image,
            ContentType: image.type
        };
        s3.upload(params, (err, data) => {
            if (err) {
                console.error('Error uploading image to S3:', err);
                if (callback && typeof callback === 'function') {
                    callback(null);
                }
            } else {
                const s3ObjectUrl = data.Location;
                console.log('Object URL from S3:', s3ObjectUrl);

                const s3BucketUrl = `https://news-hch.s3.ap-southeast-2.amazonaws.com`;
                const fullS3ObjectUrl = s3BucketUrl + '/' + key;

                if (callback && typeof callback === 'function') {
                    callback(fullS3ObjectUrl);
                }
            }
        });
    }
    function convertImgAreaToHTMLString() {
        return document.querySelector('.img-area').innerHTML;
    }
    function submitFormTitle() {
        // Continue with your form submission logic
        document.getElementById('titleImg').value = convertImgAreaToHTMLString();
        document.querySelector('.article_form').submit();
    }
</script>
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.726.0.min.js"></script>
</body>
</html>