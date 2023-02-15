package common.code;

import java.util.LinkedHashMap;
import java.util.Map;

import lombok.Getter;

public class PaymentGate {

    @Getter
    public static enum RESULT {
        S00("00", true),
        S0000("0000", true),
        E01("01", false),
        UNKNOWN("E500", false);
        private String code;
        private boolean isSuccess;
        RESULT(String code, boolean isSuccess) {
            this.code = code;
            this.isSuccess = isSuccess;
        }
        public static RESULT getResult(String code) {
            for (RESULT result : values()) {
                if (result.getCode().equals(code)) {
                    return result;
                }
            }
            return UNKNOWN;
        }
    }
    public static final String STATE_NORMAL = "N"; // PG 상태 > 정상
    public static final String STATE_CANCEL = "C"; // PG 상태 > 취소
    
    public static final String QUOTABASE1 = "00"; // 할부개월수 > 일시불
    public static final String QUOTABASE2 = "2"; // 할부개월수 > 2개월 할부
    public static final String QUOTABASE3 = "3"; // 할부개월수 > 3개월 할부
    public static final String QUOTABASE4 = "4"; // 할부개월수 > 4개월 할부
    public static final String QUOTABASE5 = "5"; // 할부개월수 > 5개월 할부
    public static final String QUOTABASE6 = "6"; // 할부개월수 > 6개월 할부
    public static final String QUOTABASE7 = "7"; // 할부개월수 > 7개월 할부
    public static final String QUOTABASE8 = "8"; // 할부개월수 > 8개월 할부
    public static final String QUOTABASE9 = "9"; // 할부개월수 > 9개월 할부
    public static final String QUOTABASE10 = "10"; // 할부개월수 > 10개월 할부
    public static final String QUOTABASE11 = "11"; // 할부개월수 > 11개월 할부
    public static final String QUOTABASE12 = "12"; // 할부개월수 > 12개월 할부
    public static final Map<String, String> QUOTABASE = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = 3086494506918372500L;
        {
            put(QUOTABASE1, "일시불");
            put(QUOTABASE2, "2개월");
            put(QUOTABASE3, "3개월");
            put(QUOTABASE4, "4개월");
            put(QUOTABASE5, "5개월");
            put(QUOTABASE6, "6개월");
            put(QUOTABASE7, "7개월");
            put(QUOTABASE8, "8개월");
            put(QUOTABASE9, "9개월");
            put(QUOTABASE10, "10개월");
            put(QUOTABASE11, "11개월");
            put(QUOTABASE12, "12개월");
        }
    };
    
}
