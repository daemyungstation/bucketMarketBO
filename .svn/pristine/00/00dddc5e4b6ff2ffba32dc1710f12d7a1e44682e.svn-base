package web.batch.service.impl;

import java.net.InetAddress;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

import common.dao.CommonDefaultDAO;
import common.util.DateUtil;
import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.log4j.Log4j2;
import web.batch.model.B2bComModel;
import web.batch.model.CounsellMstModel;
import web.batch.model.OrderCnlModel;
import web.batch.model.OrderDpsModel;
import web.batch.model.OrderMstModel;
import web.batch.model.OrderRmtModel;
import web.batch.model.ProductModel;
import web.batch.model.RmtBasicModel;
import web.batch.model.VenderRequestModel;
import web.batch.service.BatchManagerService;
import web.bo.common.service.CommonService;
import web.message.MessageType;
import web.message.service.MessageService;

/**
 * @PackageName: web.bo.batch.service.impl
 * @FileName : BatchService.java
 * @Date : 2020. 05. 04.
 * @프로그램 설명 : DLCC 연동관련 BatchJob을 구현한다, context-scheduler.xml 에서 Job 스퀘줄링 한다.
 * @author upleat
 */

@Log4j2
@Service("batchManagerService")
public class BatchManagerServiceImpl implements BatchManagerService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonService")
    private CommonService commonService;
    
    @Resource(name = "messageService")
    private MessageService messageService;

    @Resource(name = "propertiesService")
    private EgovPropertyService properties;

    private StopWatch stopWatch;

    @Override
    public void doJob01() {

        log.info(" == [doJob01 : B2B업체정보 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob01");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                List<B2bComModel> list = defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectB2bCompanyList");

                list.forEach(model -> {
                    
                    try {
                        
                        defaultDAO.getSqlSession().insert("DlccMergeMapper.mergeB2bCode", model);
                        
                    } catch(Exception e) {
                        log.error("== [doJob01 : B2B업체정보 Merge Error]");
                        log.error("" + e);
                    }
                    

                });
            }

            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob01 : B2B업체정보 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob01 : B2B업체정보 End]");
    }

    @Override
    public void doJob02() {

        log.info(" == [doJob02 : 상품정보 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob02");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                List<ProductModel> list = defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectProductList");
                
                List<Map<String, Object>> dlccProdCodeList = this.commonService.selectCode("DLCC_PRODUCT_TYPE_MONTHLY_SUPPORT");
                
                list.forEach(model -> {
                    
                    for (Map<String, Object> dlccProductCodeMap : dlccProdCodeList) {
                        String prodCd = StringUtil.getString(dlccProductCodeMap, "CMN_COM_NM", "");
                        
                        if(prodCd.equals(model.getProdCd()))
                            model.setPartPaySupotYn("Y"); break;
                    }
                    
                    try {
                        
                        defaultDAO.getSqlSession().insert("DlccMergeMapper.mergeProduct", model);    
                        
                    } catch (Exception e) {
                        log.error("== [doJob02 : 상품정보 Merge Error]");
                        log.error("" + e);
                    }
                    
                });
            }

            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob02 : 상품정보 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob02 : 상품정보 End]");
    }

    @Override
    public void doJob04() {

        log.info(" == [doJob04 : 가입정보 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob04");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                List<OrderMstModel> list = defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectOrderMstList");

                list.forEach(model -> {                    
                    //상품별로 추가정보값을 DLCC의 특정 값으로 업데이트 
                    String [] ordMstVdrBnfIdCheck1 = {
                        "DMBK2021102702570258",
                        "DMBK2021070502550256",
                        "DMBK2021070202530254",
                        "DMBK2020073000760147",
                        "DMBK2020111601610162",
                        "DMBK2021012202010202",
                        "DMBK2020072900630069"
                    };
                    if(Arrays.asList(ordMstVdrBnfIdCheck1).contains(model.getPrdMstNo())) {
                        model.setOrdMstVdrBnfId(model.getKbNo());
                    }
                    
                    String [] ordMstVdrBnfIdCheck2 = {
                        "DMBK2020121401630165"
                    };
                    if(Arrays.asList(ordMstVdrBnfIdCheck2).contains(model.getPrdMstNo())) {
                        model.setOrdMstVdrBnfId(model.getOrderNum());
                    }
                    
                    String [] ordMstVdrBnfIdCheck3 = {
                        "DMBK2021060302500251",
                        "DMBK2021033002460247",
                        "DMBK2021030802240245",
                        "DMBK2021030802230244",
                        "DMBK2021030802220243",
                        "DMBK2021030802210242",
                        "DMBK2021030802200241",
                        "DMBK2021030502190240",
                        "DMBK2021030502180239",
                        "DMBK2021030502170238",
                        "DMBK2021030502160237",
                        "DMBK2021030502140236",
                        "DMBK2021030502130235",
                        "DMBK2021030502120234",
                        "DMBK2021030502110233",
                        "DMBK2021030502100232",
                        "DMBK2021030502090231",
                        "DMBK2021030402080230",
                        "DMBK2021030402070229",
                        "DMBK2021030402060228",
                        "DMBK2021030402050227",
                        "DMBK2021030402040226",
                        "DMBK2021030402030225"
                    };
                    if(Arrays.asList(ordMstVdrBnfIdCheck3).contains(model.getPrdMstNo())) {
                        model.setOrdMstVdrBnfId(model.getB2bEmpleNo() + "/" + model.getOrderNum());
                    }                    

                    try {
                        defaultDAO.getSqlSession().insert("DlccMergeMapper.mergeOrderMst", model);
                        defaultDAO.getSqlSession().insert("DlccMergeMapper.mergeOrderDLCC", model);

                    } catch (Exception e) {
                        log.error("== [doJob04 : 가입정보 Merge Error]");
                        log.error("" + e);
                    }
                });
            }

            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob04 : 가입정보 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob04 : 가입정보 End]");
    }

    @Override
    public void updateOrderDps(String month) {
        List<OrderDpsModel> list = defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectOrderDpsList", month);

        list.forEach(model -> {
            try {
                defaultDAO.getSqlSession().insert("DlccMergeMapper.insertOrderDps", model);
            } catch(Exception e) {
                log.error("== [doJob05De1 : 상세정산정보 Merge Error]");
                log.error("" + e);
            }
        });
    }

    @Override
    public void doJob05De1() {

        log.info(" == [doJob05De1 : 상세정산정보 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob05De1");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                // 마감년월
                String payInDay = DateUtil.addMonth(DateUtil.getToday(), 0).substring(0, 6);
                updateOrderDps(payInDay);

                String payPreMonth = DateUtil.addDay(DateUtil.addMonth(DateUtil.getToday(), 0), -1).substring(0, 6);
                if( !payInDay.equals(payPreMonth) ) {
                    updateOrderDps(payPreMonth);
                }
            }
            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob05De1 : 상세정산정보 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob05De1 : 상세정산정보 End]");

    }

    @Override
    public void doJob06() {

        log.info(" == [doJob06 : 해약환급금정보 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob06");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                // Target PROD_CD
                List<ProductModel> prodCdList = defaultDAO.getSqlSession().selectList("DlccMergeMapper.selectProdCdList");

                prodCdList.forEach(prodModel -> {

                    List<OrderCnlModel> cnllist = defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectOrderCnlList", prodModel.getProdCd());

                    cnllist.forEach(cnlModel -> {
                        
                        try {
                            
                            defaultDAO.getSqlSession().insert("DlccMergeMapper.mergeOrderCnl", cnlModel);
                            
                        } catch(Exception e){
                            log.error("== [doJob06 : 해약환급금정보 Merge Error]");
                            log.error("" + e);
                        }
                        
                    });

                });
            }

            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob06 : 해약환급금정보 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob06 : 해약환급금정보 End]");

    }

    @Override
    public void doJob09() {

        log.info(" == [doJob09 : 레디플래너 정산정보 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob09");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                String payInDay = DateUtil.addMonth(DateUtil.getToday(), -1).substring(0, 6);
                List<OrderRmtModel> list = defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectOrderRmtList", payInDay);

                list.forEach(model -> {
                    
                    try{
                        
                        defaultDAO.getSqlSession().insert("DlccMergeMapper.insertOrderRmt", model);
                        
                    } catch(Exception e) {
                        log.error("== [doJob09 : 레디플래너 정산정보 Merge Error]");
                        log.error("" + e);
                    }
                    
                });
            }

            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob09 : 레디플래너 정산정보 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob09 : 레디플래너 정산정보 End]");

    }

    @Override
    public void doJob10() {

        log.info(" == [doJob10 : 레디플레너 기초정산 정보 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob10");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                List<RmtBasicModel> list = defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectRmtBasicList");
                
                list.forEach(model -> {
                    
                    try{
                        
                        defaultDAO.getSqlSession().insert("DlccMergeMapper.mergeBasicRmt", model);
                        
                    }catch(Exception e){ 
                        log.error("== [doJob10 : 레디플레너 기초정산 정보 Merge Error]");
                        log.error("" + e);
                    }
                });
            }

            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob10 : 레디플레너 기초정산 정보 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob10 : 레디플레너 기초정산 정보 End]");

    }

    @Override
    public void doJob11() {

        log.info(" == [doJob11 : 레디플레너 정산알람 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob11");

        try {

            // 서비스 호출부분
            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {

                List<VenderRequestModel> list = defaultDAO.getSqlSession().selectList("DlccMergeMapper.selectVenderRequestList");
                list.forEach(vender -> {

                    // 정산 알림
                    // TODO 지급 기간 일자 추가
                    try {
                        
                        this.messageService.sendAlimTalk(MessageType.SCM_REQUEST, vender.getCell(), vender.getVdrMstNm(), System.currentTimeMillis(), System.currentTimeMillis());
                        
                    } catch(Exception e) {
                        log.error("== [doJob11 : 레디플레너 정산알람 Send Error]");
                        log.error("" + e);
                    }
                    
                });

            }

        } catch (Exception e) {
            log.error("== [doJob11 : 레디플레너 정산알람 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob11 : 레디플레너 정산알람 End]");
    }
    
    @Override
    public void doJob12() {

        log.info(" == [doJob12 : 상담결과 Start] / " + this.getServer() + " / " + properties.getString("scheduler.task.exce.server.ip"));
        stopWatch = new StopWatch("doJob12");

        try {

            stopWatch.start();

            if (this.getServer().equals(properties.getString("scheduler.task.exce.server.ip"))) {
                List<CounsellMstModel> list = defaultDAO.getSqlSessionConForDlcc().selectList("DlccConViewMapper.selectCounsellMstList");
                
                list.forEach(model -> {
                    
                    try{
                        
                        defaultDAO.getSqlSession().insert("DlccConMergeMapper.insertCounsellMst", model);
                        
                    }catch(Exception e){ 
                        log.error("== [doJob12 : 상담결과 Merge Error]");
                        log.error("" + e);
                    }
                });
            }

            stopWatch.stop();

        } catch (Exception e) {
            log.error("== [doJob12 : 상담결과 Error]");
            log.error("" + e);
        }

        log.info(" == Exce Time : " + stopWatch.getTotalTimeSeconds() + "/초");
        log.info(" == [doJob12 : 상담결과 End]");
    }

    private String getServer() {

        String serverIp = "";

        try {

            serverIp = InetAddress.getLocalHost().getHostAddress();

        } catch (Exception e) {
            log.error("" + e);
        }
        return serverIp;
    }

}
