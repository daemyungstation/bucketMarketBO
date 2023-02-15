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
import web.bo.board.service.InquiryBoardService;
import web.bo.common.service.CommonService;

/**
 * @PackageName: web.bo.board.controller
 * @FileName : InquiryBoardController.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 고객센터 > 1:1 문의를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class InquiryBoardController {

    @Resource(name="inquiryBoardService")
    private InquiryBoardService inquiryBoardService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : inquiryBoardList
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 11.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/inquiryBoardList")
    public ModelAndView inquiryBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 문의 유형 리스트
        mv.addObject("codeList", this.commonService.selectCode("QUESTION_TYPE_CODE"));
        // 1:1 문의 목록 개수
        int totalCount = this.inquiryBoardService.selectInquiryBoardListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 1:1 문의 목록
            mv.addObject("list", this.inquiryBoardService.selectInquiryBoardList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/inquiryBoardList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : inquiryBoardForm
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 답변 등록/수정 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/inquiryBoardEditPopup")
    public ModelAndView inquiryBoardEditPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("info", this.inquiryBoardService.selectInquiryBoardInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/inquiryBoardEditPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : inquiryBoardModify
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 답변 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 7. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/inquiryBoardModify")
    public ModelAndView inquiryBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("MEM_ADV_IDX"), ""))) {
            int result = this.inquiryBoardService.updateInquiryBoard(commandMap);
            // view Page Info
            if (result > 0) {
                mv.addObject("closeMsg", "수정 되었습니다.");
            } else {
                mv.addObject("closeMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("parentReload", true);
            mv.addObject("returnUrl", serverDomain + "/bo/board/inquiryBoardList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
}
