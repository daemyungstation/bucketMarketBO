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
import web.bo.common.service.CommonService;
import web.bo.stats.service.StatsJoinAnalysisService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class StatsJoinAnalysisController {

    @Resource(name="statsJoinAnalysisService")
    private StatsJoinAnalysisService statsJoinAnalysisService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : setStatsBasicData
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 기본 데이터 설정
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
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 성별
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisSexView")
    public ModelAndView statsSummeryView(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        this.setStatsBasicData(commandMap);
        mv.addObject("list", this.statsJoinAnalysisService.selectStatsJoinAnalysisSexList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsJoinAnalysisSexView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisSexExcelDownload
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 성별 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisSexExcelDownload")
    public ModelAndView statsJoinAnalysisSexExcelDownload(@RequestParams() Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        this.setStatsBasicData(commandMap);
        List<Map<String, Object>> list = this.statsJoinAnalysisService.selectStatsJoinAnalysisSexList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_stats_join_analysis_sex" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"일자", "남성 접수", "남성 대기", "남성 가입", "남성 해약", "여성 접수", "여성 대기", "여성 가입", "여성 해약"};
            String [] cellField = {"DAY", "MALE_R", "MALE_W", "MALE_J", "MALE_C", "FEMALE_R", "FEMALE_W", "FEMALE_J", "FEMALE_C"};
            String [] cellType =  {"String", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number"};
            String [] colSize = {"80", "50", "50", "50", "50", "50", "50", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisAgeView
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 연령대
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisAgeView")
    public ModelAndView statsJoinAnalysisAgeView(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        this.setStatsBasicData(commandMap);
        mv.addObject("list", this.statsJoinAnalysisService.selectStatsJoinAnalysisAgeList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsJoinAnalysisAgeView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisAgeExcelDownload
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 연령대 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisAgeExcelDownload")
    public ModelAndView statsJoinAnalysisAgeExcelDownload(@RequestParams() Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        this.setStatsBasicData(commandMap);
        List<Map<String, Object>> list = this.statsJoinAnalysisService.selectStatsJoinAnalysisAgeList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_stats_join_analysis_age" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"일자", "남성 ~19", "남성 20대", "남성 30대", "남성 40대", "남성 50대", "남성 60대~", "여성 ~19", "여성 20대", "여성 30대", "여성 40대", "여성 50대", "여성 60대~"};
            String [] cellField = {"DAY", "ONE_M", "TWO_M", "THREE_M", "FOUR_M", "FIVE_M", "SIX_M", "ONE_F", "TWO_F", "THREE_F", "FOUR_F", "FIVE_F", "SIX_F"};
            String [] cellType =  {"String", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number"};
            String [] colSize = {"80", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisProductTypeView
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 상품유형
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisProductTypeView")
    public ModelAndView statsJoinAnalysisProductTypeView(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        this.setStatsBasicData(commandMap);
        mv.addObject("list", this.statsJoinAnalysisService.selectStatsJoinAnalysisProductTypeList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsJoinAnalysisProductTypeView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisProductTypeExcelDownload
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 상품유형 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisProductTypeExcelDownload")
    public ModelAndView statsJoinAnalysisProductTypeExcelDownload(@RequestParams() Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        this.setStatsBasicData(commandMap);
        List<Map<String, Object>> list = this.statsJoinAnalysisService.selectStatsJoinAnalysisProductTypeList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_stats_join_analysis_product_type" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"일자", "월지원 접수", "월지원 대기", "월지원 가입", "월지원 해약", "즉발(채권) 접수", "즉발(채권) 대기", "즉발(채권) 가입", "즉발(채권) 해약", "즉발(포인트) 접수", "즉발(포인트) 대기", "즉발(포인트) 가입", "즉발(포인트) 해약", "할부지원 접수", "할부지원 대기", "할부지원 가입", "할부지원 해약", "렌탈 접수", "렌탈 대기", "렌탈 가입", "렌탈 해약"};
            String [] cellField = {"DAY", "MONTHLY_R", "MONTHLY_W", "MONTHLY_J", "MONTHLY_C", "IMMEDIATELY_N_R", "IMMEDIATELY_N_W", "IMMEDIATELY_N_J", "IMMEDIATELY_N_C", "IMMEDIATELY_N_R", "IMMEDIATELY_N_W", "IMMEDIATELY_N_J", "IMMEDIATELY_N_C", "INSTALLMENT_R", "INSTALLMENT_W", "INSTALLMENT_J", "INSTALLMENT_C", "RENTAL_R", "RENTAL_W", "RENTAL_J", "RENTAL_C"};
            String [] cellType =  {"String", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number", "Number"};
            String [] colSize = {"80", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisProductView
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 상품
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisProductView")
    public ModelAndView statsJoinAnalysisProductView(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        this.setStatsBasicData(commandMap);
        mv.addObject("list", this.statsJoinAnalysisService.selectStatsJoinAnalysisProductList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsJoinAnalysisProductView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisProductExcelDownload
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 상품 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisProductExcelDownload")
    public ModelAndView statsJoinAnalysisProductExcelDownload(@RequestParams() Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        this.setStatsBasicData(commandMap);
        List<Map<String, Object>> list = this.statsJoinAnalysisService.selectStatsJoinAnalysisProductList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_stats_join_analysis_product" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"일자", "DLCC상품코드", "상품명", "접수", "대기", "가입", "해약"};
            String [] cellField = {"DAY", "PROD_CD", "PRD_MST_NM", "CNT_R", "CNT_W", "CNT_J", "CNT_C"};
            String [] cellType =  {"String", "String", "String", "Number", "Number", "Number", "Number"};
            String [] colSize = {"80", "80", "100", "50", "50", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisProductCategoryView
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 카테고리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisProductCategoryView")
    public ModelAndView statsJoinAnalysisProductCategoryView(@RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        this.setStatsBasicData(commandMap);
        // 상품 카테고리 최 상위 목록 조회
        mv.addObject("productCategoryList", this.commonService.selectCommonProductCategoryList(commandMap));
        mv.addObject("list", this.statsJoinAnalysisService.selectStatsJoinAnalysisProductCategoryList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/stats/statsJoinAnalysisProductCategoryView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : statsJoinAnalysisProductCategoryExcelDownload
     * 2. ClassName  : StatsJoinAnalysisController.java
     * 3. Comment    : 관리자 > 통계 > 가입분석 > 카테고리 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/stats/statsJoinAnalysisProductCategoryExcelDownload")
    public ModelAndView statsJoinAnalysisProductCategoryExcelDownload(@RequestParams() Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        this.setStatsBasicData(commandMap);
        List<Map<String, Object>> list = this.statsJoinAnalysisService.selectStatsJoinAnalysisProductCategoryList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_stats_join_analysis_product_category" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"일자", "대카테고리", "중카테고리", "접수", "대기", "가입", "해약"};
            String [] cellField = {"DAY", "ONE_PRD_CTG_NM", "TWO_PRD_CTG_NM", "CNT_R", "CNT_W", "CNT_J", "CNT_C"};
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
