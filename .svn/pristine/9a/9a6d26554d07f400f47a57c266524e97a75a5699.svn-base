package web.bo.stats.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.code.Const;
import common.model.Manager.ROLE_MANAGER;
import common.util.DateUtil;
import common.util.StringUtil;
import common.viewer.EXCEL;
import web.bo.stats.service.StatsCurationAnalysisService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class StatsCurationAnalysisController {

    @Resource(name="statsCurationAnalysisService")
    private StatsCurationAnalysisService statsCurationAnalysisService;
    
    /**
     * <pre>
     * 1. MethodName : setStatsBasicData
     * 2. ClassName  : StatsCurationAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 큐레이션 > 기본 데이터 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @throws Exception
     */
    private void setStatsBasicData(Map<String, Object> commandMap) throws Exception {
        commandMap.put("searchPeriod", StringUtil.getString(commandMap, "searchPeriod", Const.PERIOD_DAY));
        commandMap.put("searchStartDate", StringUtil.getString(commandMap, "searchStartDate", DateUtil.getToday("-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap, "searchEndDate", DateUtil.getToday("-")));
    }
    
    /**
     * <pre>
     * 1. MethodName : statsCurationAnalysisView
     * 2. ClassName  : StatsCurationAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 큐레이션
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsCurationAnalysisView")
    public ModelAndView statsCurationAnalysisView(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        this.setStatsBasicData(commandMap);
        mv.addObject("list", this.statsCurationAnalysisService.selectCurationAnalysisList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsCurationAnalysisView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsCurationAnalysisExcelDownload
     * 2. ClassName  : StatsCurationAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 큐레이션 > 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsCurationAnalysisExcelDownload")
    public EXCEL statsCurationAnalysisExcelDownload(@RequestParams() Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        this.setStatsBasicData(commandMap);
        List<Map<String, Object>> list = this.statsCurationAnalysisService.selectCurationAnalysisList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_stats_curation_analysis" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"일자", "주제별", "선택키워드", "클릭수 총 합계", "클릭수 PC", "클릭수 Mobile", "클릭수 Mobile App"};
            String [] cellField = {"DAY", "CRT_MST_QST", "CRT_KWD_SLT", "TOT", "PC", "MO", "APP"};
            String [] cellType =  {"String", "String", "String", "Number", "Number", "Number", "Number"};
            String [] colSize = {"80", "80", "80", "50", "50", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
}
