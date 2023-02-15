package web.bo.planner.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service
 * &#64;FileName : PlannerStatusService.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회
 * &#64;author upleat
 * </pre>
 */
public interface PlannerStatusService {

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusListCount
     * 2. ClassName  : PlannerStatusService.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlannerStatusListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusList
     * 2. ClassName  : PlannerStatusService.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlannerStatusList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusListCount
     * 2. ClassName  : PlannerStatusService.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 등급별 현황조회 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlannerGradeStatusListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusList
     * 2. ClassName  : PlannerStatusService.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 등급별 현황조회 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlannerGradeStatusList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusHistoryListCount
     * 2. ClassName  : PlannerStatusService.java
     * 3. Comment    : 상태별 이력 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlannerStatusHistoryListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusHistoryList
     * 2. ClassName  : PlannerStatusService.java
     * 3. Comment    : 상태별 이력 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlannerStatusHistoryList(Map<String, Object> commandMap) throws Exception;

}
