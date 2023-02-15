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
import web.bo.claim.service.TransferService;

/**
 * <pre>
 * @PackageName: web.bo.claim.service.impl
 * @FileName : TransferServiceImpl.java
 * @Date : 2020. 4. 3.
 * @프로그램 설명 : 관리자 > 클레임 상담 조회 > 양도/양수 신청
 * @author upleat
 * </pre>
 */
@Service("transferService")
public class TransferServiceImpl implements TransferService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectTransferListCount
     * 2. ClassName  : TransferServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 양도/양수 신청 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 3.
     * </pre>
     *
     * @see web.bo.claim.service.TransferService#selectTransferListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectTransferListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Transfer.selectTransferListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectTransferList
     * 2. ClassName  : TransferServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 양도/양수 신청 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 3.
     * </pre>
     *
     * @see web.bo.claim.service.TransferService#selectTransferList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectTransferList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Transfer.selectTransferList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateTransfer
     * 2. ClassName  : TransferServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 양도/양수 신청 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.TransferService#updateTransfer(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateTransfer(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            commandMap.put("CLM_TRS_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
            commandMap.put("CLM_TRS_UPD_IP", IPUtil.getClientIP());
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("CLM_TRS_IDX", StringUtil.getString(param, "CLM_TRS_IDX", ""));
                commandMap.put("CMN_COM_IDX", StringUtil.getString(param, "CMN_COM_IDX", ""));
                result += defaultDAO.update("Transfer.updateTransfer", commandMap);
            }
        }
        return result;
    }
}
