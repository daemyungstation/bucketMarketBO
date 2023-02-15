package web.bo.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.dao.CommonDefaultDAO;
import common.model.Manager;
import common.session.SessionsManager;
import common.util.StringUtil;
import web.bo.board.service.VendorNoticeBoardService;
import web.bo.common.service.CommonFileService;

/**
 * @PackageName: web.bo.board.service.impl
 * @FileName : VendorNoticeBoardServiceImpl.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > 제휴업체 공지사항을 처리하는 Service Implement Class
 * @author upleat
 */
@Service("vendorNoticeBoardService")
public class VendorNoticeBoardServiceImpl implements VendorNoticeBoardService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="commonFileService")
    private CommonFileService commonFileService;
    
    private static final String UPLOAD_PATH = "board";
    private static final String UPLOAD_ALLOW = "default";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";
    

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardListCount
     * 2. ClassName  : VendorNoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorNoticeBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("VendorNoticeBoard.selectVendorNoticeBoardListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardList
     * 2. ClassName  : VendorNoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectVendorNoticeBoardList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("VendorNoticeBoard.selectVendorNoticeBoardList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardInfo
     * 2. ClassName  : VendorNoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 상세 정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectVendorNoticeBoardInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        commandMap.put("CMM_FLE_TB_NM", "T_SCM_NTS");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("SCM_NTS_IDX"), ""));
        returnMap.put("fileList", commonFileService.selectCommonFileList(commandMap));
        returnMap.put("info", defaultDAO.select("VendorNoticeBoard.selectVendorNoticeBoardInfo", commandMap));
        return returnMap;
    }

    /**
     * <pre>
     * 1. MethodName : insertVendorNoticeBoard
     * 2. ClassName  : VendorNoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertVendorNoticeBoard(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Manager manager = SessionsManager.getSessionManager(request);
        commandMap.put("SCM_NTS_REG_IP", request.getRemoteAddr());
        commandMap.put("SCM_NTS_REG_ID", manager.getADM_MST_ID());

        int result = defaultDAO.insert("VendorNoticeBoard.insertVendorNoticeBoard", commandMap);
        commandMap.put("CMM_CLE_NM", "FILE");
        commandMap.put("CMM_FLE_TB_NM", "T_SCM_NTS");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("SCM_NTS_IDX"), ""));
        // 파일 업로드
        result += commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updateVendorNoticeBoard
     * 2. ClassName  : VendorNoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorNoticeBoard(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Manager manager = SessionsManager.getSessionManager(request);
        commandMap.put("SCM_NTS_UPD_IP", request.getRemoteAddr());
        commandMap.put("SCM_NTS_UPD_ID", manager.getADM_MST_ID());

        int result = defaultDAO.update("VendorNoticeBoard.updateVendorNoticeBoard", commandMap);
        
        commandMap.put("CMM_CLE_NM", "FILE");
        commandMap.put("CMM_FLE_TB_NM", "T_SCM_NTS");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("SCM_NTS_IDX"), ""));
        commonFileService.updateCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardTopCount
     * 2. ClassName  : VendorNoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 상단공지 사용 가능 유무
     * 4. 작성자       : upleat
     * 5. 작성일       : 2015. 3. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorNoticeBoardTopCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("VendorNoticeBoard.selectVendorNoticeBoardTopCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateVendorNoticeReadCount
     * 2. ClassName  : VendorNoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorNoticeReadCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("VendorNoticeBoard.updateVendorNoticeReadCount", commandMap);
    }
}
