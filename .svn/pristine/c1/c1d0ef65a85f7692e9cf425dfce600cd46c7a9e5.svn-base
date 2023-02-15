package web.bo.planner.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service
 * &#64;FileName : PlannerGradeService.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 등급 관리
 * &#64;author upleat
 * </pre>
 */
public interface PlannerGradeService {

    /**
     * <pre>
     * 1. MethodName : selectGradeTerm
     * 2. ClassName  : PlannerGradeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급기준 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectGradeTerm(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectGradeList
     * 2. ClassName  : PlannerGradeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectGradeList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectGrade
     * 2. ClassName  : PlannerGradeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectGrade(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateGrade
     * 2. ClassName  : PlannerGradeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급 목록 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateGrade(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateGradeByFile
     * 2. ClassName  : PlannerGradeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 회원 등급 수정 (파일)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    public int updateGradeByFile(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
