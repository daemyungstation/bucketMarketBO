package web.bo.main.controller;

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
import web.bo.main.service.DashboardMainService;

/**
 * @PackageName: web.bo.main.controller
 * @FileName : DashboardMainController.java
 * @Date : 2020. 7. 13.
 * @프로그램 설명 : 관리자 메인을 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class DashboardMainController {

    @Resource(name="dashboardMainService")
    private DashboardMainService dashboardMainService;

    /**
     * <pre>
     * 1. MethodName : dashboardMain
     * 2. ClassName  : DashboardMainController.java
     * 3. Comment    : 관리자 메인 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 13.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/main/dashboardMain")
    public ModelAndView dashboardMain(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(this.dashboardMainService.selectDashboardMainInfo(commandMap));
        mv.addObject("todayStr", DateUtil.getToday("."));
        mv.addObject("weekStr", DateUtil.getWeek());
        mv.setViewName("bo/main/dashboardMain");
        return mv;
    }
}
