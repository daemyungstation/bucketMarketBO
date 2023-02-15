package web.bo.planner.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service
 * &#64;FileName : PlannerNoticeService.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 공지사항 관리
 * &#64;author upleat
 * </pre>
 */
public interface PlannerNoticeService {

    /**
     * <pre>
     * 1. MethodName : selectNoticeListCount
     * 2. ClassName  : PlannerNoticeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공지사항 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectNoticeListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectNoticeList
     * 2. ClassName  : PlannerNoticeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공지사항 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectNoticeList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectNoticeInfo
     * 2. ClassName  : PlannerNoticeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공지사항 > 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectNoticeInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertNotice
     * 2. ClassName  : PlannerNoticeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공지사항 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertNotice(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateNotice
     * 2. ClassName  : PlannerNoticeService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공지사항 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateNotice(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
