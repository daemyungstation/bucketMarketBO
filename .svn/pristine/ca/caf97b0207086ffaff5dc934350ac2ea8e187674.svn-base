package web.bo.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: web.bo.site.service
 * @FileName : VendorManagerService.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 시스템관리 > 입점업체 관리를 처리하는 Service Interface
 * @author upleat
 */
public interface VendorManagerService {

    /**
     * <pre>
     * 1. MethodName : selectVendorManagerListCount
     * 2. ClassName  : VendorManagerService.java
     * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorManagerListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectVendorManagerList
    * 2. ClassName  : VendorManagerService.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectVendorManagerList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
    * 1. MethodName : insertVendorManager
    * 2. ClassName  : VendorManagerService.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 등록
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertVendorManager(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectVendorManagerInfo
    * 2. ClassName  : VendorManagerService.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 상세정보
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectVendorManagerInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
    * 1. MethodName : updateVendorManager
    * 2. ClassName  : VendorManagerService.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 수정
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorManager(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectVendorManagerNmCheckCount
    * 2. ClassName  : VendorManagerService.java
    * 3. Comment    : 입점업체 중복체크
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorManagerNmCheckCount(Map<String, Object> commandMap) throws Exception;
}
