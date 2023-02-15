package web.bo.display.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.util.StringUtil;
import common.viewer.JSON;
import web.bo.common.service.CommonService;
import web.bo.display.service.ProductDisplayService;

/**
 * @PackageName: web.bo.display.controller
 * @FileName : ProductDisplayController.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ProductDisplayController {

    @Resource(name="productDisplayService")
    private ProductDisplayService productDisplayService;

    @Resource(name="commonService")
    private CommonService commonService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : productDisplayView
     * 2. ClassName  : ProductDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/productDisplayView")
    public ModelAndView productDisplayView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("list", commonService.selectHierarchyCodeList("DISPLAY_PRODUCT_AREA_CODE"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/productDisplayView");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : productDisplayList
     * 2. ClassName  : ProductDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/productDisplayList")
    public ModelAndView productDisplayList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), ""))) {
            // 전시상품관리 목록
            mv.addObject("list", this.productDisplayService.selectProductDisplayList(commandMap));
            mv.addObject("commandMap", commandMap);
        }
        mv.setViewName("bo/display/productDisplayList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : productDisplayRegistAjax
     * 2. ClassName  : ProductDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/productDisplayRegistAjax")
    public JSON productDisplayRegistAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        // 전시상품관리 등록
        json.put("isSuccess", (productDisplayService.insertProductDisplay(commandMap) > 0));
        return json;
    }
}
