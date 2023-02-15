<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body>
    <div id="header">
        <%@ include file="/WEB-INF/jsp/bo/include/top.jsp"%>
    </div>
    <div id="container">
        <div id="aside" class="aside left">
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <div id="wrapper">
            <div id="breadcrumb"></div>
            <div id="contents">
                <div class="container">
                    <h2 class="title"><span>Today Report <b style="color: red;"><c:out value="${todayStr }"/> (<c:out value="${weekStr }"/>)</b></span></h2>
                    <c:if test="${not isScm }">
                        <div class="section-title">
                            <h3 class="title"><span>오늘 상품가입(전자서명) 접수 현황</span></h3>
                            <div class="more">
                                <a href="javascript:;" data-menu_group="order" data-menu_subclass="orderReceipt" class="request-page button small primary"><span>가입/결제조회 ></span></a>
                            </div>
                        </div>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: 15%;" />
                                <col style="width: 15%;" />
                                <col style="width: 15%;" />
                                <col style="width: 15%;" />
                                <col style="width: 15%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>전체</th>
                                    <th>월지원</th>
                                    <th>즉발(현물)</th>
                                    <th>즉발(포인트)</th>
                                    <th>할부지원</th>
                                    <th>렌탈</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <c:out value="${today.MONTHLY_R + today.IMMEDIATELY_Y_R + today.IMMEDIATELY_N_R + today.INSTALLMENT_R + today.RENTAL_R}" />
                                    </td>
                                    <td>
                                        <c:out value="${today.MONTHLY_R}" />
                                    </td>
                                    <td>
                                        <c:out value="${today.IMMEDIATELY_Y_R}" />
                                    </td>
                                    <td>
                                        <c:out value="${today.IMMEDIATELY_N_R}" />
                                    </td>
                                    <td>
                                        <c:out value="${today.INSTALLMENT_R}" />
                                    </td>
                                    <td>
                                        <c:out value="${today.RENTAL_R}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="grid">
                            <div class="col col-1-2" style="margin-right: 4%; width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>발주/지원혜택 누적 현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="support" data-menu_subclass="supportRental" class="request-page button small primary"><span>발주/혜택관리 ></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>
                                                <div class="contain-tooltip">
                                                    포인트 미지급 <i class="icon-help">?</i>
                                                    <div class="box-tooltip">
[포인트 미지급]
월지원/즉발(포인트) 상품의 납입 이후
미지급된 상태인 회원번호 건수의 총 누적
(지원혜택관리 목록 > 미지급건수와 동일)
                                                    </div>
                                                </div>
                                            </th>
                                            <th>
                                                <div class="contain-tooltip">
                                                    통화대기 <i class="icon-help">?</i>
                                                    <div class="box-tooltip">
[통화대기]
렌탈 상품의  접수 상태의 회원번호 건수의 총 누적
(렌탈접수관리 목록 > 통화대기 건수와 동일)
                                                    </div>
                                                </div>
                                            </th>
                                            <th>
                                                <div class="contain-tooltip">
                                                    렌탈대기 <i class="icon-help">?</i>
                                                    <div class="box-tooltip">
[렌탈대기]
렌탈 상품의 대명 TM 이후의 회원번호 건수의 총 누적
(SCM에서 렌탈 계약 여부 확인 전)
(렌탈접수관리 목록 > 렌탈대기 건수와 동일)
                                                    </div>
                                                </div>
                                            </th>
                                            <th>
                                                <div class="contain-tooltip">
                                                    배송준비 <i class="icon-help">?</i>
                                                    <div class="box-tooltip">
[배송준비]
즉발(현물), 할부지원 상품의 납입 이후
 배송일자가 기재되지 않은 상태인 회원번호 건수의 총 누적 
(상품발주관리 목록 > 배송준비 건수와 동일)
                                                    </div>
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${unpaidPoint}" />
                                            </td>
                                            <td>
                                                <c:out value="${rentalCnt.RENTAL_TM}" />
                                            </td>
                                            <td>
                                                <c:out value="${rentalCnt.RENTAL_READY}" />
                                            </td>
                                            <td>
                                                <c:out value="${deliveryReady}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col col-1-2" style="width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>클레임 미처리 누적 현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="claim" data-menu_subclass="cancellation" class="request-page button small primary"><span>클레임상담조회 ></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>해지 신청</th>
                                            <th>라이프서비스 신청</th>
                                            <th>양도/양수 신청</th>
                                            <th>결제수단변경 신청</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${claimCancel}" />
                                            </td>
                                            <td>
                                                <c:out value="${lifeService}" />
                                            </td>
                                            <td>
                                                <c:out value="${transfer}" />
                                            </td>
                                            <td>
                                                <c:out value="${payMethod}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="grid">
                            <div class="col col-1-2" style="margin-right: 4%; width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>지원혜택상품 미처리 누적 현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="product" data-menu_subclass="productDisapproval" class="request-page button small primary"><span>결합완료상품관리 ></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: auto;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>지원혜택상품 승인대기</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${unprocessed}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col col-1-2" style="width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>레디플래너 미처리 누적현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="planner" data-menu_subclass="applyPlanner" class="request-page button small primary"><span>레디플래너관리 ></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: 50%;" />
                                        <col style="width: 50%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>레디플래너 승인대기</th>
                                            <th>레디플래너 해제요청</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${readyPlanner.READY_CNT}" />
                                            </td>
                                            <td>
                                                <c:out value="${readyPlanner.CANCEL_CNT}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="grid">
                            <div class="col col-1-2" style="margin-right: 4%; width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>결합완료 상품 누적 현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="product" data-menu_subclass="productUnion" class="request-page button small primary"><span>결합완료상품관리></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: 25%;" />
                                        <col style="width: 25%;" />
                                        <col style="width: 25%;" />
                                        <col style="width: 25%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>전체</th>
                                            <th>판매중</th>
                                            <th>일시품절</th>
                                            <th>판매안함</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${productState.DPL_Y + productState.DPL_N + productState.DPL_S}" />
                                            </td>
                                            <td>
                                                <c:out value="${productState.DPL_Y}" />
                                            </td>
                                            <td>
                                                <c:out value="${productState.DPL_S}" />
                                            </td>
                                            <td>
                                                <c:out value="${productState.DPL_N}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col col-1-2" style="width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>레디플래너 누적 현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="planner" data-menu_subclass="applyPlanner" class="request-page button small primary"><span>레디플래너관리 ></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: 25%;" />
                                        <col style="width: 25%;" />
                                        <col style="width: 25%;" />
                                        <col style="width: 25%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>전체</th>
                                            <th>활동대기플래너</th>
                                            <th>활동플래너 정상</th>
                                            <th>활동플래너 정지</th>
                                        </tr>
                                        <tr>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${readyPlanerState.RDP_W + readyPlanerState.RDP_N + readyPlanerState.RDP_S}" />
                                            </td>
                                            <td>
                                                <c:out value="${readyPlanerState.RDP_W}" />
                                            </td>
                                            <td>
                                                <c:out value="${readyPlanerState.RDP_N}" />
                                            </td>
                                            <td>
                                                <c:out value="${readyPlanerState.RDP_S}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <h3 class="title"><span>이벤트/기획전 현황</span></h3>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 25%;" />
                                <col style="width: 25%;" />
                                <col style="width: 25%;" />
                                <col style="width: 25%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th colspan="2">
                                        <a href="javascript:;" data-menu_group="marketing" data-menu_subclass="event" class="request-page">이벤트</a>
                                    </th>
                                    <th colspan="2"><a href="javascript:;" data-menu_group="marketing" data-menu_subclass="plan" class="request-page">기획전<a></a></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span>오늘 종료 예정</span>
                                    </td>
                                    <td>
                                        <c:out value="${eventState.TOTAL_CNT}" />
                                    </td>
                                    <td>
                                        <span>오늘 종료 예정</span>
                                    </td>
                                    <td>
                                        <c:out value="${planState.TODAY_END}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>진행중</span>
                                    </td>
                                    <td>
                                        <c:out value="${eventState.TOTAL_CNT}" />
                                    </td>
                                    <td>
                                        <span>진행중</span>
                                    </td>
                                    <td>
                                        <c:out value="${planState.TODAY_END}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <h3 class="title">
                            <span>상담/게시물 현황</span>
                        </h3>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 50%;" />
                                <col style="width: 50%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>누적 미답변</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span>
                                            <a href="javascript:;" data-menu_group="product" data-menu_subclass="productQnA" class="request-page">상품Q&A</a>
                                        </span>
                                    </td>
                                    <td>
                                        <c:out value="${productQnA}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>
                                            <a href="javascript:;" data-menu_group="board" data-menu_subclass="inquiryBoard" class="request-page">1:1 문의</a>
                                        </span>
                                    </td>
                                    <td>
                                        <c:out value="${inquiry}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>
                                            <a href="javascript:;" data-menu_group="board" data-menu_subclass="contactUsBoard" class="request-page">제휴문의</a>
                                        </span>
                                    </td>
                                    <td>
                                        <c:out value="${contactUs}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    
                    <c:if test="${ isScm }">
                        <div class="grid">
                            <div class="col col-1-2" style="margin-right: 4%; width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>발주/지원혜택 누적 현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="support" data-menu_subclass="supportRental" class="request-page button small primary"><span>발주/혜택관리 ></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>
                                                <div class="contain-tooltip">포인트 미지급 <i class="icon-help">?</i><div class="box-tooltip">[포인트 미지급] 납입 이후 포인트 미지급된 상태인 회원번호의 총 누적 건수
                                            </th>
                                            <th>
                                                <div class="contain-tooltip">렌탈상품 <i class="icon-help">?</i><div class="box-tooltip">[렌탈상품]렌탈사가 렌탈여부 확인하기 전 상태인 회원번호의 총 누적 건수(대명 TM 완료)
                                            </th>
                                            <th>
                                                <div class="contain-tooltip">배송준비 <i class="icon-help">?</i><div class="box-tooltip">[배송상품]납입 이후 배송일자가 기재되지 않은 회원번호의 총 누적 건수

                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${unpaidPoint}" />
                                            </td>
                                            <td>
                                                <c:out value="${rentalCnt.RENTAL_READY}" />
                                            </td>
                                            <td>
                                                <c:out value="${deliveryReady}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col col-1-2" style="width: 48%">
                                <div class="section-title">
                                    <h3 class="title"><span>승인/대기 상품 누적 현황</span></h3>
                                    <div class="more">
                                        <a href="javascript:;" data-menu_group="product" data-menu_subclass="productDisapproval" class="request-page button small primary"><span>결합완료상품관리></span></a>
                                    </div>
                                </div>
                                <table cellspacing="0" class="table-col table-b">
                                    <colgroup>
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                        <col style="width: 15%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>전체</th>
                                            <th>승인거절</th>
                                            <th>승인대기</th>
                                            <th>승인완료</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <c:out value="${vendorProductState.CNT_R + vendorProductState.CNT_N + vendorProductState.CNT_A}" />
                                            </td>
                                            <td>
                                                <c:out value="${vendorProductState.CNT_R}" />
                                            </td>
                                            <td>
                                                <c:out value="${vendorProductState.CNT_N}" />
                                            </td>
                                            <td>
                                                <c:out value="${vendorProductState.CNT_A}" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="section-title">
                            <h3 class="title"><span>제휴사 공지사항</span></h3>
                            <div class="more">
                                <a href="javascript:;" data-menu_group="board" data-menu_subclass="vendorNoticeBoard" class="request-page button small primary"><span>공지사항관리></span></a>
                            </div>
                        </div>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: auto;" />
                                <col style="width: 20%;" />
                                <col style="width: 20%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${not empty vendorNoticeBoard }">
                                    <c:forEach var="row" items="${vendorNoticeBoard }" varStatus="i">
                                        <tr>
                                            <td class="text-left" style="padding-left: 30px;">
                                                <a href="javascript:;" data-menu_group="board" data-menu_subclass="vendorNoticeBoard" data-key="<c:out value="${row.SCM_NTS_IDX }"/>" class="request-page">
                                                    <c:out value="${row.SCM_NTS_TITLE}" />
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.SCM_NTS_REG_NM}" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.SCM_NTS_REG_DT }" pattern="yyyy.MM.dd" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${empty vendorNoticeBoard}">
                                        <tr>
                                            <td class="td_no_result"></td>
                                        </tr>
                                    </c:if>
                                </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        
                        <h3 class="title">
                            <span>상담/게시물 현황</span>
                        </h3>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 50%;" />
                                <col style="width: 50%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>누적 미답변</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span>
                                            <a href="javascript:;" data-menu_group="product" data-menu_subclass="productQnA" class="request-page">상품Q&A</a>
                                        </span>
                                    </td>
                                    <td>
                                        <c:out value="${productQnA}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    
                </div>
            </div>
            <form id="dashboardNaviForm" name="dashboardNaviForm"></form>
        </div>
        <div id="quickmenu" class="aside right">
            <!-- quickmenu-->
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
    </div>
    <div id="footer">
        <%@ include file="/WEB-INF/jsp/bo/include/footer.jsp"%>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $dashboardNaviForm = $wrapper.find("#dashboardNaviForm");
            $wrapper.on("click", ".request-page", function () {
                var $this = $(this);
                var menuGroup = $this.data("menu_group"),
                    menuSubclass = $this.data("menu_subclass"),
                    key = $this.data("key");
                if (typeof(key) != "undefined") {
                    $dashboardNaviForm
                        .append(TagUtil.createDynamicInput("hidden", "SCM_NTS_IDX", key))
                        .postSubmit($.action.view("", menuSubclass, menuGroup));
                } else {
                    $dashboardNaviForm.postSubmit($.action.list("", menuSubclass, menuGroup));
                }
            });
        });
    </script>
</body>
</html>
