package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.planner.service.ApplyPlannerService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : ApplyPlannerServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 신청 플래너
 * &#64;author upleat
 * </pre>
 */
@Service("applyPlannerService")
public class ApplyPlannerServiceImpl implements ApplyPlannerService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectApplyPlannerListCount
     * 2. ClassName  : ApplyPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 신청 플래너 > 신청 플래너 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectApplyPlannerListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ApplyPlanner.selectApplyPlannerListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectAuthManagerList
     * 2. ClassName  : ApplyPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 신청 플래너 > 신청 플래너 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectApplyPlannerList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("ApplyPlanner.selectApplyPlannerList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateStateApproveAll
     * 2. ClassName  : ApplyPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 신청 플래너 > 일괄 승인 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateStateApproveAll(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_MST_UPD_IP", IPUtil.getClientIP());

        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            int result = 0;
            for (Map<String, Object> param : paramList) {
                commandMap.put("RDP_MST_IDX", StringUtil.getString(param, "RDP_MST_IDX", ""));
                result += defaultDAO.update("ApplyPlanner.updateApproveAll", commandMap);
            }
            return result;
        } else {
            return 0;
        }
    }
}
