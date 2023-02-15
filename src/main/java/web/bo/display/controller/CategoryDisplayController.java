package web.bo.display.controller;

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
import web.bo.display.service.CategoryDisplayService;

/**
 * @PackageName: web.bo.display.controller
 * @FileName : CategoryDisplayController.java
 * @Date : 2014. 5. 29.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시카테고리관리를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CategoryDisplayController {

    @Resource(name="categoryDisplayService")
    private CategoryDisplayService categoryDisplayService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : categoryDisplayView
     * 2. ClassName  : CategoryDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryDisplayView")
    public ModelAndView categoryDisplayView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("list", categoryDisplayService.selectCategoryDisplayList(commandMap));
        commandMap.put("PRD_CTG_LEVEL", "0");
        mv.addObject("topList", categoryDisplayService.selectCategoryDisplayList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/categoryDisplayView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryDisplayFormPopup
     * 2. ClassName  : CategoryDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 등록 폼 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryDisplayFormPopup")
    public ModelAndView categoryDisplayFormPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/categoryDisplayFormPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryDisplayEdit
     * 2. ClassName  : CategoryDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 수정 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryDisplayEdit")
    public ModelAndView categoryDisplayEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(categoryDisplayService.selectCategoryDisplayInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/categoryDisplayEdit");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryDisplayRegist
     * 2. ClassName  : CategoryDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryDisplayRegist")
    public ModelAndView categoryDisplayRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = categoryDisplayService.insertCategoryDisplay(commandMap);
        if (result > 0) {
            mv.addObject("closeMsg", "등록 되었습니다.");
        } else {
            mv.addObject("closeMsg", "등록에 실패하였습니다.");
        }
        
        mv.addObject("parentReload", true);
        mv.addObject("returnUrl", serverDomain + "/bo/display/categoryDisplayView.do");
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryDisplayModify
     * 2. ClassName  : CategoryDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시카테고리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryDisplayModify")
    public ModelAndView categoryDisplayModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = categoryDisplayService.updateCategoryDisplay(commandMap);
        if (result > 0) {
            mv.addObject("alertMsg", "수정 되었습니다.");
        } else {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/display/categoryDisplayView.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
}
