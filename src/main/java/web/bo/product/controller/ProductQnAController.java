package web.bo.product.controller;

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
import common.model.Paging;
import common.util.StringUtil;
import web.bo.product.service.ProductQnAService;
import web.bo.common.service.CommonService;

/**
 * @PackageName: web.bo.product.controller
 * @FileName : ProductQnAController.java
 * @Date : 2020. 4. 20.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품QnA를 처리하는 Controller Class
 * @author upleat
 */
@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class ProductQnAController {

    @Resource(name="productQnAService")
    private ProductQnAService productQnAService;

    @Resource(name="commonService")
    private CommonService commonService;

    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;
    
    /**
     * <pre>
     * 1. MethodName : productQnAList
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품QnA 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productQnAList")
    public ModelAndView productQnAList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!SessionsManager.isScm()) {
            commandMap.put("searchListAll", "Y");
            mv.addObject("vendorList", this.commonService.selectCommonVendorList(commandMap));
        } else {
            commandMap.put("searchVdrMstIdx", SessionsManager.getSessionValue("ADM_MST_SUB_IDX"));
        }
        // 상품QnA 목록 개수
        int totalCount = this.productQnAService.selectProductQnAListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // 상품QnA 목록
            mv.addObject("list", this.productQnAService.selectProductQnAList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/product/productQnAList");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : productQnAForm
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품QnA 답변 등록/수정 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productQnAEditPopup")
    public ModelAndView productQnAEditPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("info", this.productQnAService.selectProductQnAInfo(commandMap));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/product/productQnAEditPopup");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : productQnAModify
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품QnA 답변 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/product/productQnAModify")
    public ModelAndView productQnAModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("PRD_QNA_IDX"), ""))) {
            int result = this.productQnAService.updateProductQnA(commandMap);
            // view Page Info
            if (result > 0) {
                mv.addObject("closeMsg", "수정 되었습니다.");
            } else {
                mv.addObject("closeMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("parentReload", true);
            mv.addObject("returnUrl", serverDomain + "/bo/product/productQnAList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("common/result");
        return mv;
    }
}
