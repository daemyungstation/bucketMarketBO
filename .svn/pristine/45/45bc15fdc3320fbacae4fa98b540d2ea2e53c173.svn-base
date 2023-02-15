package web.bo.site.controller;

import java.util.List;
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
import common.session.SessionsManager;
import common.util.StringUtil;
import common.viewer.JSON;
import web.bo.common.service.CommonService;
import web.bo.site.service.AuthManagerService;
import web.bo.site.service.BasicManagerService;

/**
 * @PackageName: web.bo.site.controller
 * @FileName : BasicManagerController.java
 * @Date : 2014. 4. 2.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 관리자 관리를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class BasicManagerController {

    @Resource(name="basicManagerService")
    private BasicManagerService basicManagerService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Resource(name="authManagerService")
    private AuthManagerService authManagerService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : basicManagerList
     * 2. ClassName  : BasicManager.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/basicManagerList")
    public ModelAndView basicManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 권한 리스트
        commandMap.put("searchAutMstState", "Y");
        mv.addObject("authList", this.authManagerService.selectAuthManagerList(commandMap));

        // 관리자 관리 목록 개수
        int totalCount = this.basicManagerService.selectBasicManagerListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        List<Map<String, Object>> list = null;
        if (totalCount > 0) {

            // 관리자 관리 목록
            list = this.basicManagerService.selectBasicManagerList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.setViewName("bo/site/basicManagerList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : basicManagerForm
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 등록 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/basicManagerForm")
    public ModelAndView basicManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // Common Codes
        String[] codes = { "HP_CODE", "TEL_CODE", "EMAIL_DOMAIN_CODE" };
        mv.addObject("codes", this.commonService.selectCodes(codes));

        // 권한 리스트
        commandMap.put("searchAutMstState", "Y");
        mv.addObject("authList", this.authManagerService.selectAuthManagerList(commandMap));

        // 입점업체 리스트
        commandMap.put("searchVdrMstUseYn", "Y");
        mv.addObject("vendorList", this.commonService.selectCommonVendorList(commandMap));

        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/site/basicManagerForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : basicManagerIdCheckAjax
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 아이디 중복 체크   
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/basicManagerIdCheckAjax")
    public JSON basicManagerIdCheckAjax(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        if (!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), ""))) {
            // 아이디 중복 체크
            int idCount = this.basicManagerService.selectBasicManagerIdCheckCount(commandMap);

            if (idCount > 0) {
                json.put("resultYn", "N");
            } else {
                json.put("resultYn", "Y");
            }
            json.put("successYn", "Y");
        } else {
            json.put("successYn", "N");
        }

        return json;
    }

    /**
     * <pre>
     * 1. MethodName : basicManagerRegist
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/basicManagerRegist", method=RequestMethod.POST)
    public ModelAndView basicManagerRegist(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), ""))) {
            // 관리자 관리 관리자 등록
            int result = this.basicManagerService.insertBasicManager(request, commandMap);

            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", serverDomain + "/bo/site/basicManagerList.do");

            } else {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", serverDomain + "/bo/site/basicManagerList.do");
            }
            mv.setViewName("common/result");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : basicManagerEdit
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 수정 폼  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/basicManagerEdit")
    public ModelAndView basicManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (SessionsManager.isScm(request)) {
            commandMap.put("ADM_MST_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        }
        if (!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), ""))) {
            // Common Codes
            String[] codes = { "HP_CODE", "TEL_CODE", "EMAIL_DOMAIN_CODE" };
            mv.addObject("codes", this.commonService.selectCodes(codes));

            // 권한 리스트
            commandMap.put("searchAutMstState", "Y");
            mv.addObject("authList", this.authManagerService.selectAuthManagerList(commandMap));

            // 입점업체 리스트
            commandMap.put("searchVdrMstUseYn", "Y");
            mv.addObject("vendorList", this.commonService.selectCommonVendorList(commandMap));

            // 관리자 상세 정보
            mv.addObject("info", this.basicManagerService.selectBasicManagerInfo(commandMap));
        }

        mv.addObject("commandMap", commandMap);
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : basicManagerModify
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/basicManagerModify", method=RequestMethod.POST)
    public ModelAndView basicManagerModify(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), ""))) {
            // 관리자 관리 관리자 수정
            int result = this.basicManagerService.updateBasicManager(request, commandMap);

            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", serverDomain + "/bo/site/basicManagerEdit.do");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", serverDomain + "/bo/site/basicManagerEdit.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }
}
