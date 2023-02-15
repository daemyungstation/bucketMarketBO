package web.bo.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsManager;
import common.util.IPUtil;
import common.util.JSONUtil;
import common.util.StringUtil;
import web.bo.board.service.CommentBoardService;

/**
 * @PackageName: web.bo.board.service.impl
 * @FileName : CommentBoardServiceImpl.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > 가입후기를 처리하는 Service Implement Class
 * @author upleat
 */
@Service("commentBoardService")
public class CommentBoardServiceImpl implements CommentBoardService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectCommentBoardListCount
     * 2. ClassName  : CommentBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommentBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommentBoard.selectCommentBoardListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommentBoardList
     * 2. ClassName  : CommentBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommentBoardList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("CommentBoard.selectCommentBoardList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommentBoardInfo
     * 2. ClassName  : CommentBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCommentBoardInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("CommentBoard.selectCommentBoardInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updateCommentBoard
     * 2. ClassName  : CommentBoardServiceImpl.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommentBoard(Map<String, Object> commandMap) throws Exception {
        commandMap.put("PRD_REV_UPD_ID", SessionsManager.getSessionValue("ADM_MST_ID"));
        commandMap.put("PRD_REV_UPD_IP", IPUtil.getClientIP());

        String PARAMS = StringUtil.getString(commandMap, "PARAMS", "");
        if (!"".equals(PARAMS)) {
            List<Map<String, Object>> paramList = JSONUtil.convJSONArrayToListMap(JSONUtil.convStringToJSONArray(PARAMS));
            int result = 0;
            for (Map<String, Object> param : paramList) {
                commandMap.put("PRD_REV_IDX", StringUtil.getString(param, "PRD_REV_IDX", ""));
                commandMap.put("PRD_REV_BST_YN", StringUtil.getString(param, "PRD_REV_BST_YN", ""));
                result += defaultDAO.update("CommentBoard.updateCommentBoard", commandMap);
            }
            return result;
        } else {
            return defaultDAO.update("CommentBoard.updateCommentBoard", commandMap);
        }
    }

}
