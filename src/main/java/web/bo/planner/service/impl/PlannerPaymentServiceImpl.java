package web.bo.planner.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.planner.service.PlannerPaymentService;
import web.message.MessageType;
import web.message.service.MessageService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : PlannerCalculateServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 플래너 정산
 * &#64;author upleat
 * </pre>
 */
@Service("plannerPaymentService")
public class PlannerPaymentServiceImpl implements PlannerPaymentService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "messageService")
    private MessageService messageService;

    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentListCount
     * 2. ClassName  : PlannerPaymentServiceImpl.java
     * 3. Comment    : 플래너 지급 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 11.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerPaymentService#selectPlannerPaymentListCount(java.util.Map)
     * @param commandMap
     * @return
     */
    @Override
    public int selectPlannerPaymentListCount(Map<String, Object> commandMap) {
        return this.defaultDAO.selectCount("PlannerPayment.selectPlannerPaymentListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentList
     * 2. ClassName  : PlannerPaymentServiceImpl.java
     * 3. Comment    : 플래너 지급 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 11.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerPaymentService#selectPlannerPaymentList(java.util.Map)
     * @param commandMap
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerPaymentList(Map<String, Object> commandMap) {
      //제휴업체_레디플래너정산, 제휴업체_레디플래너정산(관리자)
        commandMap.put("doMasking", (SessionsManager.getSessionValue("AUT_MST_IDX").equals("10") || SessionsManager.getSessionValue("AUT_MST_IDX").equals("17")) ? 1 : 0  );
        
        return this.defaultDAO.selectList("PlannerPayment.selectPlannerPaymentList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertPaymentComplete
     * 2. ClassName  : PlannerPaymentServiceImpl.java
     * 3. Comment    : 지급 완료
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 11.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerPaymentService#insertPaymentComplete(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public int insertPaymentComplete(Map<String, Object> commandMap) throws Exception {

        commandMap.put("RMT_ORD_UPD_IP", IPUtil.getClientIP());
        commandMap.put("RMT_ORD_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        String ORD_MST_IDX_be = StringUtil.getString(commandMap, "ORD_MST_IDX", "");
        System.out.println(ORD_MST_IDX_be);
        
        String[] ord_mst_idx_list = ORD_MST_IDX_be.split(",");
        ArrayList<String> list = new ArrayList<String>();
        
        for (int i = 0; i < ord_mst_idx_list.length; i++) {
            list.add(ord_mst_idx_list[i]);
            System.out.println(ord_mst_idx_list[i]);
        }
        
        commandMap.put("list", list);
        List<Map<String, Object>> info = defaultDAO.selectList("PlannerPayment.selectPaymentAlimInfo", commandMap);
        int result = this.defaultDAO.update("PlannerPayment.insertPaymentComplete", commandMap);
        
        // 알림톡 발송
        List<String> tempList = new ArrayList<String>();
        List<String> idList = new ArrayList<String>();
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
  
        String paymentYear = StringUtil.getString(commandMap, "paymentYear");
        String paymentMonth = StringUtil.getString(commandMap, "paymentMonth");
        for(Map<String, Object> list2 : info){
            String rdp_mst_idx = StringUtil.getString(commandMap, "RDP_MST_IDX", "");
            if(!tempList.contains(rdp_mst_idx)){
                tempList.add(rdp_mst_idx);
                resultList.add(list2);
                if (result > 0) {
                    // 알림톡 & 앱 푸시 발송
                    String RDP_MST_HP = (String) info.get(0).get("RDP_MST_HP");
                    String RDP_MST_MEM_NM = (String) info.get(0).get("RDP_MST_MEM_NM");
                    String RDP_MST_BNK_CD_NM = (String) info.get(0).get("RDP_MST_BNK_CD_NM");
                    String RDP_MST_BNK_ACT = (String) info.get(0).get("RDP_MST_BNK_ACT");
                    String RDP_MST_ACT_HDR = (String) info.get(0).get("RDP_MST_ACT_HDR");
                    // 지급 완료
                    this.messageService.sendAlimTalk(MessageType.PLANNER_PAYMENT_COMPLETE, RDP_MST_HP, RDP_MST_MEM_NM, paymentYear, paymentMonth, RDP_MST_BNK_CD_NM, RDP_MST_BNK_ACT, RDP_MST_ACT_HDR);
                }
            }
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : insertPaymentCompleteAll
     * 2. ClassName  : PlannerPaymentServiceImpl.java
     * 3. Comment    : 일괄 지급 완료
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 11.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerPaymentService#insertPaymentCompleteAll(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public int insertPaymentCompleteAll(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RMT_ORD_UPD_IP", IPUtil.getClientIP());
        commandMap.put("RMT_ORD_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        int result = 0;
        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {

            PARAMS = StringEscapeUtils.unescapeHtml4(PARAMS);

            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            for (Map<String, Object> param : paramList) {
                commandMap.put("RDP_MST_IDX", StringUtil.getString(param, "RDP_MST_IDX", ""));
                String ORD_MST_IDX_be = StringUtil.getString(param, "ORD_MST_IDX", "");
                
                String[] ord_mst_idx_list = ORD_MST_IDX_be.split(",");
                ArrayList<String> list = new ArrayList<String>();
                
                for (int i = 0; i < ord_mst_idx_list.length; i++) {
                    list.add(ord_mst_idx_list[i]);
                    System.out.println(ord_mst_idx_list[i]);
                }
                
                commandMap.put("list", list);
                
                System.out.println(list);
                
                commandMap.put("RMT_ORD_RQT_DT", StringUtil.getString(param, "RMT_ORD_RQT_DT", ""));
                commandMap.put("PRD_MST_RDP_DVD_PAY", StringUtil.getString(param, "PRD_MST_RDP_DVD_PAY", ""));
                
                List<Map<String, Object>> info = defaultDAO.selectList("PlannerPayment.selectPaymentAlimInfo", commandMap);
                int itemResult = this.defaultDAO.update("PlannerPayment.insertPaymentComplete", commandMap);
                
                List<String> tempList = new ArrayList<String>();
                List<String> idList = new ArrayList<String>();
                List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
          
                String paymentYear = StringUtil.getString(commandMap, "paymentYear");
                String paymentMonth = StringUtil.getString(commandMap, "paymentMonth");
                for(Map<String, Object> list2 : info){
                    String rdp_mst_idx = StringUtil.getString(param, "RDP_MST_IDX", "");
                    if(!tempList.contains(rdp_mst_idx)){
                        tempList.add(rdp_mst_idx);
                        resultList.add(list2);
                        if (itemResult > 0) {
                            // 알림톡 & 앱 푸시 발송
                            String RDP_MST_HP = (String) info.get(0).get("RDP_MST_HP");
                            String RDP_MST_MEM_NM = (String) info.get(0).get("RDP_MST_MEM_NM");
                            String RDP_MST_BNK_CD_NM = (String) info.get(0).get("RDP_MST_BNK_CD_NM");
                            String RDP_MST_BNK_ACT = (String) info.get(0).get("RDP_MST_BNK_ACT");
                            String RDP_MST_ACT_HDR = (String) info.get(0).get("RDP_MST_ACT_HDR");
                            // 지급 완료
                            this.messageService.sendAlimTalk(MessageType.PLANNER_PAYMENT_COMPLETE, RDP_MST_HP, RDP_MST_MEM_NM, paymentYear, paymentMonth, RDP_MST_BNK_CD_NM, RDP_MST_BNK_ACT, RDP_MST_ACT_HDR);
                        }
                    }
                }

                

                result += itemResult;
            }
        }
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentHistoryListCount
     * 2. ClassName  : PlannerPaymentServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 정산금액 팝업 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCalculateService#selectPlannerPaymentHistoryListCount(java.util.Map)
     * @param commandMap
     * @return
     */
    @Override
    public int selectPlannerPaymentHistoryListCount(Map<String, Object> commandMap) {
        return defaultDAO.selectCount("PlannerPayment.selectPlannerPaymentHistoryListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentHistoryList
     * 2. ClassName  : PlannerPaymentServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 플래너 정산 > 정산금액 팝업 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCalculateService#selectPlannerPaymentHistoryList(java.util.Map)
     * @param commandMap
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerPaymentHistoryList(Map<String, Object> commandMap) {
        return defaultDAO.selectList("PlannerPayment.selectPlannerPaymentHistoryList", commandMap);
    }

}
