package common.session;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionsMenu {

    private static final String BACK_OFFICE_MENU_LIST = "__MENU_LIST__";
    
    /**
     * <pre>
     * 1. MethodName : setSessionMenuList
     * 2. ClassName  : SessionsMenu.java
     * 3. Comment    : 세션에 메뉴 정보를 담는다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param menuList
     */
    public static void setSessionMenuList(HttpServletRequest request, List<Map<String, Object>> menuList) {
        HttpSession session = request.getSession();
        session.setAttribute(BACK_OFFICE_MENU_LIST, menuList);
    }
    
    /**
     * <pre>
     * 1. MethodName : getSessionMenuList
     * 2. ClassName  : SessionsMenu.java
     * 3. Comment    : 세션에 담긴 메뉴 목록을 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Map<String, Object>> getSessionMenuList(HttpServletRequest request) {
        try {
            return (List<Map<String, Object>>) request.getSession().getAttribute(BACK_OFFICE_MENU_LIST);
        } catch (Exception e) {
            return null;
        }

    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionClear
     * 2. ClassName  : SessionsMenu.java
     * 3. Comment    : 세션을 삭제한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     */
    public static void setSessionClear(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute(BACK_OFFICE_MENU_LIST, null);
    }
}
