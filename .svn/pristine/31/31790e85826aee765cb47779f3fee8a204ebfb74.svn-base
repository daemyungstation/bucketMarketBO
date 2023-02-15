package web.bo.product.controller;

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
import web.bo.common.service.CommonPopupService;
import web.bo.common.service.CommonService;
import web.bo.product.service.ProductNotificationInfoService;
import web.bo.product.service.ProductService;

/**
 * @PackageName: web.bo.product.controller
 * @FileName : ProductUnionController.java
 * @Date : 2020. 4. 20.
 * @프로그램 설명 : 관리자 > 상품관리 > 결합완료를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ProductUnionController {

    @Resource(name="productService")
    private ProductService productService;

    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "productNotificationInfoService")
    private ProductNotificationInfoService productNotificationInfoService;
    
    @Resource(name="commonPopupService")
    private CommonPopupService commonPopupService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : productUnionList
     * 2. ClassName  : ProductUnionController.java
     * 3. Comment    : 관리자 > 상품관리 > 결합완료상품 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productUnionList")
    public ModelAndView productUnionList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        commandMap.put("searchListAll", "Y");
        // 제휴사 목록 조회
        mv.addObject("vendorList", commonService.selectCommonVendorList(commandMap));
        // 상품 유형 코드 조회
        mv.addObject("codeList", commonService.selectCode("PRODUCT_TYPE_CODE"));
        // 상품 카테고리 최 상위 목록 조회
        mv.addObject("productCategoryList", commonService.selectCommonProductCategoryList(commandMap));
        
        // 상품 개수 조회
        int totalCount = commonPopupService.selectCommonPopupBasicProductListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 상품 목록 조회
            mv.addObject("list", commonPopupService.selectCommonPopupBasicProductList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/product/productUnionList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : productUnionExcelDownload
     * 2. ClassName  : ProductUnionController.java
     * 3. Comment    : 관리자 > 상품관리 > 결합완료 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */    
    @RequestMapping(value="/bo/product/productUnionExcelDownload")
    public EXCEL productUnionExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.commonPopupService.selectCommonPopupBasicProductList(commandMap);

        if (list != null) {
            excel.put("fileName", "daemyung_Union_" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            String [] headerTitle = {"NO",   "상품유형",           "온라인상품명",    "총상품금액",  "상품코드",   "모델분류",       "지원혜택",          "모델명",       "노출상태"};
            String [] cellField = {"RNUM",   "PRD_MST_TYPE_NM", "PRD_MST_NM", "PROD_AMT", "PROD_CD", "MODEL_CL_NM", "PRD_MST_SPL_NM", "MODEL_NM", "PRD_MST_DPL_YN_NM"};
            String [] cellType =  {"Number", "String",          "String",      "Dollar",  "String",  "String",      "String",         "String",     "String" };
            String [] colSize = {"50", "80", "150", "80", "80", "50", "50", "50", "50"};
            excel.put("headerTitle", headerTitle);
            excel.put("cellField", cellField);
            excel.put("cellType", cellType);
            excel.put("colSize", colSize);
        }
        return excel;
    }
    
    /**
     * <pre>
     * 1. MethodName : productUnionEdit
     * 2. ClassName  : ProductUnionController.java
     * 3. Comment    : 관리자 > 상품관리 > 결합상품 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productUnionEdit")
    public ModelAndView productUnionEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("PRD_MST_NO"), ""))) {
            mv.addAllObjects(productService.selectUnionProductInfo(commandMap));        
        }
        // 상품정보
        mv.addAllObjects(productService.selectBasicProductInfo(commandMap));
        // 결합상품정보
        // 상품 유형 코드 조회
        mv.addObject("codeList", commonService.selectCode("PRODUCT_TYPE_CODE"));
        // 상품 서비스
        mv.addObject("serviceList", commonService.selectCode("LIFE_SERVICE"));        
        // 상품 카테고리 최상위 목록 조회
        mv.addObject("productCategoryList", commonService.selectCommonProductCategoryList(commandMap));        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/product/productUnionEdit");
        return mv;
    }  
    
    /**
     * <pre>
     * 1. MethodName : productUnionModify
     * 2. ClassName  : ProductUnionController.java
     * 3. Comment    : 관리자 > 상품관리 > 승인상품수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productUnionModify")
    public ModelAndView productUnionModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 미승인상품 등록
        if (this.productService.updateProductUnion((MultipartHttpServletRequest) request, commandMap) > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/product/productUnionEdit.do");
        mv.setViewName("common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : productUnionNotificationInfoAjax
     * 2. ClassName  : ProductUnionController.java
     * 3. Comment    : 관리자 > 상품관리 > 승인상품 > 상품고시정보 호출
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 08.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bo/product/productUnionNotificationInfoAjax")
    public JSON productUnionNotificationInfoAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        List<Map<String, Object>> list = this.productNotificationInfoService.selectproductNotificationInfo(commandMap);
        json.put("prdNfiList", list);
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : productUnionOptionModify
     * 2. ClassName  : ProductUnionController.java
     * 3. Comment    : 관리자 > 상품관리 > 결합상품 옵션 수정
     * 4. 작성자       : inus
     * 5. 작성일       : 2020. 8. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productUnionOptionModifyAjax")
    public JSON productApprovalOptionModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        if (this.productService.updateProductOption(commandMap) > 0) {
            json.put("result", "SUCCESS");
        } else {
            json.put("result", "FAIL");
        }
        return json;
    } 
    
    /**
     * <pre>
     * 1. MethodName : productUnionSuggest
     * 2. ClassName  : ProductUnionController.java
     * 3. Comment    : 관리자 > 상품관리 > 결합상품 추천 순서 수정
     * 4. 작성자       : inus
     * 5. 작성일       : 2021. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productUnionSuggestAjax")
    public JSON productUnionSuggest(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        if (this.productService.updateProductSuggest(commandMap) > 0) {
            json.put("result", "SUCCESS");
        } else {
            json.put("result", "FAIL");
        }
        return json;
    } 
}
