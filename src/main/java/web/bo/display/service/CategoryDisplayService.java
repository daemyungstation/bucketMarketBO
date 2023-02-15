package web.bo.display.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: web.bo.display.service
 * @FileName : CategoryDisplayService.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시카테고리관리를 처리하는 Service Class
 * @author upleat
 */
public interface CategoryDisplayService {

    /**
     * <pre>
     * 1. MethodName : selectCategoryDisplayList
     * 2. ClassName  : CategoryDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCategoryDisplayList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCategoryDisplayInfo
     * 2. ClassName  : CategoryDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCategoryDisplayInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertCategoryDisplay
     * 2. ClassName  : CategoryDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCategoryDisplay(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateCategoryDisplay
     * 2. ClassName  : CategoryDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 26.
     * </pre>
     *
     * @param commandMap
     * @throws Exception
     */
    public int updateCategoryDisplay(Map<String, Object> commandMap) throws Exception;
}
