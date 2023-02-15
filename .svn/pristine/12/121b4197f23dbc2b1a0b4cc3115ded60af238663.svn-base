package web.bo.stats.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.stats.service.StatsCurationAnalysisService;

@Service("statsCurationAnalysisService")
public class StatsCurationAnalysisServiceImpl implements StatsCurationAnalysisService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectCurationAnalysisList
     * 2. ClassName  : StatsCurationAnalysisServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 큐레이션 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsCurationAnalysisService#selectCurationAnalysisList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCurationAnalysisList(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.selectList("StatsCurationAnalysis.selectStatsCurationAnalysisList", commandMap);
    }
}
