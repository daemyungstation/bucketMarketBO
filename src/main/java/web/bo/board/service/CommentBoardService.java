package web.bo.board.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: web.bo.board.service
 * @FileName : CommentBoardService.java
 * @Date : 2014. 4. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > 가입후기를 처리하는 Service Interface
 * @author upleat
 */
public interface CommentBoardService {

    /**
     * <pre>
     * 1. MethodName : selectCommentBoardListCount
     * 2. ClassName  : CommentBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 개수 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommentBoardListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCommentBoardList
     * 2. ClassName  : CommentBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommentBoardList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCommentBoardInfo
     * 2. ClassName  : CommentBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 목록 상세정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommentBoardInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateCommentBoard
     * 2. ClassName  : CommentBoardService.java
     * 3. Comment    : 관리자 > 고객센터 > 가입후기 수정 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommentBoard(Map<String, Object> commandMap) throws Exception;
}
