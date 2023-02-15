package web.bo.board.controller;

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
import common.util.StringUtil;
import web.bo.board.service.ContactUsBoardService;

/**
 * @PackageName: web.bo.board.controller
 * @FileName : ContactUsBoardController.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > 제휴문의를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ContactUsBoardController {

    @Resource(name="contactUsBoardService")
    private ContactUsBoardService contactUsBoardService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : basicManagerList
     * 2. ClassName  : ContactUsBoardController.java
     * 3. ContactUs    : 관리자 > 고객센터 > 제휴문의 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/contactUsBoardList")
    public ModelAndView contactUsBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 제휴문의 목록 개수
        int totalCount = this.contactUsBoardService.selectContactUsBoardListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 제휴문의 목록
            mv.addObject("list", this.contactUsBoardService.selectContactUsBoardList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/contactUsBoardList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : contactUsBoardEdit
     * 2. ClassName  : ContactUsBoardController.java
     * 3. ContactUs    : 관리자 > 고객센터 > 제휴문의 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/contactUsBoardEditPopup")
    public ModelAndView contactUsBoardEditPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("CTT_US_IDX"), ""))) {
            mv.addObject("info", this.contactUsBoardService.selectContactUsBoardInfo(commandMap));
            mv.addObject("commandMap", commandMap);
        }
        mv.setViewName("bo/board/contactUsBoardEditPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : contactUsBoardModify
     * 2. ClassName  : ContactUsBoardController.java
     * 3. ContactUs    : 관리자 > 고객센터 > 제휴문의 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/contactUsBoardModify")
    public ModelAndView contactUsBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        if (!"".equals(StringUtil.getString(commandMap.get("CTT_US_IDX"), ""))) {
            result = this.contactUsBoardService.updateContactUsBoard(commandMap);
        }
        // view Page Info
        if (result > 0) {
            mv.addObject("closeMsg", "수정 되었습니다.");
        } else {
            mv.addObject("closeMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("parentReload", true);
        mv.addObject("returnUrl", serverDomain + "/bo/board/contactUsBoardList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
    
}
