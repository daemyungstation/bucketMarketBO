package web.bo.display.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.StringUtil;
import web.bo.display.service.CurationDisplayService;

@Service("curationDisplayService")
public class CurationDisplayServiceImpl implements CurationDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectCurationDisplayList
     * 2. ClassName  : CurationDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 큐레이션 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.CurationDisplayService#selectCurationDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCurationDisplayList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CurationDisplay.selectCurationDisplayList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : insertCurationDisplay
     * 2. ClassName  : CurationDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 큐레이션 관리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.CurationDisplayService#insertCurationDisplay(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCurationDisplay(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        
        defaultDAO.delete("CurationDisplay.deleteCurationDisplayKeyword", commandMap);
        defaultDAO.delete("CurationDisplay.deleteCurationDisplay", commandMap);
        
        commandMap.put("CRT_MST_REG_IP", IPUtil.getClientIP());
        commandMap.put("CRT_MST_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("CRT_KWD_REG_IP", IPUtil.getClientIP());
        commandMap.put("CRT_KWD_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        String [] CRT_MST_KEYs = StringUtil.getArray(commandMap, "CRT_MST_KEYs");
        String [] CRT_MST_QSTs = StringUtil.getArray(commandMap, "CRT_MST_QSTs");
        for (int i = 0; i < CRT_MST_QSTs.length; i++) {
            commandMap.put("CRT_MST_QST", CRT_MST_QSTs[i]);
            commandMap.put("CRT_MST_SRT", (i + 1));
            result = defaultDAO.insert("CurationDisplay.insertCurationDisplay", commandMap);
            if (result > 0) {
                String [] CRT_KWD_SLTs = StringUtil.getArray(commandMap, "CRT_KWD_SLT" + CRT_MST_KEYs[i]);
                String [] CRT_KWD_RLTs = StringUtil.getArray(commandMap, "CRT_KWD_RLT" + CRT_MST_KEYs[i]);
                for (int y = 0; y < CRT_KWD_SLTs.length; y++) {
                    commandMap.put("CRT_KWD_SLT", CRT_KWD_SLTs[y]);
                    commandMap.put("CRT_KWD_RLT", CRT_KWD_RLTs[y]);
                    commandMap.put("CRT_KWD_SRT", (y + 1));
                    result += defaultDAO.insert("CurationDisplay.insertCurationDisplayKeyword", commandMap);
                }
            }
        }
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCurationDisplayKeywordListCount
     * 2. ClassName  : CurationDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 큐레이션 관리 > 키워드 검색 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 1.
     * </pre>
     *
     * @see web.bo.display.service.CurationDisplayService#selectCurationDisplayKeywordListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCurationDisplayKeywordListCount(Map<String, Object> commandMap) throws Exception {
        int [] searchKeywordByte = Const.INITIAL_SOUNDS.get(StringUtil.getString(commandMap, "searchInitialSound", "ㄱ"));
        commandMap.put("searchKeywordStartByte", searchKeywordByte[0]);
        commandMap.put("searchKeywordEndByte", searchKeywordByte[1]);
        return defaultDAO.selectCount("CurationDisplay.selectCurationDisplayKeywordListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCurationDisplayKeywordList
     * 2. ClassName  : CurationDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 큐레이션 관리 > 키워드 검색 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 1.
     * </pre>
     *
     * @see web.bo.display.service.CurationDisplayService#selectCurationDisplayKeywordList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCurationDisplayKeywordList(Map<String, Object> commandMap) throws Exception {
        int [] searchKeywordByte = Const.INITIAL_SOUNDS.get(StringUtil.getString(commandMap, "searchInitialSound", "ㄱ"));
        commandMap.put("searchKeywordStartByte", searchKeywordByte[0]);
        commandMap.put("searchKeywordEndByte", searchKeywordByte[1]);
        return defaultDAO.selectList("CurationDisplay.selectCurationDisplayKeywordList", commandMap);
    }
}
