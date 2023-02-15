package web.message;

/**
 * 알림톡 템플릿 타입
 */
public enum MessageType {

    // BO
    QNA_ANSWER("BM001", "상품Q&A 답변안내"), // 관리자 > 상품Q&A 답변 시 
    INQUIRY_ANSWER("BM002", "1:1문의하기 답변안내"), // 관리자 > 1:1 문의 답변 시 
    PLANNER_STATE_APPROVAL("BM004", "레디플래너 신청승인 완료"), // 관리자 > 레디플래너 관리 > 승인완료 시
    PLANNER_STATE_REJECT("BM005", "레디플래너 신청승인 반려"), // 관리자 > 레디플래너 관리 > 승인반려 시 
    PLANNER_STATE_STOP("BM006", "레디플래너 이용제한"), // 관리자 > 레디플래너 관리 > 이용제한 시
    PLANNER_STATE_ACTIVE("BM007", "레디플래너 이용제한 해제"), // 관리자 > 레디플래너 관리 > 이용제한 해제 시
    PLANNER_PAYMENT_COMPLETE("BM022", "레디플래너 정산 지급완료"), // 관리자 > 레디플래너 관리 > 정산지급 완료 시 (정산대행업체 SCM > 지급완료 등록 시)
    SUPPORT_DELIVERY("BM015", "상품발주안내"), // 관리자 > 발주혜택관리 > 발주조회 > 배송예정일 입력 시 
    BM016("BM016", "상품발주안내(변경시)"), // 관리자 > 발주혜택관리 > 발주조회 > 배송예정일 수정입력 시 
    SUPPORT_BENEFIT("BM017", "혜택지급안내"), // 관리자 > 발주혜택관리 > 포인트조회 > 지급일자 입력 시 (회차별 발송)
    SCM_REQUEST("BM018", "혜택지급 요청안내"), // 특정 일자에 매월 1회 일괄 발송 (배치) - 지급대상 내역이 있는 제휴사만 발송
    LOGIN("BM019", "관리자로그인"), // 관리자 로그인 인증번호
    PLANNER_NOTICE_REQUEST("BM021", "레디플래너 공지사항 등록"); // 사용자 > 공지사항등록 시 > 특정사용자(2차까지 승인)에게 카톡 발송 

    String templateCode; // 템플릿 코드
    String templateName; // 텝플릿 명칭

    MessageType(String templateCode, String templateName) {
        this.templateCode = templateCode;
        this.templateName = templateName;
    }

    public String getTemplateCode() {
        return templateCode;
    }

    public String getTemplateName() {
        return templateName;
    }

}
