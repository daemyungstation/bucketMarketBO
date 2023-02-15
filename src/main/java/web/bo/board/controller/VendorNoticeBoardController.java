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
import common.session.SessionsManager;
import common.util.StringUtil;
import common.viewer.JSON;
import web.bo.board.service.VendorNoticeBoardService;
import web.bo.common.service.CommonService;

/**
 * @PackageName: web.bo.board.controller
 * @FileName : VendorNoticeBoardController.java
 * @Date : 2014. 6. 7.
 * @프로그램 설명 : 관리자 > 고객센터 > 제휴업체 공지사항을 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class VendorNoticeBoardController {

    @Resource(name="vendorNoticeBoardService")
    private VendorNoticeBoardService vendorNoticeBoardService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    private static final int TOP_NOTICE_COUNT = 5;
    /**
     * <pre>
     * 1. MethodName : vendorNoticeBoardList
     * 2. ClassName  : VendorNoticeBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/vendorNoticeBoardList")
    public ModelAndView vendorNoticeBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (SessionsManager.isScm(request)) {
            commandMap.put("searchVdrMstIdx", SessionsManager.getSessionValue("ADM_MST_SUB_IDX"));
            commandMap.put("searchScmNtsUseYn", "Y");
        }
        
        // 입점사 목록
        mv.addObject("vendorList", commonService.selectCommonVendorList(commandMap));

        // 상단공지 리스트 먼저 가져오기
        commandMap.put("SCM_NTS_TOP_YN", "Y");
        commandMap.put("startNum", 1);
        commandMap.put("endNum", TOP_NOTICE_COUNT);
        mv.addObject("topList", this.vendorNoticeBoardService.selectVendorNoticeBoardList(commandMap));

        // 제휴업체 공지사항 목록 개수
        commandMap.put("SCM_NTS_TOP_YN", "");
        int totalCount = this.vendorNoticeBoardService.selectVendorNoticeBoardListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 제휴업체 공지사항 목록
            mv.addObject("list", this.vendorNoticeBoardService.selectVendorNoticeBoardList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/vendorNoticeBoardList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : vendorNoticeBoardForm
     * 2. ClassName  : VendorNoticeBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 등록 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/vendorNoticeBoardForm")
    public ModelAndView vendorNoticeBoardForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 구분 코드 리스트
        mv.addObject("vendorList", commonService.selectCommonVendorList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/vendorNoticeBoardForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : vendorNoticeBoardEdit
     * 2. ClassName  : VendorNoticeBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 수정 폼/상세 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value={"/bo/board/vendorNoticeBoardEdit", "/bo/board/vendorNoticeBoardView"})
    public ModelAndView vendorNoticeBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("SCM_NTS_IDX"), ""))) {
            // 제휴업체 공지사항 상세정보
            mv.addAllObjects(this.vendorNoticeBoardService.selectVendorNoticeBoardInfo(commandMap));
        }
        // 구분 코드 리스트
        mv.addObject("vendorList", commonService.selectCommonVendorList(commandMap));
        mv.addObject("commandMap", commandMap);
        if (SessionsManager.isScm(request)) {
            mv.setViewName("bo/board/vendorNoticeBoardView");
            this.vendorNoticeBoardService.updateVendorNoticeReadCount(commandMap);
        } else {
            mv.setViewName("bo/board/vendorNoticeBoardEdit");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : vendorNoticeBoardRegist
     * 2. ClassName  : VendorNoticeBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/vendorNoticeBoardRegist")
    public ModelAndView vendorNoticeBoardRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 제휴업체 공지사항 등록
        int result = this.vendorNoticeBoardService.insertVendorNoticeBoard((MultipartHttpServletRequest) request, commandMap);
        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/board/vendorNoticeBoardList.do");
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : vendorNoticeBoardModify
     * 2. ClassName  : VendorNoticeBoardController.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/vendorNoticeBoardModify")
    public ModelAndView vendorNoticeBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("SCM_NTS_IDX"), ""))) {
            // 제휴업체 공지사항 수정
            int result = this.vendorNoticeBoardService.updateVendorNoticeBoard((MultipartHttpServletRequest) request, commandMap);
            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", serverDomain + "/bo/board/vendorNoticeBoardList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : vendorNoticeBoardTopCountAjax
     * 2. ClassName  : VendorNoticeBoardController.java
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
    @RequestMapping(value="/bo/board/vendorNoticeBoardTopCountAjax")
    public JSON vendorNoticeBoardTopCountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        int result = this.vendorNoticeBoardService.selectVendorNoticeBoardTopCount(commandMap);
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
