package web.message.model;

import com.fasterxml.jackson.annotation.JsonValue;

// 알림톡 버튼 타입
public enum MessageButtonType {

    WEB_LINK("WL"), // 웹 링크
    APP_LINK("AL"), // 앱 링크
    DELEVERY_STATUS("DS"), // 배송조회
    BOT_KEYWORD("BK"), // 봇키워드
    MESSAGE_DELEVERRY("MD"); // 메시지전달

    String type;

    MessageButtonType(String type) {
        this.type = type;
    }

    @JsonValue
    public String getType() {
        return type;
    }

}