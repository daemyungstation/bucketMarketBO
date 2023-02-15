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
import common.util.StringUtil;
import common.viewer.EXCEL;
import web.bo.common.service.CommonService;
import web.bo.planner.service.PlannerCommunityService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : PlannerCommunityController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 커뮤니티
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PlannerCommunityController {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "plannerCommunityService")
    private PlannerCommunityService plannerCommunityService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : plannerCommunityList
     * 2. ClassName  : PlannerCommunityController.java
     * 3. Comment    : 관리자 > 레디플래너 > 커뮤니티
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerCommunityList")
    public ModelAndView plannerCommunityList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 목록 개수
        int totalCount = this.plannerCommunityService.selectCommunityListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.plannerCommunityService.selectCommunityList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerCommunityList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerCommunityExcelDownload
     * 2. ClassName  : PlannerCommunityController.java
     * 3. Comment    : 관리자 > 레디플래너 > 커뮤니티 > 엑셀 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerCommunityExcelDownload")
    public EXCEL plannerCommunityExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.plannerCommunityService.selectCommunityList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_planner_community_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "플래너번호", "RDP_MST_NO", "String", "50" });
            column.add(new String[] { "아이디", "RDP_MST_ID", "String", "50" });
            column.add(new String[] { "이름", "RDP_MST_MEM_NM", "String", "50" });
            column.add(new String[] { "제목", "RDP_BBS_TITLE", "String", "50" });
            column.add(new String[] { "조회수", "RDP_BBS_READ_CNT", "String", "50" });
            column.add(new String[] { "상태", "RDP_BBS_USE_YN", "String", "50" });
            column.add(new String[] { "등록일", "RDP_BBS_REG_DT", "String", "50" });
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
     * 1. MethodName : plannerCommunityEdit
     * 2. ClassName  : PlannerCommunityController.java
     * 3. Comment    : 관리자 > 레디플래너 > 커뮤니티 > 수정 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerCommunityEdit")
    public ModelAndView plannerCommunityEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 상세정보
        mv.addAllObjects(this.plannerCommunityService.selectCommunityInfo(commandMap));

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerCommunityEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerCommunityModify
     * 2. ClassName  : PlannerCommunityController.java
     * 3. Comment    : 관리자 > 레디플래너 > 커뮤니티 > 수정 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerCommunityModify")
    public ModelAndView plannerCommunityModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("RDP_BBS_IDX"), ""))) {
            // 수정
            int result = this.plannerCommunityService.updateCommunity(commandMap);
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", serverDomain + "/bo/planner/plannerCommunityList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }
}
