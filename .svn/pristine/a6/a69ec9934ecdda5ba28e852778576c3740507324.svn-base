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
import common.viewer.JSON;
import web.bo.site.service.CommonCodeManagerService;

/**
 * @PackageName: web.bo.site.controller
 * @FileName : CommonCodeManagerController.java
 * @Date : 2014. 4. 2.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 공통코드를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CommonCodeManagerController {

    @Resource(name="commonCodeManagerService")
    private CommonCodeManagerService commonCodeManagerService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : commonCodeManagerList
     * 2. ClassName  : CommonCodeManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/commonCodeManagerList")
    public ModelAndView commonCodeManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공통코드 개수
        commandMap.put("CMN_COM_LEVEL", "0");
        int totalCount = this.commonCodeManagerService.selectCommonCodeManagerListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        List<Map<String, Object>> list = null;
        if (totalCount > 0) {

            // 공통코드 목록
            list = this.commonCodeManagerService.selectCommonCodeManagerList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.setViewName("bo/site/commonCodeManagerList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : commonCodeManagerForm
     * 2. ClassName  : CommonCodeManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 등록 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/commonCodeManagerForm")
    public ModelAndView commonCodeManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), ""))) {
            // 공통코드 상세 정보
            mv.addObject("info", this.commonCodeManagerService.selectCommonCodeManagerInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/site/commonCodeManagerForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : commonCodeManagerRegist
     * 2. ClassName  : CommonCodeManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/commonCodeManagerRegist")
    public ModelAndView commonCodeManagerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공통코드 등록
        int result = this.commonCodeManagerService.insertCommonCodeManager(request, commandMap);

        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");

            // 최상위로 취가된 것이 아니면 상위코드의 수정화면으로 이동함.
            if (!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), ""))) {
                mv.addObject("returnUrl", serverDomain + "/bo/site/commonCodeManagerEdit.do");
                mv.addObject("commandMap", commandMap);
            } else
                mv.addObject("returnUrl", serverDomain + "/bo/site/commonCodeManagerList.do");

        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", serverDomain + "/bo/site/commonCodeManagerList.do");
        }

        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : commonCodeManagerEdit
     * 2. ClassName  : CommonCodeManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 수정 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/commonCodeManagerEdit")
    public ModelAndView commonCodeManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), ""))) {
            // 공통코드 관리 상세정보
            Map<String, Object> info = this.commonCodeManagerService.selectCommonCodeManagerInfo(commandMap);
            mv.addObject("info", info);
            if (!"".equals(StringUtil.getString(info, "CMN_COM_IDX", ""))) {
                commandMap.put("CMN_COM_UP_IDX", StringUtil.getString(info, "CMN_COM_IDX", ""));
                commandMap.put("searchYn", "N");
                // 하위 코드 리스트
                mv.addObject("list", this.commonCodeManagerService.selectCommonCodeManagerList(commandMap));
            }
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/site/commonCodeManagerEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : commonCodeManagerModify
     * 2. ClassName  : CommonCodeManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/commonCodeManagerModify")
    public ModelAndView commonCodeManagerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("CMN_COM_IDX"), ""))) {
            // 공통코드 수정
            int result = this.commonCodeManagerService.updateCommonCodeManager(request, commandMap);

            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");

                if ("0".equals(StringUtil.getString(commandMap.get("CMN_COM_LEVEL"), "0"))) {
                    mv.addObject("returnUrl", serverDomain + "/bo/site/commonCodeManagerList.do");
                } else {
                    commandMap.put("CMN_COM_IDX", StringUtil.getString(commandMap.get("CMN_COM_UP_IDX")));
                    mv.addObject("returnUrl", serverDomain + "/bo/site/commonCodeManagerEdit.do");
                }

            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");

                if ("0".equals(StringUtil.getString(commandMap.get("CMN_COM_LEVEL"), "0"))) {
                    mv.addObject("returnUrl", serverDomain + "/bo/site/commonCodeManagerList.do");
                } else {
                    commandMap.put("CMN_COM_IDX", StringUtil.getString(commandMap.get("CMN_COM_UP_IDX")));
                    mv.addObject("returnUrl", serverDomain + "/bo/site/commonCodeManagerEdit.do");
                }
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : commonCodeManagerSortArrayAjax
     * 2. ClassName  : CommonCodeManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 관리 순서 변경 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/site/commonCodeManagerSortArrayAjax")
    public JSON commonCodeManagerSortArrayAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        int result = 0;

        if (commandMap.get("CMN_COM_IDX[]") != null && commandMap.get("CMN_COM_SORT[]") != null) {
            result = this.commonCodeManagerService.updateCommonCodeManagerSortArray(request, commandMap);
        } else {
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        if (result > 0) {
            json.put("message", "저장에 성공하였습니다.");
        } else {
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        return json;
    }
}
