package web.bo.marketing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: web.bo.marketing.service
 * @FileName : PlanService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 기획전관리 처리하는 Service Interface
 * @author upleat
 */
public interface PlanService {

    /**
     * <pre>
     * 1. MethodName : selectPlanListCount
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlanListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlanList
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlanList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlanInfo
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlanInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertPlan
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertPlan(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlan
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 > 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlan(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPlanReplyListCount
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 수정 폼 > 기획전 댓글> 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlanReplyListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPlanReplyListCount
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 기획전 > 수정 폼 > 기획전 댓글> 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlanReplyList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlanReplyModify
     * 2. ClassName  : PlanService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 이벤트 > 상세 > 이벤트 댓글 > 노출수성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlanReplyModify(Map<String, Object> commandMap) throws Exception;
}
