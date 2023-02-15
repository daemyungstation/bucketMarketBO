package web.pg.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.inicis.std.util.SignatureUtil;

import common.code.PaymentGate;
import common.dao.CommonDefaultDAO;
import common.util.DateUtil;
import common.util.HttpConnectionUtil;
import common.util.HttpConnectionUtil.HttpMethod;
import common.util.IPUtil;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;
import net.sf.json.JSONObject;
import web.pg.service.IniPayService;

@Log4j2
@Service("iniPayService")
public class IniPayServiceImpl implements IniPayService {
    
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    @Value("#{pg['pg.sign.key']}")
    private String signKey;
    
    @Value("#{pg['pg.charset']}")
    private String charset;
    
    @Value("#{pg['pg.refund.type']}")
    private String refundType;
    
    @Value("#{pg['pg.refund.url']}")
    private String refundUrl;
    
    @Value("#{pg['pg.refund.key']}")
    private String refundKey;
    
    @Value("#{pg['pg.mobile.accept.charset']}")
    private String acceptCharset;
    
    @Value("#{pg['pg.content.type']}")
    private String contentType;
    
    
    /**
     * <pre>
     * 1. MethodName : selectIniPayApvInfo
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 관리자 > Payment Gate > 승인 결과 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.pg.service.IniPayService#selectIniPayApvInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectIniPayApvInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("IniPay.selectIniPayApvInfo", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayCnlReqMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 관리자 > Payment Gate > 취소 요청 데이터 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayCnlReqMap(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> info = this.selectIniPayApvInfo(commandMap);
        String oid = StringUtil.getString(info, "P_OID"); // 상점 주문번호
        String payMstIdx = StringUtil.getString(info, "PAY_MST_IDX"); // payment gate key
        String type = this.refundType; // "Refund" 고정
        String paymethod = StringUtil.getString(info, "P_TYPE"); // 지불수단 코드
        String timestamp = DateUtil.getCurrentDateTime(); // 전문생성시간(YYYYMMDDhhmmss)
        String clientIp = IPUtil.getServerIP(); // 요청 서버IP
        String mid = StringUtil.getString(info, "P_MID"); // 가맹점 ID
        String tid = StringUtil.getString(info, "P_TID"); // 취소요청 TID
        String msg = StringUtil.getString(commandMap, "MSG"); // 취소요청사유
        String hashData = SignatureUtil.hash((this.refundKey + type + paymethod + timestamp + clientIp + mid + tid), "SHA-512"); // 전문위변조 HASH
        log.debug("hashData : [{}]", hashData);
        log.debug("this.refundKey : [{}]", this.refundKey);
        Map<String, Object> params = new HashMap<>();
        params.put("oid", oid);
        params.put("payMstIdx", payMstIdx);
        params.put("type", type);
        params.put("paymethod", paymethod);
        params.put("timestamp", timestamp);
        params.put("clientIp", clientIp);
        params.put("mid", mid);
        params.put("tid", tid);
        params.put("msg", msg);
        params.put("hashData", hashData);
        return params;
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayCnlReqResultMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 관리자 > Payment Gate > 취소 요청 결과 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param params
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayCnlReqResultMap(Map<String, Object> params) throws Exception {
        Map<String, Object> headers = new HashMap<>();
        headers.put("Accept-Charset", this.acceptCharset);
        headers.put("Content-Type", this.contentType);
        Map<String, Object> resultMap = new HashMap<>();
        try {
            resultMap = HttpConnectionUtil.excute(this.refundUrl, HttpMethod.POST, headers, params, this.charset, JSONObject.class);
        } catch (Exception e) {
            if (log.isDebugEnabled()) {
                e.printStackTrace();
            } else {
                Arrays.toString(e.getStackTrace());
            }
        }
        log.debug("resultMap : [{}]", resultMap);
        String resultCode = StringUtil.getString(resultMap, "resultCode", PaymentGate.RESULT.UNKNOWN.getCode());
        PaymentGate.RESULT result = PaymentGate.RESULT.getResult(resultCode);
        resultMap.put("isSuccess", result.isSuccess());
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertIniPayCnlReq
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 관리자 > Payment Gate > 취소 요청 / 결과
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.pg.service.IniPayService#insertIniPayCnlReq(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> insertIniPayCnlReq(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("isSuccess", false);
        Map<String, Object> params = this.getIniPayCnlReqMap(commandMap);
        params.put("CNL_REQ_REG_IP", IPUtil.getClientIP());
        int result = this.defaultDAO.insert("IniPay.insertIniPayCnlReq", params);
        if (result > 0) {
            Map<String, Object> data = this.getIniPayCnlReqResultMap(params);
            data.put("CNL_REQ_IDX", StringUtil.getString(params, "CNL_REQ_IDX"));
            data.put("CNL_RET_REG_IP", IPUtil.getClientIP());
            this.defaultDAO.insert("IniPay.insertIniPayCnlReqResult", data);
            if ((boolean) data.get("isSuccess")) {
                this.defaultDAO.update("IniPay.updateIniPayMaster", params);
            }
            returnMap.putAll(data);
        }
        return returnMap;
    }    
}
