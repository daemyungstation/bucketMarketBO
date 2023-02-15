package web.bo.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.ExcelUtil;
import common.util.IPUtil;
import common.util.StringUtil;
import web.bo.board.service.FaqBoardService;

/**
 * @PackageName: web.bo.board.service.impl
 * @FileName : FaqBoardServiceImpl.java
 * @Date : 2014. 4. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > FAQ 관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("faqBoardService")
public class FaqBoardServiceImpl implements FaqBoardService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    
    
    /**
     * <pre>
     * 1. MethodName : selectFaqBoardListCount
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectFaqBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("FaqBoard.selectFaqBoardListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectFaqBoardList
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectFaqBoardList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("FaqBoard.selectFaqBoardList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectFaqBoardInfo
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectFaqBoardInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("FaqBoard.selectFaqBoardInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertFaqBoard
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertFaqBoard(Map<String, Object> commandMap) throws Exception {
        commandMap.put("BRD_FAQ_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("BRD_FAQ_REG_IP", IPUtil.getClientIP());
        return defaultDAO.insert("FaqBoard.insertFaqBoard", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateFaqBoard
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateFaqBoard(Map<String, Object> commandMap) throws Exception {
        commandMap.put("BRD_FAQ_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("BRD_FAQ_UPD_IP", IPUtil.getClientIP());
        return defaultDAO.update("FaqBoard.updateFaqBoard", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateFaqBoardSort
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 전시 순서 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateFaqBoardSort(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("BRD_FAQ_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("BRD_FAQ_UPD_IP", IPUtil.getClientIP());
        String [] BRD_FAQ_IDXs = StringUtil.getArray(commandMap, "BRD_FAQ_IDXs");
        String [] BRD_FAQ_SRTs = StringUtil.getArray(commandMap, "BRD_FAQ_SRTs");
        for (int  i = 0; i < BRD_FAQ_IDXs.length; i++) {
            commandMap.put("BRD_FAQ_IDX", BRD_FAQ_IDXs[i]);
            commandMap.put("BRD_FAQ_SRT", BRD_FAQ_SRTs[i]);
            result += defaultDAO.update("FaqBoard.updateFaqBoardSort", commandMap);
        }
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : updateFaqBoardSort
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 전시 순서 수정 (EXCEL UPLOAD)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @return
     * @throws Exception
     */
    public int updateFaqBoardSort(MultipartHttpServletRequest request) throws Exception {
        int result = 0;
        CommonsMultipartFile file = (CommonsMultipartFile) request.getFile("EXCEL");
        if (!file.isEmpty()) {
            String [] columName = {"BRD_FAQ_IDX", "BRD_FAQ_SRT", "BRD_CMN_COM_NM", "BRD_FAQ_TITLE", "BRD_FAQ_READ_CNT", "BRD_FAQ_REG_DT", "BRD_FAQ_USE_YN"};
            List<Map<String, Object>> list = ExcelUtil.excelRead(file, columName);
            for (Map<String, Object> map : list) {
                map.put("BRD_FAQ_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
                map.put("BRD_FAQ_UPD_IP", IPUtil.getClientIP());
                result += defaultDAO.update("FaqBoard.updateFaqBoardSort", map);
            }
        }
        return result;
    }
}
