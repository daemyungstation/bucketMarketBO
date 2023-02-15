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
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import common.util.DateUtil;
import common.viewer.EXCEL;
import common.viewer.JSON;
import web.bo.common.service.CommonService;
import web.bo.planner.service.ApplyPlannerService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : ApplyPlannerController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 신청 플래너
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ApplyPlannerController {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "applyPlannerService")
    private ApplyPlannerService applyPlannerService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : applyPlannerList
     * 2. ClassName  : ApplyPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 신청 플래너
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/applyPlannerList")
    public ModelAndView applyPlannerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 목록 개수
        int totalCount = this.applyPlannerService.selectApplyPlannerListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.applyPlannerService.selectApplyPlannerList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/applyPlannerList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : applyPlannerApproveAllAjax
     * 2. ClassName  : ApplyPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 신청 플래너 > 일괄 승인 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/applyPlannerApproveAllAjax")
    public JSON applyPlannerApprovalAllAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("isSuccess", (this.applyPlannerService.updateStateApproveAll(commandMap) > 0));
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : applyPlannerExcelDownload
     * 2. ClassName  : ApplyPlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 신청 플래너 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/applyPlannerExcelDownload")
    public EXCEL applyPlannerExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.applyPlannerService.selectApplyPlannerList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_apply_planner_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "플래너번호", "RDP_MST_NO", "String", "50" });
            column.add(new String[] { "이름", "RDP_MST_MEM_NM", "String", "50" });
            column.add(new String[] { "이메일주소", "RDP_MST_MAIL", "String", "50" });
            column.add(new String[] { "연락처", "RDP_MST_HP", "String", "50" });
            column.add(new String[] { "임직원 여부", "RDP_MST_DM_YN", "String", "50" });
            column.add(new String[] { "사번", "RDP_MST_DM_NO", "String", "50" });
            column.add(new String[] { "신청일", "RDP_MST_REG_DT", "date", "50" });
            column.add(new String[] { "상태", "RDP_MST_STATE_NM", "String", "50" });
            excel.put("headerTitle", column.stream().map(a -> a[0]).toArray(String[]::new));
            excel.put("cellField", column.stream().map(a -> a[1]).toArray(String[]::new));
            excel.put("cellType", column.stream().map(a -> a[2]).toArray(String[]::new));
            excel.put("colSize", column.stream().map(a -> a[3]).toArray(String[]::new));
            excel.put("list", list);
        }
        return excel;
    }
}
