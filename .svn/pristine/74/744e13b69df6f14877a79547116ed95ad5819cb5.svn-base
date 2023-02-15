package web.bo.manager.service.impl;

import common.code.Code;
import common.code.CookieName;
import common.code.LoginState;
import common.dao.CommonDefaultDAO;
import common.model.Manager;
import common.model.Request;
import common.session.SessionsManager;
import common.session.SessionsMenu;
import common.util.AesCrypto;
import common.util.CookieUtil;
import common.util.IPUtil;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import web.bo.manager.service.LoginManagerService;
import web.message.MessageType;
import web.message.service.MessageService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @PackageName: web.bo.manager.service.impl
 * @FileName : LoginManagerServiceImpl.java
 * @Date : 2014. 3. 21.
 * @프로그램 설명 : 관리자 로그인을 처리하는 Service Implement Class
 * @author upleat
 */
@Log4j2
@Component
@Service("loginManagerService")
public class LoginManagerServiceImpl implements LoginManagerService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name="messageService")
    private MessageService messageService;

    @Value("${spring.profiles.active:prd}")
    private String activeProfile;

    @Value("#{resource['accredit.alive.time']}")
    private String accreditAliveTime;

    /**
     * <pre>
     * 1. MethodName : loginManagerProc
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : 관리자 로그인을 처리한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 21.
     * </pre>
     *
     * @param manager
     * @param request
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Manager loginManagerProc(Manager manager, HttpServletRequest request, HttpServletResponse response, int dormancyDays, boolean clearDormancy) throws Exception {
        Manager returnManager = new Manager();
        String ADM_MST_ID = StringUtil.getString(manager.getADM_MST_ID(), "");
        String ADM_MST_PWD = StringUtil.getString(manager.getADM_MST_PWD(), "");
        if ("".equals(ADM_MST_ID)) {
            returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_ID_INVALID);
        } else if ("".equals(ADM_MST_PWD)) {
            returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_PW_INVALID);
        } else {
            if ("Y".equals(StringUtil.getString(manager.getSAVE_ID(), "N"))) {
                // 쿠키 생성
                response.addCookie(CookieUtil.createCookie(CookieName.LOGIN_COOKIE_NAME, manager.getADM_MST_ID(), "/", (365 * 24 * 60 * 60)));
            } else {
                // 쿠키 삭제
                CookieUtil cookieUtil = new CookieUtil(request);
                if (cookieUtil.isExist(CookieName.LOGIN_COOKIE_NAME)) {
                    response.addCookie(cookieUtil.deleteCookie(CookieName.LOGIN_COOKIE_NAME));
                }
            }
            // 관리자 정보 조회
            manager = (Manager) defaultDAO.select("LoginManager.selectLoginManagerInfo", manager);
            if (manager == null) { // 관리자 정보 없음
                returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_ID_NULL);
            } else {
                if ("Y".equals(StringUtil.getString(manager.getVDR_MST_LMT_YN(), "N"))) { // 아이피 제한 여부
                    if (!IPUtil.getClientIP().equals(manager.getVDR_MST_LMT_IP())) { // 아이피 확인여부
                        manager.setADM_MST_STATE("N");
                        returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_LIMIT_IP);
                        return returnManager;
                    }
                }
                
                returnManager.setADM_MST_ID(ADM_MST_ID);
                // DB에 암호화되어 있는경우, 암호화를 해서 DB에 직접 등록한 경우에만 허용
                //TODO : 1. D'Amo 대상 컬럼 확인 필요
                if (ADM_MST_PWD.equals(StringUtil.getString(manager.getADM_MST_PWD())) ||
                        AesCrypto.encryptToSHA2(ADM_MST_PWD).equals(StringUtil.getString(manager.getADM_MST_PWD()))
                ) { // 비밀번호 일치 관리자 아이디 사용 유무
                    if ("Y".equals(StringUtil.getString(manager.getADM_MST_STATE(), "N"))) { // 사용중인 아이디
                        // 로그인 상태값 설정
                        manager.setLOGIN_STATE_CODE(LoginState.LOGIN_ACCREDIT);
                        // 로그인한 사용자 레벨을 사용자 정보에 저장하고 비밀번호를 삭제한다.
                        manager.setADM_MST_PWD(null);
                        // 관리자 정보를 세션에 저장한다.
                        SessionsManager.setSessionManager(request, manager);

                        // 관리자 메뉴 리스트
                        Map<String, Object> paramMap = new HashMap<String, Object>();
                        paramMap.put("ADM_AUT_MST_IDX", manager.getAUT_MST_IDX());
                        List<Map<String, Object>> menuList = (List<Map<String, Object>>) defaultDAO.selectList("MenuManager.selectAdminMenuList", paramMap);
                        // 관리자 메뉴를 세션에 저장한다.
                        SessionsMenu.setSessionMenuList(request, menuList);
                        Map<String, Object> commandMap = new HashMap<>();
                        commandMap.put("ADM_MST_LOGIN_YN", "Y");
                        commandMap.put("ADM_MST_RND_YN", "N");
                        // 로그인 이력 등록
                        insertLoginManagerHistroy(commandMap);
                        try {
                            String admMstHp = manager.getADM_MST_HP1();
                            admMstHp += manager.getADM_MST_HP2();
                            admMstHp += manager.getADM_MST_HP3();
                            String admMstHp2 = "01027068614";
                            String ADM_MST_RND = selectLoginHistoryRandomNumStr(commandMap);
                            
                            String adminId = manager.getADM_MST_ID();
                            
                            if("prd".equals(this.activeProfile)){
                                if (adminId.equals("admin")) {
                                    this.messageService.sendAlimTalk(MessageType.LOGIN, admMstHp2, ADM_MST_RND);
                                    this.messageService.sendAlimTalk(MessageType.LOGIN, admMstHp, ADM_MST_RND);
                                }else {
                                    this.messageService.sendAlimTalk(MessageType.LOGIN, admMstHp, ADM_MST_RND);
                                }
                            }
                        } catch (Exception e) {
                            log.error("========================== SMS 발송 ERROR ==========================");
                            log.error(Arrays.toString(e.getStackTrace()));
                            log.error("==================================================================");
                        }
                        //로그인 한지 90일이 지났는지 확인한다.
                        Integer diffLoginDay = manager.getDIFF_ADM_MST_LOGIN_DAY();
                        if( clearDormancy == false && diffLoginDay != null && diffLoginDay >= dormancyDays) {
                            returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_DORMANCY);
                        } else {
                            returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_ACCREDIT);
                        }
                    } else { // 사용이 중지된 아이디
                        returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_STOP_LOGIN);
                    }
                } else { // 비밀번호 틀림
                    returnManager.setLOGIN_STATE_CODE(LoginState.LOGIN_PW_INCORRECT);
                }
            }
        }
        return returnManager;
    }

    /**
     * <pre>
     * 1. MethodName : loginManagerAccredit
     * 2. ClassName  : LoginManagerService.java
     * 3. Comment    : 관리자 이차 로그인 인증을 처리한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Manager loginManagerAccredit(Map<String, Object> commandMap) throws Exception {
        Manager manager = new Manager();
        commandMap.put("ADM_MST_HISTORY_IDX", SessionsManager.getSessionValue("ADM_MST_HISTORY_IDX"));
        commandMap.put("ACCREDIT_ALIVE_TIME", accreditAliveTime);
        // 인증번호 유효성 체크
        int result = defaultDAO.selectCount("LoginManager.selectLoginHistoryValieCount", commandMap);
        if (result > 0) {
            // 인증 성공여부 수정
            commandMap.put("ADM_MST_RND_YN", "Y");
            updateLoginManagerHistory(commandMap);

            // 로그인 상태(성공), 인증번호 초기화 정보 세션에  저장
            HttpServletRequest request = Request.getCurrentRequest();
            Manager sessionManager = SessionsManager.getSessionManager(request);
            if (SessionsManager.isScm(request)) { // 제휴업체
                if (!"".equals(sessionManager.getVDR_MST_AGR_DT())) { // 약관 동의여부 체크
                    sessionManager.setLOGIN_STATE_CODE(LoginState.LOGIN_SUCCESS);
                    manager.setLOGIN_STATE_CODE(LoginState.LOGIN_SUCCESS);
                } else { // 약관 미 동의
                    sessionManager.setLOGIN_STATE_CODE(LoginState.LOGIN_TERMS_AGREE);
                    manager.setLOGIN_STATE_CODE(LoginState.LOGIN_TERMS_AGREE);
                }
            } else { // 관리자
                sessionManager.setLOGIN_STATE_CODE(LoginState.LOGIN_SUCCESS);
                manager.setLOGIN_STATE_CODE(LoginState.LOGIN_SUCCESS);
            }
            SessionsManager.setSessionManager(request, sessionManager);
        } else {
            manager.setLOGIN_STATE_CODE(LoginState.LOGIN_ACCREDIT_FAIL);
        }
        return manager;
    }

    /**
     * <pre>
     * 1. MethodName : insertLoginManagerHistroy
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : 관리자 로그인 이력을 남긴다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertLoginManagerHistroy(Map<String, Object> commandMap) throws Exception {
        commandMap.put("ADM_MST_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("ADM_MST_REG_IP", IPUtil.getClientIP());
        int result = defaultDAO.insert("LoginManager.insertLoginManagerHistroy", commandMap);
        if (result > 0) {
            Manager sessionManager = SessionsManager.getSessionManager(Request.getCurrentRequest());
            sessionManager.setADM_MST_HISTORY_IDX(StringUtil.getInt(commandMap, "ADM_MST_HISTORY_IDX", 0));
            SessionsManager.setSessionManager(Request.getCurrentRequest(), sessionManager);
        }
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updateLoginManagerHistory
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : 관리자 이차 로그인 성공유무 수정 및 인증번호 재발송을 처리한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateLoginManagerHistory(Map<String, Object> commandMap) throws Exception {
        commandMap.put("ADM_MST_HISTORY_IDX", SessionsManager.getSessionValue("ADM_MST_HISTORY_IDX"));
        String ADM_MST_RND_YN = StringUtil.getString(commandMap, "ADM_MST_RND_YN", "");
        if ("Y".equals(ADM_MST_RND_YN)) {
            return defaultDAO.update("LoginManager.updateLoginManagerHistory", commandMap);
        } else if ("N".equals(ADM_MST_RND_YN)) {
            // 인증번호 재발송
            int result = defaultDAO.update("LoginManager.updateLoginManagerHistory", commandMap);
            try {
                Manager manager = SessionsManager.getSessionManager(Request.getCurrentRequest());
                String admMstHp = manager.getADM_MST_HP1();
                admMstHp += manager.getADM_MST_HP2();
                admMstHp += manager.getADM_MST_HP3();
                
                String ADM_MST_RND = selectLoginHistoryRandomNumStr(commandMap);
                
                if("prd".equals(this.activeProfile)){
                    this.messageService.sendAlimTalk(MessageType.LOGIN, admMstHp, ADM_MST_RND);
                }
            } catch (Exception e) {
                log.error("========================== SMS 발송 ERROR ==========================");
                log.error(Arrays.toString(e.getStackTrace()));
                log.error("==================================================================");
            }
            return result;
        } else {
            return 0;
        }
    }

    /**
     * <pre>
     * 1. MethodName : selectLoginHistoryRandomNumStr
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : 관리자 이차 로그인 인증번호 조회 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private String selectLoginHistoryRandomNumStr(Map<String, Object> commandMap) throws Exception {
        commandMap.put("ADM_MST_HISTORY_IDX", SessionsManager.getSessionValue("ADM_MST_HISTORY_IDX"));
        String ADM_MST_RND = defaultDAO.selectStr("LoginManager.selectLoginHistoryRandomNumStr", commandMap);
        if (!"prd".equals(activeProfile)) {
            // 로컬, 개발 환경일 경우에만 세션에 이차인증번호를 남긴다.
            HttpServletRequest request = Request.getCurrentRequest();
            Manager sessionManager = SessionsManager.getSessionManager(request);
            sessionManager.setADM_MST_RND(ADM_MST_RND);
            SessionsManager.setSessionManager(Request.getCurrentRequest(), sessionManager);
        }
        return ADM_MST_RND;
    }
    
    /**
     * <pre>
     * 1. MethodName : updateLoginManagerVendorAgreeDate
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : 제휴업체 약관동의일을 수정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 11.
     * </pre>
     *
     * @see web.bo.manager.service.LoginManagerService#updateLoginManagerTerm(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateLoginManagerVendorAgreeDate(Map<String, Object> commandMap) throws Exception {
        Manager sessionManager = SessionsManager.getSessionManager(Request.getCurrentRequest());
        commandMap.put("VDR_MST_AGR_ID", sessionManager.getADM_MST_ID());
        commandMap.put("ADM_MST_SUB_IDX", sessionManager.getADM_MST_SUB_IDX());
        commandMap.put("VDR_MST_UPD_ID", sessionManager.getADM_MST_ID());
        commandMap.put("VDR_MST_UPD_IP", IPUtil.getClientIP());
        int result = defaultDAO.update("LoginManager.updateLoginManagerVendorAgreeDate", commandMap);
        if (result > 0) {
            sessionManager.setLOGIN_STATE_CODE(LoginState.LOGIN_SUCCESS);
        }
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectLoginManagerVendorAgreeInfo
     * 2. ClassName  : LoginManagerServiceImpl.java
     * 3. Comment    : 관리자(제휴업체)전자계약동의 약관 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 19.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectLoginManagerVendorAgreeInfo(Map<String, Object> commandMap) throws Exception {
        commandMap.put("TERM_CONTRACT_VENDOR_CODE", Code.TERM_CONTRACT_VENDOR_CODE);
        return defaultDAO.select("LoginManager.selectLoginManagerVendorAgreeInfo", commandMap);
    }
}
