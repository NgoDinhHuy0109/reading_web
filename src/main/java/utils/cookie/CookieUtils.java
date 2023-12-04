package utils.cookie;

import com.mchange.v2.lang.StringUtils;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class CookieUtils {
    public Boolean setCookie(HttpServletResponse httpServletResponse, HttpServletRequest request, String json, String ele) {
        Cookie userCookie = new Cookie("accounts", URLEncoder.encode(json, StandardCharsets.UTF_8));
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

    public void deleteCookie(String ele,  HttpServletResponse response) {
        // Create a new cookie with the same name as the cookie to be deleted
        Cookie deleteCookie = new Cookie(ele, "");

        // Set its max age to 0 to delete the cookie
        deleteCookie.setMaxAge(0);

        // Add the cookie to the response
        response.addCookie(deleteCookie);
    }
}
