package web.sci.name.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.sci.v2.comm.secu.SciSecuManager;
import com.sci.v2.comm.secu.hmac.SciHmac;

import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.slf4j.Slf4j;
import web.sci.name.model.SciNameCheckRequest;
import web.sci.name.model.SciNameCheckResult;
import web.sci.name.model.SciNameCheckResult.RESULT_CODE;
import web.sci.name.service.SciNameCheckService;

/**
 * <pre>
 * &#64;PackageName: web.sci.name.service
 * &#64;FileName : SciNameCheckService.java
 * &#64;Date : 2020. 5. 12.
 * &#64;프로그램 설명 : SCI 실명확인 서비스
 * &#64;author upleat
 * </pre>
 */
@Slf4j
@Service("sciNameCheckService")
public class SciNameCheckServiceImpl implements SciNameCheckService {

    @Value("#{resource['front.ssl.domain']}")
    private String pcDomain;

    @Value("#{resource['mobile.ssl.domain']}")
    private String mobileDomain;

    @Resource(name = "sciPropertiesService")
    private EgovPropertyService properties;

    /**
     * <pre>
     * 1. MethodName : checkName
     * 2. ClassName  : SciNameCheckServiceImpl.java
     * 3. Comment    : 실명확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @see web.sci.name.service.SciNameCheckService#nameCheck(java.util.Map)
     * @param commandMap
     * @throws Exception
     */
    @Override
    public SciNameCheckResult nameCheck(HttpServletRequest httpReq, SciNameCheckRequest param) {

        log.info("nameCheck() param : {}", new Object[] { param });

        try {

            // 필수값 확인
            boolean checkPrimary = StringUtils.isAnyBlank(new String[] { param.getSrvNo(), param.getJumin1(), param.getJumin2(), param.getName() });
            if (checkPrimary) {
                return new SciNameCheckResult(false, "필수값 누락");
            }

            // 요청 암호화
            this.makeRequest(param);

            // HTTP 데이터 생성
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(new MediaType("application", "x-www-form-urlencoded", Charset.forName("UTF-8")));
            headers.add("referer", httpReq.getHeader("referer")); // 요청한 페이지 정보
            headers.add("accept-charset", "UTF-8"); // 인코딩
            LinkedMultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
            map.add("reqInfo", param.getReqInfo());
            map.add("ok_url", param.getRetUrl());
            HttpEntity<MultiValueMap<String, String>> requestBody = new HttpEntity<MultiValueMap<String, String>>(map, headers);

            log.info("nameCheck() requestUrl : {}, requestBody : {}", param.getActionUrl(), requestBody.toString());

            // HTTP 요청
            String responseBody = new RestTemplate().postForEntity(param.getActionUrl(), requestBody, String.class).getBody();

            // 응답 데이터 복호화
            SciNameCheckResult result = this.parseResonse(param, responseBody);
            log.info("nameCheck() return : {}", result);
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            return new SciNameCheckResult(false, "처리중 오류");
        }
    }

    /**
     * <pre>
     * 1. MethodName : generateRequest
     * 2. ClassName  : SciNameCheckServiceImpl.java
     * 3. Comment    : 요청데이터 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param param
     * @return
     * @throws UnsupportedEncodingException
     */
    private SciNameCheckRequest makeRequest(SciNameCheckRequest param) throws UnsupportedEncodingException {

        log.info("makeRequest() param : {}", param);

        // 요청 번호를 위한 난수 생성
        String tempNo = String.valueOf(System.nanoTime());

        // 요청 데이터 생성
        String id = this.properties.getString("sci.name.check.service.id"); // 실명확인 회원사 아이디
        String srvNo = param.getSrvNo(); // 실명확인 서비스번호
        String reqNum = tempNo + RandomStringUtils.random(30 - tempNo.length(), false, true); // 요청번호
        String jumin1 = param.getJumin1(); // 주민등록번호 1
        String jumin2 = param.getJumin2(); // 주민등록번호 2
        String name = URLEncoder.encode(param.getName(), "UTF-8"); // 이름
        String exVar = "0000000000000000"; // 복호화용 임시필드
        String retUrl = this.pcDomain + "/sci/returnUrl"; // 실명확인 결과수신 URL - 응답 HTML을 직접 파싱하므로 사용되지 않음

        // 요청 서비스 결정 - 내국인/외국인
        String actionUrl = "";
        if ("5".equals(jumin2.substring(0, 1)) || "6".equals(jumin2.substring(0, 1)) || "7".equals(jumin2.substring(0, 1)) || "8".equals(jumin2.substring(0, 1))) {
            actionUrl = this.properties.getString("sci.foreign.name.check.service.url");
        } else {
            actionUrl = this.properties.getString("sci.name.check.service.url");
        }

        log.info("makeRequest() id : {}, srvNo : {}, reqNum : {}, jumin1 : {}, jumin2 : {}, name : {}, exVar : {}, retUrl : {}, actionUrl  : {}", new String[] { id, srvNo, reqNum, jumin1, jumin2, name, exVar, retUrl, actionUrl });

        // 01. 암호화 모듈 선언
        SciSecuManager seed = new SciSecuManager();

        // 02. 1차 암호화
        String encStr = "";
        String reqInfo = id + "/" + jumin1 + "/" + jumin2 + "/" + name + "/" + reqNum + "/" + srvNo + "////" + exVar; // 데이터 암호화
        encStr = seed.getEnc(reqInfo, "");

        // 03. 위변조 검증 값 생성
        String hmacMsg = SciHmac.HMacEncript(encStr);

        // 03. 2차 암호화
        reqInfo = seed.getEnc(encStr + "/" + hmacMsg + "/" + "0000000000000000", ""); //2차암호화

        // 저장
        param.setId(id);
        param.setReqNum(reqNum);
        param.setExVar(exVar);
        param.setRetUrl(retUrl);
        param.setActionUrl(actionUrl);
        param.setReqInfo(reqInfo);

        log.info("makeRequest() return : {}", param);

        return param;
    }

    /**
     * <pre>
     * 1. MethodName : parseResonse
     * 2. ClassName  : SciNameCheckServiceImpl.java
     * 3. Comment    : 응답 HTML 파싱 및 결과 데이터 복호화
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param body
     * @return
     * @throws UnsupportedEncodingException
     */
    private SciNameCheckResult parseResonse(SciNameCheckRequest request, String body) throws UnsupportedEncodingException {

        SciNameCheckResult result = new SciNameCheckResult(); // 처리 결과

        Document returnDoc = Jsoup.parse(body);

        // 응답 결과값
        String retInfo = returnDoc.select("input[name='retInfo']").val();
        result.setRetInfoOriginal(retInfo);

        // 1. 암호화 모듈 (jar) Loading
        SciSecuManager sciSecuMg = new SciSecuManager();

        // 요청 번호값을 Key로 생성 한다.
        retInfo = sciSecuMg.getDec(retInfo, request.getReqNum());
        result.setRetInfo(retInfo);

        // 2. 1차 파싱---------------------------------------------------------------
        int inf1 = retInfo.indexOf("/", 0);
        int inf2 = retInfo.indexOf("/", inf1 + 1);

        String encPara = retInfo.substring(0, inf1); // 암호화된 통합 파라미터
        String encMsg = retInfo.substring(inf1 + 1, inf2); // 암호화된 통합 파라미터의 Hash값
        String encMsg2 = sciSecuMg.getMsg(encPara); // 위,변조여부2
        result.setEncPara(encPara);
        result.setEncMsg(encMsg);
        result.setEncMsg2(encMsg2);

        // 3. 위/변조 검증 ---------------------------------------------------------------
        if (encMsg2.equals(encMsg) == false) {
            result.setSuccess(false, "위/변조 검증 실패");
        }

        // 4. 복호화 및 위/변조 검증 ---------------------------------------------------------------
        retInfo = sciSecuMg.getDec(encPara, request.getReqNum());
        result.setRetInfo(retInfo);

        int info1 = retInfo.indexOf("/", 0);
        int info2 = retInfo.indexOf("/", info1 + 1);
        int info3 = retInfo.indexOf("/", info2 + 1);
        int info4 = retInfo.indexOf("/", info3 + 1);
        int info5 = retInfo.indexOf("/", info4 + 1);
        int info6 = retInfo.indexOf("/", info5 + 1);
        int info7 = retInfo.indexOf("/", info6 + 1);
        int info8 = retInfo.indexOf("/", info7 + 1);
        int info9 = retInfo.indexOf("/", info8 + 1);
        int info10 = retInfo.indexOf("/", info9 + 1);

        String reqNum = retInfo.substring(0, info1); // 요청번호
        String jumin1 = retInfo.substring(info1 + 1, info2); // 주민번호1
        String jumin2 = retInfo.substring(info2 + 1, info3); // 주민번호2
        String name = retInfo.substring(info3 + 1, info4); // 성명
        String successCode = retInfo.substring(info4 + 1, info5); // 인증성공여부 코드
        String discrHash = retInfo.substring(info5 + 1, info6); // 중복가입확인정보
        String ciscrHash = retInfo.substring(info6 + 1, info7); // CI연계값
        String ciVersion = retInfo.substring(info7 + 1, info8); // CI버전
        String memId = retInfo.substring(info8 + 1, info9); // memId
        String encKey = retInfo.substring(info9 + 1, info10); // encKey
        String mmdd = retInfo.substring(info10 + 1, retInfo.length()); // mmdd
        discrHash = sciSecuMg.getDec(discrHash, request.getReqNum()); // 암호화된 중복가입확인정보 한번더 복호화
        ciscrHash = sciSecuMg.getDec(ciscrHash, request.getReqNum()); // 암호화된 CI연계값 한번더 복호화

        result.setReqNum(reqNum);
        result.setJumin1(jumin1);
        result.setJumin2(jumin2);
        result.setName(URLDecoder.decode(name, "UTF-8"));
        result.setSuccessCode(successCode);
        result.setDiscrHash(discrHash);
        result.setCiscrHash(ciscrHash);
        result.setCiVersion(ciVersion);
        result.setMemId(memId);
        result.setEncKey(encKey);
        result.setMmdd(mmdd);
        result.setDiscrHash(discrHash);
        result.setCiscrHash(ciscrHash);

        // 실명확인 결과
        RESULT_CODE resultCode = RESULT_CODE.getCode(successCode);
        result.setSuccess(resultCode.isResult(), resultCode.getMessage());

        log.info("parseResonse() return : {}", result);

        return result;
    }
}
