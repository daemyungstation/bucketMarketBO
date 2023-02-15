package web.bo.stats.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.stats.service.StatsSummeryService;

@Service("statsSummeryService")
public class StatsSummeryServiceImpl implements StatsSummeryService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    
    /**
     * <pre>
     * 1. MethodName : selectStatsSummaryRatioInfo
     * 2. ClassName  : StatsSummeryServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 개요 > 실적 비중
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsSummeryService#selectStatsSummaryRatioInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectStatsSummaryRatioInfo(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.select("StatsSummery.selectStatsSummaryRatioInfo", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectStatsSummaryRecordList
     * 2. ClassName  : StatsSummeryServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 개요 > 실적 정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsSummeryService#selectStatsSummaryRecordList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectStatsSummaryRecordList(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.selectList("StatsSummery.selectStatsSummaryRecordList", commandMap);
    }
}
