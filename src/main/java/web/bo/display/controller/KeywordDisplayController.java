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
import web.bo.display.service.KeywordDisplayService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class KeywordDisplayController {

    @Resource(name="keywordDisplayService")
    private KeywordDisplayService keywordDisplayService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : keywordDisplayList
     * 2. ClassName  : KeywordDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 인기키워드 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/keywordDisplayList")
    public ModelAndView keywordDisplayList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("list", keywordDisplayService.selectKeywordDisplayList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/display/keywordDisplayList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : keywordDisplayProc
     * 2. ClassName  : KeywordDisplayController.java
     * 3. Comment    : 관리자 > 전시관리 > 인기키워드 관리 > 등록/수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/display/keywordDisplayProc")
    public ModelAndView keywordDisplayProc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        int result = keywordDisplayService.mergeKeywordDisplay(commandMap);
        if (result > 0) {
            mv.addObject("alertMsg", "저장 되었습니다.");
        } else {
            mv.addObject("alertMsg", "저장에 실패하였습니다.");
        }
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/display/keywordDisplayList.do");
        mv.setViewName("common/result");
        return mv;
    }
}
