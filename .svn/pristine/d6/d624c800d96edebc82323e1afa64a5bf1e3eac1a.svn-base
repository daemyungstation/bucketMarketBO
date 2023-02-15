package web.bo.planner.controller;

import java.util.ArrayList;
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
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import common.util.DateUtil;
import common.util.StringUtil;
import common.viewer.EXCEL;
import web.bo.common.service.CommonService;
import web.bo.planner.service.PlannerNoticeService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : PlannerNoticeController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 공지사항
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PlannerNoticeController {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "plannerNoticeService")
    private PlannerNoticeService plannerNoticeService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : plannerNoticeList
     * 2. ClassName  : PlannerNoticeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공지사항
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerNoticeList")
    public ModelAndView plannerNoticeList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 상단 목록
        commandMap.put("RDP_NTS_TOP_YN", "Y");
        mv.addObject("topList", this.plannerNoticeService.selectNoticeList(commandMap));

        // 하단 목록
        commandMap.put("RDP_NTS_TOP_YN", "");
        // 목록 개수
        int totalCount = this.plannerNoticeService.selectNoticeListCount(commandMap);
        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.plannerNoticeService.selectNoticeList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerNoticeList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerNoticeExcelDownload
     * 2. ClassName  : PlannerNoticeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공지사항 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerNoticeExcelDownload")
    public EXCEL plannerNoticeExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();

        // 상단 목록
        commandMap.put("RDP_NTS_TOP_YN", "Y");
        List<Map<String, Object>> list = this.plannerNoticeService.selectNoticeList(commandMap);
        if (list == null) {
            list = new ArrayList<>();
        }
        // 하단 목록
        commandMap.put("RDP_NTS_TOP_YN", "Y");
        List<Map<String, Object>> bottomList = this.plannerNoticeService.selectNoticeList(commandMap);
        if (bottomList == null) {
            bottomList = new ArrayList<>();
        }
        list.addAll(bottomList);

        excel.put("fileName", "daemyung_planner_notice_" + DateUtil.getCurrentDateTime());
        List<String[]> column = new ArrayList<>();
        column.add(new String[] { "제목", "RDP_NTS_TITLE", "String", "50" });
        column.add(new String[] { "조회수", "RDP_NTS_READ_CNT", "String", "50" });
        column.add(new String[] { "등록일", "RDP_NTS_REG_DT", "Date", "50" });
        column.add(new String[] { "상태", "RDP_NTS_USE_YN", "String", "50" });
        excel.put("headerTitle", column.stream().map(a -> a[0]).toArray(String[]::new));
        excel.put("cellField", column.stream().map(a -> a[1]).toArray(String[]::new));
        excel.put("cellType", column.stream().map(a -> a[2]).toArray(String[]::new));
        excel.put("colSize", column.stream().map(a -> a[3]).toArray(String[]::new));
        excel.put("list", list);
        return excel;
    }

    /**
     * <pre>
     * 1. MethodName : plannerNoticeForm
     * 2. ClassName  : PlannerNoticeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공지사항 > 등록 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerNoticeForm")
    public ModelAndView plannerNoticeForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerNoticeForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerNoticeRegist
     * 2. ClassName  : PlannerNoticeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공지사항 > 등록 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerNoticeRegist")
    public ModelAndView plannerNoticeRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 등록
        int result = this.plannerNoticeService.insertNotice((MultipartHttpServletRequest) request, commandMap);
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/planner/plannerNoticeList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerNoticeEdit
     * 2. ClassName  : PlannerNoticeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공지사항 > 수정 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerNoticeEdit")
    public ModelAndView plannerNoticeEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공지사항 상세정보
        mv.addAllObjects(this.plannerNoticeService.selectNoticeInfo(commandMap));

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerNoticeEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerNoticeModify
     * 2. ClassName  : PlannerNoticeController.java
     * 3. Comment    : 관리자 > 레디플래너 > 공지사항 > 수정 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerNoticeModify")
    public ModelAndView plannerNoticeModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("RDP_NTS_IDX"), ""))) {
            // 수정
            int result = this.plannerNoticeService.updateNotice((MultipartHttpServletRequest) request, commandMap);
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", serverDomain + "/bo/planner/plannerNoticeList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }
}
