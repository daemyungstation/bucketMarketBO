package web.bo.site.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.code.Code;
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import common.util.StringUtil;
import web.bo.common.service.CommonService;
import web.bo.site.service.TermManagerService;

/**
 * @PackageName: web.bo.board.controller
 * @FileName : TermManagerController.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 이용약관 관리를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class TermManagerController {

    @Resource(name="termManagerService")
    private TermManagerService termManagerService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : termManagerList
     * 2. ClassName  : TermManagerController.java
     * 3. Comment    : 이용약관 리시트
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/termManagerList")
    public ModelAndView termManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        int CMN_COM_IDX = StringUtil.getInt(commandMap, "CMN_COM_IDX", Code.TERM_USER_AGREEMENT_CODE);

        List<String> codeList = new ArrayList<>();
        codeList.add("TERM_CODE");
        if (CMN_COM_IDX == Code.TERM_PERSONAL_INFORMATION_CODE) {
            codeList.add("TERM_PERSONAL_INFORMATION_CODE");
        } else if (CMN_COM_IDX == Code.TERM_CONTRACT_CODE) {
            codeList.add("TERM_CONTRACT_CODE");
        } else if (CMN_COM_IDX == Code.TERM_READY_PLANNER_CODE) {
            codeList.add("TERM_READY_PLANNER_CODE");
        }
        // 이용약관 유형, 구분 리스트
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
        int totalCount = this.termManagerService.selectTermManagerListCount(commandMap);
        // 페이징
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 이용약관 리스트
            mv.addObject("list", this.termManagerService.selectTermManagerList(commandMap));
        }
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/site/termManagerList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : termManagerForm
     * 2. ClassName  : TermManagerController.java
     * 3. Comment    : 이용약관 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/termManagerForm")
    public ModelAndView termManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        String[] codes = { "TERM_CODE", "TERM_PERSONAL_INFORMATION_CODE", "TERM_CONTRACT_CODE", "TERM_READY_PLANNER_CODE" };
        // 이용약관 유형, 구분 리스트
        mv.addObject("codes", this.commonService.selectCodes(codes));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/site/termManagerForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : termManagerEdit
     * 2. ClassName  : TermManagerController.java
     * 3. Comment    : 이용약관 수정 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/termManagerEdit")
    public ModelAndView termManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        String[] codes = { "TERM_CODE", "TERM_PERSONAL_INFORMATION_CODE", "TERM_CONTRACT_CODE", "TERM_READY_PLANNER_CODE" };
        // 이용약관 유형, 구분 리스트
        mv.addObject("codes", this.commonService.selectCodes(codes));
        // 이용약관 정보
        mv.addObject("info", this.termManagerService.selectTermManagerInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/site/termManagerEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : termManagerRegist
     * 2. ClassName  : TermManagerController.java
     * 3. Comment    : 이용약관 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/termManagerRegist")
    public ModelAndView termManagerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 이용약관 등록
        if (this.termManagerService.insertTermManager(commandMap) > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        int CMN_COM_IDX = StringUtil.getInt(commandMap, "CMN_COM_IDX", Code.TERM_USER_AGREEMENT_CODE);
        commandMap.clear();
        commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/site/termManagerList.do");
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : termManagerModify
     * 2. ClassName  : TermManagerController.java
     * 3. Comment    : 이용약관 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/termManagerModify")
    public ModelAndView termManagerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (this.termManagerService.updateTermManager(commandMap) > 0) {
            mv.addObject("alertMsg", "수정 되었습니다.");
        } else {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/site/termManagerList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
}