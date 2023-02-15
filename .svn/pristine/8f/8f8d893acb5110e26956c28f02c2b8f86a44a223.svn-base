package web.bo.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.common.service.CommonPopupService;

@Service("commonPopupService")
public class CommonPopupServiceImpl implements CommonPopupService {
    
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonBasicProductListCount
     * 2. ClassName  : CommonPopupServiceImpl.java
     * 3. Comment    : 상품 공통 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @see web.bo.common.service.CommonPopupService#selectCommonBasicProductListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonPopupBasicProductListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommonPopup.selectCommonPopupBasicProductListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommonBasicProductList
     * 2. ClassName  : CommonPopupServiceImpl.java
     * 3. Comment    : 상품 공통 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @see web.bo.common.service.CommonPopupService#selectCommonBasicProductList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonPopupBasicProductList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CommonPopup.selectCommonPopupBasicProductList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupB2bListCount
     * 2. ClassName  : CommonPopupServiceImpl.java
     * 3. Comment    : B2B 공통 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.common.service.CommonPopupService#selectCommonPopupB2bListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonPopupB2bListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommonPopup.selectCommonPopupB2bListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupB2bList
     * 2. ClassName  : CommonPopupServiceImpl.java
     * 3. Comment    : B2B 공통 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.common.service.CommonPopupService#selectCommonPopupB2bList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonPopupB2bList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CommonPopup.selectCommonPopupB2bList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupDlccCount
     * 2. ClassName  : CommonPopupServiceImpl.java
     * 3. Comment    : dlcc 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.common.service.CommonPopupService#selectCommonPopupDlccCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommonPopupDlccCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommonPopup.selectCommonPopupDlccCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommonPopupDlccList
     * 2. ClassName  : CommonPopupServiceImpl.java
     * 3. Comment    : dlcc 공통 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.common.service.CommonPopupService#selectCommonPopupDlccList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonPopupDlccList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CommonPopup.selectCommonPopupDlccList", commandMap);
    }    
}
