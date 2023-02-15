package common.matcher;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

public class CsrfRequestMatcher implements RequestMatcher {
    
    private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");
    private RegexRequestMatcher unprotectedMatcher = new RegexRequestMatcher("/fr/common/oneselfResult.do", null);
    
    @Override
    public boolean matches(HttpServletRequest request) {
        boolean rtnMatcher = unprotectedMatcher.matches(request);
        if(rtnMatcher){
            return false;
        }else{
            if(allowedMethods.matcher(request.getMethod()).matches()){
                return false;
            }else{
                return true;
            }
        }
    }
}
