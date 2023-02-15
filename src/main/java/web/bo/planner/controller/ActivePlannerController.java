package web.bo.planner.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import common.util.StringUtil;
import common.viewer.EXCEL;
import web.bo.common.service.CommonService;
import web.bo.planner.service.ActivePlannerService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : ActivePlannerController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 활동 플래너
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ActivePlannerController {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "activePlannerService")
    private ActivePlannerService activePlannerService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : activePlannerList
     * 2. ClassName  : ActivePlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 활동 플래너
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/activePlannerList")
    public ModelAndView activePlannerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공통코드
        List<String> codeList = new ArrayList<>();
        // 사업자 유형
        codeList.add("PLANNER_BUSINESS_CLASS");
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        // 목록 개수
        int totalCount = this.activePlannerService.selectActivePlannerListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.activePlannerService.selectActivePlannerList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/activePlannerList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : activePlannerExcelDownload
     * 2. ClassName  : ActivePlannerController.java
     * 3. Comment    : 관리자 > 레디플래너 > 활동 플래너 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/activePlannerExcelDownload")
    public EXCEL activePlannerExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.activePlannerService.selectActivePlannerList(commandMap);
        if (list != null) {
            for (Map<String, Object> item : list) {
                int RDP_MST_BUSI_CLS = StringUtil.getInt(item, "RDP_MST_BUSI_CLS");
                if (RDP_MST_BUSI_CLS == Code.PLANNER_BUSINESS_CLASS_PRIVATE) {
                    item.put("RDP_MST_SSN", StringUtil.getString(item, "RDP_MST_SSN1") + "-" + StringUtil.getString(item, "RDP_MST_SSN2"));
                } else {
                    item.put("RDP_MST_BUSI", StringUtil.getString(item, "RDP_MST_BUSI1") + "-" + StringUtil.getString(item, "RDP_MST_BUSI2") + "-" + StringUtil.getString(item, "RDP_MST_BUSI3"));
                }
                item.put("RDP_MST_DR_ADDR", StringUtil.getString(item, "RDP_MST_DR_ADDR1") + " " + StringUtil.getString(item, "RDP_MST_DR_ADDR2"));
                Object adrListObj = item.get("RDP_SIT_ADR_LIST");
                if (adrListObj != null) {
                    List<String> RDP_SIT_ADR = new ArrayList<>();
                    @SuppressWarnings("unchecked")
                    List<Map<String, Object>> adrList = (List<Map<String, Object>>) adrListObj;
                    for (Map<String, Object> adr : adrList) {
                        RDP_SIT_ADR.add(StringUtil.getString(adr, "RDP_SIT_ADR"));
                    }
                    item.put("RDP_SIT_ADR", StringUtils.join(RDP_SIT_ADR, "\n"));
                }
            }
            excel.put("fileName", "daemyung_active_planner_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "고유번호", "RDP_MST_IDX", "String", "50" });
            column.add(new String[] { "플래너번호", "RDP_MST_NO", "String", "50" });
            column.add(new String[] { "이름", "RDP_MST_MEM_NM", "String", "50" });
            column.add(new String[] { "연락처", "RDP_MST_HP", "String", "50" });
            column.add(new String[] { "아이디", "RDP_MST_ID", "String", "50" });
            column.add(new String[] { "사업자유형", "RDP_MST_BUSI_CLS_NM", "String", "50" });
            column.add(new String[] { "주민등록번호", "RDP_MST_SSN", "String", "50" });
            column.add(new String[] { "사업자번호", "RDP_MST_BUSI", "String", "50" });
            column.add(new String[] { "우편번호", "RDP_MST_ZIP_CODE", "String", "50" });
            column.add(new String[] { "주소", "RDP_MST_DR_ADDR", "String", "200" });
            column.add(new String[] { "은행정보", "RDP_MST_BNK_CD_NM", "String", "50" });
            column.add(new String[] { "은행계좌", "RDP_MST_BNK_ACT", "String", "50" });
            column.add(new String[] { "홍보사이트", "RDP_SIT_ADR", "String", "100" });
            column.add(new String[] { "자격", "RDP_MST_STATE_NM", "String", "50" });
            column.add(new String[] { "등급", "RDP_LVL_NM", "String", "50" });
            column.add(new String[] { "활동 시작일", "RDP_MST_ATV_DT", "Date", "50" });
            excel.put("headerTitle", column.stream().map(a -> a[0]).toArray(String[]::new));
            excel.put("cellField", column.stream().map(a -> a[1]).toArray(String[]::new));
            excel.put("cellType", column.stream().map(a -> a[2]).toArray(String[]::new));
            excel.put("colSize", column.stream().map(a -> a[3]).toArray(String[]::new));
            excel.put("list", list);
        }
        return excel;
    }
}
