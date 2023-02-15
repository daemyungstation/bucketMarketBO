package common.code;

import java.util.LinkedHashMap;
import java.util.Map;

import lombok.Getter;

/**
 * <pre>
 * @PackageName: common.code
 * @FileName : Const.java
 * @Date : 2020. 3. 26.
 * @프로그램 설명 : 상수 모음
 * @author upleat
 * </pre>
 */
public class Const {
    
    @Getter
    public static enum ERROR {
        E499("E499", "필수 파라메터가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E499]"),
        E404("E404", "게시글을 찾을 수 없습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E404]"),
        E500("E500", "알수없는 오류가 발생되었습니다.");
        private String code;
        private String message;
        ERROR(String code, String message) {
            this.code = code;
            this.message = message;
        }
    }
    
    static public final String PC = "P"; // PC
    static public final String MOBILE = "M"; // MOBILE
    static public final String APP = "A"; // A
    static public final Map<String, String> DEVICE = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = -3950860101678375052L;
        {
            put(PC, "PC");
            put(MOBILE, "MOBILE");
        }
    };
    static public final Map<String, String> DEVICE_TYPE = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = 9042159987377341634L;
        {
            put(PC, "PC");
            put(MOBILE, "Mobile");
            put(APP, "Mobile App");
        }
    };
    
    static public final String LINK_TARGET_NONE ="N"; // 링크없음
    static public final String LINK_TARGET_HREF ="H"; // 페이지 이동
    static public final String LINK_TARGET_WINDOW ="W"; // 새창열림
    static public final Map<String, String> LINK_TARGET = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = 9042159987377341634L;
        {
            put(LINK_TARGET_NONE, "링크없음");
            put(LINK_TARGET_HREF, "페이지이동");
            put(LINK_TARGET_WINDOW, "새창열림");
        }
        
    };
    
    static private final int [] INITIAL_SOUND_01 = {44032, 45207}; // ㄱ, ㄲ
    static private final int [] INITIAL_SOUND_02 = {45208, 45795}; // ㄴ
    static private final int [] INITIAL_SOUND_03 = {45796, 46971}; // ㄷ, ㄸ
    static private final int [] INITIAL_SOUND_04 = {46972, 47559}; // ㄹ
    static private final int [] INITIAL_SOUND_05 = {47560, 48147}; // ㅁ
    static private final int [] INITIAL_SOUND_06 = {48148, 49323}; // ㅂ, ㅃ
    static private final int [] INITIAL_SOUND_07 = {49324, 50499}; // ㅅ, ㅆ
    static private final int [] INITIAL_SOUND_08 = {50500, 51087}; // ㅇ
    static private final int [] INITIAL_SOUND_09 = {51088, 52263}; // ㅈ, ㅉ
    static private final int [] INITIAL_SOUND_10 = {52264, 52851}; // ㅊ
    static private final int [] INITIAL_SOUND_11 = {52852, 53439}; // ㅋ
    static private final int [] INITIAL_SOUND_12 = {53440, 54027}; // ㅌ
    static private final int [] INITIAL_SOUND_13 = {54028, 54615}; // ㅍ
    static private final int [] INITIAL_SOUND_14 = {54616, 55203}; // ㅎ
    static public final Map<String, int[]> INITIAL_SOUNDS = new LinkedHashMap<String, int[]> () {
        private static final long serialVersionUID = -4084485735599019383L;
        {
            put("ㄱ", INITIAL_SOUND_01);
            put("ㄴ", INITIAL_SOUND_02);
            put("ㄷ", INITIAL_SOUND_03);
            put("ㄹ", INITIAL_SOUND_04);
            put("ㅁ", INITIAL_SOUND_05);
            put("ㅂ", INITIAL_SOUND_06);
            put("ㅅ", INITIAL_SOUND_07);
            put("ㅇ", INITIAL_SOUND_08);
            put("ㅈ", INITIAL_SOUND_09);
            put("ㅊ", INITIAL_SOUND_10);
            put("ㅋ", INITIAL_SOUND_11);
            put("ㅌ", INITIAL_SOUND_12);
            put("ㅍ", INITIAL_SOUND_13);
            put("ㅎ", INITIAL_SOUND_14);
        }
    };
    static public final String KEYWORD_TYPE_SEARCH = "S"; // 키워드 타입 검색
    static public final String KEYWORD_TYPE_LINKE = "L"; // 키워드 타입 링크
    static public final Map<String, String> KEYWORD_TYPES = new LinkedHashMap<String, String> () {
        private static final long serialVersionUID = 8711119362614729464L;
        {
            put(KEYWORD_TYPE_SEARCH, "상품 검색키워드");
            put(KEYWORD_TYPE_LINKE, "링크페이지 이동");
        }
    };
    
    static public final String PLANNER_PROFILE_IMAGE = "I"; // 프로필 이미지
    static public final String PLANNER_QUIZ_VIDEO = "V"; // 동영상
    static public final String PLANNER_QUIZ_PC_THUMBNAIL = "P"; // PC 섬네일
    static public final String PLANNER_QUIZ_MOBILE_THUMBNAIL = "M"; // MOBILE 섬네일
    
    static public final String PLANNER_PAYMENT_Y = "Y"; // 플래너 지급 여부 Y
    static public final String PLANNER_PAYMENT_N = "N"; // 플래너 지급 여부 N
    
    static public final String PERIOD_DAY = "day";
    static public final String PERIOD_MONTH = "month";
    static public final String PERIOD_YEAR = "year";
    
    static public final Map<String, String> PERIODS = new LinkedHashMap<String, String> () {
        private static final long serialVersionUID = -5709058377505596427L;
        {
            put(PERIOD_DAY, "일별");
            put(PERIOD_MONTH, "월별");
            put(PERIOD_YEAR, "연도별");
        }
    };
    
    static public final String MAN = "0001"; //성별 > 남성
    static public final String FEMALE = "0002"; // 성별 > 여성
}
