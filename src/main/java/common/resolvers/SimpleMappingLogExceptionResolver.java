package common.resolvers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import common.exception.AuthenticationException;

public class SimpleMappingLogExceptionResolver extends SimpleMappingExceptionResolver {

    private static final Logger logger = LoggerFactory.getLogger(SimpleMappingLogExceptionResolver.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        if (ex instanceof AuthenticationException) {
            logger.error(ex.toString());
        } else {
            logger.error(ex.getMessage(), ex);
        }
        return super.resolveException(request, response, handler, ex);
    }
}
