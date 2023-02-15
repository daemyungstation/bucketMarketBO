package web.bo.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import lombok.extern.log4j.Log4j2;
import web.bo.product.service.ProductTemplateService;
import web.sms.service.SmsService;

/**
 * @PackageName: web.bo.product.service.impl
 * @FileName : ProductTemplateServiceImpl.java
 * @Date : 2020. 4. 20.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품Template를 처리하는 Service Implement Class
 * @author upleat
 */
@Log4j2
@Service("productTemplateService")
public class ProductTemplateServiceImpl implements ProductTemplateService {
    
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="smsService")
    private SmsService smsService;
    
    /**
     * <pre>
     * 1. MethodName : selectProductTemplateListCount
     * 2. ClassName  : ProductTemplateServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품Template 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectProductTemplateListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ProductTemplate.selectProductTemplateListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectProductTemplateList
     * 2. ClassName  : ProductTemplateServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품Template 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductTemplateList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("ProductTemplate.selectProductTemplateList", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : selectProductTemplateInfo
    * 2. ClassName  : ProductTemplateServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 상품Template 상세 정보 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductTemplateInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("ProductTemplate.selectProductTemplateInfo", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : updateProductTemplate
    * 2. ClassName  : ProductTemplateServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 상품Template 수정
    * 4. 작성자       : upleat
    * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateProductTemplate(Map<String, Object> commandMap) throws Exception {
        commandMap.put("PRD_TPL_UPD_IP", IPUtil.getClientIP());
        commandMap.put("PRD_TPL_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        return defaultDAO.update("ProductTemplate.updateProductTemplate", commandMap);
    }
    
    /**
     * <pre>
    * 1. MethodName : insertProductTemplate
    * 2. ClassName  : ProductTemplateServiceImpl.java
    * 3. Comment    : 관리자 > 상품관리 > 상품Template 등록
    * 4. 작성자       : upleat
    * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertProductTemplate(Map<String, Object> commandMap) throws Exception {
        commandMap.put("PRD_TPL_REG_IP", IPUtil.getClientIP());
        commandMap.put("PRD_TPL_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        return defaultDAO.insert("ProductTemplate.insertProductTemplate", commandMap);
    }    
}
