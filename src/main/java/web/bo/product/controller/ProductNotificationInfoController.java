package web.bo.product.controller;

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
import common.util.StringUtil;
import web.bo.common.service.CommonService;
import web.bo.product.service.ProductNotificationInfoService;

/**
 * @PackageName: web.bo.product.controller
 * @FileName : ProductNotificationInfo.java
 * @Date : 2015. 10. 21.
 * @프로그램 설명 : 상품정보고시를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ProductNotificationInfoController {

    @Resource(name = "productNotificationInfoService")
    private ProductNotificationInfoService productNotificationInfoService;
    @Resource(name = "commonService")
    private CommonService commonService;

    /**
     * <pre>
    * 1. MethodName : productNotificationInfoList
    * 2. ClassName : ProductNotificationInfo.java
    * 3. Comment : 상품고시정보 리스트
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/bo/product/productNotificationInfoList")
    public ModelAndView productNotificationInfoList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 상품고시 품목 갯수
        commandMap.put("PRD_NFI_LEVEL", "0");
        int totalCount = this.productNotificationInfoService.selectProductNotificationInfoListCount(commandMap);

        List<Map<String, Object>> list = null;
        if (totalCount > 0) {
            // 상품고시 품목 목록
            commandMap.put("PRD_NFI_USE_YN", "");
            list = this.productNotificationInfoService.selectProductNotificationInfoList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }

    /**
     * <pre>
    * 1. MethodName : productNotificationInfoRegist
    * 2. ClassName : ProductNotificationInfo.java
    * 3. Comment : 상품고시정보 등록
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/bo/product/productNotificationInfoRegist")
    public ModelAndView productNotificationInfoRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap, @RequestParams(value = "PRD_NFI_INFO_YN") String[] PRD_NFI_INFO_YN,
            @RequestParams(value = "PRD_NFI_INFO") String[] PRD_NFI_INFO, @RequestParams(value = "PRD_NFI_INFO_CODE") String[] PRD_NFI_INFO_CODE, @RequestParams(value = "PRD_NFI_INFO_EXE") String[] PRD_NFI_INFO_EXE) throws Exception {
        ModelAndView mv = new ModelAndView();

        commandMap.put("arrPRD_NFI_INFO_YN", PRD_NFI_INFO_YN);
        commandMap.put("arrPRD_NFI_INFO", PRD_NFI_INFO);
        commandMap.put("arrPRD_NFI_INFO_CODE", PRD_NFI_INFO_CODE);
        commandMap.put("arrPRD_NFI_INFO_EXE", PRD_NFI_INFO_EXE);
        // 상품고시관리 최상위(품목) 등록
        int result = this.productNotificationInfoService.insertProductNotificationInfo(request, commandMap);
        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/bo/product/productNotificationInfoList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
    * 1. MethodName : productNotificationInfoEdit
    * 2. ClassName : ProductNotificationInfo.java
    * 3. Comment : 품목정보 등록/수정 폼
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/bo/product/productNotificationInfoEdit")
    public ModelAndView productNotificationInfoEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        String WRITE_MODE = StringUtil.getString(commandMap.get("WRITE_MODE"));

        if (WRITE_MODE.equals("M")) {
            // 품목 상세 가져오기
            Map<String, Object> row = this.productNotificationInfoService.selectproductNotificationInfoTop(commandMap);
            mv.addObject("row", row);
            // 품목에 대한 항목 상세 가져오기
            List<Map<String, Object>> rowSub = null;
            rowSub = this.productNotificationInfoService.selectproductNotificationInfo(commandMap);
            mv.addObject("rowSub", rowSub);
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/bo/product/productNotificationInfoEdit");

        return mv;
    }

    /**
     * <pre>
    * 1. MethodName : productNotificationInfoModify
    * 2. ClassName : ProductNotificationInfo.java
    * 3. Comment : 상품고시정보 수정
    * 4. 작성자 : upleat
    * 5. 작성일 : 2015. 10. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/bo/product/productNotificationInfoModify")
    public ModelAndView productNotificationInfoModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap, @RequestParams(value = "PRD_NFI_INFO_YN") String[] PRD_NFI_INFO_YN,
            @RequestParams(value = "PRD_NFI_INFO") String[] PRD_NFI_INFO, @RequestParams(value = "PRD_NFI_INFO_CODE") String[] PRD_NFI_INFO_CODE, @RequestParams(value = "PRD_NFI_INFO_EXE") String[] PRD_NFI_INFO_EXE) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("PRD_NFI_IDX"), ""))) {
            commandMap.put("arrPRD_NFI_INFO_YN", PRD_NFI_INFO_YN);
            commandMap.put("arrPRD_NFI_INFO", PRD_NFI_INFO);
            commandMap.put("arrPRD_NFI_INFO_CODE", PRD_NFI_INFO_CODE);
            commandMap.put("arrPRD_NFI_INFO_EXE", PRD_NFI_INFO_EXE);

            // 상품고시정보 수정
            int result = this.productNotificationInfoService.updateproductNotificationInfo(request, commandMap);

            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");

            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/bo/product/productNotificationInfoList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }

}
