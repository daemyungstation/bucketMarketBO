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
import web.bo.claim.service.LifeService;

/**
 * <pre>
 * @PackageName: web.bo.claim.service.impl
 * @FileName : LifeServiceImpl.java
 * @Date : 2020. 4. 3.
 * @프로그램 설명 : 관리자 > 클레임 상담 조회 > 라이프서비스 신청
 * @author upleat
 * </pre>
 */
@Service("lifeService")
public class LifeServiceImpl implements LifeService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectLifeListCount
     * 2. ClassName  : LifeServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 라이프서비스 신청 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.LifeService#selectLifeListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectLifeListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Life.selectLifeListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectLifeList
     * 2. ClassName  : LifeServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 라이프서비스 신청 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.LifeService#selectLifeList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectLifeList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Life.selectLifeList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateLife
     * 2. ClassName  : LifeServiceImpl.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 라이프서비스 신청 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @see web.bo.claim.service.LifeService#updateLife(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateLife(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            commandMap.put("CLM_LFS_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
            commandMap.put("CLM_LFS_UPD_IP", IPUtil.getClientIP());
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("CLM_LFS_IDX", StringUtil.getString(param, "CLM_LFS_IDX", ""));
                commandMap.put("CMN_COM_IDX", StringUtil.getString(param, "CMN_COM_IDX", ""));
                result += defaultDAO.update("Life.updateLife", commandMap);
            }
        }
        return result;
    }
}
