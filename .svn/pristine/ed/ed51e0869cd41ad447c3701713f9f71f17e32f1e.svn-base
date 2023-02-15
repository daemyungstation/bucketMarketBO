package web.bo.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.order.service.OrderService;

/**
 * @PackageName: web.bo.order.service.impl
 * @FileName : OrderServiceImpl.java
 * @Date : 2020. 5. 27
 * @프로그램 설명 : 관리자 > 가입결제 조회를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    
    /**
     * <pre>
     * 1. MethodName : selectReceiptOrderCount
     * 2. ClassName  : OrderServiceImpl.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.order.service.OrderService#selectReceiptOrderCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectReceiptOrderCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Order.selectReceiptOrderCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectReceiptOrderList
     * 2. ClassName  : OrderServiceImpl.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.OrderService#selectReceiptOrderList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectReceiptOrderList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Order.selectReceiptOrderList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectJoinOrderCount
     * 2. ClassName  : OrderServiceImpl.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.order.service.OrderService#selectJoinOrderCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectJoinOrderCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Order.selectJoinOrderCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectReceiptOrderList
     * 2. ClassName  : OrderServiceImpl.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.marketing.service.OrderService#selectJoinOrderList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectJoinOrderList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Order.selectJoinOrderList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectOrderReceiptInfo
     * 2. ClassName  : OrderServiceImpl.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 가입상세 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderReceiptInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("Order.selectReceiptCustomerInfo", commandMap));
        returnMap.put("payInfo", defaultDAO.select("Order.selectOrderPayInfo", commandMap));
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectOrderJoinInfo
     * 2. ClassName  : OrderServiceImpl.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 접수목록 > 가입상세 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderJoinInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("Order.selectJoinCustomerInfo", commandMap));
        returnMap.put("payInfo", defaultDAO.select("Order.selectOrderPayInfo", commandMap));
        returnMap.put("payment", defaultDAO.select("Order.selectOrderPayment", commandMap));
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectOrderPaymentList
     * 2. ClassName  : OrderServiceImpl.java
     * 3. Comment    : 관리자 > 가입결제 조회 > 납입상세 리스트
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderPaymentList(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        Map<String, Object> customer = defaultDAO.select("Order.selectOrderAccntNo", commandMap);
        returnMap.put("customer", customer);
        List<Map<String, Object>> payment = defaultDAO.selectList("Order.selectOrderPaymentList", commandMap);
        returnMap.put("payment", payment);
        return returnMap;
    }
}