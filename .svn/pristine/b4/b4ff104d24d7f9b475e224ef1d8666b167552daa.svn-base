package web.message.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class MessageButton {

    private String name; // 버튼 제목
    private MessageButtonType type; // 버튼 타입
    private String url_pc; // PC 링크
    private String url_mobile; // 모바일 링크
    @JsonInclude(Include.NON_NULL)
    private String scheme_ios; // ios custom scheme
    @JsonInclude(Include.NON_NULL)
    private String scheme_android; // android custom scheme

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MessageButtonType getType() {
        return type;
    }

    public void setType(MessageButtonType type) {
        this.type = type;
    }

    public String getUrl_pc() {
        return url_pc;
    }

    public void setUrl_pc(String url_pc) {
        this.url_pc = url_pc;
    }

    public String getUrl_mobile() {
        return url_mobile;
    }

    public void setUrl_mobile(String url_mobile) {
        this.url_mobile = url_mobile;
    }

    public String getScheme_ios() {
        return scheme_ios;
    }

    public void setScheme_ios(String scheme_ios) {
        this.scheme_ios = scheme_ios;
    }

    public String getScheme_android() {
        return scheme_android;
    }

    public void setScheme_android(String scheme_android) {
        this.scheme_android = scheme_android;
    }

    @Override
    public String toString() {
        return "AlimTalkButton [name=" + name + ", type=" + type + ", url_pc=" + url_pc + ", url_mobile=" + url_mobile + ", scheme_ios=" + scheme_ios + ", scheme_android=" + scheme_android + "]";
    }

}
