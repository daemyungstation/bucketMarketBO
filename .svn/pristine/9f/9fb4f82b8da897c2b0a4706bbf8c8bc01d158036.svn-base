package web.bo.planner.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.util.StringUtil;
import web.bo.common.service.CommonFileService;
import web.bo.planner.service.PlannerCommunityService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : PlannerCommunityServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 커뮤니티 관리
 * &#64;author upleat
 * </pre>
 */
@Service("plannerCommunityService")
public class PlannerCommunityServiceImpl implements PlannerCommunityService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonFileService")
    private CommonFileService commonFileService;

    /**
     * <pre>
     * 1. MethodName : selectCommunityListCount
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 커뮤니티 관리 > 목록 갯수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCommunityService#selectCommunityListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectCommunityListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PlannerCommunity.selectCommunityListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommunityList
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 커뮤니티 관리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCommunityService#selectCommunityList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectCommunityList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PlannerCommunity.selectCommunityList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommunityInfo
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 커뮤니티 관리 > 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCommunityService#selectCommunityInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectCommunityInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();

        // 파일
        commandMap.put("CMM_FLE_TB_NM", "T_RDP_BBS");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("RDP_BBS_IDX"), ""));
        returnMap.put("fileList", commonFileService.selectCommonFileList(commandMap));

        // 조회 & 조회수 증가
        returnMap.put("info", defaultDAO.select("PlannerCommunity.selectCommunityInfo", commandMap));
        defaultDAO.update("PlannerCommunity.updateReadCount", commandMap);

        return returnMap;
    }

    /**
     * <pre>
     * 1. MethodName : updateCommunity
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 커뮤니티 관리 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @see web.bo.planner.service.PlannerCommunityService#updateCommunity(org.springframework.web.multipart.MultipartHttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updateCommunity(Map<String, Object> commandMap) throws Exception {
        
        // 수정
        return defaultDAO.update("PlannerCommunity.updateCommunity", commandMap);
    }

}
