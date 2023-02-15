package common.util;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import common.model.Request;

public class IPUtil {
    
    /**
     * <pre>
     * 1. MethodName : getClientIP
     * 2. ClassName  : IPUtil.java
     * 3. Comment    : 클라이언트 아이피 정보를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @return
     */
    public  static String getClientIP () {
        HttpServletRequest request = Request.getCurrentRequest();
        return request.getRemoteAddr();
    }

    /**
     * <pre>
     * 1. MethodName : getServerIP
     * 2. ClassName  : IPUtil.java
     * 3. Comment    : 서버 아이피 정보를 반환한다
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    public  static String getServerIP() throws Exception {
        InetAddress ip = InetAddress.getLocalHost();
        return ip.getHostAddress();
    }
    
}
