package net.fullstack7.common;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CookieManager {

    // 쿠키 추가 메서드
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);  // 쿠키의 유효 기간 설정 (초 단위)
        cookie.setPath("/");       // 쿠키의 유효 경로 설정 (루트 경로에서 모든 요청에 사용)
        response.addCookie(cookie);
    }

    // 쿠키 조회 메서드
    public static String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;  // 쿠키가 없을 경우 null 반환
    }

    // 쿠키 삭제 메서드
    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);  // 쿠키의 유효 기간을 0으로 설정하여 삭제
        cookie.setPath("/");  // 유효 경로 설정
        response.addCookie(cookie);
    }
}
