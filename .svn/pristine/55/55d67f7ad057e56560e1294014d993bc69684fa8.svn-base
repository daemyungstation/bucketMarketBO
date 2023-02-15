package common.util;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {

    private Map<String, Cookie> cookieMap = new HashMap<>();

    /**
     * <pre>
     * 1. MethodName : CookieUtil
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : cookie배열을 cookieMap에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param request
     */
    public CookieUtil(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                cookieMap.put(cookies[i].getName(), cookies[i]);
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : createCookie
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : 쿠키객체를 생성해서 리턴
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param name
     * @param value
     * @return
     * @throws IOException
     */
    public static Cookie createCookie(String name, String value) throws IOException {
        return new Cookie(name, URLEncoder.encode(value, "utf-8"));
    }

     /**
      * <pre>
      * 1. MethodName : createCookie
      * 2. ClassName  : CookieUtil.java
      * 3. Comment    : 쿠키객체를 생성해서 리턴
      * 4. 작성자       : upleat
      * 5. 작성일       : 2020. 3. 9.
      * </pre>
      *
      * @param name
      * @param value
      * @param path
      * @return
      * @throws IOException
      */
    public static Cookie createCookie(String name, String value, String path) throws IOException {
        Cookie cookie = createCookie(name, value);
        cookie.setPath(path);
        return cookie;
    }
    
    /**
     * <pre>
     * 1. MethodName : createCookie
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : 쿠키객체를 생성해서 리턴
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param name
     * @param value
     * @param path
     * @param maxAge
     * @return
     * @throws IOException
     */
    public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
        Cookie cookie = createCookie(name, value, path);
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        return cookie;
    }

    /**
     * <pre>
     * 1. MethodName : createCookie
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : 쿠키객체를 생성해서 리턴
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param name
     * @param value
     * @param domain
     * @param path
     * @param maxAge
     * @return
     * @throws IOException
     */
    public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException {
        Cookie cookie = createCookie(name, value, path, maxAge);
        cookie.setDomain(domain);
        return cookie;
    }

    /**
     * <pre>
     * 1. MethodName : getCookie
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : 쿠키를 가져온다
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param name
     * @return
     */
    public Cookie getCookie(String name) {
        return (Cookie) cookieMap.get(name);
    }

    /**
     * <pre>
     * 1. MethodName : getValue
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : 쿠키의 값을 가져온다
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param name
     * @return
     * @throws IOException
     */
    public String getValue(String name) throws IOException {
        Cookie cookie = (Cookie) cookieMap.get(name);
        if (cookie == null)
            return "";
        return URLDecoder.decode(cookie.getValue(), "utf-8");
    }

    /**
     * <pre>
     * 1. MethodName : deleteCookie
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : 쿠키 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param cookieKey
     * @return
     */
    public Cookie deleteCookie(String cookieKey) {
        Cookie cookie = null;
        if (isExist(cookieKey)) {
            cookie = getCookie(cookieKey);
            // 쿠키생성시에 setPath()가 설정되어 있으면 삭제시에도 해당 패스를 다시 삭제하기위해서 생성된
            // 쿠키에 재설정하고 setMaxAge(0)으로 설정하며 삭제합니다.
            if (cookie.getPath() != null) {
                cookie.setPath(cookie.getPath());
            } else {
                cookie.setPath("/");
            }
            if (cookie.getDomain() != null) {
                cookie.setDomain(cookie.getDomain());
            }
            cookie.setMaxAge(0);
        }
        return cookie;
    }

    /**
     * <pre>
     * 1. MethodName : isExist
     * 2. ClassName  : CookieUtil.java
     * 3. Comment    : 쿠키 존재 여부
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 9.
     * </pre>
     *
     * @param name
     * @return
     */
    public boolean isExist(String name) {
        return cookieMap.get(name) != null;
    }
}
