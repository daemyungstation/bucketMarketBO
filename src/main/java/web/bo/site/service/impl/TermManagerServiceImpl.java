package web.bo.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import web.bo.site.service.TermManagerService;

/**
 * @PackageName: web.bo.board.service.impl
 * @FileName : TermManagerServiceImpl.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 관리자 > 기준정보 >이용약관관리 처리하는 serviceImpl
 * @author upleat
 */

@Service("termManagerService")
public class TermManagerServiceImpl implements TermManagerService {
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectTermManagerListCount
     * 2. ClassName  : TermManagerServiceImpl.java
     * 3. Comment    : 관리자 > 기준정보 > 이용약관 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectTermManagerListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("TermManager.selectTermManagerListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectTermManagerList
     * 2. ClassName  : TermManagerServiceImpl.java
     * 3. Comment    : 관리자 > 기준정보 > 이용약관 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectTermManagerList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("TermManager.selectTermManagerList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectTermManagerInfo
     * 2. ClassName  : TermManagerServiceImpl.java
     * 3. Comment    : 관리자 > 기준정보 > 이용약관 상세조회, 이용약관 개정이력
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectTermManagerInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("TermManager.selectTermManagerInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertTermManager
     * 2. ClassName  : TermManagerServiceImpl.java
     * 3. Comment    : 관리자 > 기준정보 > 이용약관 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertTermManager(Map<String, Object> commandMap) throws Exception {
        commandMap.put("AGR_MST_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("AGR_MST_REG_IP", IPUtil.getClientIP());
        return defaultDAO.insert("TermManager.insertTermManager", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateTermManager
     * 2. ClassName  : TermManagerServiceImpl.java
     * 3. Comment    : 관리자 > 기준정보 > 이용약관 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateTermManager(Map<String, Object> commandMap) throws Exception {
        commandMap.put("AGR_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("AGR_MST_UPD_IP", IPUtil.getClientIP());
        return defaultDAO.update("TermManager.updateTermManager", commandMap);
    }

}
