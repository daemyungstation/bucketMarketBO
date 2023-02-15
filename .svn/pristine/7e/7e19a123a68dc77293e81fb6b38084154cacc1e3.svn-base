package web.bo.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.StringUtil;
import web.bo.display.service.CategoryDisplayService;

/**
 * @PackageName: web.bo.display.service.impl
 * @FileName : CategoryDisplayServiceImpl.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시카테고리관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("categoryDisplayService")
public class CategoryDisplayServiceImpl implements CategoryDisplayService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectCategoryDisplayList
     * 2. ClassName  : CategoryDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @see web.bo.display.service.CategoryDisplayService#selectCategoryDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategoryDisplayList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CategoryDisplay.selectCategoryDisplayList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCategoryDisplayInfo
     * 2. ClassName  : CategoryDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @see web.bo.display.service.CategoryDisplayService#selectCategoryDisplayInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCategoryDisplayInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("CategoryDisplay.selectCategoryDisplayInfo", commandMap));
        returnMap.put("childList", selectCategoryDisplayList(commandMap));
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertCategoryDisplay
     * 2. ClassName  : CategoryDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @see web.bo.display.service.CategoryDisplayService#insertCategoryDisplay(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCategoryDisplay(Map<String, Object> commandMap) throws Exception {
        commandMap.put("PRD_CTG_REG_IP", IPUtil.getClientIP());
        commandMap.put("PRD_CTG_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        return defaultDAO.insert("CategoryDisplay.insertCategoryDisplay", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : updateCategoryDisplay
     * 2. ClassName  : CategoryDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @see web.bo.display.service.CategoryDisplayService#updateCategoryDisplay(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCategoryDisplay(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PRD_CTG_IDX = StringUtil.getString(commandMap, "PRD_CTG_IDX", "");
        commandMap.put("PRD_CTG_UPD_IP", IPUtil.getClientIP());
        commandMap.put("PRD_CTG_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        if (!"".equals(PRD_CTG_IDX)) {
            result += defaultDAO.update("CategoryDisplay.updateCategoryDisplay", commandMap);
        }
        String [] PRD_CTG_CHILD_IDXs = StringUtil.getArray(commandMap, "PRD_CTG_CHILD_IDXs");
        String [] PRD_CTG_CHILD_SORTs = StringUtil.getArray(commandMap, "PRD_CTG_CHILD_SORTs");
        commandMap.clear();
        for (int i = 0; i < PRD_CTG_CHILD_IDXs.length; i++) {
            commandMap.put("PRD_CTG_UPD_IP", IPUtil.getClientIP());
            commandMap.put("PRD_CTG_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
            commandMap.put("PRD_CTG_IDX", PRD_CTG_CHILD_IDXs[i]);
            commandMap.put("PRD_CTG_SORT", PRD_CTG_CHILD_SORTs[i]);
            result += defaultDAO.update("CategoryDisplay.updateCategoryDisplaySort", commandMap);
        }
        commandMap.clear();
        commandMap.put("PRD_CTG_IDX", PRD_CTG_IDX);
        return result;
    }
}
