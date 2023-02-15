package web.bo.marketing.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.common.service.CommonFileService;
import web.bo.marketing.service.PlanService;

/**
 * @PackageName: web.bo.marketing.service.impl
 * @FileName : PlanServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 기획전관리를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("planService")
public class PlanServiceImpl implements PlanService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="commonFileService")
    private CommonFileService commonFileService;

    private static final String UPLOAD_PATH = "marketing";
    private static final String UPLOAD_ALLOW = "image";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";

    /**
     * <pre>
     * 1. MethodName : selectPlanListCount
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlanListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Plan.selectPlanListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlanList
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlanList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Plan.selectPlanList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlanInfo
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlanInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("Plan.selectPlanInfo", commandMap));
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "PLN_MST_IDX", ""));
        commandMap.put("CMM_FLE_TB_TYPE", Const.PC);
        returnMap.put("pcFileList", commonFileService.selectCommonFileList(commandMap));
        commandMap.put("CMM_FLE_TB_TYPE", Const.MOBILE);
        returnMap.put("mobileFileList", commonFileService.selectCommonFileList(commandMap));
        returnMap.put("productList", defaultDAO.selectList("Plan.selectPlanProductList", commandMap));
        return returnMap;
    }

    /**
     * <pre>
     * 1. MethodName : insertPlan
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertPlan(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("PLN_MST_REG_IP", IPUtil.getClientIP());
        commandMap.put("PLN_MST_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        // 기획전 관리 등록
        result += defaultDAO.insert("Plan.insertPlan", commandMap);
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "PLN_MST_IDX", ""));
        result += commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        
        if ("Y".equals(StringUtil.getString(commandMap, "PLN_MST_PRD_DPL_YN", "N"))) {
            String [] PLN_GRP_NUMs = StringUtil.getArray(commandMap, "PLN_GRP_NUMs");
            for (int i = 0; i < PLN_GRP_NUMs.length; i++) {
                String PLN_GRP_NUM = PLN_GRP_NUMs[i];
                commandMap.put("PLN_GRP_TITLE", StringUtil.getString(commandMap, "PLN_GRP_TITLE_" + PLN_GRP_NUM, ""));
                commandMap.put("PLN_GRP_COL", StringUtil.getString(commandMap, "PLN_GRP_COL_" + PLN_GRP_NUM, ""));
                commandMap.put("PLN_GRP_SORT", (i + 1));
                // 기획전 관리 상품 그룹 등록
                result += defaultDAO.insert("Plan.insertPlanGroup", commandMap);
                String [] PRD_MST_NOs = StringUtil.getArray(commandMap, "PRD_MST_NO_" + PLN_GRP_NUM);
                for (int y = 0; y < PRD_MST_NOs.length; y++) {
                    commandMap.put("PLN_PRD_MST_NO", PRD_MST_NOs[y]);
                    commandMap.put("PLN_DTL_ORDER", (y + 1));
                    // 기획전 관리 상품 구성 등록
                    result += defaultDAO.insert("Plan.insertPlanDetail", commandMap);
                }
            }
        }
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updatePlan
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlan(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("PLN_MST_UPD_IP", IPUtil.getClientIP());
        commandMap.put("PLN_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        // 기획전 관리 수정
        result += defaultDAO.insert("Plan.updatePlan", commandMap);
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "PLN_MST_IDX", ""));
        result += commonFileService.updateCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        
        result += defaultDAO.delete("Plan.deletePlanDetail", commandMap);
        result += defaultDAO.delete("Plan.deletePlanGroup", commandMap);
        
        if ("Y".equals(StringUtil.getString(commandMap, "PLN_MST_PRD_DPL_YN", "N"))) {
            String [] PLN_GRP_NUMs = StringUtil.getArray(commandMap, "PLN_GRP_NUMs");
            for (int i = 0; i < PLN_GRP_NUMs.length; i++) {
                String PLN_GRP_NUM = PLN_GRP_NUMs[i];
                commandMap.put("PLN_GRP_TITLE", StringUtil.getString(commandMap, "PLN_GRP_TITLE_" + PLN_GRP_NUM, ""));
                commandMap.put("PLN_GRP_COL", StringUtil.getString(commandMap, "PLN_GRP_COL_" + PLN_GRP_NUM, ""));
                commandMap.put("PLN_GRP_SORT", (i + 1));
                // 기획전 관리 상품 그룹 수정
                result += defaultDAO.insert("Plan.insertPlanGroup", commandMap);
                String [] PRD_MST_NOs = StringUtil.getArray(commandMap, "PRD_MST_NO_" + PLN_GRP_NUM);
                for (int y = 0; y < PRD_MST_NOs.length; y++) {
                    commandMap.put("PLN_PRD_MST_NO", PRD_MST_NOs[y]);
                    commandMap.put("PLN_DTL_ORDER", (y + 1));
                    // 기획전 관리 상품 구성 수정
                    result += defaultDAO.insert("Plan.insertPlanDetail", commandMap);
                }
            }
        }
        return result;
    }

    
    /**
     * <pre>
     * 1. MethodName : selectPlanReplyListCount
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 수정 폼 > 기획전 댓글> 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.PlanService#selectPlanReplyListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlanReplyListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Plan.selectPlanReplyListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectPlanReplyList
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 수정 폼 > 기획전 댓글> 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.PlanService#selectPlanReplyList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlanReplyList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Plan.selectPlanReplyList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updatePlanReplyModify
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 상세 > 기획전 댓글 > 노출수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.PlanService#updatePlanReplyModify(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlanReplyModify(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("PLN_RPL_IDX", StringUtil.getString(param, "PLN_RPL_IDX", ""));
                commandMap.put("PLN_RPL_USE_YN", StringUtil.getString(param, "PLN_RPL_USE_YN", ""));
                result += defaultDAO.update("Plan.updatePlanReply", commandMap);
            }
        }
        return result;
    }
}
