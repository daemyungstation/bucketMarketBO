package web.bo.claim.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.claim.service.CancellationService;

/**
 * <pre>
 * @PackageName: web.bo.claim.service.impl
 * @FileName : CancellationServiceImpl.java
 * @Date : 2020. 4. 3.
 * @프로그램 설명 : @프로그램 설명 : 관리자 > 클레임 상담 조회 > 해지 신청
 * @author upleat
 * </pre>
 */
@Service("cancellationService")
public class CancellationServiceImpl implements CancellationService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectCancellationListCount
     * 2. ClassName  : CancellationServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 해지 신청 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.CancellationService#selectCancellationListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCancellationListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Cancellation.selectCancellationListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCancellationList
     * 2. ClassName  : CancellationServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 해지 신청 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.CancellationService#selectCancellationList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCancellationList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Cancellation.selectCancellationList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateCancellation
     * 2. ClassName  : CancellationServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 해지 신청 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.CancellationService#updateCancellation(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCancellation(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            commandMap.put("CLM_CCL_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
            commandMap.put("CLM_CCL_UPD_IP", IPUtil.getClientIP());
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("CLM_CCL_IDX", StringUtil.getString(param, "CLM_CCL_IDX", ""));
                commandMap.put("CMN_COM_IDX", StringUtil.getString(param, "CMN_COM_IDX", ""));
                result += defaultDAO.update("Cancellation.updateCancellation", commandMap);
            }
        }
        return result;
    }
}
