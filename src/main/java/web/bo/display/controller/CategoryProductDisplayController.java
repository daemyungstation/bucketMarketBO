package web.bo.display.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.viewer.JSON;
import web.bo.display.service.CategoryDisplayService;
import web.bo.display.service.CategoryProductDisplayService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CategoryProductDisplayController {

    @Resource(name="categoryDisplayService")
    private CategoryDisplayService categoryDisplayService;
    
    @Resource(name="categoryProductDisplayService")
    private CategoryProductDisplayService categoryProductDisplayService;
    
    /**
     * <pre>
     * 1. MethodName : categoryDisplayView
     * 2. ClassName  : CategoryDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 카테고리 상품진열관리 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryProductDisplayView")
    public ModelAndView categoryProductDisplayView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        commandMap.put("PRD_CTG_USE_YN", "Y");
        commandMap.put("PRD_CTG_DSP_YN", "Y");
        mv.addObject("list", categoryDisplayService.selectCategoryDisplayList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/categoryProductDisplayView");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryProductDisplayList
     * 2. ClassName  : CategoryProductDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 카테고리 상품진열관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryProductDisplayList")
    public ModelAndView categoryProductDisplayList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("list", categoryProductDisplayService.selectCategoryProductDisplayList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/categoryProductDisplayList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : categoryProductDisplayModifyAjax
     * 2. ClassName  : CategoryProductDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 카테고리 상품진열관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/categoryProductDisplayModifyAjax")
    public JSON categoryProductDisplayModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", (categoryProductDisplayService.updateCategoryProductDisplay(commandMap) > 0));
        return json;
    }
}
