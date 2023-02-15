package common.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class ProfilesUtil {

    @Value("${spring.profiles.active:prd}")
    private String activeProfile;

    /**
     * <pre>
     * 1. MethodName : getActiveProfiles
     * 2. ClassName  : ProfilesUtil.java
     * 3. Comment    : 적용 된 해당 profile을 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 10.
     * </pre>
     *
     * @return
     */
    public String getActiveProfiles() {
        log.info("profile : [{}]", activeProfile);
        return activeProfile;
    }
}
