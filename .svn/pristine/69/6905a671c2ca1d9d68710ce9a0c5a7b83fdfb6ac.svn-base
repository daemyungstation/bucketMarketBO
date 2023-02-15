package web.sms.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import egovframework.rte.fdl.property.EgovPropertyService;
import web.sms.service.SmsService;

@Service("smsService")
public class SmsServiceImpl implements SmsService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="propertiesService")
    private EgovPropertyService propertiesService;

    /**
     * <pre>
     * 1. MethodName : SmsServiceImpl
     * 2. ClassName  : SmsServiceImpl.java
     * 3. Comment    : SMS 발송
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 10.
     * </pre>
     *
     * @see web.sms.service.SmsService#insertSms(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertSms(Map<String, Object> commandMap) throws Exception {
//        return defaultDAO.insert("Sms.insertSms", commandMap);
        return 1;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertSmsTalk
     * 2. ClassName  : SmsServiceImpl.java
     * 3. Comment    : 알림톡 발송
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 19.
     * </pre>
     *
     * @see web.sms.service.SmsService#insertSmsTalk(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertSmsTalk(Map<String, Object> commandMap) throws Exception {
//        return defaultDAO.insert("Sms.insertSmsTalk", commandMap);
        return 1;
    }
}
