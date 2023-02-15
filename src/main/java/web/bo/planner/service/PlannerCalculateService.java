package web.bo.planner.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service
 * &#64;FileName : PlannerCalculateService.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 플래너 정산
 * &#64;author upleat
 * </pre>
 */
public interface PlannerCalculateService {

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateListCount
     * 2. ClassName  : PlannerCalculateService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     */
    int selectPlannerCalculateListCount(Map<String, Object> commandMap);

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateList
     * 2. ClassName  : PlannerCalculateService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     */
    List<Map<String, Object>> selectPlannerCalculateList(Map<String, Object> commandMap);

    /**
     * <pre>
     * 1. MethodName : requestCalculate
     * 2. ClassName  : PlannerCalculateService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 지급요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception 
     */
    int requestCalculate(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateHistoryListCount
     * 2. ClassName  : PlannerCalculateService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 정산금액 팝업 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     */
    int selectPlannerCalculateHistoryListCount(Map<String, Object> commandMap);

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateHistoryList
     * 2. ClassName  : PlannerCalculateService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 정산금액 팝업 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     */
    List<Map<String, Object>> selectPlannerCalculateHistoryList(Map<String, Object> commandMap);

}
