package utils.cookie;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import static Service.OTPGenerator.encodeOTP;
import static Service.OTPGenerator.generateOTP;

public class CookieUtils {
    public Boolean setCookie(HttpServletResponse httpServletResponse, HttpServletRequest request, String json, String ele) {
        Cookie userCookie = new Cookie("accounts", URLEncoder.encode(json, StandardCharsets.UTF_8));
        String otp = generateOTP(); // Hàm generateOTP() tạo mã OTP

        // Lưu mã OTP vào Cookie
        Cookie otpCookie = new Cookie("otp", encodeOTP(otp)); // Hàm encodeOTP() để mã hóa OTP
        otpCookie.setMaxAge(60); // Thời gian tồn tại của Cookie (ví dụ: 5 phút)
        httpServletResponse.addCookie(otpCookie);
        //expire after 1 day
        userCookie.setMaxAge(14400);
        httpServletResponse.addCookie(userCookie);

        //check if cookie is saved
        return getCookie(request, ele) != null;
    }

    public String getCookie(HttpServletRequest request, String ele) {
        Cookie[] cookies = request.getCookies();
        String userCookieValue = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (ele.equals(cookie.getName())) {
                    userCookieValue = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                    return userCookieValue;
                }
            }
        }
        return userCookieValue;
    }

    public Boolean setOTP(HttpServletResponse httpServletResponse, HttpServletRequest request) {
        String otp = generateOTP(); // Hàm generateOTP() tạo mã OTP

        // Lưu mã OTP vào Cookie
        Cookie otpCookie = new Cookie("otp", encodeOTP(otp)); // Hàm encodeOTP() để mã hóa OTP
        otpCookie.setMaxAge(60); // Thời gian tồn tại của Cookie (ví dụ: 5 phút)
        httpServletResponse.addCookie(otpCookie);

        //check if cookie is saved
        return getOTPSentToUserFromCookieOrStorage(request) != null;
    }

    public String getOTPSentToUserFromCookieOrStorage(HttpServletRequest request) {
        // Lấy mã OTP từ Cookie (nếu sử dụng Cookie để lưu trữ)
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("otp".equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    public void deleteCookie(String ele, HttpServletResponse response) {
        // Create a new cookie with the same name as the cookie to be deleted
        Cookie deleteCookie = new Cookie(ele, "");
        // Set its max age to 0 to delete the cookie
        deleteCookie.setMaxAge(0);
        // Add the cookie to the response
        response.addCookie(deleteCookie);
    }
}
