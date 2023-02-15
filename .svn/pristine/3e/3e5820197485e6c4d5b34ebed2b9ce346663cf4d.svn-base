package common.resolvers;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.navercorp.lucy.security.xss.servletfilter.XssEscapeFilter;



/**
 * <pre>
 * @PackageName: common.resolvers
 * @FileName : CommandMapArgumentResolver.java
 * @Date : 2020. 4. 8.
 * @프로그램 설명 : HTTP request 객체에 있는 파라미터이름과 값을 commandMap에 담는다.
 * @author upleat
 * </pre>
 */
public class CommandMapArgumentResolver implements WebArgumentResolver {
    
    private XssEscapeFilter xssEscapeFilter = XssEscapeFilter.getInstance();
    
    /**
     * <pre>
     * 1. MethodName : resolveArgument
     * 2. ClassName  : CommandMapArgumentResolver.java
     * 3. Comment    : Controller의 메소드 argument에 commandMap이라는 Map 객체가 있다면 HTTP request 객체에 있는 파라미터이름과 값을 commandMap에 담아 returing한다. 배열인 파라미터 값은 배열로 Map에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 8.
     * </pre>
     *
     * @see org.springframework.web.bind.support.WebArgumentResolver#resolveArgument(org.springframework.core.MethodParameter, org.springframework.web.context.request.NativeWebRequest)
     * @param methodParameter
     * @param webRequest
     * @return
     * @throws Exception
     */
    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest) throws Exception {
        Map<String, Object> commandMap = new HashMap<String, Object>();
        Class<?> clazz = methodParameter.getParameterType();
        String paramName = methodParameter.getParameterName();
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        boolean isSend = false;
        if (clazz.equals(Map.class) && paramName.equals("commandMap")) {
            Enumeration<?> enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String key = (String) enumeration.nextElement();
                String[] values = request.getParameterValues(key);
                if (values != null) {
                    if (values.length > 1) {
                        if (request instanceof MultipartHttpServletRequest) {
                            for (String value : values) {
                                value = xssEscapeFilter.doFilter(request.getRequestURI(), key, value);
                            }
                        }
                        commandMap.put(key, values);
                    } else {
                        if (request instanceof MultipartHttpServletRequest) {
                            commandMap.put(key, xssEscapeFilter.doFilter(request.getRequestURI(), key, values[0]));
                        } else {
                            commandMap.put(key, values[0]);
                        }
                    }
                }
            }
            isSend = true;
        }
        if (isSend) {
            return commandMap;
        } else {
            return UNRESOLVED;
        }
    }
}
