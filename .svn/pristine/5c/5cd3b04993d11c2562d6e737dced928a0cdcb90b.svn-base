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
import common.viewer.JSON;
import web.bo.board.service.CommentBoardService;
import web.bo.common.service.CommonService;

/**
 * @PackageName: web.bo.board.controller
 * @FileName : CommentBoardController.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > 가입후기를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CommentBoardController {

    @Resource(name="commentBoardService")
    private CommentBoardService commentBoardService;

    @Resource(name="commonService")
    private CommonService commonService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : basicManagerList
     * 2. ClassName  : CommentBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/commentBoardList")
    public ModelAndView commentBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 상품 유형 코드 목록 조회
        mv.addObject("codeList", this.commonService.selectCode("PRODUCT_TYPE_CODE"));
        // 가입후기 목록 개수
        int totalCount = this.commentBoardService.selectCommentBoardListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 가입후기 목록
            mv.addObject("list", this.commentBoardService.selectCommentBoardList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/commentBoardList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : commentBoardEdit
     * 2. ClassName  : CommentBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/commentBoardEditPopup")
    public ModelAndView commentBoardEditPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""))) {
            mv.addObject("info", this.commentBoardService.selectCommentBoardInfo(commandMap));
            mv.addObject("commandMap", commandMap);
        }
        mv.setViewName("bo/board/commentBoardEditPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : commentBoardModify
     * 2. ClassName  : CommentBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/commentBoardModify")
    public ModelAndView commentBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        if (!"".equals(StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""))) {
            result = this.commentBoardService.updateCommentBoard(commandMap);
        }
        // view Page Info
        if (result > 0) {
            mv.addObject("closeMsg", "수정 되었습니다.");
        } else {
            mv.addObject("closeMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("parentReload", true);
        mv.addObject("returnUrl", serverDomain + "/bo/board/commentBoardList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : commentBoardModifyAjax
     * 2. ClassName  : CommentBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 > 베스트 여부 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/commentBoardModifyAjax")
    public JSON commentBoardModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("isSuccess", (this.commentBoardService.updateCommentBoard(commandMap) > 0));
        return json;
    }
}
