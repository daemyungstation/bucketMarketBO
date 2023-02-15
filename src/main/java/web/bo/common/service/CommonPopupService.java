package web.bo.common.service;

import java.util.List;
import java.util.Map;

public interface CommonPopupService {

    /**
     * <pre>
     * 1. MethodName : selectCommonPopupBasicProductListCount
     * 2. ClassName  : CommonPopupService.java
     * 3. Comment    : 상품 공통 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonPopupBasicProductListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupBasicProductList
     * 2. ClassName  : CommonPopupService.java
     * 3. Comment    : 상품 공통 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonPopupBasicProductList(Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupB2bListCount
     * 2. ClassName  : CommonPopupService.java
     * 3. Comment    : B2B 공통 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonPopupB2bListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupB2bList
     * 2. ClassName  : CommonPopupService.java
     * 3. Comment    : B2B 공통 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonPopupB2bList(Map<String, Object> commandMap) throws Exception;
 
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupDlccCount
     * 2. ClassName  : CommonPopupService.java
     * 3. Comment    : dlcc 상품 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonPopupDlccCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupDlccList
     * 2. ClassName  : CommonPopupService.java
     * 3. Comment    : dlcc 상품 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonPopupDlccList(Map<String, Object> commandMap) throws Exception;
 
    
}
