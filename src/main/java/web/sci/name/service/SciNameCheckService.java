package web.sci.name.service;

import javax.servlet.http.HttpServletRequest;

import web.sci.name.model.SciNameCheckRequest;
import web.sci.name.model.SciNameCheckResult;

/**
 * <pre>
 * &#64;PackageName: web.sci.name.service
 * &#64;FileName : SciNameCheckService.java
 * &#64;Date : 2020. 5. 12.
 * &#64;프로그램 설명 : SCI 실명확인 서비스
 * &#64;author upleat
 * </pre>
 */
public interface SciNameCheckService {

    /**
     * <pre>
     * 1. MethodName : checkName
     * 2. ClassName  : SciNameCheckService.java
     * 3. Comment    : 실명확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param commandMap
     * @throws Exception
     */
    public SciNameCheckResult nameCheck(HttpServletRequest request, SciNameCheckRequest param);
}
