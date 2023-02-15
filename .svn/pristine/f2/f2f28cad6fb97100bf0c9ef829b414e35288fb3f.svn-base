package web.bo.product.service.impl;

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
import web.bo.product.service.ProductQnAService;
import web.message.MessageType;
import web.message.service.MessageService;

/**
 * @PackageName: web.bo.product.service.impl
 * @FileName : ProductQnAServiceImpl.java
 * @Date : 2020. 4. 20.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품QnA를 처리하는 Service Implement Class
 * @author upleat
 */
@Log4j2
@Service("productQnAService")
public class ProductQnAServiceImpl implements ProductQnAService {
    
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="messageService")
    private MessageService messageService;
    
    /**
     * <pre>
     * 1. MethodName : selectProductQnAListCount
     * 2. ClassName  : ProductQnAServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품QnA 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectProductQnAListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ProductQnA.selectProductQnAListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectProductQnAList
     * 2. ClassName  : ProductQnAServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품QnA 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductQnAList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("ProductQnA.selectProductQnAList", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : selectProductQnAInfo
    * 2. ClassName  : ProductQnAServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 상품QnA 상세 정보 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductQnAInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("ProductQnA.selectProductQnAInfo", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : updateProductQnA
    * 2. ClassName  : ProductQnAServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 상품QnA 답변 등록 / 수정
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateProductQnA(Map<String, Object> commandMap) throws Exception {
        commandMap.put("PRD_QNA_UPD_IP", IPUtil.getClientIP());
        commandMap.put("PRD_QNA_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        // 답변 등록
        int result = defaultDAO.update("ProductQnA.updateProductQnA", commandMap);
        Map<String, Object> info = selectProductQnAInfo(commandMap);
        if ("Y".equals(StringUtil.getString(info, "PRD_QNA_SMS_YN", "N"))) {
            try {
                String prdMstNo = StringUtil.getString(info, "PRD_MST_NO");
                String prdQnaMemNm = StringUtil.getString(info, "PRD_QNA_MEM_NM");
                String prdQnaHp = StringUtil.getString(info, "PRD_QNA_HP1");
                prdQnaHp += StringUtil.getString(info, "PRD_QNA_HP2");
                prdQnaHp += StringUtil.getString(info, "PRD_QNA_HP3");
                this.messageService.sendAlimTalk(MessageType.QNA_ANSWER, prdQnaHp, prdQnaMemNm, prdMstNo);
            } catch (Exception e) {
                log.error("========================== 카카오 알림톡 발송 ERROR ==========================");
                log.error(Arrays.toString(e.getStackTrace()));
                log.error("==================================================================");
            }
        }
        return result;
    }
}
