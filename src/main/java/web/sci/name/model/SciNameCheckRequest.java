package web.sci.name.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <pre>
 * &#64;PackageName: web.sci.name.model
 * &#64;FileName : SciNameCheckRequest.java
 * &#64;Date : 2020. 5. 12.
 * &#64;프로그램 설명 : 실명확인 요청 VO
 * &#64;author upleat
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SciNameCheckRequest {

    String srvNo; // 실명확인 서비스 번호
    String jumin1; // 주민등록번호 1
    String jumin2; // 주민등록번호 2
    String name; // 이름

    // 내부 처리용 변수
    String id; // 실명확인 회원사 아이디
    String reqNum; // 요청번호
    String exVar; // 복호화용 임시필드
    String actionUrl; // 실명확인 요청 URL
    String retUrl; // 실명확인 결과수신 URL
    
    // 암호화된 요청 데이터
    String reqInfo;
}
