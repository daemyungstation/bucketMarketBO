package web.bo.planner.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service
 * &#64;FileName : PlannerQuizService.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 교육이수 관리
 * &#64;author upleat
 * </pre>
 */
public interface PlannerQuizService {

    /**
     * <pre>
     * 1. MethodName : selectPlannerQuizListCount
     * 2. ClassName  : PlannerQuizService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 목록 갯수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    int selectPlannerQuizListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerQuizList
     * 2. ClassName  : PlannerQuizService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    List<Map<String, Object>> selectPlannerQuizList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertPlannerQuizGroup
     * 2. ClassName  : PlannerQuizService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    int insertPlannerQuiz(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlannerQuiz
     * 2. ClassName  : PlannerQuizService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    int updatePlannerQuiz(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerQuizInfo
     * 2. ClassName  : PlannerQuizService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    Map<String, Object> selectPlannerQuizInfo(Map<String, Object> commandMap) throws Exception;

}
