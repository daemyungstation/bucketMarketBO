package web.bo.stats.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.util.DateUtil;
import common.viewer.EXCEL;
import common.model.Paging;
import web.bo.planner.service.PlannerStatusService;
import web.bo.stats.service.StatsPlannerAnalysisService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class StatsPlannerAnalysisController {

    @Resource(name = "statsPlannerAnalysisService")
    private StatsPlannerAnalysisService statsPlannerAnalysisService;

    @Resource(name = "plannerStatusService")
    private PlannerStatusService plannerStatusService;

    @RequestMapping(value = "/bo/stats/statsPlannerAnalysisList")
    public ModelAndView statsPlannerAnalysisList(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 현황
        mv.addObject("summary1", this.statsPlannerAnalysisService.selectPlannerSummary1(commandMap));
        mv.addObject("summary2", this.statsPlannerAnalysisService.selectPlannerSummary2(commandMap));

        // 목록 개수
        int totalCount = this.plannerStatusService.selectPlannerStatusListCount(commandMap);
        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.plannerStatusService.selectPlannerStatusList(commandMap);
        }
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsPlannerAnalysisList");
        return mv;
    }

    @RequestMapping(value = "bo/stats/statsPlannerAnalysisExcelDownload")
    public EXCEL statsPlannerAnalysisExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.plannerStatusService.selectPlannerStatusList(commandMap);
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
}
