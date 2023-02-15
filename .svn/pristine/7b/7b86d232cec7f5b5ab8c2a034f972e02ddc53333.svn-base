<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="order" data-menu_subclass="order">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>가입상세</span>
                    </h2>
                </div>
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>" />
                    <input type="hidden" name="MSG" value="사용자취소" />
                    <h3 class="title">
                        <span>고객정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: auto;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>고객명</th>
                                <th>온라인상품명</th>
                                <th>월납입금</th>
                                <th>만기회차</th>
                                <th>모델분류(지원혜택)</th>
                                <th>모델명</th>
                                <th>옵션</th>
                                <th>추가정보</th>
                                <th>연락처</th>
                                <th>비상연락처</th>
                                <th>주소(증서 배송)</th>
                                <th>접수일시</th>
                                <th>가입일시</th>
                                <th>회원상태</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <c:out value="${info.ACCNT_NO }" />
                                </td>
                                <td>
                                    <c:out value="${info.MEM_NM }" />
                                </td>
                                <td class="left">
                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${info.PRD_MST_NO }"/>">
                                        <c:out value="${info.PRD_MST_NM }" />
                                    </a>
                                </td>
                                <td>
                                    <fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/>
                                </td>
                                <td>
                                    <c:out value="${info.EXPR_NO }" />
                                </td>
                                <td>
                                    <c:out value="${info.MODEL_CL_NM}" />
                                    <BR>
                                    <c:out value="${info.PRD_MST_SPL_NM}" />
                                </td>
                                <td>
                                    <c:out value="${info.MODEL_NM}" />
                                </td>
                                <td>
                                    <c:out value="${info.PRD_OPT_DTL}" />
                                </td>
                                <td>
                                    <c:out value="${info.ORD_MST_VDR_BNF_ID}" />
                                </td>
                                <td>
                                    <c:out value="${info.CELL}" />
                                </td>
                                <td>
                                    <c:out value="${info.HOME_TEL}" />
                                </td>
                                <td>
                                    <c:out value="${info.HOME_ADDR}" /><c:out value="${info.HOME_ADDR2}" />
                                </td>                                
                                <td>
                                    <ui:formatDate value="${info.REG_DM }" pattern="yyyy.MM.dd" />
                                </td>
                                <td>
                                    <ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" />
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty info.KSTBIT }">
                                            <c:out value="${info.KSTBIT}" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${empty info.KSTBIT}">
                                                <SPAN>접수</SPAN>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>                                            
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title">
                        <span>결제정보</span>
                    </h3>
                    <c:if test="${not empty payInfo }">
                        <c:if test="${payInfo.PAY_MST_GBN eq 'N' }">
                            <div class="grid section-button-search-right">
                                <a href="javascript:;" id="cancel" class="button small cancel" data-ord_mst_idx="<c:out value="${info.ORD_MST_IDX }"/>">
                                    <span>결제 취소</span>
                                </a>
                            </div>
                        </c:if>
                    </c:if>   
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 20%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 5%;" />
                            <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>결제일시</th>
                                <th>결제수단</th>
                                <th>승인번호</th>
                                <th>할부개월</th>
                                <th>결제금액</th>
                                <th>상태</th>
                                <th>변경일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <c:choose>
                                    <c:when test="${not empty payInfo }">
                                        <td>
                                            <ui:formatDate value="${payInfo.PAY_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                        </td>
                                        <td>
                                            <c:out value="${payInfo.P_FN_NM }" />(<c:out value="${payInfo.P_CARD_NUM }" />)
                                        </td>
                                        <td>
                                            <c:out value="${payInfo.P_AUTH_NO }" />
                                        </td>                                
                                        <td>
                                            <c:out value="${payInfo.P_RMESG2 eq '00' ? '일시불' : payInfo.P_RMESG2 }" />
                                            <c:out value="${payInfo.P_RMESG2 ne '00' ? '개월' : ''}" />
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${payInfo.P_AMT }" type="number"/>
                                        </td>
                                        <td>
                                            <c:out value="${payInfo.PAY_MST_GBN eq 'N' ? '정상' : '취소' }" />
                                        </td>
                                        <td>
                                            <ui:formatDate value="${payInfo.PAY_MST_UPD_DT }" pattern="yyyy.MM.dd" />
                                        </td>  
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${empty payInfo}">
                                            <tr>
                                                <td class="td_no_result"></td>
                                            </tr>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title">
                        <span>납입정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>공제번호</th>
                                <th>결제유형</th>
                                <th>납입현황</th>
                                <th>총납입금액</th>
                                <th>상조부금납입금</th>
                                <th>결합상품납입금</th>
                                <th>추가금</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <c:choose>
                                    <c:when test="${not empty payment }">
                                        <td>
                                            <c:out value="${payment.DED_NO }" />
                                        </td>
                                        <td>
                                            <c:out value="${payment.PAY_MTHD_NM }" />
                                        </td>
                                        <td>
                                            <a href="javascript:;" class="payment-detail" data-ord_mst_idx="<c:out value="${info.ORD_MST_IDX }"/>">
                                                <c:out value="${payment.PAY_NO }" />/<c:out value="${payment.EXPR_NO }" />
                                            </a>
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${payment.PAY_SUM }" type="number"/>
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${payment.PAY_AMT }" type="number"/>
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${payment.PAY_AMT1 }" type="number"/>
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${payment.PAY_AMT2 }" type="number"/>
                                        </td>  
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${empty payment}">
                                            <tr>
                                                <td class="td_no_result"></td>
                                            </tr>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title">
                        <span>맴버십 카드 정보</span>
                    </h3>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>회원번호</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.ACCNT_NO }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>리조트 우대번호</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.RESORT_NO }"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title">
                        <span>라이프서비스 정보</span>
                    </h3>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>주계약 서비스</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <c:out value="${info.MAIN_CONTRACT }"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div class="grid section-button-search">
                    <a href="javascript:self.close();" class="button small">
                        <span>닫기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            <%-- 상품 상세 이동 --%>
            $popup.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
            });
            <%-- 주문상세 버튼 클릭 이벤트 --%>
            $frm.on("click", ".payment-detail", function() {
                $frm.find("input[name='ORD_MST_IDX']").val($(this).data("ord_mst_idx"));
                $frm.postPop($.action.popup("PaymentDetail"), "orderPaymentDetailPopup", "width=1500,height=1000,left=10,top=10");
            });
            <%-- 주문상세 버튼 클릭 이벤트 --%>
            $frm.on("click", ".cancel", function() {
                if (confirm("결제 취소 하시겠습니까?")) {
                    $.postSyncJsonAjax($.action.ajax("ReceiptRefund"), {ORD_MST_IDX : "<c:out value="${info.ORD_MST_IDX }"/>",MSG : "구매자 요청 취소"}, function(data) {
                        alert(data.resultMsg);
                        if (data.isSuccess) {
                            location.reload();
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>