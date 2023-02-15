package web.bo.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.StringUtil;
import web.bo.product.service.ProductNotificationInfoService;

/**
 * @PackageName: web.am.product.service.impl
 * @FileName : ProductNotificationInfoServiceImpl.java
 * @Date : 2015. 10. 21.
 * @프로그램 설명 : 상품고시관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("productNotificationInfoService")
public class ProductNotificationInfoServiceImpl implements ProductNotificationInfoService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
    * 1. MethodName : selectCommonCodeManagerListCount
    * 2. ClassName : ProductNotificationInfoServiceImpl.java
    * 3. Comment : 상품고시관리 목록 갯수
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectProductNotificationInfoListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ProductNotificationInfo.selectProductNotificationInfoListCount", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : selectCommonCodeManagerList
    * 2. ClassName : ProductNotificationInfoServiceImpl.java
    * 3. Comment : 상품고시관리 목록
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductNotificationInfoList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("ProductNotificationInfo.selectProductNotificationInfoList", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : insertProductNotificationInfo
    * 2. ClassName : ProductNotificationInfoServiceImpl.java
    * 3. Comment : 상품고시정보 등록
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertProductNotificationInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        
        commandMap.put("PRD_NFI_REG_IP", IPUtil.getClientIP());
        commandMap.put("PRD_NFI_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));        

        int result = defaultDAO.insert("ProductNotificationInfo.insertProductNotificationInfoTop", commandMap);

        if (result > 0) {
            String[] arrPRD_NFI_INFO = (String[]) commandMap.get("arrPRD_NFI_INFO"); // 상품고시 항목내용
            if (arrPRD_NFI_INFO != null) {
                commandMap.put("PRD_NFI_UP_IDX", StringUtil.getString(commandMap.get("PRD_NFI_IDX"), ""));
                commandMap.put("PRD_NFI_LEVEL", 1);
                commandMap.put("PRD_NFI_USE_YN", "Y");

                for (int i = 0; i < arrPRD_NFI_INFO.length; i++) {
                    if (!"".equals(arrPRD_NFI_INFO[i])) {
                        commandMap.put("PRD_NFI_INFO", arrPRD_NFI_INFO[i]);
                        result = defaultDAO.insert("ProductNotificationInfo.insertProductNotificationInfo", commandMap);
                    }
                }
            }
        }

        return result;
    }

    /**
     * <pre>
    * 1. MethodName : selectproductNotificationInfo
    * 2. ClassName : ProductNotificationInfoServiceImpl.java
    * 3. Comment : 품목 상세
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectproductNotificationInfoTop(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("ProductNotificationInfo.selectproductNotificationInfoTop", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : selectproductNotificationInfo
    * 2. ClassName : ProductNotificationInfoServiceImpl.java
    * 3. Comment : 품목에 대한 상세
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectproductNotificationInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("ProductNotificationInfo.selectproductNotificationInfo", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : updateCommonCodeManager
    * 2. ClassName : ProductNotificationInfoServiceImpl.java
    * 3. Comment : 상품고시정보 수정 
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateproductNotificationInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        
        commandMap.put("PRD_NFI_UPD_IP", IPUtil.getClientIP());
        commandMap.put("PRD_NFI_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));             
        
        int result = defaultDAO.update("ProductNotificationInfo.updateproductNotificationInfoTop", commandMap);

        if (result > 0) {
            // 상품고시 품목에 해당 하는 항목 전부 삭제
            defaultDAO.delete("ProductNotificationInfo.deleteproductNotificationInfo", commandMap);
            String[] arrPRD_NFI_INFO = (String[]) commandMap.get("arrPRD_NFI_INFO"); // 상품고시 항목내용

            if (arrPRD_NFI_INFO != null) {
                commandMap.put("PRD_NFI_UP_IDX", StringUtil.getString(commandMap.get("PRD_NFI_IDX"), ""));
                commandMap.put("PRD_NFI_LEVEL", 1);
                commandMap.put("PRD_NFI_USE_YN", "Y");

                for (int i = 0; i < arrPRD_NFI_INFO.length; i++) {
                    if (!"".equals(arrPRD_NFI_INFO[i])) {
                        commandMap.put("PRD_NFI_INFO", arrPRD_NFI_INFO[i]);
                        result = defaultDAO.insert("ProductNotificationInfo.insertProductNotificationInfo", commandMap);
                    }
                }
            }
        }

        return result;
    }

}
