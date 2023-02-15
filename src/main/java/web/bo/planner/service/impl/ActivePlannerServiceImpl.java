package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.planner.service.ActivePlannerService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : ActivePlannerServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 활동 플래너
 * &#64;author upleat
 * </pre>
 */
@Service("activePlannerService")
public class ActivePlannerServiceImpl implements ActivePlannerService {

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
    public int selectActivePlannerListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ActivePlanner.selectActivePlannerListCount", commandMap);
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
    public List<Map<String, Object>> selectActivePlannerList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("ActivePlanner.selectActivePlannerList", commandMap);
    }

}
