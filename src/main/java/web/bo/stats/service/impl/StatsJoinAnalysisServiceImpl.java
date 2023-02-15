package web.bo.stats.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Code;
import common.dao.CommonDefaultDAO;
import common.util.StringUtil;
import web.bo.stats.service.StatsJoinAnalysisService;

@Service("statsJoinAnalysisService")
public class StatsJoinAnalysisServiceImpl implements StatsJoinAnalysisService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    
    /**
     * <pre>
     * 1. MethodName : selectStatsJoinAnalysisSexList
     * 2. ClassName  : StatsJoinAnalysisServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 성별
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsJoinAnalysisService#selectStatsJoinAnalysisSexList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectStatsJoinAnalysisSexList(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisSexList", commandMap);
    }
    
    
    /**
     * <pre>
     * 1. MethodName : selectStatsJoinAnalysisAgeList
     * 2. ClassName  : StatsJoinAnalysisServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 연령대  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsJoinAnalysisService#selectStatsAnalysisAgeList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectStatsJoinAnalysisAgeList(Map<String, Object> commandMap) throws Exception {
        int searchStatus = StringUtil.getInt(commandMap, "searchStatus", Code.CONTRACT_STATUS_RECEIPT);
        if (searchStatus == Code.MEMBER_JOIN_READY) { // 대기
            return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisAgeWaitList", commandMap);
        } else if (searchStatus == Code.MEMBER_JOIN_COMPLETE) { // 가입
            return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisAgeJoinList", commandMap);
        } else if (searchStatus == Code.MEMBER_JOIN_CANCEL) { // 해약
            return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisAgeCancelList", commandMap);
        } else { // 접수
            return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisAgeRegistList", commandMap);
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : selectStatsJoinAnalysisProductTypeList
     * 2. ClassName  : StatsJoinAnalysisServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 상품유형
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsJoinAnalysisService#selectStatsJoinAnalysisProductTypeList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectStatsJoinAnalysisProductTypeList(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisProductTypeList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectStatsJoinAnalysisProductList
     * 2. ClassName  : StatsJoinAnalysisServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 상품정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsJoinAnalysisService#selectStatsJoinAnalysisProductList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectStatsJoinAnalysisProductList(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisProductList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectStatsJoinAnalysisProductCategoryList
     * 2. ClassName  : StatsJoinAnalysisServiceImpl.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 상품 카테고리 정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @see web.bo.stats.service.StatsJoinAnalysisService#selectStatsJoinAnalysisProductCategoryList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectStatsJoinAnalysisProductCategoryList(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.selectList("StatsJoinAnalysis.selectStatsJoinAnalysisProductCategoryList", commandMap);
    }
}
