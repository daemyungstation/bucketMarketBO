package web.bo.planner.service.impl;

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
import common.util.StringUtil;
import web.bo.common.service.CommonFileService;
import web.bo.planner.service.PlannerQuizService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : PlannerQuizServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 교육이수 관리
 * &#64;author upleat
 * </pre>
 */
@Service("plannerQuizService")
public class PlannerQuizServiceImpl implements PlannerQuizService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonFileService")
    private CommonFileService commonFileService;

    private static final String UPLOAD_PATH = "planner";
    private static final String UPLOAD_ALLOW = "planner";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";

    /**
     * <pre>
     * 1. MethodName : selectPlannerQuizListCount
     * 2. ClassName  : PlannerQuizServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 목록 갯수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 16.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerQuizService#selectPlannerQuizListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectPlannerQuizListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PlannerQuiz.selectPlannerQuizListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerQuizList
     * 2. ClassName  : PlannerQuizServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 16.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerQuizService#selectPlannerQuizList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerQuizList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PlannerQuiz.selectPlannerQuizList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertPlannerQuiz
     * 2. ClassName  : PlannerQuizServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerQuizService#insertPlannerQuiz(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertPlannerQuiz(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_EDU_REG_IP", IPUtil.getClientIP());
        commandMap.put("RDP_EDU_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_QUIZ_REG_IP", IPUtil.getClientIP());
        commandMap.put("RDP_QUIZ_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_ITEM_REG_IP", IPUtil.getClientIP());
        commandMap.put("RDP_ITEM_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));

        // 퀴즈 그룹 추가
        int result = defaultDAO.insert("PlannerQuiz.insertPlannerQuizGroup", commandMap);

        // 퀴즈 추가
        String[] RDP_QUIZ_NO = StringUtil.getArray(commandMap, "RDP_QUIZ_NO");
        for (int i = 0; i < RDP_QUIZ_NO.length; i++) {

            // 삭제하지 않은것만 추가
            String RDP_QUIZ_DEL_YN = StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_QUIZ_DEL_YN");
            if ("N".equals(RDP_QUIZ_DEL_YN)) {
                commandMap.put("RDP_QUIZ_NM", StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_QUIZ_NM"));
                commandMap.put("RDP_QUIZ_SORT", StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_QUIZ_SORT"));
                defaultDAO.insert("PlannerQuiz.insertPlannerQuiz", commandMap);

                // 문항 추가
                String[] RDP_ITEM_IDX = StringUtil.getArray(commandMap, "QUIZ[" + i + "].RDP_ITEM_IDX");
                String[] RDP_ITEM_DEL_YN = StringUtil.getArray(commandMap, "QUIZ[" + i + "].RDP_ITEM_DEL_YN");
                String[] RDP_ITEM_NM = StringUtil.getArray(commandMap, "QUIZ[" + i + "].RDP_ITEM_NM");
                int RDP_ITEM_SORT_INDEX = 0;
                for (int j = 0; j < RDP_ITEM_IDX.length; j++) {

                    // 삭제하지 않은것만 추가
                    if ("N".equals(RDP_ITEM_DEL_YN[j])) {
                        commandMap.put("RDP_ITEM_NM", RDP_ITEM_NM[j]);
                        commandMap.put("RDP_ITEM_YN", StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_ITEM_YN[" + j + "]"));
                        commandMap.put("RDP_ITEM_SORT", RDP_ITEM_SORT_INDEX++);
                        defaultDAO.insert("PlannerQuiz.insertPlannerQuizItem", commandMap);
                    }
                }
            }
        }

        // 첨부파일
        if (result > 0) {
            commandMap.put("CMM_FLE_TB_NM", "T_RDP_EDU");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "RDP_EDU_IDX"));
            commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerQuiz
     * 2. ClassName  : PlannerQuizServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerQuizService#updatePlannerQuiz(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updatePlannerQuiz(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_EDU_UPD_IP", IPUtil.getClientIP());
        commandMap.put("RDP_EDU_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_QUIZ_REG_IP", IPUtil.getClientIP());
        commandMap.put("RDP_QUIZ_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_ITEM_REG_IP", IPUtil.getClientIP());
        commandMap.put("RDP_ITEM_REG_ID", SessionsManager.getSessionValue("ADM_MST_ID"));

        // 하위 퀴즈, 문항 모두 삭제 (수정X, 삭제 후 추가)
        defaultDAO.delete("PlannerQuiz.deletePlannerQuiz", commandMap);
        defaultDAO.delete("PlannerQuiz.deletePlannerQuizItem", commandMap);

        // 퀴즈 그룹 수정
        int result = defaultDAO.update("PlannerQuiz.updatePlannerQuizGroup", commandMap);

        // 퀴즈 추가
        String[] RDP_QUIZ_NO = StringUtil.getArray(commandMap, "RDP_QUIZ_NO");
        for (int i = 0; i < RDP_QUIZ_NO.length; i++) {

            // 삭제하지 않은것만 추가
            String RDP_QUIZ_DEL_YN = StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_QUIZ_DEL_YN");
            if ("N".equals(RDP_QUIZ_DEL_YN)) {
                commandMap.put("RDP_QUIZ_NM", StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_QUIZ_NM"));
                commandMap.put("RDP_QUIZ_SORT", StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_QUIZ_SORT"));
                defaultDAO.insert("PlannerQuiz.insertPlannerQuiz", commandMap);

                // 문항 추가
                String[] RDP_ITEM_IDX = StringUtil.getArray(commandMap, "QUIZ[" + i + "].RDP_ITEM_IDX");
                String[] RDP_ITEM_DEL_YN = StringUtil.getArray(commandMap, "QUIZ[" + i + "].RDP_ITEM_DEL_YN");
                String[] RDP_ITEM_NM = StringUtil.getArray(commandMap, "QUIZ[" + i + "].RDP_ITEM_NM");
                int RDP_ITEM_SORT_INDEX = 0;
                for (int j = 0; j < RDP_ITEM_IDX.length; j++) {

                    // 삭제하지 않은것만 추가
                    if ("N".equals(RDP_ITEM_DEL_YN[j])) {
                        commandMap.put("RDP_ITEM_NM", RDP_ITEM_NM[j]);
                        commandMap.put("RDP_ITEM_YN", StringUtil.getString(commandMap, "QUIZ[" + i + "].RDP_ITEM_YN[" + j + "]"));
                        commandMap.put("RDP_ITEM_SORT", RDP_ITEM_SORT_INDEX++);
                        defaultDAO.insert("PlannerQuiz.insertPlannerQuizItem", commandMap);
                    }
                }
            }
        }

        // 첨부파일
        if (result > 0) {
            commandMap.put("CMM_FLE_TB_NM", "T_RDP_EDU");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "RDP_EDU_IDX"));
            commonFileService.updateCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerQuizInfo
     * 2. ClassName  : PlannerQuizServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 교육이수 관리 > 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 21.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerQuizService#selectPlannerQuizInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPlannerQuizInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();

        // 상세정보
        returnMap.put("info", defaultDAO.select("PlannerQuiz.selectPlannerQuizInfo", commandMap));

        // 첨부파일
        commandMap.put("CMM_FLE_TB_NM", "T_RDP_EDU");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "RDP_EDU_IDX"));
        // 비디오 
        commandMap.put("CMM_FLE_TB_TYPE", Const.PLANNER_QUIZ_VIDEO);
        returnMap.put("videoList", commonFileService.selectCommonFileList(commandMap));
        // PC 섬네일 이미지
        commandMap.put("CMM_FLE_TB_TYPE", Const.PLANNER_QUIZ_PC_THUMBNAIL);
        returnMap.put("pcThumbnailList", commonFileService.selectCommonFileList(commandMap));
        // MOBILE 섬네일 이미지
        commandMap.put("CMM_FLE_TB_TYPE", Const.PLANNER_QUIZ_MOBILE_THUMBNAIL);
        returnMap.put("mobileThumbnailList", commonFileService.selectCommonFileList(commandMap));

        return returnMap;
    }

}
