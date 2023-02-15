package web.bo.support.controller;

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
import common.session.SessionsManager;
import common.util.DateUtil;
import common.util.StringUtil;
import common.viewer.EXCEL;
import common.viewer.JSON;
import common.model.Paging;
import web.bo.common.service.CommonService;
import web.bo.support.service.SupportService;

/**
 * @PackageName: web.bo.support.controller
 * @FileName : SupportController.java
 * @Date : 2020. 05. 25
 * @프로그램 설명 : 관리자 > 가입결제 조회 > 가입 접수를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class SupportController {

    @Resource(name="supportService")
    private SupportService supportService;
    
    @Resource(name="commonService")
    private CommonService commonService;    
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : supportRentalList
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 렙탈접수 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/support/supportRentalList")
    public ModelAndView supportRentalList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 제휴사 승인결과 코드 조회
        mv.addObject("codeList", commonService.selectCode("SCM_RENTAL"));
        // 제휴사 조회
        if (!SessionsManager.isScm()) {
            commandMap.put("searchListAll", "Y");
            mv.addObject("vendorList", this.commonService.selectCommonVendorList(commandMap));
        } else {
            commandMap.put("searchVdrMstIdx", SessionsManager.getSessionValue("ADM_MST_SUB_IDX"));
        }
        int totalCount = supportService.selectRentalSupportCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 접수 목록
            mv.addObject("list", supportService.selectRentalSupportList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/support/supportRentalList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportRentalExcelDownload
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 렙탈접수 조회 > 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */    
    @RequestMapping(value="/bo/support/supportRentalExcelDownload")
    public EXCEL supportRentalExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.supportService.selectRentalSupportList(commandMap);

        if (list != null) {
            excel.put("fileName", "daemyung_rental_" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"NO",     "접수일",            "고객명",   "연락처",     "제휴업체",       "모델분류",       "지원혜택",         "제품타입",          "모델명",     "제휴사 승인결과",          "설치주소",      "상세주소"};
            String [] cellField =   {"RNUM",   "ORD_MST_REG_DT",  "MEM_NM", "CELL",    "VDR_MST_NM",  "MODEL_CL_NM", "PRD_MST_SPL_NM","PRD_OPT_IDX_NM", "MODEL_NM", "ORD_MST_VDR_APV_NM", "INSPL_ADDR", "INSPL_ADDR2"};
            String [] cellType =    {"Number", "String",          "String", "String",  "String",      "String",      "String",        "String",         "String",   "String",             "String",     "String" };
            String [] colSize =     {"50",     "50",              "50",     "50",      "50",          "150",         "50",            "50",             "50",       "50",                 "50",         "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportRentalOptionModifyAjax
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 제품타입 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */      
    @RequestMapping(value={"/bo/support/supportRentalOptionModifyAjax", "/bo/support/supportDeliveryOptionModifyAjax"})
    public JSON supportOptionModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("isSuccess", (this.supportService.updateRentalOption(commandMap) > 0));
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportRentalApprovalModifyAjax
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 제휴사 승인변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */      
    @RequestMapping(value="/bo/support/supportRentalApprovalModifyAjax")
    public JSON supportRentalApprovalModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("isSuccess", (this.supportService.updateVenderApproval(commandMap) > 0));
        json.addObject("ORD_MST_VDR_APV", (commandMap.get("ORD_MST_VDR_APV")));
        return json;
    }    
    
    /**
     * <pre>
     * 1. MethodName : supportRentalDetailPopup
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 렌탈접수 > 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */         
    
    @RequestMapping(value="/bo/support/supportRentalDetailPopup")
    public ModelAndView supportRentalDetailPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("ORD_MST_IDX"), ""))) {
            mv.addObject("codeList", commonService.selectCode("TEL_CODE"));
            mv.addAllObjects(this.supportService.selectRentalDetailInfo(commandMap));
            mv.addAllObjects(this.supportService.selectRentalSupportMemoList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/support/supportRentalDetailPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportRentalInstallInfoModify
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 렌탈접수 > 상세조회 > 설치정보 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    @RequestMapping(value="/bo/support/supportRentalInstallInfoModify")
    public ModelAndView supportRentalInstallInfoModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 설치정보 수정
        if (this.supportService.updateInstallInfo(commandMap) > 0) {
            mv.addObject("alertMsg", "수정 되었습니다.");
        } else {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/support/supportRentalDetailPopup.do");
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportRentalMemoInfoModify
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회  > 상세정보 > 특이사항 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/support/supportRentalMemoInfoModify")
    public ModelAndView supportRentalMemoInfoModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 설치정보 수정
        if (this.supportService.insertOrderMemoInfo(commandMap) > 0) {
            mv.addObject("alertMsg", "저장 되었습니다.");
        } else {
            mv.addObject("alertMsg", "저장에 실패하였습니다.");
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/support/supportRentalDetailPopup.do");
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportDeliveryList
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/support/supportDeliveryList")
    public ModelAndView supportDeliveryList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 배송상태 코드 조회
        mv.addObject("codeList", commonService.selectCode("DELIVERY"));
        // 제휴사 조회
        if (!SessionsManager.isScm()) {
            commandMap.put("searchListAll", "Y");
            mv.addObject("vendorList", this.commonService.selectCommonVendorList(commandMap));
        } else {
            commandMap.put("searchVdrMstIdx", SessionsManager.getSessionValue("ADM_MST_SUB_IDX"));
        }
        int totalCount = supportService.selectSupportDeliveryCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            mv.addObject("list", supportService.selectSupportDeliveryList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/support/supportDeliveryList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportDeliveryExcelDownload
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회 > 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */    
    @RequestMapping(value="/bo/support/supportDeliveryExcelDownload")
    public EXCEL supportDeliveryExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.supportService.selectSupportDeliveryList(commandMap);

        if (list != null) {
            excel.put("fileName", "daemyung_delivery_" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"NO",     "회원번호",    "가입일",    "고객명",   "연락처",    "제휴업체",      "모델분류",       "지원혜택",          "제품타입",          "모델명",     "설치주소",      "상세주소",       "배송예정일",             "배송완료일",            "배송보류일",             "상태",                   "특이사항"};
            String [] cellField =   {"RNUM",   "ACCNT_NO", "JOIN_DT", "MEM_NM", "CELL",   "VDR_MST_NM", "MODEL_CL_NM", "PRD_MST_SPL_NM", "PRD_OPT_IDX_NM", "MODEL_NM", "INSPL_ADDR", "INSPL_ADDR2", "ORD_MST_DLV_ING_DT", "ORD_MST_DLV_CPL_DT", "ORD_MST_DLV_WAT_DT", "ORD_MST_DLV_STATE_NM", "ORD_MEMO_CTS"};
            String [] cellType =    {"Number", "String",   "String",  "String", "String", "String",     "String",      "String",         "String",         "String",   "String",     "String",      "String",             "String",             "String",             "String",               "String"  };
            String [] colSize =     {"50",     "50",       "50",      "50",     "50",     "50",         "150",         "50",             "50",             "50",       "100",         "50",          "50",                 "50",                 "50",                 "50",                   "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }    
    
    /**
     * <pre>
     * 1. MethodName : supportDeliveryDateModifyAjax
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회 > 배송일 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */      
    @RequestMapping(value="/bo/support/supportDeliveryDateModifyAjax")
    public JSON supportDeliveryDeliveryModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", (this.supportService.updateDeliveryDate(commandMap) > 0));
        json.put("deliveryStatus", this.supportService.selectDeliveryStateStr(commandMap));
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportDeliveryDetailPopup
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회 > 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */         
    
    @RequestMapping(value="/bo/support/supportDeliveryDetailPopup")
    public ModelAndView supportDeliveryDetailPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("ORD_MST_IDX"), ""))) {
            mv.addObject("codeList", commonService.selectCode("TEL_CODE"));
            mv.addAllObjects(this.supportService.selectDeliveryDetailInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/support/supportDeliveryDetailPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportDeliveryInstallInfoModify
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회  > 상세정보 > 설치정보 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    @RequestMapping(value="/bo/support/supportDeliveryInstallInfoModify")
    public ModelAndView supportDeliveryInstallInfoModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 설치정보 수정
        if (this.supportService.updateInstallInfo(commandMap) > 0) {
            mv.addObject("alertMsg", "수정 되었습니다.");
        } else {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/support/supportDeliveryDetailPopup.do");
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportDeliveryMemoInfoModify
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회  > 상세정보 > 특이사항 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    @RequestMapping(value="/bo/support/supportDeliveryMemoInfoModify")
    public ModelAndView supportDeliveryMemoInfoModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 설치정보 수정
        if (this.supportService.insertOrderMemoInfo(commandMap) > 0) {
            mv.addObject("alertMsg", "저장 되었습니다.");
        } else {
            mv.addObject("alertMsg", "저장에 실패하였습니다.");
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/support/supportDeliveryDetailPopup.do");
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportBenefitList
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 혜택/지원(포인트) 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/support/supportBenefitList")
    public ModelAndView supportBenefitList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 제휴사 조회
        if (!SessionsManager.isScm()) {
            commandMap.put("searchListAll", "Y");
            mv.addObject("vendorList", this.commonService.selectCommonVendorList(commandMap));
        } else {
            commandMap.put("searchVdrMstIdx", SessionsManager.getSessionValue("ADM_MST_SUB_IDX"));
        }
        int totalCount = supportService.selectSupportBenefitCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            mv.addObject("list", supportService.selectSupportBenefitList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/support/supportBenefitList");
        return mv;
    } 
    
    /**
     * <pre>
     * 1. MethodName : supportBenefitBatchTargetPopup
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 혜택/지원(포인트) 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/support/supportBenefitBatchTargetPopup")
    public ModelAndView supportBenefitBatchTargetPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        String [] ACCNT_NO = StringUtil.getArray(commandMap, "ACCNT_NO");
        commandMap.put("ACCNT_NO", ACCNT_NO[0]);
        if (!"".equals(StringUtil.getString(commandMap, "ACCNT_NO"))) {
            commandMap.put("PAY_NO", StringUtil.getArray(commandMap, "PAY_NO"));
            mv.addObject("list", supportService.selectBenefitBatchTargetList(commandMap));
            mv.addObject("info", supportService.selectBenefitBatchTargetInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/support/supportBenefitBatchTargetPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportBenefitBatchTargetModify
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 혜택/지원(포인트) 지급
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    @RequestMapping(value="/bo/support/supportBenefitBatchTargetModify")
    public ModelAndView supportBenefitBatchTargetModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 혜택지원 일괄 지급
        //commandMap.put("PAY_NO", StringUtil.getArray(commandMap, "PAY_NO"));
        if (this.supportService.updateBenefitBatchInfo(commandMap) > 0) {
            mv.addObject("closeMsg", "저장 되었습니다.");
            mv.addObject("parentReload", true);
        } else {
            mv.addObject("alertMsg", "저장에 실패하였습니다.");
            mv.addObject("returnUrl", serverDomain + "/bo/support/supportBenefitBatchTargetPopup.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportBenefitBatchTargetModifyAjax
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 혜택/지원(포인트) 지급
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */    
    @RequestMapping(value="/bo/support/supportBenefitBatchTargetModifyAjax")
    public JSON supportBenefitBatchTargetModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        // 혜택지원 일괄 지급
        //commandMap.put("PAY_NO", StringUtil.getArray(commandMap, "PAY_NO"));
        json.put("isSuccess", (this.supportService.updateBenefitBatchInfo(commandMap) > 0));
        json.put("benefitYn", "Y");
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportBenefitDetailPopup
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 혜택/지원(포인트) 상세 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/support/supportBenefitDetailPopup")
    public ModelAndView supportBenefitDetailPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap, "ORD_MST_IDX"))) {
            mv.addObject("info", supportService.selectBenefitSupportInfo(commandMap));
            mv.addObject("list", supportService.selectBenefitSupportList(commandMap));
            mv.addAllObjects(this.supportService.selectBenefitSupportMemoList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/support/supportBenefitDetailPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportBenefitExcelDownload
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 혜택/지원(포인트) 조회 > 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */    
    @RequestMapping(value="/bo/support/supportBenefitExcelDownload")
    public EXCEL supportBenefitExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.supportService.selectSupportBenefitList(commandMap);

        if (list != null) {
            excel.put("fileName", "daemyung_benefit_" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"NO",     "회원번호",    "고객명",   "온라인상품명",    "연락처",   "납입회차",  "납입일",    "제휴업체",      "모델분류",       "지원혜택",          "가입상태",     "추가정보",              "혜택/지급일자",   "지급내역",           "지급상태"     };
            String [] cellField =   {"RNUM",   "ACCNT_NO", "MEM_NM", "PRD_MST_NM", "CELL",   "PAY_NO", "PAY_DAY", "VDR_MST_NM", "MODEL_CL_NM", "PRD_MST_SPL_NM", "KSTBIT_NM", "ORD_MST_VDR_BNF_ID", "ORD_BNF_DT", "PRD_MST_SPT_TXT", "ORD_BNF_YN"};
            String [] cellType =    {"Number", "String",   "String", "String",     "String", "String", "String",  "String",     "String",      "String",         "String",    "String",             "String",     "String",          "String"    };
            String [] colSize =     {"50",     "50",       "50",      "50",        "50",     "50",     "50",      "50",         "150",         "50",             "50",         "50",                "50",         "50",              "50"        };
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
    
    /**
     * <pre>
     * 1. MethodName : supportDeliveryMemoInfoModify
     * 2. ClassName  : SupportController.java
     * 3. Comment    : 관리자 > 발주혜택관리 조회 > 상품발주 조회  > 상세정보 > 특이사항 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/support/supportBenefitMemoInfoModify")
    public ModelAndView supportBenefitMemoInfoModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 설치정보 수정
        if (this.supportService.insertOrderMemoInfo(commandMap) > 0) {
            mv.addObject("alertMsg", "저장 되었습니다.");
        } else {
            mv.addObject("alertMsg", "저장에 실패하였습니다.");
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/support/supportBenefitDetailPopup.do");
        mv.setViewName("common/result");
        return mv;
    }
}
