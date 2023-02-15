package web.bo.planner.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.code.Code;
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import common.util.DateUtil;
import common.util.StringUtil;
import common.viewer.EXCEL;
import egovframework.rte.fdl.property.EgovPropertyService;
import web.bo.common.service.CommonService;
import web.bo.planner.service.CommonPlannerService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : CommonPlannerController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 공통 기능
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CommonPlannerController {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "commonPlannerService")
    private CommonPlannerService commonPlannerService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    @Resource(name = "sciPropertiesService")
    private EgovPropertyService sciPropertiesService;

    /**
     * <pre>
     * 1. MethodName : plannerPopup
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopup")
    public ModelAndView plannerPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 프로필 조회
        Map<String, Object> profile = commonPlannerService.selectPlannerProfile(commandMap);
        mv.addObject("info", profile);

        // 플래너 상태에 따른 분기
        int state = StringUtil.getInt(profile, "RDP_MST_STATE", Code.PLANNER_STATE_APPLY);
        if (Code.PLANNER_STATE_APPLY == state || Code.PLANNER_STATE_REJECT == state) { // 신청, 반려

            mv.setViewName("bo/planner/applyPlannerPopup");
        } else if (Code.PLANNER_STATE_APPROVAL == state || Code.PLANNER_STATE_INACTIVE == state) { // 승인, 활동대기

            // SCI 실명확인 서비스번호
            mv.addObject("sciServiceNo", this.sciPropertiesService.getString("sci.name.check.service.number.planner.profile1"));

            // 공통코드
            List<String> codeList = new ArrayList<>();
            codeList.add("PLANNER_BUSINESS_CLASS"); // 사업자 유형
            codeList.add("INICIS_BACK_CODE"); // 은행 코드
            mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

            mv.setViewName("bo/planner/plannerProfilePopup");
        } else if (Code.PLANNER_STATE_ACTIVE == state || Code.PLANNER_STATE_STOP == state || Code.PLANNER_STATE_REQUEST_RELEASE == state) { // 정상, 정지, 해제요청

            // SCI 실명확인 서비스번호
            mv.addObject("sciServiceNo", this.sciPropertiesService.getString("sci.name.check.service.number.planner.profile1"));
            
            // 공통코드
            // 사업자 유형
            List<String> codeList = new ArrayList<>();
            codeList.add("PLANNER_BUSINESS_CLASS"); // 사업자 유형
            codeList.add("INICIS_BACK_CODE"); // 은행 코드
            mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

            mv.setViewName("bo/planner/plannerProfilePopup");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPopupProfilePopup
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업 > 프로필
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopupProfilePopup")
    public ModelAndView plannerPopupProfilePopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 프로필 조회
        Map<String, Object> profile = commonPlannerService.selectPlannerProfile(commandMap);
        mv.addObject("info", profile);

        // SCI 실명확인 서비스번호
        mv.addObject("sciServiceNo", this.sciPropertiesService.getString("sci.name.check.service.number.planner.profile2"));

        // 공통코드
        // 사업자 유형
        List<String> codeList = new ArrayList<>();
        codeList.add("PLANNER_BUSINESS_CLASS"); // 사업자 유형
        codeList.add("INICIS_BACK_CODE"); // 은행 코드
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        mv.setViewName("bo/planner/plannerProfilePopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPopupPerformancePopup
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업 > 실적
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopupPerformancePopup")
    public ModelAndView plannerPopupPerformancePopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 프로필 조회
        Map<String, Object> profile = this.commonPlannerService.selectPlannerProfile(commandMap);
        mv.addObject("info", profile);

        // 목록 개수
        int totalCount = this.commonPlannerService.selectPlannerPerformanceListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.commonPlannerService.selectPlannerPerformanceList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerPerformancePopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPopupPaymentPopup
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업 > 실적
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopupPaymentPopup")
    public ModelAndView plannerPopupPaymentPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 프로필 조회
        Map<String, Object> profile = this.commonPlannerService.selectPlannerProfile(commandMap);
        mv.addObject("info", profile);

        // 목록 개수
        int totalCount = this.commonPlannerService.selectPlannerPaymentListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.commonPlannerService.selectPlannerPaymentList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerPaymentPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPopupApplyModify
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업 (신청/반려) > 수정 요청 (승인/반려 처리)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopupApplyModify")
    public ModelAndView plannerPopupApplyModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("RDP_MST_IDX"), ""))) {
            int result = this.commonPlannerService.updateStateApply(commandMap);
            if (result > 0) {
                mv.addObject("closeMsg", "수정 되었습니다.");
            } else {
                mv.addObject("closeMsg", "수정에 실패하였습니다.");
            }
        }
        mv.addObject("parentReload", true);
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPopupProfileModify
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업 (프로필) > 프로필 수정 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopupProfileModify")
    public ModelAndView plannerPopupInactiveProfileModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("RDP_MST_IDX"), ""))) {
            int result = this.commonPlannerService.updatePlannerProfile(commandMap);
            if (result > 0) {
                mv.addObject("closeMsg", "수정 되었습니다.");
            } else {
                mv.addObject("closeMsg", "수정에 실패하였습니다.");
            }
        }
        mv.addObject("parentReload", true);
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPopupPerformanceExcelDownload
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업 (실적) > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopupPerformanceExcelDownload")
    public EXCEL plannerPopupPerformanceExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.commonPlannerService.selectPlannerPerformanceList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_planner_performance_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "캠페인 상품", "PRD_MST_NM", "String", "50" });
            column.add(new String[] { "수익구성(금액)", "PRD_MST_RDP_DVD_PAY", "String", "50" });
            column.add(new String[] { "수익구성(회차)", "PRD_MST_RDP_DVD_CNT", "String", "50" });
            column.add(new String[] { "온라인 상품코드", "PRD_MST_NO", "String", "50" });
            column.add(new String[] { "총 접수건수", "TOTAL_RECEIPT", "String", "50" });
            column.add(new String[] { "총 가입대기건수", "TOTAL_WAITING_TO_JOIN", "String", "50" });
            column.add(new String[] { "총 가입건수", "TOTAL_JOIN", "String", "50" });
            column.add(new String[] { "총 해약건수", "TOTAL_CANCEL", "String", "50" });
            column.add(new String[] { "총 예상수익", "TOTAL_EXPECTED_RETURN", "String", "50" });
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
     * 1. MethodName : plannerPopupPaymentExcelDownload
     * 2. ClassName  : CommonPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공통 기능 > 레디플래너 팝업 (지급) > 엑셀 다운로드.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPopupPaymentExcelDownload")
    public EXCEL plannerPopupPaymentExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.commonPlannerService.selectPlannerPerformanceList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_planner_payment_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "정산년월", "ALOW_DT_YM", "String", "50" });
            column.add(new String[] { "정산금액", "TOTAL_ALOW_AMT", "String", "50" });
            column.add(new String[] { "지급여부", "RMT_ORD_YN", "String", "50" });
            column.add(new String[] { "지급일", "ALOW_DT", "String", "50" });
            excel.put("headerTitle", column.stream().map(a -> a[0]).toArray(String[]::new));
            excel.put("cellField", column.stream().map(a -> a[1]).toArray(String[]::new));
            excel.put("cellType", column.stream().map(a -> a[2]).toArray(String[]::new));
            excel.put("colSize", column.stream().map(a -> a[3]).toArray(String[]::new));
            excel.put("list", list);
        }
        return excel;
    }
}
