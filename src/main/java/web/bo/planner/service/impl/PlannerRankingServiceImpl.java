package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.planner.service.PlannerRankingService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : PlannerRankingServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 랭킹조회
 * &#64;author upleat
 * </pre>
 */
@Service("plannerRankingService")
public class PlannerRankingServiceImpl implements PlannerRankingService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectPlannerRankingListCount
     * 2. ClassName  : PlannerRankingServiceImpl.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerRankingService#selectPlannerRankingListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectPlannerRankingListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PlannerRanking.selectPlannerRankingListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerRankingList
     * 2. ClassName  : PlannerRankingServiceImpl.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerRankingService#selectPlannerRankingList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerRankingList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PlannerRanking.selectPlannerRankingList", commandMap);
    }

}
