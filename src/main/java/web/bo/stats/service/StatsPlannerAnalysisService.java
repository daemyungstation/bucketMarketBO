package web.bo.stats.service;

import java.util.Map;

public interface StatsPlannerAnalysisService {

    /**
     * <pre>
     * 1. MethodName : selectPlannerSummary1
     * 2. ClassName  : StatsPlannerAnalysisService.java
     * 3. Comment    : 레디플래너 현황
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerSummary1(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerSummary2
     * 2. ClassName  : StatsPlannerAnalysisService.java
     * 3. Comment    : 레디플래너 현황
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerSummary2(Map<String, Object> commandMap) throws Exception;

}
