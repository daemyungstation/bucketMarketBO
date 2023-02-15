package web.bo.planner.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Paging;
import common.model.Manager.ROLE_MANAGER;
import common.util.DateUtil;
import common.viewer.EXCEL;
import web.bo.common.service.CommonService;
import web.bo.planner.service.ActivePlannerService;
import web.bo.planner.service.PlannerGradeService;
import web.bo.planner.service.PlannerStatusService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : PlannerGradeController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 등급 관리
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PlannerGradeController {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "plannerGradeService")
    private PlannerGradeService plannerGradeService;

    @Resource(name = "plannerStatusService")
    private PlannerStatusService plannerStatusService;

    @Resource(name = "activePlannerService")
    private ActivePlannerService activePlannerService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : plannerGradeView
     * 2. ClassName  : PlannerGradeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 등급 관리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerGradeView")
    public ModelAndView plannerGradeView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공통코드
        List<String> codeList = new ArrayList<>();
        // 등급산정 기준
        codeList.add("PLANNER_GRADE_TERM");
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        // 등급산정 기준
        mv.addObject("term", this.plannerGradeService.selectGradeTerm(commandMap));
        // 목록
        mv.addObject("list", this.plannerGradeService.selectGradeList(commandMap));

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerGradeView");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerGradeUploadPopup
     * 2. ClassName  : PlannerGradeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 등급 관리 > 회원선정 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerGradeUploadPopup")
    public ModelAndView plannerGradeUploadPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 등급 조회
        mv.addObject("info", this.plannerGradeService.selectGrade(commandMap));

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerGradeUploadPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerGradeSampleExcelDownload
     * 2. ClassName  : PlannerGradeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 등급 관리 > 회원선정 팝업 > 샘플 파일 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerGradeSampleExcelDownload")
    public EXCEL plannerGradeSampleExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.activePlannerService.selectActivePlannerList(new HashMap<String, Object>());
        if (list != null) {
            excel.put("fileName", "sample_" + DateUtil.getCurrentDateTime());
            String[] headerTitle = { "플래너번호", "이름", "연락처", "아이디", "사업자유형", "활동시작일" };
            String[] cellField = { "RDP_MST_NO", "RDP_MST_MEM_NM", "RDP_MST_HP", "RDP_MST_ID", "RDP_MST_BUSI_CLS_NM", "RDP_MST_ATV_DT" };
            String[] cellType = { "String", "String", "String", "String", "String", "Date" };
            String[] colSize = { "50", "80", "80", "50", "50", "50" };
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
            excel.put("list", list);
        }
        return excel;
    }

    /**
     * <pre>
     * 1. MethodName : plannerGradeUploadModify
     * 2. ClassName  : PlannerGradeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 등급 관리 > 회원선정 팝업 > 파일 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bo/planner/plannerGradeUploadModify")
    public ModelAndView plannerGradeUploadModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        int result = this.plannerGradeService.updateGradeByFile((MultipartHttpServletRequest) request, commandMap);
        if (result > 0) {
            mv.addObject("closeMsg", "수정 되었습니다.");
        } else {
            mv.addObject("closeMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("parentReload", true);
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerGradeListPopup
     * 2. ClassName  : PlannerGradeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 등급 관리 > 회원 목록 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerGradeListPopup")
    public ModelAndView plannerGradeListPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 등급 조회
        mv.addObject("info", this.plannerGradeService.selectGrade(commandMap));

        // 목록 개수
        int totalCount = this.plannerStatusService.selectPlannerGradeStatusListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 등급 조회
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.plannerStatusService.selectPlannerGradeStatusList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerGradeListPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerGradeListPopupExcelDownload
     * 2. ClassName  : PlannerGradeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 등급 관리 > 회원 목록 팝업 > 회원목록 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerGradeListPopupExcelDownload")
    public EXCEL plannerGradeListPopupExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.plannerStatusService.selectPlannerGradeStatusList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_planner_status_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "플래너번호", "RDP_MST_NO", "String", "50" });
            column.add(new String[] { "이름", "RDP_MST_MEM_NM", "String", "80" });
            column.add(new String[] { "연락처", "RDP_MST_HP", "String", "80" });
            column.add(new String[] { "아이디", "RDP_MST_ID", "String", "50" });
            column.add(new String[] { "총 접수건수", "TOTAL_RECEIPT", "String", "50" });
            column.add(new String[] { "총 가입대기건수", "TOTAL_WAITING_TO_JOIN", "String", "50" });
            column.add(new String[] { "총 가입건수", "TOTAL_JOIN", "String", "50" });
            column.add(new String[] { "총 해약건수", "TOTAL_CANCEL", "String", "50" });
            column.add(new String[] { "총 예상수익", "TOTAL_EXPECTED_RETURN", "String", "50" });
            column.add(new String[] { "임직원 여부", "RDP_MST_DM_YN", "String", "50" });
            column.add(new String[] { "사번", "RDP_MST_DM_NO", "String", "50" });
            column.add(new String[] { "사업자유형", "RDP_MST_BUSI_CLS_NM", "String", "50" });
            column.add(new String[] { "자격", "RDP_MST_STATE_NM", "String", "50" });
            excel.put("headerTitle", column.stream().map(a -> a[0]).toArray(String[]::new));
            excel.put("cellField", column.stream().map(a -> a[1]).toArray(String[]::new));
            excel.put("cellType", column.stream().map(a -> a[2]).toArray(String[]::new));
            excel.put("colSize", column.stream().map(a -> a[3]).toArray(String[]::new));
            excel.put("list", list);
        }
        return excel;
    }

    /**
     * <pre>
     * 1. MethodName : plannerGradeModify
     * 2. ClassName  : PlannerGradeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 등급 관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerGradeModify")
    public ModelAndView plannerGradeModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 수정
        int result = this.plannerGradeService.updateGrade(commandMap);
        if (result > 0) {
            mv.addObject("alertMsg", "수정 되었습니다.");
        } else {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/planner/plannerGradeView.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");

        return mv;
    }
}
