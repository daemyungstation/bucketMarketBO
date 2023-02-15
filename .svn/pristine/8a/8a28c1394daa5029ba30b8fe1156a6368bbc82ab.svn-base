package web.bo.display.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import web.bo.display.service.PopupDisplayService;

/**
 * @PackageName: web.bo.display.controller
 * @FileName : PopupDisplayController.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 팝업관리를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PopupDisplayController {

    @Resource(name="popupDisplayService")
    private PopupDisplayService popupDisplayService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : popupDisplayList
     * 2. ClassName  : PopupDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/popupDisplayList")
    public ModelAndView popupDisplayList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int totalCount = popupDisplayService.selectPopupDisplayCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));

        if (totalCount > 0) {
            mv.addObject("list", popupDisplayService.selectPopupDisplayList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/popupDisplayList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popupDisplayFormPopup
     * 2. ClassName  : PopupDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 등록 폼 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/popupDisplayFormPopup")
    public ModelAndView popupDisplayFormPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/popupDisplayFormPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popupDisplayEditPopup
     * 2. ClassName  : PopupDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 수정 폼 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/popupDisplayEditPopup")
    public ModelAndView popupDisplayEditPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(popupDisplayService.selectPopupDisplayInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/popupDisplayEditPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popupDisplayRegist
     * 2. ClassName  : PopupDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/popupDisplayRegist", method=RequestMethod.POST)
    public ModelAndView popupDisplayRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = popupDisplayService.insertPopupDisplay((MultipartHttpServletRequest) request, commandMap);
        if (result > 0) {
            mv.addObject("closeMsg", "등록 되었습니다.");
        } else {
            mv.addObject("closeMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("parentReload", true);
        mv.addObject("returnUrl", serverDomain + "/bo/display/popupDisplayList.do");
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : popupDisplayModify
     * 2. ClassName  : PopupDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/popupDisplayModify", method=RequestMethod.POST)
    public ModelAndView popupDisplayModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = popupDisplayService.updatePopupDisplay((MultipartHttpServletRequest) request, commandMap);
        if (result > 0) {
            mv.addObject("closeMsg", "수정 되었습니다.");
        } else {
            mv.addObject("closeMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("parentReload", true);
        mv.addObject("returnUrl", serverDomain + "/bo/display/popupDisplayList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
}
