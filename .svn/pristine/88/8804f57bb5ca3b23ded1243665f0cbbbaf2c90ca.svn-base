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
import web.bo.display.service.CategoryProductDisplayService;

@Service("categoryProductDisplayService")
public class CategoryProductDisplayServiceImpl implements CategoryProductDisplayService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductDisplayList
     * 2. ClassName  : CategoryProductDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 카테고리 상품진열관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.CategoryProductDisplayService#categoryProductDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategoryProductDisplayList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CategoryProductDisplay.selectCategoryProductDisplayList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateCategoryProductDisplay
     * 2. ClassName  : CategoryProductDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 카테고리 상품진열관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.CategoryProductDisplayService#updateCategoryProductDisplay(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCategoryProductDisplay(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            commandMap.put("PRD_MST_UPD_IP", IPUtil.getClientIP());
            commandMap.put("PRD_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("PRD_MST_NO", StringUtil.getString(param, "PRD_MST_NO", ""));
                commandMap.put("PRD_MST_SRT", StringUtil.getString(param, "PRD_MST_SRT", ""));
                result += defaultDAO.update("CategoryProductDisplay.updateCategoryProductDisplay", commandMap);
            }
        }
        return result;
    }
    
}
