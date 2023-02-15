package web.bo.product.controller;

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
import web.bo.product.service.ProductTemplateService;
import web.bo.common.service.CommonService;

/**
 * @PackageName: web.bo.product.controller
 * @FileName : ProductTemplateController.java
 * @Date : 2020. 4. 20.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품Template를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ProductTemplateController {

    @Resource(name="productTemplateService")
    private ProductTemplateService productTemplateService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : productTemplateList
     * 2. ClassName  : ProductTemplateController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품Template 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productTemplateList")
    public ModelAndView productTemplateList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int CMN_COM_IDX = StringUtil.getInt(commandMap, "CMN_COM_IDX", Code.LIFE_SERVICE);

        List<String> codeList = new ArrayList<>();
        codeList.add("TEMPLATE_CODE");
        if (CMN_COM_IDX == Code.LIFE_SERVICE) {
            codeList.add("LIFE_SERVICE");
        } else if (CMN_COM_IDX == Code.PRODUCT_TYPE) {
            codeList.add("PRODUCT_TYPE");
        }
        // 이용약관 유형, 구분 리스트
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
        // 상품Template 목록 개수
        int totalCount = this.productTemplateService.selectProductTemplateListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 상품Template 목록
            mv.addObject("list", this.productTemplateService.selectProductTemplateList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/product/productTemplateList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : productTemplateEdit
     * 2. ClassName  : ProductTemplateController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품Template 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productTemplateEdit")
    public ModelAndView productTemplateEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        String[] codes = { "TEMPLATE_CODE", "LIFE_SERVICE", "PRODUCT_TYPE" };
        // 이용약관 유형, 구분 리스트
        mv.addObject("codes", this.commonService.selectCodes(codes));        
        mv.addObject("info", this.productTemplateService.selectProductTemplateInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/product/productTemplateEdit");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : productTemplateModify
     * 2. ClassName  : ProductTemplateController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품Template 답변 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productTemplateModify")
    public ModelAndView productTemplateModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (this.productTemplateService.updateProductTemplate(commandMap) > 0) {
            mv.addObject("alertMsg", "수정 되었습니다.");
        } else {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/product/productTemplateList.do");
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;        
    }
    
    /**
     * <pre>
     * 1. MethodName : productTemplateForm
     * 2. ClassName  : ProductTemplateController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품Template 입력
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productTemplateForm")
    public ModelAndView productTemplateForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        String[] codes = { "TEMPLATE_CODE", "LIFE_SERVICE", "PRODUCT_TYPE" };
        // 이용약관 유형, 구분 리스트
        mv.addObject("codes", this.commonService.selectCodes(codes));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/product/productTemplateForm");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : productTemplateRegist
     * 2. ClassName  : ProductTemplateController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품Template 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productTemplateRegist")
    public ModelAndView productTemplateRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 이용약관 등록
        if (this.productTemplateService.insertProductTemplate(commandMap) > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        int CMN_COM_IDX = StringUtil.getInt(commandMap, "CMN_COM_IDX", Code.LIFE_SERVICE);
        commandMap.clear();
        commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
        mv.addObject("commandMap", commandMap);
        mv.addObject("returnUrl", serverDomain + "/bo/product/productTemplateList.do");
        mv.setViewName("common/result");
        return mv;
    }    
    
}
