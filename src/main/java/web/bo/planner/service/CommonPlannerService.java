package web.bo.planner.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service
 * &#64;FileName : ActivePlannerService.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 공통 기능
 * &#64;author upleat
 * </pre>
 */
public interface CommonPlannerService {

    /**
     * <pre>
     * 1. MethodName : selectPlannerDetail
     * 2. ClassName  : CommonPlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 프로필
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerProfile(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerPerformanceListCount
     * 2. ClassName  : CommonPlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 실적
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlannerPerformanceListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerPerformanceList
     * 2. ClassName  : CommonPlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 실적
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlannerPerformanceList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentListCount
     * 2. ClassName  : CommonPlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 지급
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlannerPaymentListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentList
     * 2. ClassName  : CommonPlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 지급
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlannerPaymentList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateStateApply
     * 2. ClassName  : CommonPlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 승인 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateStateApply(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateInactiveProfile
     * 2. ClassName  : CommonPlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 활동대기 프로필 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    int updatePlannerProfile(Map<String, Object> commandMap) throws Exception;
}
