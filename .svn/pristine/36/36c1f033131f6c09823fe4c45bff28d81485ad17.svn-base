package web.dozn.bank.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.UnknownHttpStatusCodeException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import common.dao.CommonDefaultDAO;
import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import web.dozn.bank.service.DoznBankingService;

/**
 * <pre>
 * &#64;PackageName: web.dozn.bank.service.impl
 * &#64;FileName : DoznBankingServiceImpl.java
 * &#64;Date : 2020. 5. 4.
 * &#64;프로그램 설명 : DOZN 펌뱅킹 서비스
 * &#64;author upleat
 * </pre>
 */
@Slf4j
@Service("doznBankingService")
public class DoznBankingServiceImpl implements DoznBankingService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "bankingPropertiesService")
    private EgovPropertyService properties;

    /**
     * <pre>
     * 1. MethodName : inquireDepositor
     * 2. ClassName  : CommonAccountServiceImpl.java
     * 3. Comment    : 예금주 조회
     * 4. 작성자       : upleat    
     * 5. 작성일       : 2020. 4. 29.
     * </pre>
     *
     * @see web.bo.common.service.DoznBankingService#inquireDepositor(java.util.Map)
     * @param commandMap
     * @return
     * @throws IOException
     * @throws JsonMappingException
     * @throws JsonParseException
     */
    @Override
    public Map<String, Object> inquireDepositor(Map<String, Object> commandMap) {

        // 거래 고유번호 생성
        int telegramNo = defaultDAO.selectCount("DoznBanking.selectTelegramNo", null);

        String requestUrl = properties.getString("dosn.banking.url.inquire.depositor");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        JSONObject requestBody = new JSONObject();
        requestBody.put("api_key", properties.getString("dosn.banking.api.key"));
        requestBody.put("org_code", properties.getString("dosn.banking.org.code"));
        requestBody.put("telegram_no", telegramNo);
        requestBody.put("bank_code", StringUtil.fillLeft(StringUtil.getString(commandMap, "bankCode"), 3, "0"));
        requestBody.put("account", StringUtil.getString(commandMap, "bankAccount"));
        requestBody.put("check_depositor", properties.getString("dosn.banking.check.depositor"));
        requestBody.put("identify_no", StringUtil.getString(commandMap, "BANK_IDENTIFY_NO"));

        log.info("inquireDepositor() requestUrl : {}, requestBody : {}", requestUrl, requestBody.toString());

        String responseBody = null;
        try {
            responseBody = new RestTemplate().postForObject(requestUrl, new HttpEntity<String>(requestBody.toString(), headers), String.class);
        } catch (UnknownHttpStatusCodeException e) {
            responseBody = e.getResponseBodyAsString();
        } catch (HttpStatusCodeException e) {
            responseBody = e.getResponseBodyAsString();
        }

        log.info("inquireDepositor() responseBody : {}", responseBody);

        Map<String, Object> resultMap = new HashMap<>();
        try {
            DoznBankingResponse response = new ObjectMapper().readValue(responseBody, DoznBankingResponse.class);
            if (response.getStatus() == 200) {
                resultMap.put("result", true);
                resultMap.put("depositor", response.getDepositor());
            } else if (response.getStatus() == 520) {
                resultMap.put("result", false);
                resultMap.put("message", response.getError_message());
            } else {
                resultMap.put("result", false);
                resultMap.put("message", "처리 중 오류 [ " + response.getStatus() + "-" + response.getError_code() + " ]");
            }
        } catch (IOException e) {
            resultMap.put("result", false);
            resultMap.put("message", "처리 중 오류");
        }

        return resultMap;
    }

    @Data
    private static class DoznBankingResponse {
        private int status; // 응답 상태 코드
        private String error_code; // 은행 오류코드
        private String error_message; // 은행 오류 메세지
        private String natv_tr_no; // 더즌 거래번호
        private String request_at; // 요청일시
        private String depositor; // 예금주명
    }

}
