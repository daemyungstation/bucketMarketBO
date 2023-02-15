package web.bo.main.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import web.bo.main.service.DashboardMainService;

@Service("dashboardMainService")
public class DashboardMainServiceImpl implements DashboardMainService {
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectDashboardMainInfo
     * 2. ClassName  : DashboardMainServiceImpl.java
     * 3. Comment    : 관리자 > 대시보드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 12.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectDashboardMainInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        if (!SessionsManager.isScm()) {
            returnMap.put("today", defaultDAO.select("DashboardMain.selectSummaryTodayInfo", commandMap));
            returnMap.put("unpaidPoint", defaultDAO.selectCount("DashboardMain.selectUnpaidPointCount", commandMap));
            returnMap.put("rentalCnt", defaultDAO.select("DashboardMain.selectRentalStateByCount", commandMap));
            returnMap.put("deliveryReady", defaultDAO.selectCount("DashboardMain.selectDeliveryReadyCount", commandMap));
            returnMap.put("claimCancel", defaultDAO.selectCount("DashboardMain.selectClaimCancelCount", commandMap));
            returnMap.put("lifeService", defaultDAO.selectCount("DashboardMain.selectLifeServiceCount", commandMap));
            returnMap.put("transfer", defaultDAO.selectCount("DashboardMain.selectTransferCount", commandMap));
            returnMap.put("payMethod", defaultDAO.selectCount("DashboardMain.selectPayMethodCount", commandMap));
            returnMap.put("unprocessed", defaultDAO.selectCount("DashboardMain.selectUnprocessedCount", commandMap));
            returnMap.put("readyPlanner", defaultDAO.select("DashboardMain.selectReadyPlannerUnprocessedCount", commandMap));
            returnMap.put("productState", defaultDAO.select("DashboardMain.selectUnionProductStateCount", commandMap));
            returnMap.put("readyPlanerState", defaultDAO.select("DashboardMain.selectReadyPlanerStateCount", commandMap));
            returnMap.put("eventState", defaultDAO.select("DashboardMain.selectEventStateCount", commandMap));
            returnMap.put("planState", defaultDAO.select("DashboardMain.selectPlanStateCount", commandMap));
            returnMap.put("productQnA", defaultDAO.selectCount("DashboardMain.selectProductQnACount", commandMap));
            returnMap.put("inquiry", defaultDAO.selectCount("DashboardMain.selectInquiryCount", commandMap));
            returnMap.put("contactUs", defaultDAO.selectCount("DashboardMain.selectContactUsCount", commandMap));
        } else {
            commandMap.put("ADM_MST_SUB_IDX", SessionsManager.getSessionValue("ADM_MST_SUB_IDX"));
            returnMap.put("unpaidPoint", defaultDAO.selectCount("DashboardMain.selectUnpaidPointCount", commandMap));
            returnMap.put("rentalCnt", defaultDAO.select("DashboardMain.selectRentalStateByCount", commandMap));
            returnMap.put("deliveryReady", defaultDAO.selectCount("DashboardMain.selectDeliveryReadyCount", commandMap));
            returnMap.put("vendorProductState", defaultDAO.select("DashboardMain.selectVendorProductStateCount", commandMap));
            returnMap.put("vendorNoticeBoard", defaultDAO.selectList("DashboardMain.selectVendorNoticeBoardList", commandMap));
            returnMap.put("productQnA", defaultDAO.selectCount("DashboardMain.selectProductQnACount", commandMap));
        } 
        return returnMap;
    }    
    
}

