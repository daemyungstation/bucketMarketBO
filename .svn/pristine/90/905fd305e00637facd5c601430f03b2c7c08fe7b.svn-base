package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Code;
import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;
import web.bo.planner.service.CommonPlannerService;
import web.message.MessageType;
import web.message.service.MessageService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : CommonPlannerServiceImpl.java
 * &#64;Date : 2020. 4. 10.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 공통 기능
 * &#64;author upleat
 * </pre>
 */
@Log4j2
@Service("commonPlannerService")
public class CommonPlannerServiceImpl implements CommonPlannerService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "messageService")
    private MessageService messageService;

    /**
     * <pre>
     * 1. MethodName : selectPlannerDetail
     * 2. ClassName  : CommonPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 프로필
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public Map<String, Object> selectPlannerProfile(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("CommonPlanner.selectPlannerProfile", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerPerformanceListCount
     * 2. ClassName  : CommonPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 실적
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.planner.service.CommonPlannerService#selectPlannerPerformanceListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectPlannerPerformanceListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommonPlanner.selectPlannerPerformanceListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerPerformanceList
     * 2. ClassName  : CommonPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 실적
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.planner.service.CommonPlannerService#selectPlannerPerformanceList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerPerformanceList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CommonPlanner.selectPlannerPerformanceList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentListCount
     * 2. ClassName  : CommonPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 지급
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.planner.service.CommonPlannerService#selectPlannerPaymentListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectPlannerPaymentListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommonPlanner.selectPlannerPaymentListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerPaymentList
     * 2. ClassName  : CommonPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 상세 조회 - 지급
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @see web.bo.planner.service.CommonPlannerService#selectPlannerPaymentList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPlannerPaymentList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CommonPlanner.selectPlannerPaymentList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateStateApply
     * 2. ClassName  : CommonPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 플래너 신청 상태 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @see web.bo.planner.service.CommonPlannerService#updateStateApply(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updateStateApply(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_MST_UPD_IP", IPUtil.getClientIP());

        // 상태 변경 일자 업데이트
        defaultDAO.update("CommonPlanner.updateStateUpdateDate", commandMap);
        // 상태 변경
        int result = defaultDAO.update("CommonPlanner.updateState", commandMap);

        // 알림톡 발송
        if (result > 0) {

            Map<String, Object> planner = selectPlannerProfile(commandMap);
            String RDP_MST_HP = StringUtil.getString(planner, "RDP_MST_HP1") + StringUtil.getString(planner, "RDP_MST_HP2") + StringUtil.getString(planner, "RDP_MST_HP3");
            String RDP_MST_MEM_NM = StringUtil.getString(planner, "RDP_MST_MEM_NM");
            String RDP_MST_NO = StringUtil.getString(planner, "RDP_MST_NO");
            String RDP_MST_RJT_RSN = StringUtil.getString(planner, "RDP_MST_RJT_RSN", "").replace("\r\n", " ");
            // 상태에 따른 분기
            int RDP_MST_STATE = StringUtil.getInt(commandMap, "RDP_MST_STATE", -1);
            if (RDP_MST_STATE == Code.PLANNER_STATE_APPROVAL) {
                // 승인
                this.messageService.sendAlimTalk(MessageType.PLANNER_STATE_APPROVAL, RDP_MST_HP, RDP_MST_MEM_NM, RDP_MST_NO);
            } else if (RDP_MST_STATE == Code.PLANNER_STATE_REJECT) {
                // 반려
                this.messageService.sendAlimTalk(MessageType.PLANNER_STATE_REJECT, RDP_MST_HP, RDP_MST_MEM_NM, RDP_MST_NO, RDP_MST_RJT_RSN);
            }
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerProfile
     * 2. ClassName  : CommonPlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 공통 기능 > 프로필 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 10.
     * </pre>
     *
     * @see web.bo.planner.service.CommonPlannerService#updatePlannerProfile(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public int updatePlannerProfile(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_MST_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("RDP_MST_UPD_IP", IPUtil.getClientIP());

        // 플래너 상태에 따른 분기
        Map<String, Object> info = defaultDAO.select("CommonPlanner.selectPlannerProfile", commandMap);
        int oldState = StringUtil.getInt(info, "RDP_MST_STATE", 0);
        int newState = StringUtil.getInt(commandMap, "RDP_MST_STATE", 0);

        log.info("RDP_MST_STATE : oldState [{}] to newState[{}]", oldState, newState);

        if (oldState == Code.PLANNER_STATE_APPROVAL || oldState == Code.PLANNER_STATE_INACTIVE) { // 승인, 활동대기
            // 정산 정보만 업데이트
            return defaultDAO.update("CommonPlanner.updateProfile", commandMap);
        } else if (oldState == Code.PLANNER_STATE_ACTIVE || oldState == Code.PLANNER_STATE_STOP || oldState == Code.PLANNER_STATE_REQUEST_RELEASE) { // 정상, 정지, 해제요청

            // 정산 정보 업데이트
            int result = defaultDAO.update("CommonPlanner.updateProfile", commandMap);

            // 상태 정보 업데이트
            if (newState > 0) {
                defaultDAO.update("CommonPlanner.updateStateUpdateDate", commandMap);
                defaultDAO.update("CommonPlanner.updateState", commandMap);

                // 알림톡 발송
                if (result > 0) {
                    Map<String, Object> planner = selectPlannerProfile(commandMap);
                    String RDP_MST_NO = StringUtil.getString(planner, "RDP_MST_NO");
                    String RDP_MST_HP = StringUtil.getString(planner, "RDP_MST_HP1") + StringUtil.getString(planner, "RDP_MST_HP2") + StringUtil.getString(planner, "RDP_MST_HP3");
                    String RDP_MST_MEM_NM = StringUtil.getString(planner, "RDP_MST_MEM_NM");
                    String RDP_MST_STP_RSN = StringUtil.getString(planner, "RDP_MST_STP_RSN", "").replace("\r\n", " ");
                    // 상태에 따른 분기
                    int RDP_MST_STATE = StringUtil.getInt(commandMap, "RDP_MST_STATE", -1);
                    if (oldState != Code.PLANNER_STATE_STOP && RDP_MST_STATE == Code.PLANNER_STATE_STOP) {
                        // 이용제한
                        this.messageService.sendAlimTalk(MessageType.PLANNER_STATE_STOP, RDP_MST_HP, RDP_MST_MEM_NM, System.currentTimeMillis(), RDP_MST_STP_RSN);
                        this.messageService.sendAppPush(MessageType.PLANNER_STATE_STOP, RDP_MST_NO, RDP_MST_MEM_NM, System.currentTimeMillis(), RDP_MST_STP_RSN);
                    } else if (oldState != Code.PLANNER_STATE_ACTIVE && RDP_MST_STATE == Code.PLANNER_STATE_ACTIVE) {
                        // 이용제한 해제
                        this.messageService.sendAlimTalk(MessageType.PLANNER_STATE_ACTIVE, RDP_MST_HP, RDP_MST_MEM_NM);
                        this.messageService.sendAppPush(MessageType.PLANNER_STATE_ACTIVE, RDP_MST_NO, RDP_MST_MEM_NM);
                    }
                }
            }

            return result;
        } else {
            return 0;
        }
    }

}
