package web.bo.planner.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
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
import common.util.FormatUtil;
import common.util.StringUtil;
import common.viewer.EXCEL;
import common.viewer.JSON;
import web.bo.planner.service.CommonPlannerService;
import web.bo.planner.service.PlannerPaymentService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : PlannerPaymentController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 플래너 지급 (SCM)
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PlannerPaymentController {

    @Resource(name = "commonPlannerService")
    private CommonPlannerService commonPlannerService;

    @Resource(name = "plannerPaymentService")
    private PlannerPaymentService plannerPaymentService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : plannerPaymentList
     * 2. ClassName  : PlannerPaymentController.java
     * 3. Comment    : 관리자 > 레디플래너 > 플래너 지급 대상 목록 (SCM)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPaymentList")
    public ModelAndView plannerPaymentList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 기본값
        LocalDate date = LocalDate.now();
        commandMap.put("searchPaymentYear", StringUtil.getInt(commandMap, "searchPaymentYear", date.getYear()));
        commandMap.put("searchPaymentMonth", StringUtil.getInt(commandMap, "searchPaymentMonth", date.getMonthValue()));

        // 목록 개수
        int totalCount = this.plannerPaymentService.selectPlannerPaymentListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.plannerPaymentService.selectPlannerPaymentList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerPaymentList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPaymentExcelDownload
     * 2. ClassName  : PlannerPaymentController.java
     * 3. Comment    : 관리자 > 레디플래너 > 플래너 지급 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPaymentExcelDownload")
    public EXCEL plannerPaymentExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.plannerPaymentService.selectPlannerPaymentList(commandMap);
        if (list != null) {
            for (Map<String, Object> item : list) {
                int RDP_MST_BUSI_CLS = StringUtil.getInt(item, "RDP_MST_BUSI_CLS");
                if (RDP_MST_BUSI_CLS == Code.PLANNER_BUSINESS_CLASS_PRIVATE) {
                    item.put("RDP_MST_SSN", StringUtil.getString(item, "RDP_MST_SSN1") + "-" + StringUtil.getString(item, "RDP_MST_SSN2"));
                } else {
                    item.put("RDP_MST_BUSI", StringUtil.getString(item, "RDP_MST_BUSI1") + "-" + StringUtil.getString(item, "RDP_MST_BUSI2") + "-" + StringUtil.getString(item, "RDP_MST_BUSI3"));
                }
                item.put("RDP_MST_DR_ADDR", StringUtil.getString(item, "RDP_MST_DR_ADDR1") + " " + StringUtil.getString(item, "RDP_MST_DR_ADDR2"));
                String RMT_ORD_PAY_DT = StringUtil.getString(item, "RMT_ORD_PAY_DT");
                if (StringUtils.isNotBlank(RMT_ORD_PAY_DT)) {
                    item.put("RMT_ORD_PAY_DT", FormatUtil.formatDateTime(RMT_ORD_PAY_DT, "."));
                }
                String RMT_ORD_YN = StringUtil.getString(item, "RMT_ORD_YN");
                if(RMT_ORD_YN.equals("Y")){
                    RMT_ORD_YN = "지급완료";
                    item.put("RMT_ORD_YN", RMT_ORD_YN);
                }else if(RMT_ORD_YN.equals("N")){
                    RMT_ORD_YN = "지급요청";
                    item.put("RMT_ORD_YN", RMT_ORD_YN);
                }else{
                    RMT_ORD_YN = "지급요청 전";
                    item.put("RMT_ORD_YN", RMT_ORD_YN);
                }
            }
            excel.put("fileName", "daemyung_planner_payment_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "플래너번호", "RDP_MST_NO", "String", "50" });
            column.add(new String[] { "이름", "RDP_MST_MEM_NM", "String", "80" });
            column.add(new String[] { "영업사원", "SELLER_NAME", "String", "80" });
            column.add(new String[] { "추천인", "ORD_MST_REC_TXT", "String", "80" });
            column.add(new String[] { "연락처", "RDP_MST_HP", "String", "80" });
            column.add(new String[] { "사업자유형", "RDP_MST_BUSI_CLS_NM", "String", "50" });
            column.add(new String[] { "법인명", "RDP_MST_BUSI_NM", "String", "80" });
            column.add(new String[] { "은행", "RDP_MST_BNK_CD_NM", "String", "50" });
            column.add(new String[] { "계좌번호", "RDP_MST_BNK_ACT", "String", "50" });
            column.add(new String[] { "예금주명", "RDP_MST_ACT_HDR", "String", "50" });
            column.add(new String[] { "정산금액", "PAY", "Number", "50" });
            column.add(new String[] { "온라인 상품명", "PRD_MST_NM", "String", "80" });
            column.add(new String[] { "가입자명", "PRD_MST_NM", "String", "50" });
            column.add(new String[] { "연락처", "CELL", "String", "50" });
            column.add(new String[] { "가입일자", "JOIN_DT", "String", "50" });
            column.add(new String[] { "해약일자", "RESN_PROC_DAY", "String", "50" });
            column.add(new String[] { "가입상태", "KSTBIT", "String", "50" });
            column.add(new String[] { "납입회차", "PAY_NO", "String", "50" });
            column.add(new String[] { "지급여부", "RMT_ORD_YN", "String", "50" });
            column.add(new String[] { "지급일", "RMT_ORD_PAY_DT", "String", "50" });
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
     * 1. MethodName : plannerPaymentHistoryListPopup
     * 2. ClassName  : PlannerPaymentController.java
     * 3. Comment    : 관리자 > 레디플래너 > 플래너 정산 > 정산금액 팝업
     * 4. 작성자       : inus
     * 5. 작성일       : 2021. 5. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPaymentHistoryListPopup" )
    public ModelAndView plannerPaymentHistoryListPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 프로필 조회
        Map<String, Object> profile = commonPlannerService.selectPlannerProfile(commandMap);
        mv.addObject("info", profile);
        
        String historyYear = (String) commandMap.put("searchPaymentYear", StringUtil.getString(commandMap, "searchPaymentYear"));
        String historyMonth = (String) commandMap.put("searchPaymentMonth", StringUtil.getString(commandMap, "searchPaymentMonth"));
        
        String historyDate = (historyYear + historyMonth);
        
        commandMap.put("historyDate", historyDate);

        // 목록 개수
        int totalCount = this.plannerPaymentService.selectPlannerPaymentHistoryListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 등급 조회
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.plannerPaymentService.selectPlannerPaymentHistoryList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerCalculateHistoryListPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPaymentPaymentAjax
     * 2. ClassName  : PlannerPaymentController.java
     * 3. Comment    : 관리자 > 레디플래너 > 플래너 지급 > 지급 완료 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPaymentCompleteAjax")
    public JSON plannerPaymentCompleteAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
     // 기본값
        LocalDate date = LocalDate.now();
        commandMap.put("searchPaymentYear", StringUtil.getInt(commandMap, "searchPaymentYear", date.getYear()));
        commandMap.put("searchPaymentMonth", StringUtil.getInt(commandMap, "searchPaymentMonth", date.getMonthValue()));
        json.addObject("isSuccess", (this.plannerPaymentService.insertPaymentComplete(commandMap) > 0));
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPopup
     * 2. ClassName  : PlannerPaymentController.java
     * 3. Comment    : 일괄지급처리 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 11.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPaymentCompleteAllPopup")
    public ModelAndView plannerPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
//        String paymentYear = StringUtil.getString(commandMap, "paymentYear", "");
//        String paymentMonth = StringUtil.getString(commandMap, "paymentMonth", "");
//        commandMap.put("searchPaymentYear",paymentYear);
//        commandMap.put("searchPaymentMonth",paymentMonth);

        // 목록
//        List<Map<String, Object>> list = this.plannerPaymentService.selectPlannerPaymentList(commandMap);
//        
//        commandMap.put("RDP_MST_HP", list.get(0).get("RDP_MST_HP"));
//        commandMap.put("RDP_MST_MEM_NM", list.get(0).get("RDP_MST_MEM_NM"));
//        commandMap.put("RDP_MST_BNK_CD_NM", list.get(0).get("RDP_MST_BNK_CD_NM"));
//        commandMap.put("RDP_MST_BNK_ACT", list.get(0).get("RDP_MST_BNK_ACT"));
//        commandMap.put("RDP_MST_ACT_HDR", list.get(0).get("RDP_MST_ACT_HDR"));
        // lucy 필터를 두번 타게 되면서 escape 처리된 문자열을 다시 escape 처리 하는것 방지.
        commandMap.put("PARAMS", StringEscapeUtils.unescapeHtml4(StringUtil.getString(commandMap, "PARAMS", "")));

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerPaymentCompleteAllPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerPaymentPaymentAjax
     * 2. ClassName  : PlannerPaymentController.java
     * 3. Comment    : 관리자 > 레디플래너 > 플래너 지급 > 일괄 지급 완료 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerPaymentCompleteAllAjax")
    public JSON plannerPaymentCompleteAllAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        // 기본값
        LocalDate date = LocalDate.now();
        commandMap.put("searchPaymentYear", StringUtil.getInt(commandMap, "searchPaymentYear", date.getYear()));
        commandMap.put("searchPaymentMonth", StringUtil.getInt(commandMap, "searchPaymentMonth", date.getMonthValue()));
        System.out.println("commandMap" + commandMap);
        json.addObject("isSuccess", (this.plannerPaymentService.insertPaymentCompleteAll(commandMap) > 0));
        return json;
    }
}
