package web.message.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import common.dao.CommonDefaultDAO;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.slf4j.Slf4j;
import web.message.MessageType;
import web.message.model.MessageButton;
import web.message.model.MessageTemplate;
import web.message.service.MessageService;

@Slf4j
@Service("messageService")
public class MessageServiceImpl implements MessageService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "messagePropertiesService")
    private EgovPropertyService messagePropertiesService;

    @Resource
    private Map<String, MessageTemplate> templates;

    @Value("${spring.profiles.active:prd}")
    private String activeProfile;

    /**
     * 알림톡 전송
     * 
     * @param template
     * @param phone
     * @param args
     * @throws JsonProcessingException
     */
    @Override
    public void sendAlimTalk(MessageType type, String phone, Object... args) {

        try {

            // 템플릿
            MessageTemplate template = templates.get(type.getTemplateCode());

            // 템플릿 코드
            String templateCode = "";
            if ("prd".equals(this.activeProfile)) {
                templateCode = type.getTemplateCode();
            } else {
                // 아래는 테스트 코드. local, dev 에서만 사용
                if ("BM019".equals(type.getTemplateCode())) {
                    templateCode = type.getTemplateCode();
                } else if ("BM004".equals(type.getTemplateCode())) {
                    templateCode = "TT" + type.getTemplateCode();
                } else if ("BM005".equals(type.getTemplateCode())) {
                    templateCode = "TT" + type.getTemplateCode();
                } else if ("BM022".equals(type.getTemplateCode())) {
                    templateCode = type.getTemplateCode();
                } else {
                    templateCode = "T" + type.getTemplateCode();
                }
            }

            log.info("- sendAlimTalk : activeProfile [{}], templateCode [{}]", activeProfile, templateCode);

            // 전송 요청
            Map<String, Object> params = new HashMap<>();
            // params.put("SERIALNUM", null);
            // params.put("ID", null);
            params.put("PHONE", phone);
            params.put("CALLBACK", "1644-8399");
            // params.put("REQDATE", "");
            params.put("MSG", String.format(template.getMessage(), args));
            params.put("TEMPLATE_CODE", templateCode); // 템플릿 코드
            params.put("PROFILE_KEY", this.messagePropertiesService.getString("alimtalk.profile.key"));
            params.put("FAILED_TYPE", "MMS");
            params.put("FAILED_SUBJECT", template.getTitle());
            params.put("FAILED_MSG", String.format(template.getMessage(), args));
            if (template.getButton() != null) {
                List<MessageButton> buttonList = template.getButton();
                for (MessageButton button : buttonList) {
                    button.setUrl_pc(String.format(button.getUrl_pc(), args));
                    button.setUrl_mobile(String.format(button.getUrl_mobile(), args));
                }
                params.put("BUTTON_JSON", new ObjectMapper().writeValueAsString(template));
            }

            log.info("- sendAlimTalk : {} [ {} ], to : {}, params : {}", new Object[] { type.getTemplateCode(), type.getTemplateName(), phone, params });

            this.defaultDAO.insert("Message.insertAlimTalkRequest", params);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 앱푸시 전송
     * 
     * @param template
     * @param phone
     * @param args
     * @throws JsonProcessingException
     */
    @Override
    public void sendAppPush(MessageType type, String plannerNo, Object... args) {

        try {

            // 템플릿
            MessageTemplate template = templates.get(type.getTemplateCode());

            // 전송 요청
            Map<String, Object> params = new HashMap<>();
            params.put("appkey", messagePropertiesService.getString("finger.push.app.key")); // 핑거푸시 앱 키 값
            params.put("appsecret", messagePropertiesService.getString("finger.push.app.secret")); // 핑거푸시 앱 시크릿 값
            params.put("msgtitle", template.getTitle()); // 푸시 메시지 타이틀
            params.put("msgcontents", String.format(template.getMessage(), args)); // 푸시 메시지 내용
            params.put("identify", plannerNo); // 푸시 수신 타겟 식별자
            params.put("mode", "STOS"); // STOS - 타겟 발송
            params.put("bgcolor", "#080000"); // 알림배경색
            params.put("fontcolor", "#FBF3F3"); // 알림폰트색
            params.put("link", null);
            params.put("labelCode", null);

            log.info("- sendAppPush : {} [ {} ], to : {}, params : {}", new Object[] { type.getTemplateCode(), type.getTemplateName(), plannerNo, params });

            this.defaultDAO.insert("Message.insertFingerPushRequest", params);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
