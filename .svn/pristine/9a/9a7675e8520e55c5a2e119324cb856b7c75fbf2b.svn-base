package web.bo.site.controller;

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
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import common.util.StringUtil;
import web.bo.common.service.CommonService;
import web.bo.site.service.AuthManagerService;
import web.bo.site.service.MenuManagerService;

/**
 * <pre>
 * &#64;PackageName: web.bo.site.controller
 * &#64;FileName : AuthManagerController.java
 * &#64;Date : 2014. 3. 25.
 * &#64;프로그램 설명 : 관리자 > 사이트 관리 > 권한관리 처리하는 Controller Class
 * &#64;author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class AuthManagerController {

    @Resource(name="authManagerService")
    private AuthManagerService authManagerService;

    @Resource(name="menuManagerService")
    private MenuManagerService menuManagerService;

    @Resource(name="commonService")
    private CommonService commonService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : basicManagerList
     * 2. ClassName  : AuthManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/authManagerList")
    public ModelAndView authManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 권한관리 목록 개수
        int totalCount = this.authManagerService.selectAuthManagerListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        List<Map<String, Object>> list = null;
        if (totalCount > 0) {

            // 권한관리 목록
            list = this.authManagerService.selectAuthManagerList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.setViewName("bo/site/authManagerList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : basicManagerForm
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 등록 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/authManagerForm")
    public ModelAndView authManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 관리자 메뉴 리스트
        commandMap.put("searchAdmMnuOnYN", "Y");
        mv.addObject("menuList", this.menuManagerService.selectmenuManagerList(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/site/authManagerForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : authManagerRegist
     * 2. ClassName  : AuthManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 31.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/authManagerRegist")
    public ModelAndView authManagerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        int result = this.authManagerService.insertAuthManager(request, commandMap);

        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", serverDomain + "/bo/site/authManagerList.do");

        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", serverDomain + "/bo/site/authManagerList.do");
        }
        mv.setViewName("common/result");

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : authManagerEdit
     * 2. ClassName  : AuthManagerController.java
     * 3. Comment    :  관리자 > 사이트 관리 > 권한관리 수정 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 31.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/authManagerEdit")
    public ModelAndView authManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("AUT_MST_IDX"), ""))) {
            // 관리자 메뉴 리스트
            commandMap.put("ADM_AUT_MST_IDX", StringUtil.getString(commandMap.get("AUT_MST_IDX"), ""));
            commandMap.put("searchAdmMnuOnYN", "Y");
            mv.addObject("menuList", this.menuManagerService.selectmenuManagerList(commandMap));
            commandMap.remove("ADM_AUT_MST_IDX");

            // 권한관리 상세 정보
            mv.addObject("row", this.authManagerService.selectAuthManagerInfo(commandMap));
            mv.addObject("commandMap", commandMap);

        }
        mv.setViewName("bo/site/authManagerEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : authmanagerModify
     * 2. ClassName  : AuthManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 31.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/authManagerModify")
    public ModelAndView authmanagerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("AUT_MST_IDX"), ""))) {
            int result = this.authManagerService.updateAuthManager(request, commandMap);

            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", serverDomain + "/bo/site/authManagerList.do");

            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", serverDomain + "/bo/site/authManagerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }
}
