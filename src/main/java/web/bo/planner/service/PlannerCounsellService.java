package web.bo.planner.service;

import java.util.List;
import java.util.Map;

public interface PlannerCounsellService {
    
    /**
     * <pre>
     * 1. MethodName : selectPlannerCounsellListCount
     * 2. ClassName  : PlannerCounsellService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > DB상담조회 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlannerCounsellListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerCounsellList
     * 2. ClassName  : PlannerCounsellService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > DB상담조회 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlannerCounsellList(Map<String, Object> commandMap) throws Exception;

    public String selectUpadate(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCounsellCalculateHistoryListCount
     * 2. ClassName  : PlannerCounsellService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > DB상담조회 목록 개수 > 메모 팝업 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     */
    int selectCounsellHistoryListCount(Map<String, Object> commandMap);

    /**
     * <pre>
     * 1. MethodName : selectCounsellCalculateHistoryList
     * 2. ClassName  : PlannerCounsellService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > DB상담조회 목록 개수 > 메모 팝업 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     */
    public List<Map<String, Object>> selectCounsellHistoryList(Map<String, Object> commandMap);

}
