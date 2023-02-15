package web.bo.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: web.bo.board.service
 * @FileName : VendorNoticeBoardService.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > 제휴업체 공지사항을 처리하는 Service Interface
 * @author upleat
 */
public interface VendorNoticeBoardService {

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardListCount
     * 2. ClassName  : VendorNoticeBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorNoticeBoardListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardList
     * 2. ClassName  : VendorNoticeBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectVendorNoticeBoardList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardInfo
     * 2. ClassName  : VendorNoticeBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectVendorNoticeBoardInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertVendorNoticeBoard
     * 2. ClassName  : VendorNoticeBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertVendorNoticeBoard(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateVendorNoticeBoard
     * 2. ClassName  : VendorNoticeBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorNoticeBoard(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeBoardTopCount
     * 2. ClassName  : VendorNoticeBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 상단공지 사용 가능 유무
     * 4. 작성자       : upleat
     * 5. 작성일       : 2015. 3. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorNoticeBoardTopCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateVendorNoticeReadCount
     * 2. ClassName  : VendorNoticeBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 제휴업체 공지사항 조회수 증가
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorNoticeReadCount(Map<String, Object> commandMap) throws Exception;
}
