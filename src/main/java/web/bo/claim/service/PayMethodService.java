package web.bo.claim.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * @PackageName: web.bo.claim.service
 * @FileName : PayMethodService.java
 * @Date : 2020. 4. 3.
 * @프로그램 설명 : 관리자 > 클레임 상담 조회 > 결제수단변경 신청
 * @author upleat
 * </pre>
 */
public interface PayMethodService {

    /**
     * <pre>
     * 1. MethodName : selectPayMethodListCount
     * 2. ClassName  : PayMethodService.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPayMethodListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPayMethodList
     * 2. ClassName  : PayMethodService.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPayMethodList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPayMethodInfo
     * 2. ClassName  : PayMethodService.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 상세 정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPayMethodInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updatePayMethod
     * 2. ClassName  : PayMethodService.java
     * 3. Comment    : 관리자 > 클레임 상담 조회 > 결제수단변경 신청 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePayMethod(Map<String, Object> commandMap) throws Exception;
    
}
