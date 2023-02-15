package web.bo.display.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import web.bo.display.service.CurationDisplayService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CurationDisplayController {
    
    @Resource(name="curationDisplayService")
    private CurationDisplayService curationDisplayService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : curationDisplayList
     * 2. ClassName  : CurationDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 큐레이션 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/curationDisplayList")
    public ModelAndView curationDisplayList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("list", curationDisplayService.selectCurationDisplayList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/curationDisplayList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : curationDisplayRegist
     * 2. ClassName  : CurationDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 큐레이션 관리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/curationDisplayRegist", method=RequestMethod.POST)
    public ModelAndView curationDisplayRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = curationDisplayService.insertCurationDisplay(commandMap);
        if (result > 0) {
            mv.addObject("alertMsg", "저장 되었습니다.");
        } else {
            mv.addObject("alertMsg", "저장에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/display/curationDisplayList.do");
        mv.setViewName("common/result");
        return mv;
    }
    /**
     * <pre>
     * 1. MethodName : curationDisplaySearchPopup
     * 2. ClassName  : CurationDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 큐레이션 관리 > 키워드 검색 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/curationDisplaySearchPopup")
    public ModelAndView curationDisplaySearchPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        int totalCount = curationDisplayService.selectCurationDisplayKeywordListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            mv.addObject("list", curationDisplayService.selectCurationDisplayKeywordList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/curationDisplaySearchPopup");
        return mv;
    }
    
}
