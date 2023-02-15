package web.bo.display.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.StringUtil;
import web.bo.display.service.KeywordDisplayService;

@Service("keywordDisplayService")
public class KeywordDisplayServiceImpl implements KeywordDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectKeywordDisplayList
     * 2. ClassName  : KeywordDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 인기키워드 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.display.service.KeywordDisplayService#selectKeywordDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectKeywordDisplayList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("KeywordDisplay.selectKeywordDisplayList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : mergeKeywordDisplay
     * 2. ClassName  : KeywordDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 인기키워드 관리 > 등록/수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.display.service.KeywordDisplayService#mergeKeywordDisplay(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int mergeKeywordDisplay(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("PPL_WRD_REG_IP", IPUtil.getClientIP());
        commandMap.put("PPL_WRD_UPD_IP", IPUtil.getClientIP());
        commandMap.put("PPL_WRD_HIS_REG_IP", IPUtil.getClientIP());
        commandMap.put("PPL_WRD_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("PPL_WRD_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("PPL_WRD_HIS_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        String [] PPL_WRD_IDXs = StringUtil.getArray(commandMap, "PPL_WRD_IDXs");
        String [] PPL_WRD_TEXTs = StringUtil.getArray(commandMap, "PPL_WRD_TEXTs");
        String [] PPL_WRD_SCHs = StringUtil.getArray(commandMap, "PPL_WRD_SCHs");
        String [] PPL_WRD_URLs = StringUtil.getArray(commandMap, "PPL_WRD_URLs");
        for (int i = 0; i < PPL_WRD_IDXs.length; i++) {
            if (StringUtil.getInt(PPL_WRD_IDXs[i]) == 0) {
                commandMap.remove("PPL_WRD_IDX");
            } else {
                commandMap.put("PPL_WRD_IDX", PPL_WRD_IDXs[i]);
            }
            commandMap.put("PPL_WRD_TEXT", PPL_WRD_TEXTs[i]);
            commandMap.put("PPL_WRD_SORT", (i + 1));
            commandMap.put("PPL_WRD_SCH", PPL_WRD_SCHs[i]);
            commandMap.put("PPL_WRD_URL", PPL_WRD_URLs[i]);
            
            result += defaultDAO.update("KeywordDisplay.mergeKeywordDisplay", commandMap);
            result += defaultDAO.insert("KeywordDisplay.insertKeywordDisplayHistory", commandMap);
        }
        return result;
    }
}

