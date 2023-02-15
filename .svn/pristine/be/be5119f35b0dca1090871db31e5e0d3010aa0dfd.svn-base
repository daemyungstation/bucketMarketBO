package web.bo.planner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.bo.planner.service.InactivePlannerService;

/**
 * <pre>
 * &#64;PackageName: web.bo.planner.service.impl
 * &#64;FileName : InactivePlannerServiceImpl.java
 * &#64;Date : 2020. 4. 7.
 * &#64;프로그램 설명 : 관리자 > 레디플래너 관리 > 활동대기 플래너
 * &#64;author upleat
 * </pre>
 */
@Service("inactivePlannerService")
public class InactivePlannerServiceImpl implements InactivePlannerService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectInactivePlannerListCount
     * 2. ClassName  : InactivePlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 활동대기 플래너 > 활동대기 플래너 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectInactivePlannerListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("InactivePlanner.selectInactivePlannerListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectInactivePlannerList
     * 2. ClassName  : InactivePlannerServiceImpl.java
     * 3. Comment    : 관리자 > 레디플래너 관리 > 활동대기 플래너 > 활동대기 플래너 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInactivePlannerList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("InactivePlanner.selectInactivePlannerList", commandMap);
    }
}
