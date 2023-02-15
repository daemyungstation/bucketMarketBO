package web.bo.display.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.display.service.ProductDisplayService;

/**
 * @PackageName: web.bo.display.service.impl
 * @FileName : ProductDisplayServiceImpl.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("productDisplayService")
public class ProductDisplayServiceImpl implements ProductDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectProductDisplayList
     * 2. ClassName  : ProductDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductDisplayList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("ProductDisplay.selectProductDisplayList", commandMap);
    }


    /**
     * <pre>
     * 1. MethodName : insertProductDisplay
     * 2. ClassName  : ProductDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertProductDisplay(Map<String, Object> commandMap) throws Exception {
        int result = 0;
            String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
            if (!"".equals(PARAMS)) {
                // 전시 상품 삭제
                defaultDAO.delete("ProductDisplay.deleteProductDisplay", commandMap);
                commandMap.put("DSP_MST_REG_IP", IPUtil.getClientIP());
                commandMap.put("DSP_MST_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
                List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
                for (Map<String, Object> param : paramList) {
                    commandMap.put("PRD_MST_NO", StringUtil.getString(param, "PRD_MST_NO", ""));
                    commandMap.put("DSP_MST_TXT", StringUtil.getString(param, "DSP_MST_TXT", ""));
                    commandMap.put("DSP_MST_SRT", StringUtil.getString(param, "DSP_MST_SRT", ""));
                    // 전시 상품 등록
                    result += defaultDAO.insert("ProductDisplay.insertProductDisplay", commandMap);
                }
            }
        return result;
    }
}
