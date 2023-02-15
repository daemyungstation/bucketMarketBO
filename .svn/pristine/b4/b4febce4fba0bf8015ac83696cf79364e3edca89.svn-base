package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.ExcelUtil;
import common.util.IPUtil;
import common.util.StringUtil;
import web.bo.planner.service.PlannerGradeService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : PlannerGradeServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 등급 관리
 * &#64;author upleat
 * </pre>
 */
@Service("plannerGradeService")
public class PlannerGradeServiceImpl implements PlannerGradeService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectGradeTerm
     * 2. ClassName  : PlannerGradeServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급기준 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerGradeService#selectGradeTerm(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public Map<String, Object> selectGradeTerm(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PlannerGrade.selectGradeTerm", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectGradeList
     * 2. ClassName  : PlannerGradeServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerGradeService#selectGradeList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectGradeList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PlannerGrade.selectGradeList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectGrade
     * 2. ClassName  : PlannerGradeServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerGradeService#selectGrade(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public Map<String, Object> selectGrade(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PlannerGrade.selectGrade", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateGrade
     * 2. ClassName  : PlannerGradeServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 등급 목록 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerGradeService#updateGrade(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updateGrade(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_TERM_UPD_IP", IPUtil.getClientIP());
        commandMap.put("RDP_TERM_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_LVL_UPD_IP", IPUtil.getClientIP());
        commandMap.put("RDP_LVL_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));

        // 등급산정 기준
        int result = defaultDAO.update("PlannerGrade.updateGradeTerm", commandMap);

        // 등급
        String[] RDP_LVL_IDXs = StringUtil.getArray(commandMap, "RDP_LVL_IDX");
        String[] RDP_LVL_NMs = StringUtil.getArray(commandMap, "RDP_LVL_NM");
        String[] RDP_LVL_STDs = StringUtil.getArray(commandMap, "RDP_LVL_STD");
        String[] RDP_LVL_BNFs = StringUtil.getArray(commandMap, "RDP_LVL_BNF");
        for (int i = 0; i < RDP_LVL_IDXs.length; i++) {
            commandMap.put("RDP_LVL_IDX", RDP_LVL_IDXs[i]);
            commandMap.put("RDP_LVL_NM", RDP_LVL_NMs[i]);
            commandMap.put("RDP_LVL_STD", RDP_LVL_STDs[i]);
            commandMap.put("RDP_LVL_BNF", RDP_LVL_BNFs[i]);
            result += defaultDAO.update("PlannerGrade.updateGrade", commandMap);
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updateGradeByFile
     * 2. ClassName  : PlannerGradeServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 등급 관리 > 회원 등급 수정 (파일)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerGradeService#updateGradeByFile(org.springframework.web.multipart.MultipartHttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updateGradeByFile(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        CommonsMultipartFile file = (CommonsMultipartFile) request.getFile("EXCEL");
        if (!file.isEmpty()) {
            String[] columName = { "RDP_MST_NO", "RDP_MST_MEM_NM", "RDP_MST_HP", "RDP_MST_ID", "RDP_MST_BUSI_CLS_NM", "RDP_MST_ATV_DT" };
            List<Map<String, Object>> list = ExcelUtil.excelRead(file, columName);
            for (Map<String, Object> map : list) {
                commandMap.put("RDP_MST_NO", StringUtil.getString(map, "RDP_MST_NO"));
                result += defaultDAO.update("PlannerGrade.updatePlannerGrade", commandMap);
            }
        }
        return result;
    }

}
