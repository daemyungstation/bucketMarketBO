package web.bo.board.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import common.util.StringUtil;
import common.viewer.JSON;
import web.bo.board.service.NoticeBoardService;
import web.bo.common.service.CommonService;

/**
 * @PackageName: web.bo.board.controller
 * @FileName : NoticeBoardController.java
 * @Date : 2014. 6. 7.
 * @프로그램 설명 : 관리자 > 고객센터 > 공지사항을 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class NoticeBoardController {

    @Resource(name="noticeBoardService")
    private NoticeBoardService noticeBoardService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    private static final int TOP_NOTICE_COUNT = 5;
    /**
     * <pre>
     * 1. MethodName : noticeBoardList
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 공지사항 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/noticeBoardList")
    public ModelAndView noticeBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공지사항 유형 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("NOTICE_TYPE_CODE"));

        // 상단공지 리스트 먼저 가져오기
        commandMap.put("BRD_NTS_TOP_YN", "Y");
        commandMap.put("startNum", 1);
        commandMap.put("endNum", TOP_NOTICE_COUNT);
        mv.addObject("topList", this.noticeBoardService.selectNoticeBoardList(commandMap));

        // 공지사항 목록 개수
        commandMap.put("BRD_NTS_TOP_YN", "");
        int totalCount = this.noticeBoardService.selectNoticeBoardListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 공지사항 목록
            mv.addObject("list", this.noticeBoardService.selectNoticeBoardList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/noticeBoardList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : noticeBoardForm
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 설명추가부분관리자 > 고객센터 > 공지사항 등록 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/noticeBoardForm")
    public ModelAndView noticeBoardForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("NOTICE_TYPE_CODE"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/noticeBoardForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : noticeBoardEdit
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 설명추가부분관리자 > 고객센터 > 공지사항 수정 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/noticeBoardEdit")
    public ModelAndView noticeBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("BRD_NTS_IDX"), ""))) {
            // 공지사항 상세정보
            mv.addAllObjects(this.noticeBoardService.selectNoticeBoardInfo(commandMap));
        }
        // 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("NOTICE_TYPE_CODE"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/noticeBoardEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : noticeBoardRegist
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 설명추가부분관리자 > 고객센터 > 공지사항 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/noticeBoardRegist")
    public ModelAndView noticeBoardRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 공지사항 등록
        int result = this.noticeBoardService.insertNoticeBoard((MultipartHttpServletRequest) request, commandMap);
        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/board/noticeBoardList.do");
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : noticeBoardModify
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 설명추가부분관리자 > 고객센터 > 공지사항 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/noticeBoardModify")
    public ModelAndView noticeBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("BRD_NTS_IDX"), ""))) {
            // 공지사항 수정
            int result = this.noticeBoardService.updateNoticeBoard((MultipartHttpServletRequest) request, commandMap);
            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", serverDomain + "/bo/board/noticeBoardList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : noticeBoardTopCountAjax
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 상단공지 사용 가능 유무
     * 4. 작성자       : upleat
     * 5. 작성일       : 2015. 3. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/noticeBoardTopCountAjax")
    public JSON noticeBoardTopCountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        int result = this.noticeBoardService.selectNoticeBoardTopCount(commandMap);
        if (result > TOP_NOTICE_COUNT) {
            json.put("resultYn", "N");
        } else if (result == TOP_NOTICE_COUNT) {
            json.put("resultYn", "F"); // FULL
        } else {
            json.put("resultYn", "Y");
        }
        return json;
    }

}
