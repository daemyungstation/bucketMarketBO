package web.bo.common.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.model.Paging;
import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import web.bo.common.service.CommonFileService;
import web.bo.common.service.CommonPopupService;
import web.bo.common.service.CommonService;
import web.bo.planner.service.ActivePlannerService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CommonPopupController {

    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="commonPopupService")
    private CommonPopupService commonPopupService;

    @Resource(name="activePlannerService")
    private ActivePlannerService activePlannerService;

    @Resource(name="commonFileService")
    private CommonFileService commonFileService;

    @Resource(name="propertiesService")
    private EgovPropertyService propertiesService;

    /**
     * <pre>
     * 1. MethodName : vendorB2BSearchPopup
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : B2B 회사 검색 공통 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/common/popup/vendorB2BSearchPopup")
    public ModelAndView vendorB2BSearchPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // B2B 개수 조회
        int totalCount = commonPopupService.selectCommonPopupB2bListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // B2B 목록 조회
            mv.addObject("list", commonPopupService.selectCommonPopupB2bList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/popup/vendorB2BSearchPopup");
        return mv;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : basicProductSearchPopup
     * 2. ClassName  : CommonController.java
     * 3. Comment    : 공통 상품검색 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/common/popup/basicProductSearchPopup")
    public ModelAndView basicProductSearchPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
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
        mv.setViewName("common/popup/basicProductSearchPopup");
        return mv;
    }



    
    /**
     * <pre>
     * 1. MethodName : basicProductViewPopup
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : 공통 상품상세 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/common/popup/basicProductViewPopup")
    public ModelAndView basicProductViewPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        commandMap.put("commandMap", commandMap);
        mv.setViewName("common/popup/basicProductViewPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : imagePreviewPopup
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : 공통 이미지미리보기 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/common/popup/imagePreviewPopup")
    public ModelAndView imagePreviewPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("info", commonFileService.selectCommonFileInfo(commandMap));
        mv.addObject("TITLE", StringUtil.getString(commandMap, "TITLE", ""));
        mv.setViewName("common/popup/imagePreviewPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : plannerPopup
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : 공통 레디플래너 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bo/common/popup/plannerPopup")
    public String plannerPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        // 공통 및 권한 처리를 위해 forward 처리 함.
        return "forward:/bo/planner/plannerPopup.do";
    }
    
    /**
     * <pre>
     * 1. MethodName : dlccSearchPopup
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : dlcc 검색 공통 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/common/popup/dlccSearchPopup")
    public ModelAndView dlccSearchPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // dlcc 개수 조회
        int totalCount = commonPopupService.selectCommonPopupDlccCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // dlcc 목록 조회
            mv.addObject("list", commonPopupService.selectCommonPopupDlccList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/popup/dlccSearchPopup");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : orderPopup
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : 공통 주문 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bo/common/popup/orderPopup")
    public String orderPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        // 공통 및 권한 처리를 위해 forward 처리 함.
        return "forward:/bo/order/orderJoinDetailPopup.do";
    }
    /**
     * <pre>
     * 1. MethodName : scmPopup
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : 공통 제휴사 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bo/common/popup/scmPopup")
    public String scmPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        // 공통 및 권한 처리를 위해 forward 처리 함.
        return "forward:/bo/site/vendorManagerEdit.do";
    }


    /**
     * <pre>
     * 1. MethodName : basicProductSearchPopup
     * 2. ClassName  : CommonController.java
     * 3. Comment    : 공통 상품검색 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/common/popup/basicPlannerSearchPopup")
    public ModelAndView plannerSearchPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {

        ModelAndView mv = new ModelAndView();

        // 공통코드
        List<String> codeList = new ArrayList<>();
        // 사업자 유형
        codeList.add("PLANNER_BUSINESS_CLASS");
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        // 목록 개수
        int totalCount = this.activePlannerService.selectActivePlannerListCount(commandMap);

        // 페이징
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());

        // 목록
        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            list = this.activePlannerService.selectActivePlannerList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

        mv.setViewName("/common/popup/basicPlannerSearchPopup");
        return mv;
    }
}
