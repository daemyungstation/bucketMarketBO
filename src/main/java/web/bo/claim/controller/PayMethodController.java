package web.bo.claim.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Paging;
import common.model.Manager.ROLE_MANAGER;
import common.util.DateUtil;
import common.viewer.EXCEL;
import common.viewer.JSON;
import web.bo.claim.service.PayMethodService;
import web.bo.common.service.CommonService;

/**
 * <pre>
 * @PackageName: web.bo.claim.controller
 * @FileName : PayMethodController.java
 * @Date : 2020. 4. 3.
 * @프로그램 설명 : 관리자 > 클레임 상담 조회 > 결제수단변경 신청
 * @author upleat
 * </pre>
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class PayMethodController {

    @Resource(name="payMethodService")
    private PayMethodService payMethodService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : payMethodList
     * 2. ClassName  : PayMethodController.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/claim/payMethodList")
    public ModelAndView payMethodList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("codeList", this.commonService.selectCode("CLAIM_STATUS_CODE"));
        int totalCount = this.payMethodService.selectPayMethodListCount(commandMap);
        mv.addObject("totalCount", totalCount); 
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            mv.addObject("list", this.payMethodService.selectPayMethodList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/claim/payMethodList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : payMethodExcelDownload
     * 2. ClassName  : PayMethodController.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 목록 > 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/claim/payMethodExcelDownload")
    public EXCEL payMethodExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.payMethodService.selectPayMethodList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_pay_method_" + DateUtil.getCurrentDateTime());
            String [] headerTitle = {"회원번호", "온라인상품명", "고객명", "연락처", "기간계상품코드", "잔여회차", "납입회차", "모델분류", "지원혜택", "모델명", "신청일", "진행상태"};
            String [] cellField = {"ACCNT_NO", "PRD_MST_NM", "MEM_NM", "CELL", "PROD_CD", "REMAINDER_CNT", "TRUE_CNT", "MODEL_CD", "PRD_MST_SPL_NM", "MODEL_NM", "CLM_ACT_REG_DT", "CMN_COM_NM"};
            String [] cellType = {"String", "String", "String", "String", "String", "String", "String", "String", "String", "String", "String", "String"};
            String [] colSize = {"50", "100", "50", "80", "50", "30", "30", "50", "50","50", "80", "50"};
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
     * 1. MethodName : payMethodEditPopup
     * 2. ClassName  : PayMethodController.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 수정 폼 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/claim/payMethodEditPopup")
    public ModelAndView payMethodEditPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("codeList", this.commonService.selectCode("CLAIM_STATUS_CODE"));
        mv.addAllObjects(this.payMethodService.selectPayMethodInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/claim/payMethodEditPopup");
        return mv;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : payMethodModifyAjax
     * 2. ClassName  : PayMethodController.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/claim/payMethodModifyAjax", method=RequestMethod.POST)
    public JSON payMethodModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", (this.payMethodService.updatePayMethod(commandMap) > 0));
        return json;
    }
}
