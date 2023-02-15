package web.bo.product.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductImageService {
    
    /**
     * <pre>
     * 1. MethodName : selectProductImageInfo
     * 2. ClassName  : ProductImageService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품이미지 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectProductImageInfo(Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : insertProductImage
     * 2. ClassName  : ProductImageService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품이미지 > 등록 (파일 업로드)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertProductImage(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateProductImage
     * 2. ClassName  : ProductImageService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품이미지 > 수정 (파일 삭제 / 업로드)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateProductImage(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

}
