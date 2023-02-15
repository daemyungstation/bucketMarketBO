package web.sci.name.model;

import org.apache.commons.lang3.StringUtils;

import lombok.Data;
import lombok.Getter;

/**
 * <pre>
 * &#64;PackageName: web.sci.name.model
 * &#64;FileName : SciNameCheckResult.java
 * &#64;Date : 2020. 5. 12.
 * &#64;프로그램 설명 : SCI 실명확인 결과
 * &#64;author upleat
 * </pre>
 */
@Data
public class SciNameCheckResult {

    @Getter
    public static enum RESULT_CODE {

        SUCCESS("1", true, "일치"), // 실명확인 DB가 일치
        FAIL("2", false, "불일치"), // 실명확인 DB와 불일치 또는 이름이 한글이 아님
        NOT_REGISTERED("3", false, "미등록"), // 실명확인 DB 미등록
        INPUT_ERROR("4", false, "입력값 오류"), // 주민등록번호 오류
        SYSTEM_ERROR("5", false, "에러"), // 시스템 장애
        IDENTITY("7", false, "명의도용방지"), // 명의도용방지가 설정된 경우
        SYSTEM_LOCK("9", false, "에러-9"), // 계속된 요청으로 인한 서비스 LOCK
        UNKNOWN("U", false, "알수없음"); // 알 수 없는 코드

        private String code;
        private boolean result;
        private String message;

        RESULT_CODE(String codeValue, boolean result, String codeMessage) {
            this.code = codeValue;
            this.result = result;
            this.message = codeMessage;
        }

        public static RESULT_CODE getCode(String value) {
            for (RESULT_CODE code : values()) {
                if (StringUtils.equals(code.getCode(), value)) {
                    return code;
                }
            }
            return UNKNOWN;
        }
    }

    private boolean success; // 결과
    private String message; // 메세지

    // 내부 처리용 변수
    private String retInfoOriginal; // 응답 결과 원본
    private String retInfo; // 응답 결과
    private String encMsg; // 위,변조여부1
    private String encMsg2; // 위,변조여부2
    private String msgChk; // 위조/변조 검증 결과
    private String reqNum; // 요청번호
    private String jumin1; // 주민번호1
    private String jumin2; // 주민번호2
    private String name; // 성명
    private String successCode; // 인증성공여부 코드
    private String discrHash; // 중복가입확인정보
    private String ciscrHash; // CI연계값
    private String ciVersion; // CI버전
    private String mmdd; // mmdd
    private String memId; // memId
    private String encKey; // encKey
    private String encPara; // 암호화된 통합 파라미터

    public SciNameCheckResult() {

    }

    public SciNameCheckResult(boolean result, String message) {
        this.success = result;
        this.message = message;
    }

    public void setSuccess(boolean result, String message) {
        this.success = result;
        this.message = message;
    }
}
