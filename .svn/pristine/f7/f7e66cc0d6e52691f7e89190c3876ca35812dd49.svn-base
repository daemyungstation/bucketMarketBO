package web.bo.stats.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.stats.service.StatsPlannerAnalysisService;

@Service("statsPlannerAnalysisService")
public class StatsPlannerAnalysisServiceImpl implements StatsPlannerAnalysisService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectPlannerSummary1
     * 2. ClassName  : StatsPlannerAnalysisServiceImpl.java
     * 3. Comment    : 레디플래너 현황
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsPlannerAnalysisService#selectPlannerSummary1(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectPlannerSummary1(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.select("StatsPlannerAnalysis.selectStatsPlannerSummary1", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerSummary2
     * 2. ClassName  : StatsPlannerAnalysisServiceImpl.java
     * 3. Comment    : 레디플래너 현황
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsPlannerAnalysisService#selectPlannerSummary(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectPlannerSummary2(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.select("StatsPlannerAnalysis.selectStatsPlannerSummary2", commandMap);
    }
}
