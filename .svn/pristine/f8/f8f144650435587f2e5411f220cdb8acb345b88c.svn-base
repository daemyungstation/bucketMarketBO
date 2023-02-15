package web.bo.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CommonFileService {

    /**
     * <pre>
     * 1. MethodName : uploadCommonFileEditor
     * 2. ClassName  : CommonFileService.java
     * 3. Comment    : 에디터 파일 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String uploadCommonFileEditor(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : uploadCommonFileEditor
     * 2. ClassName  : CommonFileService.java
     * 3. Comment    : 에디터 파일 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void uploadCommonFileEditor(HttpServletRequest request, HttpServletResponse response) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonFileList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통 파일 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonFileList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCommonFileInfo
     * 2. ClassName  : CommonFileService.java
     * 3. Comment    : 공통파일 상세 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommonFileInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertCommonFileList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통 파일 업로드 및 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param path
     * @param allow
     * @param dateFolderFlag
     * @return
     * @throws Exception
     */
    public int insertCommonFileList(MultipartHttpServletRequest request, Map<String, Object> commandMap, final String path, final String allow, final String dateFolderFlag) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateCommonFileList
     * 2. ClassName  : CommonFileService.java
     * 3. Comment    : 공통 파일 삭제, 업로드 및 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param path
     * @param allow
     * @param dateFolderFlag
     * @return
     * @throws Exception
     */
    public int updateCommonFileList(MultipartHttpServletRequest request, Map<String, Object> commandMap, final String path, final String allow, final String dateFolderFlag) throws Exception;
    
    /**
     * <pre>
    * 1. MethodName : updateCommonFileDownCount
    * 2. ClassName  : CommonFileService.java
    * 3. Comment    : 파일 다운로드 수 증가
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommonFileDownCount(Map<String, Object> commandMap) throws Exception;

}
