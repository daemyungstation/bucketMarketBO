<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="support" data-menu_subclass="supportBenefit">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>일괄 지급 입력</span>
                    </h2>
                </div>
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>" />
                    <input type="hidden" name="ACCNT_NO" value="<c:out value="${commandMap.ACCNT_NO }"/>" />
                    <c:forEach var="PAY_NO" items="${commandMap.PAY_NO }">
                        <input type="hidden" name="PAY_NO" value="<c:out value="${PAY_NO }"/>" />
                    </c:forEach>
                    <h3 class="title">
                        <span>선택된 지원혜택</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />

                        </colgroup>
                        <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>고객명</th>
                                <th>온라인상품명</th>
                                <th>연락처</th>
                                <th>납입회차</th>
                                <th>납입일</th>
                                <th>기간계상품코드</th>
                                <th>제휴업체</th>
                                <th>모델분류(지원혜택)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${row.ACCNT_NO }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.MEM_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.PRD_MST_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.CELL }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.PAY_NO }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.PAY_DAY }" pattern="yyyy.MM.dd" />
                                            </td>
                                            <td>
                                                <c:out value="${row.PROD_CD }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.VDR_MST_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.MODEL_CL_NM}" />
                                                <BR>
                                                <c:out value="${row.PRD_MST_SPL_NM}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${empty list}">
                                        <tr>
                                            <td class="td_no_result"></td>
                                        </tr>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                    
                    
                    <h3 class="title">
                        <span>혜택/지급내역 </span>
                    </h3>
                    <p><span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.</p>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: 35%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>혜택/지급일자<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <a href="javascript:;" class="js-datepickr">
                                        <span class="icon datepickr">
                                            <em>날짜선택</em>
                                        </span>
                                    </a>
                                    <input type="text" name="ORD_BNF_DT" id="ORD_BNF_DT" class="text" value="" maxlength="10"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>지급내역<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text short" maxlength="40" value="<c:out value="${info.PRD_MST_SPT_TXT}" />" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>추가정보<i class="require"><em>필수입력</em></i></span>
                                </th>
                                <td colspan="3">
                                    <input type="text" name="ORD_MST_VDR_BNF_ID" id="ORD_MST_VDR_BNF_ID" class="text short" maxlength="20" value="<c:out value="${info.ORD_MST_VDR_BNF_ID }"/>"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </form>
                <div class="grid section-button-search">
                    <a href="javascript:;" id="save" class="button small">
                        <span>저장</span>
                    </a>
                    <a href="javascript:;" id="close" class="button small">
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
            $frm.validate({
                ignore : [],
                rules : {
                    ORD_BNF_DT : {
                        required : true
                    },
                    PRD_MST_SPT_TXT : {
                        required : true
                    },
                    ORD_MST_VDR_BNF_ID : {
                        required : true
                    }
                }
            });
            <%-- 저장 이벤트  --%>
            $popup.on("click", "#save", function() {
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("BatchTarget"));
                    }
                }
            });
            <%-- 닫기  --%>
            $popup.on("click", "#close", function() {
                opener.location.reload();
                window.close();
            }); 
        });
    </script>
</body>
</html>
