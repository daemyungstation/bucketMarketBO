package web.bo.common.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: web.bo.common.service
 * @FileName : CommonService.java
 * @Date : 2014. 3. 28.
 * @프로그램 설명 : 공통요소를 처리하는 Service Interface
 * @author upleat
 */
public interface CommonService {

    /**
     * <pre>
     * 1. MethodName : selectCommonList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 하위코드 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCode(String code) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCodeByCode(String code) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectCodes
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통 코드 묶음 하위 코드 조회 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCodes(String[] codes) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectTopCode
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통코드 하위코드 조회 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectTopCode(String code) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectHierarchyCodeList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 현재 미포함 하위 코드 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectHierarchyCodeList(String code) throws Exception;
    
    /**
     * <pre>
    * 1. MethodName : selectTopCodes
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통 코드 묶음 하위 코드 조회
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectTopCodes(String[] codes) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectCodeInfo
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통 코드 상세 정보 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCodeInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonAuthManagerList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 담당자(매니저) 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonAuthManagerList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonVendorList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 입점업체 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonVendorList(Map<String, Object> commandMap) throws Exception;

    
    /**
     * <pre>
     * 1. MethodName : selectCommonProductCategoryList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 상품 카테고리 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonProductCategoryList(Map<String, Object> commandMap) throws Exception;
    
}