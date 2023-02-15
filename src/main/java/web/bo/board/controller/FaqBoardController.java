package web.bo.board.controller;

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
import web.bo.board.service.FaqBoardService;
import web.bo.common.service.CommonService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class FaqBoardController {

    @Resource(name="faqBoardService")
    private FaqBoardService faqBoardService;

    @Resource(name="commonService")
    private CommonService commonService;
    
    @Value("#{resource['server.ssl.domain']}")
    private String serverDomain;

    /**
     * <pre>
     * 1. MethodName : faqBoardList
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardList")
    public ModelAndView faqBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // faq 관리 목록 개수
        int totalCount = this.faqBoardService.selectFaqBoardListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            // faq 관리 목록
            mv.addObject("list", this.faqBoardService.selectFaqBoardList(commandMap));
        }
        // 문의 유형 리스트
        mv.addObject("codeList", this.commonService.selectCode("QUESTION_TYPE_CODE"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/faqBoardList");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : faqBoardExcelDownload
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록 > 엑셀다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardExcelDownload")
    public EXCEL faqBoardExcelDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.faqBoardService.selectFaqBoardList(commandMap);
        if (list != null) {
            excel.put("fileName", "daemyung_faq_" + DateUtil.getCurrentDateTime());
            excel.put("list", list);
            if ("Y".equals(StringUtil.getString(commandMap, "BRD_FAQ_SAMPLE_YN", "N"))) {
                String [] headerTitle = {"일련번호", "순서", "문의유형", "제목", "조회수", "등록일", "상태"};
                String [] cellField = {"BRD_FAQ_IDX", "BRD_FAQ_SRT", "BRD_CMN_COM_NM", "BRD_FAQ_TITLE", "BRD_FAQ_READ_CNT", "BRD_FAQ_REG_DT", "BRD_FAQ_USE_YN"};
                String [] cellType = {"Number", "Number", "String", "String", "Number", "String", "String"};
                String [] colSize = {"50", "50", "80", "150", "50", "80", "50"};
                excel.put("headerTitle", headerTitle);
                excel.put("cellField", cellField);
                excel.put("cellType", cellType);
                excel.put("colSize", colSize);
            } else {
                String [] headerTitle = {"NO", "문의유형", "제목", "조회수", "등록일", "상태"};
                String [] cellField = {"RNUM", "BRD_CMN_COM_NM", "BRD_FAQ_TITLE", "BRD_FAQ_READ_CNT", "BRD_FAQ_REG_DT", "BRD_FAQ_USE_YN"};
                String [] cellType = {"Number", "String", "String", "Number", "String", "String"};
                String [] colSize = {"50", "80", "150", "50", "80", "50"};
                excel.put("headerTitle", headerTitle);
                excel.put("cellField", cellField);
                excel.put("cellType", cellType);
                excel.put("colSize", colSize);
            }
        }
        return excel;
    }

    /**
     * <pre>
     * 1. MethodName : faqBoardExcelUploadPopup
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록 > 일괄 순서변경 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardExcelUploadPopup")
    public ModelAndView faqBoardExcelUploadPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : faqBoardSortEditPopup
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록 > 건별 순서변경 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardSortEditPopup")
    public ModelAndView faqBoardSortEditPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("list", this.faqBoardService.selectFaqBoardList(commandMap));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : faqBoardForm
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 등록 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardForm")
    public ModelAndView faqBoardForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 문의 유형 리스트
        mv.addObject("codeList", this.commonService.selectCode("QUESTION_TYPE_CODE"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/faqBoardForm");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : faqBoardEdit
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 수정 폼 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardEdit")
    public ModelAndView faqBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("BRD_FAQ_IDX"), ""))) {
            // 문의 유형 리스트
            mv.addObject("codeList", this.commonService.selectCode("QUESTION_TYPE_CODE"));
            // faq 관리 상세정보
            mv.addObject("info", this.faqBoardService.selectFaqBoardInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("bo/board/faqBoardEdit");
        return mv;
    }


    /**
     * <pre>
     * 1. MethodName : faqBoardRegist
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardRegist")
    public ModelAndView faqBoardRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 관리자 관리 관리자 등록
        int result = this.faqBoardService.insertFaqBoard(commandMap);
        // view Page Info
        if (result > 0) {
            mv.addObject("alertMsg", "등록 되었습니다.");
        } else {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
        }
        mv.addObject("returnUrl", serverDomain + "/bo/board/faqBoardList.do");
        mv.setViewName("common/result");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : faqBoardModify
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardModify")
    public ModelAndView faqBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!"".equals(StringUtil.getString(commandMap.get("BRD_FAQ_IDX"), ""))) {
            // 관리자 관리 관리자 수정
            int result = this.faqBoardService.updateFaqBoard(commandMap);
            // view Page Info
            if (result > 0) {
                mv.addObject("alertMsg", "수정 되었습니다.");
            } else {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", serverDomain + "/bo/board/faqBoardList.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("common/result");
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : faqBoardSortModify
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 순서 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/bo/board/faqBoardSortModify")
    public ModelAndView faqBoardSortModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        String BRD_FAQ_EXCEL_YN = StringUtil.getString(commandMap, "BRD_FAQ_EXCEL_YN", "");
        if ("Y".equals(BRD_FAQ_EXCEL_YN)) {
            
            result = this.faqBoardService.updateFaqBoardSort((MultipartHttpServletRequest) request);
            
        } else if ("N".equals(BRD_FAQ_EXCEL_YN)) {
            result = this.faqBoardService.updateFaqBoardSort(commandMap);
        }
        
        if (result > 0) {
            mv.addObject("closeMsg", "수정 되었습니다.");
        } else {
            mv.addObject("closeMsg", "수정에 실패하였습니다.");
        }
        mv.setViewName("common/result");
        return mv;
    }
}
