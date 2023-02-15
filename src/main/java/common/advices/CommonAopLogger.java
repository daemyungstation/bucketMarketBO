package common.advices;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

public class CommonAopLogger {

    private ObjectMapper mapper = new ObjectMapper();

    /**
     * 컨트롤러
     */
    public Object logController(ProceedingJoinPoint point) throws Throwable {

        MethodSignature signature = (MethodSignature) point.getSignature();
        Logger logger = LoggerFactory.getLogger(signature.getDeclaringType());
        logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");

        String prefix = signature.getName() + "() ";

        try {
            logger.info(prefix + "REQUEST : " + ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getRequestURI());
        } catch (Exception e) {
            logger.info(prefix + "REQUEST : ");
        }

        String[] parameterNames = signature.getParameterNames();
        Object[] signatureArgs = point.getArgs();
        for (int i = 0; i < parameterNames.length; i++) {

            if (signatureArgs[i] instanceof HttpServletRequest) {
                logger.debug(prefix + "PARAMETER [request:HttpServletRequest] : ...");
            } else if (signatureArgs[i] instanceof HttpServletResponse) {
                logger.debug(prefix + "PARAMETER [response:HttpServletResponse] : ...");
            } else {
                String argStr = "";
                if (signatureArgs[i] != null) {
                    argStr = signatureArgs[i].toString();
                }
                logger.debug(prefix + "PARAMETER [" + parameterNames[i] + ":" + signatureArgs[i].getClass().getCanonicalName() + "] : " + argStr);
            }
        }

        // proceed
        Object result = point.proceed();

        // logger.info(prefix + "RESULT : " + result);
        logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");

        return result;
    }

    /**
     * 서비스
     */
    public Object logService(ProceedingJoinPoint point) throws Throwable {

        MethodSignature signature = (MethodSignature) point.getSignature();
        Logger logger = LoggerFactory.getLogger(signature.getDeclaringType());
        logger.debug("====================================================================================================================");

        String prefix = signature.getName() + "() ";
        String[] parameterNames = signature.getParameterNames();
        Object[] signatureArgs = point.getArgs();
        for (int i = 0; i < parameterNames.length; i++) {

            if (signatureArgs[i] instanceof HttpServletRequest) {
                logger.debug(prefix + "PARAMETER [request:HttpServletRequest] : ...");
            } else if (signatureArgs[i] instanceof HttpServletResponse) {
                logger.debug(prefix + "PARAMETER [response:HttpServletResponse] : ...");
            } else {
                Object arg = "";
                if (signatureArgs[i] != null) {
                    arg = signatureArgs[i];
                }
                try {
                    if (signatureArgs[i] != null) {
                        logger.debug(prefix + "PARAMETER [" + parameterNames[i] + ":" + signatureArgs[i].getClass().getCanonicalName() + "] : " + mapper.writeValueAsString(arg));
                    } else {
                        logger.debug(prefix + "PARAMETER [" + parameterNames[i] + ":" + "NULL" + "] : " + "NULL");
                    }
                } catch (Exception e) {
                    if (signatureArgs[i] != null) {
                        logger.debug(prefix + "PARAMETER [" + parameterNames[i] + ":" + signatureArgs[i].getClass().getCanonicalName() + "] : " + mapper.writeValueAsString(arg));
                    } else {
                        logger.debug(prefix + "PARAMETER [" + parameterNames[i] + ":" + "NULL" + "] : " + "NULL");
                    }
                }
            }
        }

        // proceed
        Object result = point.proceed();

        //        Object arg = "";
        //        if (result != null) {
        //            arg = result;
        //        }
        //        try {
        //            logger.debug(prefix + "RETURN : " + mapper.writeValueAsString(arg));
        //        } catch (Exception e) {
        //            logger.debug(prefix + "RETURN : " + arg);
        //        }
        logger.debug("====================================================================================================================");

        return result;
    }
}
