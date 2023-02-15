package web.bo.display.service;

import java.util.List;
import java.util.Map;

public interface KeywordDisplayService {

    /**
     * <pre>
     * 1. MethodName : selectKeywordDisplayList
     * 2. ClassName  : KeywordDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 인기키워드 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectKeywordDisplayList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : mergeKeywordDisplay
     * 2. ClassName  : KeywordDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 인기키워드 관리 > 등록/수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int mergeKeywordDisplay(Map<String, Object> commandMap) throws Exception;
    
}
