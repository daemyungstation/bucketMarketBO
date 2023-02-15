package web.bo.order.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: web.bo.order.service
 * @FileName : OrderService.java
 * @Date : 2020. 5. 27
 * @프로그램 설명 : 관리자 > 가입결제 조회를 처리하는 Service Interface
 * @author upleat
 */
public interface OrderService {
    
    
    /**
     * <pre>
     * 1. MethodName : selectReceiptOrderCount
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectReceiptOrderCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectReceiptOrderList
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectReceiptOrderList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectJoinOrderCount
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 가입목록 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectJoinOrderCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectJoinOrderList
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 가입목록 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectJoinOrderList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectOrderReceiptInfo
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 가입상세 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderReceiptInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectOrderJoinInfo
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 가입목록 > 가입상세 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderJoinInfo(Map<String, Object> commandMap) throws Exception;   
    
    /**
     * <pre>
     * 1. MethodName : selectOrderPaymentList
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 납입상세 리스트
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderPaymentList(Map<String, Object> commandMap) throws Exception;
    
}
