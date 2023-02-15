package web.bo.display.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: web.bo.display.service
 * @FileName : ProductDisplayService.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Service Interface
 * @author upleat
 */
public interface ProductDisplayService {

    /**
     * <pre>
     * 1. MethodName : selectProductDisplayList
     * 2. ClassName  : ProductDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectProductDisplayList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertProductDisplay
     * 2. ClassName  : ProductDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertProductDisplay(Map<String, Object> commandMap) throws Exception;
}
