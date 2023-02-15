package web.pg.service;

import java.util.Map;

public interface IniPayService {
    
    /**
     * <pre>
     * 1. MethodName : selectIniPayApvInfo
     * 2. ClassName  : IniPayService.java
     * 3. Comment    : 관리자 > Payment Gate > 승인 결과 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectIniPayApvInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertIniPayCnlReq
     * 2. ClassName  : IniPayService.java
     * 3. Comment    : 관리자 > Payment Gate > 취소 요청 / 결과
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> insertIniPayCnlReq(Map<String, Object> commandMap) throws Exception;
}
