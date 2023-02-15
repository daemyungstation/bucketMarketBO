package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import web.bo.planner.service.PlannerCalculateService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : PlannerCalculateServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 플래너 정산
 * &#64;author upleat
 * </pre>
 */
@Service("plannerCalculateService")
public class PlannerCalculateServiceImpl implements PlannerCalculateService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateListCount
     * 2. ClassName  : PlannerCalculateServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCalculateService#selectPlannerCalculateListCount(java.util.Map)
     * @param commandMap
     * @return
     */
    @Override
    public int selectPlannerCalculateListCount(Map<String, Object> commandMap) {
        return defaultDAO.selectCount("PlannerCalculate.selectPlannerCalculateListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateList
     * 2. ClassName  : PlannerCalculateServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCalculateService#selectPlannerCalculateList(java.util.Map)
     * @param commandMap
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerCalculateList(Map<String, Object> commandMap) {
        //제휴업체_레디플래너정산, 제휴업체_레디플래너정산(관리자)
        commandMap.put("doMasking", (SessionsManager.getSessionValue("AUT_MST_IDX").equals("10") || SessionsManager.getSessionValue("AUT_MST_IDX").equals("17")) ? 1 : 0  );
        
        return defaultDAO.selectList("PlannerCalculate.selectPlannerCalculateList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : requestCalculate
     * 2. ClassName  : PlannerCalculateServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 지급 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCalculateService#requestCalculate(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int requestCalculate(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RMT_ORD_REG_IP", IPUtil.getClientIP());
        commandMap.put("RMT_ORD_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        return defaultDAO.insert("PlannerCalculate.requestCalculate", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateHistoryListCount
     * 2. ClassName  : PlannerCalculateServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 정산금액 팝업 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCalculateService#selectPlannerCalculateHistoryListCount(java.util.Map)
     * @param commandMap
     * @return
     */
    @Override
    public int selectPlannerCalculateHistoryListCount(Map<String, Object> commandMap) {
        return defaultDAO.selectCount("PlannerCalculate.selectPlannerCalculateHistoryListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerCalculateHistoryList
     * 2. ClassName  : PlannerCalculateServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 정산금액 팝업 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCalculateService#selectPlannerCalculateHistoryList(java.util.Map)
     * @param commandMap
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerCalculateHistoryList(Map<String, Object> commandMap) {
        return defaultDAO.selectList("PlannerCalculate.selectPlannerCalculateHistoryList", commandMap);
    }

}
