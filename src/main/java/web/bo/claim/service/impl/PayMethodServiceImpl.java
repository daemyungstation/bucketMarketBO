package web.bo.claim.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.claim.service.PayMethodService;

/**
 * <pre>
 * @PackageName: web.bo.claim.service.impl
 * @FileName : PayMethodServiceImpl.java
 * @Date : 2020. 4. 3.
 * @프로그램 설명 : 관리자 > 클레임 상담 조회 > 결제수단변경 신청
 * @author upleat
 * </pre>
 */
@Service("payMethodService")
public class PayMethodServiceImpl implements PayMethodService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    
    /**
     * <pre>
     * 1. MethodName : selectPayMethodListCount
     * 2. ClassName  : PayMethodServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.PayMethodService#selectPayMethodListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPayMethodListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PayMethod.selectPayMethodListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectPayMethodList
     * 2. ClassName  : PayMethodServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.PayMethodService#selectPayMethodList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPayMethodList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PayMethod.selectPayMethodList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectPayMethodInfo
     * 2. ClassName  : PayMethodServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 상세 정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.PayMethodService#selectPayMethodInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectPayMethodInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        Map<String, Object> info = defaultDAO.select("PayMethod.selectPayMethodInfo", commandMap);
        returnMap.put("info", info);
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : updatePayMethod
     * 2. ClassName  : PayMethodServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.PayMethodService#updatePayMethod(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePayMethod(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            commandMap.put("CLM_ACT_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
            commandMap.put("CLM_ACT_UPD_IP", IPUtil.getClientIP());
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("CLM_ACT_IDX", StringUtil.getString(param, "CLM_ACT_IDX", ""));
                commandMap.put("CMN_COM_IDX", StringUtil.getString(param, "CMN_COM_IDX", ""));
                result += defaultDAO.update("PayMethod.updatePayMethod", commandMap);
            }
        }
        return result;
    }
}
