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
import web.bo.stats.service.StatsSummeryService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class StatsSummeryController {

    @Resource(name="statsSummeryService")
    private StatsSummeryService statsSummeryService;
    
    /**
     * <pre>
     * 1. MethodName : setStatsBasicData
     * 2. ClassName  : StatsSummeryController.java
     * 3. Comment    : 관리자 > 통계 > 개요 > 기본 데이터 설정
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
     * 1. MethodName : statsSummeryView
     * 2. ClassName  : StatsSummeryController.java
     * 3. Comment    : 관리자 > 통계 > 개요
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsSummeryView")
    public ModelAndView statsSummeryView(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        this.setStatsBasicData(commandMap);
        // 실적 비중
        mv.addObject("info", this.statsSummeryService.selectStatsSummaryRatioInfo(commandMap));
        // 실정 상세 현황
        mv.addObject("list", this.statsSummeryService.selectStatsSummaryRecordList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsSummeryView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsSummeryExceldownload
     * 2. ClassName  : StatsSummeryController.java
     * 3. Comment    : 관리자 > 통계 > 개요 > 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsSummeryExcelDownload")
    public EXCEL statsSummeryExceldownload(@RequestParams() Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        this.setStatsBasicData(commandMap);
        // 실정 상세 현황
        List<Map<String, Object>> list = this.statsSummeryService.selectStatsSummaryRecordList(commandMap);
        if (list != null) {
            
            excel.put("fileName", "daemyung_stats_summery" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            
            String [] headerTitle = {"일자", "일반 접수", "일반 대기", "일반 가입", "일반 해약", "레디플래너 접수", "레디플래너 대기", "레디플래너 가입", "레디플래너 해약"};
            String [] cellField = {"DAY", "CST_R", "CST_W", "CST_J", "CST_C", "RDP_R", "RDP_W", "RDP_J", "RDP_C"};
            String [] cellType =  {"String", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number"};
            String [] colSize = {"80", "50", "50", "50", "50", "50", "50", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
            
        }
        return excel;
    }
}
