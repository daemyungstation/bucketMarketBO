package web.bo.planner.controller;

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
import common.util.StringUtil;
import web.bo.common.service.CommonService;
import web.bo.planner.service.PlannerQuizService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.controller
 * &#64;FileName : PlannerQuizController.java
 * &#64;Date : 2020. 4. 3.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 > 교육이수 관리
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PlannerQuizController {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "plannerQuizService")
    private PlannerQuizService plannerQuizService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : plannerQuizList
     * 2. ClassName  : PlannerQuizController.java
     * 3. Comment    : 관리자 > 레디플래너 > 교육이수 관리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerQuizList")
    public ModelAndView plannerQuizList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 목록 개수
        int totalCount = this.plannerQuizService.selectPlannerQuizListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.plannerQuizService.selectPlannerQuizList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("bo/planner/plannerQuizList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerQuizForm
     * 2. ClassName  : PlannerQuizController.java
     * 3. Comment    : 관리자 > 레디플래너 > 교육이수 관리 > 등록 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerQuizForm")
    public ModelAndView plannerQuizForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerQuizForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerQuizRegist
     * 2. ClassName  : PlannerQuizController.java
     * 3. Comment    : 관리자 > 레디플래너 > 교육이수 관리 > 등록 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerQuizRegist")
    public ModelAndView plannerQuizRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = this.plannerQuizService.insertPlannerQuiz((MultipartHttpServletRequest) request, commandMap);
        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/planner/plannerQuizList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerQuizEdit
     * 2. ClassName  : PlannerQuizController.java
     * 3. Comment    : 관리자 > 레디플래너 > 교육이수 관리 > 수정 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerQuizEdit")
    public ModelAndView plannerQuizEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공지사항 상세정보
        mv.addAllObjects(this.plannerQuizService.selectPlannerQuizInfo(commandMap));

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/planner/plannerQuizEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : plannerQuizModify
     * 2. ClassName  : PlannerQuizController.java
     * 3. Comment    : 관리자 > 레디플래너 > 교육이수 관리 > 수정 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "bo/planner/plannerQuizModify")
    public ModelAndView plannerQuizModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("RDP_EDU_IDX"), ""))) {
            // 수정
            int result = this.plannerQuizService.updatePlannerQuiz((MultipartHttpServletRequest) request, commandMap);
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", serverDomain + "/bo/planner/plannerQuizList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }

        return mv;
    }
}
