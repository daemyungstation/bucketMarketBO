package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import web.bo.planner.service.PlannerCounsellService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : ActivePlannerServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 활동 플래너
 * &#64;author upleat
 * </pre>
 */
@Service("plannerCounsellService")
public class PlannerCounsellServiceImpl implements PlannerCounsellService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectActivePlannerListCount
     * 2. ClassName  : ActivePlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 신청 플래너 > 활동 플래너 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @see web.bo.planner.service.ActivePlannerService#selectActivePlannerListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlannerCounsellListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PlannerCounsell.selectPlannerCounsellListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectActivePlannerList
     * 2. ClassName  : ActivePlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 신청 플래너 > 활동 플래너 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.planner.service.ActivePlannerService#selectActivePlannerListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlannerCounsellList(Map<String, Object> commandMap) throws Exception {   
        //제휴업체_레디플래너정산, 제휴업체_레디플래너정산(관리자)
        commandMap.put("doMasking", (SessionsManager.getSessionValue("AUT_MST_IDX").equals("10") || SessionsManager.getSessionValue("AUT_MST_IDX").equals("17")) ? 1 : 0  );
        return (List<Map<String, Object>>) defaultDAO.selectList("PlannerCounsell.selectPlannerCounsellList", commandMap);
    }

    @Override
    public String selectUpadate(Map<String, Object> commandMap) throws Exception {
        
        return defaultDAO.selectStr("PlannerCounsell.selectUpadate", commandMap);
    }
    
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
    @Override
    public int selectCounsellHistoryListCount(Map<String, Object> commandMap) {
        return defaultDAO.selectCount("PlannerCounsell.selectCounsellHistoryListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCounsellCalculateHistoryListCount
     * 2. ClassName  : PlannerCounsellService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > DB상담조회 목록 개수 > 메모 팝업 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectCounsellHistoryList(Map<String, Object> commandMap) {
        return defaultDAO.selectList("PlannerCounsell.selectCounsellHistoryList", commandMap);
    }

}
