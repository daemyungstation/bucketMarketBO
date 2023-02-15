package web.bo.common.controller;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessLevel;
import common.annotation.RequestParams;
import common.model.Manager.ROLE_MANAGER;
import common.util.StringUtil;
import web.bo.common.service.CommonFileService;

@Controller
@AccessLevel(ROLE_MANAGER.administrator)
public class CommonFileController {
    
    @Resource(name="commonFileService")
    private CommonFileService commonFileService;
    
    /**
     * <pre>
     * 1. MethodName : commonFileDownload
     * 2. ClassName  : CommonFileController.java
     * 3. Comment    : 파일 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/common/commonFileDownload")
    public ModelAndView commonFileDownload(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("downloadView");
        if (!"".equals(StringUtil.getString(commandMap.get("CMM_FLE_IDX"), ""))) {
            // 파일 다운로드 수 증가
            int result = this.commonFileService.updateCommonFileDownCount(commandMap);
            if (result > 0) {
                Map<String, Object> info = this.commonFileService.selectCommonFileInfo(commandMap);
                mv.addObject("downloadFile", new File(StringUtil.getString(info, "CMM_FLE_SAVE_PATH", "")));
                mv.addObject("orgFileName", StringUtil.getString(info, "CMM_FLE_ORG_NM", ""));
            }
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : SmartEditorUpload
     * 2. ClassName  : CommonFileController.java
     * 3. Comment    : 파일업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @param response
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/common/commonFileEditorUpload")
    public String SmartEditorUpload(HttpServletRequest request, HttpServletResponse response, Map<String, Object> commandMap) throws Exception {
        return "redirect:" + commonFileService.uploadCommonFileEditor((MultipartHttpServletRequest) request, commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : SmartEditorHtml5Upload
     * 2. ClassName  : CommonFileController.java
     * 3. Comment    : html5 파일업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value="/common/commonFileEditorHtml5Upload")
    public void SmartEditorHtml5Upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        commonFileService.uploadCommonFileEditor(request, response);
    }
}
