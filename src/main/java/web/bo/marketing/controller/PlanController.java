package web.bo.marketing.controller;

import java.util.HashMap;
import java.util.List;
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
import common.util.DateUtil;
import common.util.StringUtil;
import common.viewer.EXCEL;
import common.viewer.JSON;
import web.bo.common.service.CommonService;
import web.bo.marketing.service.PlanService;

/**
 * @PackageName: web.bo.marketing.controller
 * @FileName : PlanController.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 기획전관리를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PlanController {

    @Resource(name="planService")
    private PlanService planService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : planList
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planList")
    public ModelAndView planList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 기획전관리 목록 개수
        int totalCount = planService.selectPlanListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 공지사항 목록
            mv.addObject("list", planService.selectPlanList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/marketing/planList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : planForm
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planForm")
    public ModelAndView planForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("codeList", commonService.selectCode("PROMOTION_PRODUCT_COL"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/marketing/planForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : planEdit
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 수정 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planEdit")
    public ModelAndView planEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("codeList", commonService.selectCode("PROMOTION_PRODUCT_COL"));
        mv.addAllObjects(planService.selectPlanInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/marketing/planEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : planRegist
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planRegist")
    public ModelAndView planRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 기획전관리 관리자 등록
        int result = this.planService.insertPlan((MultipartHttpServletRequest) request, commandMap);
        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/marketing/planList.do");
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : planModify
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planModify")
    public ModelAndView planModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("PLN_MST_IDX"), ""))) {
            int result = this.planService.updatePlan((MultipartHttpServletRequest) request, commandMap);
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", serverDomain + "/bo/marketing/planList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : planReplyList
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 수정 폼 > 기획전 댓글> 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planReplyList")
    public ModelAndView planReplyList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> param = new HashMap<>();
        param.put("PLN_MST_IDX", StringUtil.getString(commandMap, "PLN_MST_IDX", ""));
        param.put("cPage", StringUtil.getString(commandMap, "replyCPage", ""));
        param.put("pageSize", StringUtil.getString(commandMap, "replyPageSize", ""));
        param.put("searchPlnRplCts", StringUtil.getString(commandMap, "searchPlnRplCts", ""));
        param.put("searchPlnRplUseYn", StringUtil.getString(commandMap, "searchPlnRplUseYn", ""));
        param.put("searchPlnRplRegStDt", StringUtil.getString(commandMap, "searchPlnRplRegStDt", ""));
        param.put("searchPlnRplRegEtDt", StringUtil.getString(commandMap, "searchPlnRplRegEtDt", ""));
        
        int totalCount = planService.selectPlanReplyListCount(param);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, param));
        if (totalCount > 0) {
            // 기획전 댓글 목록
            mv.addObject("list", planService.selectPlanReplyList(param));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/marketing/planReplyList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : planReplyExcelDownload
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 수정 폼 > 기획전 댓글> 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planReplyExcelDownload")
    public EXCEL planReplyExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.planService.selectPlanReplyList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_plan_reply_" + DateUtil.getCurrentDateTime());
            String [] headerTitle = {"이름", "연락처", "댓글내용", "작성일", "마케팅수신동의", "노출"};
            String [] cellField = {"PLN_RPL_NM", "PLN_RPL_HP","PLN_RPL_CTS", "PLN_RPL_REG_DT", "PLN_RPL_MKT_YN","PLN_RPL_USE_YN"};
            String [] cellType = {"String", "String", "String", "String", "String", "String"};
            String [] colSize = {"50", "80", "150", "80", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
            excel.put("list", list);
        }
        return excel;
    }    
    
    /**
     * <pre>
     * 1. MethodName : planReplyModifyAjax
     * 2. ClassName  : PlanController.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 수정 폼 > 기획전 댓글> 노출수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/marketing/planReplyModifyAjax")
    public JSON planReplyModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", (planService.updatePlanReplyModify(commandMap) > 0));
        return json;
    }
}
