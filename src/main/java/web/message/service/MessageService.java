package web.message.service;

import web.message.MessageType;

/**
 * <pre>
 * &#64;PackageName: web.mplace.alimtalk.service
 * &#64;FileName : messageService.java
 * &#64;Date : 2020. 6. 17.
 * &#64;프로그램 설명 : 카카오 알림톡 서비스
 * &#64;author upleat
 * </pre>
 */
public interface MessageService {

    public void sendAlimTalk(MessageType alimTalk, String phone, Object... args);

    public void sendAppPush(MessageType alimTalk, String plannerNo, Object... args);
}
