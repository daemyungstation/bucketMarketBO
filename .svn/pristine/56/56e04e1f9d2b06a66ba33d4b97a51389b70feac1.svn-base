package web.bo.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import web.bo.board.service.ContactUsBoardService;

/**
 * @PackageName: web.bo.board.service.impl
 * @FileName : ContactUsBoardServiceImpl.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > 제휴문의를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("contactUsBoardService")
public class ContactUsBoardServiceImpl implements ContactUsBoardService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectContactUsBoardListCount
     * 2. ClassName  : ContactUsBoardServiceImpl.java
     * 3. ContactUs    : 관리자 > 고객센터 > 제휴문의 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectContactUsBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ContactUsBoard.selectContactUsBoardListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectContactUsBoardList
     * 2. ClassName  : ContactUsBoardServiceImpl.java
     * 3. ContactUs    : 관리자 > 고객센터 > 제휴문의 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectContactUsBoardList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("ContactUsBoard.selectContactUsBoardList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectContactUsBoardInfo
     * 2. ClassName  : ContactUsBoardServiceImpl.java
     * 3. ContactUs    : 관리자 > 고객센터 > 제휴문의 목록 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectContactUsBoardInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("ContactUsBoard.selectContactUsBoardInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateContactUsBoard
     * 2. ClassName  : ContactUsBoardServiceImpl.java
     * 3. ContactUs    : 관리자 > 고객센터 > 제휴문의 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateContactUsBoard(Map<String, Object> commandMap) throws Exception {
        commandMap.put("CTT_US_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("CTT_US_UPD_IP", IPUtil.getClientIP());
        return defaultDAO.update("ContactUsBoard.updateContactUsBoard", commandMap);
    }

}
