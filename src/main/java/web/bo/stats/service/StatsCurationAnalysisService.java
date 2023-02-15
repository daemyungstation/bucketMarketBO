package web.bo.stats.service;

import java.util.List;
import java.util.Map;

public interface StatsCurationAnalysisService {

    /**
     * <pre>
     * 1. MethodName : selectCurationAnalysisList
     * 2. ClassName  : StatsCurationAnalysisService.java
     * 3. Comment    : 관리자 > 통계 > 큐레이션 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCurationAnalysisList(Map<String, Object> commandMap) throws Exception;
    
}
