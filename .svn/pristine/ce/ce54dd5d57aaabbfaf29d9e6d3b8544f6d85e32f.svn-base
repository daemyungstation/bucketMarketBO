package web.bo.board.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;
import web.bo.board.service.InquiryBoardService;
import web.message.MessageType;
import web.message.service.MessageService;

/**
 * @PackageName: web.bo.customer.service.impl
 * @FileName : InquiryBoardServiceImpl.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 고객센터 > 1:1 문의를 처리하는 Service Implement Class
 * @author upleat
 */
@Log4j2
@Service("inquiryBoardService")
public class InquiryBoardServiceImpl implements InquiryBoardService {
    
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="messageService")
    private MessageService messageService;
    
    /**
     * <pre>
     * 1. MethodName : selectInquiryBoardListCount
     * 2. ClassName  : InquiryBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 1:1문의 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectInquiryBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("InquiryBoard.selectInquiryBoardListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectInquiryBoardList
     * 2. ClassName  : InquiryBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 1:1문의 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInquiryBoardList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("InquiryBoard.selectInquiryBoardList", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : selectInquiryBoardInfo
    * 2. ClassName  : InquiryBoardServiceImpl.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1문의 상세 정보 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectInquiryBoardInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("InquiryBoard.selectInquiryBoardInfo", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : updateInquiryBoard
    * 2. ClassName  : InquiryBoardServiceImpl.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1문의 답변 등록 / 수정
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateInquiryBoard(Map<String, Object> commandMap) throws Exception {
        commandMap.put("MEM_ADV_UPD_IP", IPUtil.getClientIP());
        commandMap.put("MEM_ADV_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        // 답변 등록
        int result = defaultDAO.update("InquiryBoard.updateInquiryBoard", commandMap);
        Map<String, Object> info = selectInquiryBoardInfo(commandMap);
        try {
            String memMstMemNm = StringUtil.getString(info, "MEM_MST_MEM_NM");
            String memAdvHp = StringUtil.getString(info, "MEM_ADV_HP1");
            memAdvHp += StringUtil.getString(info, "MEM_ADV_HP2");
            memAdvHp += StringUtil.getString(info, "MEM_ADV_HP3");
            this.messageService.sendAlimTalk(MessageType.INQUIRY_ANSWER, memAdvHp, memMstMemNm);
        } catch (Exception e) {
            log.error("========================== 카카오 알림톡 발송 ERROR ==========================");
            log.error(Arrays.toString(e.getStackTrace()));
            log.error("==================================================================");
        }
        return result;
    }
}
