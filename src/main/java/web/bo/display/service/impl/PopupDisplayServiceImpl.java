package web.bo.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.StringUtil;
import web.bo.common.service.CommonFileService;
import web.bo.display.service.PopupDisplayService;

/**
 * @PackageName: web.bo.display.service.impl
 * @FileName : PopupDisplayServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 팝업관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("popupDisplayService")
public class PopupDisplayServiceImpl implements PopupDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="commonFileService")
    private CommonFileService commonFileService;
    
    private static final String UPLOAD_PATH = "display";
    private static final String UPLOAD_ALLOW = "image";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";
    
    /**
     * <pre>
     * 1. MethodName : selectPopupDisplayCount
     * 2. ClassName  : PopupDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.PopupDisplayService#selectPopupDisplayCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPopupDisplayCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PopupDisplay.selectPopupDisplayCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPopupDisplayList
     * 2. ClassName  : PopupDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.PopupDisplayService#selectPopupDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPopupDisplayList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PopupDisplay.selectPopupDisplayList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectPopupDisplayInfo
     * 2. ClassName  : PopupDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.PopupDisplayService#selectPopupDisplayInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPopupDisplayInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("PopupDisplay.selectPopupDisplayInfo", commandMap));
        commandMap.put("CMM_FLE_TB_NM", "T_POP_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "POP_MST_IDX"));
        returnMap.put("fileList", commonFileService.selectCommonFileList(commandMap));
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertPopupDisplay
     * 2. ClassName  : PopupDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.PopupDisplayService#insertPopupDisplay(org.springframework.web.multipart.MultipartHttpServletRequest, java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertPopupDisplay(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("POP_MST_REG_IP", IPUtil.getClientIP());
        commandMap.put("POP_MST_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        result += defaultDAO.insert("PopupDisplay.insertPopupDisplay", commandMap);
        if (result > 0) {
            commandMap.put("CMM_FLE_TB_NM", "T_POP_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "POP_MST_IDX"));
            result += commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        }
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updatePopupDisplay
     * 2. ClassName  : PopupDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.PopupDisplayService#updatePopupDisplay(org.springframework.web.multipart.MultipartHttpServletRequest, java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePopupDisplay(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("POP_MST_MOD_IP", IPUtil.getClientIP());
        commandMap.put("POP_MST_MOD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        result += defaultDAO.insert("PopupDisplay.updatePopupDisplay", commandMap);
        if (result > 0) {
            commandMap.put("CMM_FLE_TB_NM", "T_POP_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "POP_MST_IDX"));
            result += commonFileService.updateCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        }
        return result;

    }
}
