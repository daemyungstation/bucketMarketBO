package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.planner.service.PlannerStatusService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : PlannerStatusServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회
 * &#64;author upleat
 * </pre>
 */
@Service("plannerStatusService")
public class PlannerStatusServiceImpl implements PlannerStatusService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusListCount
     * 2. ClassName  : PlannerStatusServiceImpl.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerStatusService#selectPlannerStatusListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectPlannerStatusListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PlannerStatus.selectPlannerStatusListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusList
     * 2. ClassName  : PlannerStatusServiceImpl.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 현황조회 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerStatusService#selectPlannerStatusList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerStatusList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PlannerStatus.selectPlannerStatusList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerGradeStatusListCount
     * 2. ClassName  : PlannerStatusServiceImpl.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 등급별 현황조회 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerStatusService#selectPlannerGradeStatusListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectPlannerGradeStatusListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PlannerStatus.selectPlannerGradeStatusListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerGradeStatusList
     * 2. ClassName  : PlannerStatusServiceImpl.java
     * 3. Comment    : 프로그램 설명 : 관리자 > 레디플래너 관리 > 등급별 현황조회 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerStatusService#selectPlannerGradeStatusList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerGradeStatusList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PlannerStatus.selectPlannerGradeStatusList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusHistoryListCount
     * 2. ClassName  : PlannerStatusServiceImpl.java
     * 3. Comment    : 상태별 현황 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 4.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerStatusService#selectPlannerStatusHistoryListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectPlannerStatusHistoryListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PlannerStatus.selectPlannerStatusHistoryListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerStatusHistoryList
     * 2. ClassName  : PlannerStatusServiceImpl.java
     * 3. Comment    : 상태별 현황 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 4.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerStatusService#selectPlannerStatusHistoryList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerStatusHistoryList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PlannerStatus.selectPlannerStatusHistoryList", commandMap);
    }

}
