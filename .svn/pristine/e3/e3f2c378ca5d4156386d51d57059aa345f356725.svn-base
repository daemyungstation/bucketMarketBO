package web.bo.marketing.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.common.service.CommonFileService;
import web.bo.marketing.service.EventService;

/**
 * @PackageName: web.bo.marketing.service.impl
 * @FileName : EventServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 프로모션 관리 > 이벤트 관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("eventService")
public class EventServiceImpl implements EventService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name="commonFileService")
    private CommonFileService commonFileService;

    private static final String UPLOAD_PATH = "marketing";
    private static final String UPLOAD_ALLOW = "image";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";
    
    /**
     * <pre>
     * 1. MethodName : selectEventListCount
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#selectEventListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Event.selectEventListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectEventList
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#selectEventList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectEventList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Event.selectEventList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectEventInfo
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#selectEventInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectEventInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("Event.selectEventInfo", commandMap));
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "EVT_MST_IDX", ""));
        commandMap.put("CMM_FLE_TB_TYPE", Const.PC);
        returnMap.put("pcFileList", commonFileService.selectCommonFileList(commandMap));
        commandMap.put("CMM_FLE_TB_TYPE", Const.MOBILE);
        returnMap.put("mobileFileList", commonFileService.selectCommonFileList(commandMap));
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectEventReplyListCount
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세 > 이벤트 댓글 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#selectEventReplyListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventReplyListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Event.selectEventReplyListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectEventReplyList
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세 > 이벤트 댓글 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#selectEventReplyList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectEventReplyList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Event.selectEventReplyList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : insertEvent
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#insertEvent(org.springframework.web.multipart.MultipartHttpServletRequest, java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertEvent(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("EVT_MST_REG_IP", IPUtil.getClientIP());
        commandMap.put("EVT_MST_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        result += defaultDAO.insert("Event.insertEvent", commandMap);
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "EVT_MST_IDX", ""));
        result += commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : updateEvent
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#updateEvent(org.springframework.web.multipart.MultipartHttpServletRequest, java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEvent(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("EVT_MST_UPD_IP", IPUtil.getClientIP());
        commandMap.put("EVT_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        result += defaultDAO.update("Event.updateEvent", commandMap);
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "EVT_MST_IDX", ""));
        result += commonFileService.updateCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : updateEventReplyModify
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세 > 이벤트 댓글 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.EventService#updateEventReplyModify(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEventReplyModify(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("EVT_RPL_IDX", StringUtil.getString(param, "EVT_RPL_IDX", ""));
                commandMap.put("EVT_RPL_USE_YN", StringUtil.getString(param, "EVT_RPL_USE_YN", ""));
                result += defaultDAO.update("Event.updateEventReply", commandMap);
            }
        }
        return result;
    }

}