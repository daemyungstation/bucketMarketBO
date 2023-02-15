package web.batch.service;

/**
 * @PackageName: web.batch.service
 * @FileName : BatchManagerService.java
 * @Date : 2020. 5. 4.
 * @프로그램 설명 : DLCC 연동
 * @author upleat
 */
public interface BatchManagerService {
    
    /**
     * (매일 00:10)
     * <pre>
     * 1. MethodName : doJob01
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : DLCC B2B Company 정보를 Merge 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @throws Exception
     */
    public void doJob01();
    
    /**
     * (매일 00:20)
     * <pre>
     * 1. MethodName : doJob02
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : DLCC Product정보를 Merge 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @throws Exception
     */
    public void doJob02();
    
    /**
     * (매일 00:40)
     * <pre>
     * 1. MethodName : doJob04
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : DLCC 가입정보를 Merge 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @throws Exception
     */
    public void doJob04();

    void updateOrderDps(String month);

    /**
     * (매월 1일 02:00)
     * <pre>
     * 1. MethodName : doJob05De1
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : DLCC 상세정산정보를 Insert 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 19.
     * </pre>
     *
     * @throws Exception
     */
    public void doJob05De1();
    
    /**
     * (매일 01:00)
     * <pre>
     * 1. MethodName : doJob06
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : DLCC 해약환급금정보 Merge 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 19.
     * </pre>
     *
     * @throws Exception
     */
    public void doJob06();
    
    /**
     * (매월 1일 02:30)
     * <pre>
     * 1. MethodName : doJob09
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 레디플래너 주문별 정산정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 17.
     * </pre>
     *
     */
    public void doJob09();
    
    /**
     * (매일 03:00)
     * <pre>
     * 1. MethodName : doJob10
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 레디플래너 정산 기초 정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 17.
     * </pre>
     *
     */
    public void doJob10();
    
    /**
     * (매일 03:00)
     * <pre>
     * 1. MethodName : doJob11
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 레디플래너 알림
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 6.
     * </pre>
     *
     */
    public void doJob11();
    
    /**
     * (-)
     * <pre>
     * 1. MethodName : doJob12
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 상담 결과
     * 4. 작성자       : inus
     * 5. 작성일       : 2021. 9. 29.
     * </pre>
     *
     */
    public void doJob12();
    
    
}
