package web.bo.planner.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service
 * &#64;FileName : InactivePlannerService.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 활동 대기 플래너
 * &#64;author upleat
 * </pre>
 */
public interface InactivePlannerService {

    /**
     * <pre>
     * 1. MethodName : selectInactivePlannerListCount
     * 2. ClassName  : InactivePlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 신청 플래너 > 신청 플래너 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectInactivePlannerListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectInactivePlannerList
     * 2. ClassName  : InactivePlannerService.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 신청 플래너 > 신청 플래너 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectInactivePlannerList(Map<String, Object> commandMap) throws Exception;
}
