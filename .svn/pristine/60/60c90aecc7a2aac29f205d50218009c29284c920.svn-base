package web.bo.marketing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: web.bo.marketing.service
 * @FileName : EventService.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 프로모션 관리 > 이벤트 관리를 처리하는 Service Interface
 * @author upleat
 */
public interface EventService {
    
    
    /**
     * <pre>
     * 1. MethodName : selectEventListCount
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectEventList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectEventList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectEventInfo
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectEventInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectEventReplyListCount
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세 > 이벤트 댓글 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventReplyListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectEventReplyList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세 > 이벤트 댓글 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectEventReplyList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertEvent
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertEvent(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateEvent
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEvent(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateEventReplyModify
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세 > 이벤트 댓글 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEventReplyModify(Map<String, Object> commandMap) throws Exception;
}
