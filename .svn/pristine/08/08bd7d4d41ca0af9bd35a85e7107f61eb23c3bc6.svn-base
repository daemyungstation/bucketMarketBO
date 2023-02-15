package common.advices;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.springframework.core.annotation.AnnotationUtils;

import common.annotation.AccessLevel;
import common.exception.AccessException;
import common.exception.AuthenticationException;
import common.model.Manager;
import common.model.Manager.ROLE_MANAGER;
import common.model.Request;
import common.session.SessionsManager;
import common.session.SessionsMenu;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class PageRequestPermissionAdvice {
    
    private Method getMethod(Class<?> clazz, String methodName) throws Exception {
        Method method = null;
        for (Method item : clazz.getMethods()) {
            if ((methodName).equals(item.getName())) {
                method = clazz.getMethod(item.getName(), item.getParameterTypes());
                break;
            }
        }
        return method;
    }
    
    private void checkAccessRoleLevel(HttpServletRequest request, Class<?> clazz, String methodName, String requestUri) throws Exception {
        Method method = getMethod(clazz, methodName);
        // 접근자 디폴트 셋팅
        ROLE_MANAGER grantRole = ROLE_MANAGER.guest;
        try {
            // 접근하고자 하는 Class 또는 Method의 접근 레벨 확인
            if (AnnotationUtils.findAnnotation(method, AccessLevel.class) != null) {
                grantRole = AnnotationUtils.findAnnotation(method, AccessLevel.class).value();
            } else if (clazz.isAnnotationPresent(AccessLevel.class)) {
                grantRole = clazz.getAnnotation(AccessLevel.class).value();
            }
        } catch (Exception e) {

        }
        // 로그인 세션이 존재 유무에 따른 접근자 레벨 설정
        ROLE_MANAGER accessRole = SessionsManager.isLogin(request) ? (ROLE_MANAGER) SessionsManager.getSessionRole(request) : ROLE_MANAGER.guest;
        int grantRoleCnt = Manager.levels.get(grantRole);
        int accessRoleCnt = Manager.levels.get(accessRole);
        log.debug("접근 권한   : [{}]              접근 권한 레벨 : [{}]", accessRole, accessRoleCnt);
        log.debug("부여 권한   : [{}]              부여 권한 레벨 : [{}]", grantRole, grantRoleCnt);
        log.debug("접근 URI : [{}]", requestUri);
        if (accessRoleCnt < grantRoleCnt) {
            if (SessionsManager.isLogin(request)) {
                // 페이지 접근 권한 없음
                throw new AccessException();
            } else {
                // 로그인 하지 않은 사용자
                throw new AuthenticationException();
            }
        }
    }
    
    private void checkAccessMenuRole(HttpServletRequest request, String requestUri) throws Exception {
        if (SessionsManager.isLogin(request)) {
            final String [] excludes = {"dashboard", "login", "logout", "common"};
            boolean isAccessible = false;
            for (String exclude : excludes) {
                if (requestUri.toLowerCase().contains(exclude)) {
                    isAccessible = true;
                    break;
                }
            }
            if (!isAccessible) {
                List<Map<String, Object>> menuList = SessionsMenu.getSessionMenuList(request);
                for (Map<String, Object> menu : menuList) {
                    String menuAuthUrl = StringUtil.getString(menu, "ADM_MNU_AUTH_URL").trim();
                    if (requestUri.contains(menuAuthUrl)) {
                        log.debug("부여 URI   : [{}]", menuAuthUrl);
                        isAccessible = true;
                        break;
                    }
                }
                if (!isAccessible) {
                    throw new AccessException();
                }
            }
        }
    }
    
    public void checkPageRequestPermission(JoinPoint joinPoint) throws Exception {
        HttpServletRequest request = Request.getCurrentRequest();
        String requestUri = request.getRequestURI().toString();
        log.debug("〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓");
        checkAccessRoleLevel(request, joinPoint.getTarget().getClass(), joinPoint.getSignature().getName(), requestUri);
        checkAccessMenuRole(request, requestUri);
        log.debug("〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓");
    }
}
