package web.bo.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: web.bo.board.service
 * @FileName : FaqBoardService.java
 * @Date : 2014. 4. 8.
 * @프로그램 설명 : 관리자 > 고객센터 > FAQ 관리를 처리하는 Service Interface
 * @author upleat
 */
public interface FaqBoardService {

    /**
     * <pre>
     * 1. MethodName : selectFaqBoardListCount
     * 2. ClassName  : FaqBoardService.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록 개수  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectFaqBoardListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectFaqBoardList
     * 2. ClassName  : FaqBoardService.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 목록  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectFaqBoardList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectFaqBoardInfo
     * 2. ClassName  : FaqBoardService.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 상세정보  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectFaqBoardInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertFaqBoard
     * 2. ClassName  : FaqBoardService.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 등록  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertFaqBoard(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateFaqBoard
     * 2. ClassName  : FaqBoardService.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 수정  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateFaqBoard(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateFaqBoardSort
     * 2. ClassName  : FaqBoardService.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 전시 순서 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateFaqBoardSort(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateFaqBoardSort
     * 2. ClassName  : FaqBoardService.java
     * 3. Comment    : 관리자 >  고객센터 > FAQ 관리 전시 순서 수정 (EXCEL UPLOAD)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @return
     * @throws Exception
     */
    public int updateFaqBoardSort(MultipartHttpServletRequest request) throws Exception;
}
