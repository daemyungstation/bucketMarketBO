package web.bo.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.model.Manager;
import common.session.SessionsManager;
import web.bo.site.service.CommonCodeManagerService;

/**
 * @PackageName: web.bo.site.service.impl
 * @FileName : CommonCodeManagerServiceImpl.java
 * @Date : 2014. 4. 2.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 공통코드 관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("commonCodeManagerService")
public class CommonCodeManagerServiceImpl implements CommonCodeManagerService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : commonCodeManagerListCount
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonCodeManagerListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommonCodeManager.selectCommonCodeManagerListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : commonCodeManagerList
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonCodeManagerList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CommonCodeManager.selectCommonCodeManagerList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommonCodeManagerInfo
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCommonCodeManagerInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("CommonCodeManager.selectCommonCodeManagerInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertCommonCodeManager
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCommonCodeManager(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Manager manager = SessionsManager.getSessionManager(request);
        commandMap.put("CMN_COM_REG_IP", request.getRemoteAddr());
        commandMap.put("CMN_COM_REG_ID", manager.getADM_MST_ID());
        return defaultDAO.insert("CommonCodeManager.insertCommonCodeManager", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateCommonCodeManager
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommonCodeManager(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Manager manager = SessionsManager.getSessionManager(request);
        commandMap.put("CMN_COM_UPD_IP", request.getRemoteAddr());
        commandMap.put("CMN_COM_UPD_ID", manager.getADM_MST_ID());
        return defaultDAO.update("CommonCodeManager.updateCommonCodeManager", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateCommonCodeSortArray
     * 2. ClassName  : CommonCodeManagerServiceImpl.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 순서 정렬 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommonCodeManagerSortArray(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Manager manager = SessionsManager.getSessionManager(request);
        commandMap.put("CMN_COM_UPD_IP", request.getRemoteAddr());
        commandMap.put("CMN_COM_UPD_ID", manager.getADM_MST_ID());
        String[] CMN_COM_IDX = (String[]) commandMap.get("CMN_COM_IDX[]");
        String[] CMN_COM_SORT = (String[]) commandMap.get("CMN_COM_SORT[]");
        int result = 0;

        for (int i = 0; i < CMN_COM_IDX.length; i++) {
            commandMap.put("CMN_COM_IDX", CMN_COM_IDX[i]);
            commandMap.put("CMN_COM_SORT", CMN_COM_SORT[i]);
            result = defaultDAO.update("CommonCodeManager.updateCommonCodeManagerSortArray", commandMap);
        }

        return result;
    }
}
