package web.bo.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import web.bo.site.service.VendorManagerService;

/**
 * @PackageName: web.bo.site.service.impl
 * @FileName : VendorManagerServiceImpl.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 시스템관리 > 입점업체 관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("vendorManagerService")
public class VendorManagerServiceImpl implements VendorManagerService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectVendorManagerListCount
     * 2. ClassName  : VendorManagerServiceImpl.java
     * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorManagerListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("VendorManager.selectVendorManagerListCount", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : selectVendorManagerList
    * 2. ClassName  : VendorManagerServiceImpl.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectVendorManagerList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("VendorManager.selectVendorManagerList", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : insertVendorManager
    * 2. ClassName  : VendorManagerServiceImpl.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 등록
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertVendorManager(Map<String, Object> commandMap) throws Exception {
        commandMap.put("VDR_MST_REG_IP", IPUtil.getClientIP());
        commandMap.put("VDR_MST_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        return defaultDAO.insert("VendorManager.insertVendorManager", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : selectVendorManagerInfo
    * 2. ClassName  : VendorManagerServiceImpl.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 상세정보
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectVendorManagerInfo(Map<String, Object> commandMap) throws Exception {
        return (Map<String, Object>) defaultDAO.select("VendorManager.selectVendorManagerInfo", commandMap);
    }

    /**
     * <pre>
    * 1. MethodName : updateVendorManager
    * 2. ClassName  : VendorManagerServiceImpl.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 수정
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorManager(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("VDR_MST_UPD_IP", IPUtil.getClientIP());
        commandMap.put("VDR_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        int result = defaultDAO.update("VendorManager.updateVendorManager", commandMap);
        if (result > 0) {
            // 입점업체정보관리에서 상태여부에 따른 관리자관리에 해당 입점업체에 대한 아이디 사용여부 수정
            defaultDAO.update("VendorManager.updateBasicManagerState", commandMap);
        }
        return result;
    }

    /**
     * <pre>
    * 1. MethodName : selectVendorManagerNmCheckCount
    * 2. ClassName  : VendorManagerServiceImpl.java
    * 3. Comment    : 입점업체 중복체크
    * 4. 작성자       : upleat
    * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorManagerNmCheckCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("VendorManager.selectVendorManagerNmCheckCount", commandMap);
    }
}
