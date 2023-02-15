package web.bo.site.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import web.bo.common.service.CommonService;

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
public class BatchManagerController {
    
    @Resource(name = "commonService")
    private CommonService commonService;

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
    @RequestMapping(value = "/bo/site/batchManagerList")
    public ModelAndView batchManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("bo/site/batchManagerList");
        return mv;
    }

}
