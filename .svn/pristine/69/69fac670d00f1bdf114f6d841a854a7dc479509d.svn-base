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
                        <span>상세납입현황</span>
                    </h2>
                </div>
                <form id="frm" name="frm">
                    <h3 class="title">
                        <span>회차별 납입정보</span>
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
                                    <c:out value="${customer.ACCNT_NO }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>고객명</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${customer.MEM_NM }"/>
                                </td>                                
                            </tr>
                        </tbody>
                    </table>                    
                    
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>회차</th>
                                <th>납입일자</th>
                                <th>상조부금 납입금</th>
                                <th>결합상품 납입금</th>
                                <th>추가금</th>
                                <th>월납입금총액</th>
                                <th>해약금</th>
                                <th>납입방법</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty payment }">                        
                                    <c:forEach var="payment" items="${payment }" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${payment.PAY_NO }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${payment.PAY_DAY }" pattern="yyyy.MM.dd" />
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
                                            <td>
                                                <fmt:formatNumber value="${payment.PAY_SUM }" type="number"/>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${payment.RESN_AMT }" type="number"/>
                                            </td>
                                            <td>
                                                <c:out value="${payment.PAY_MTHD_NM}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${empty payment}">
                                        <tr>
                                            <td class="td_no_result"></td>
                                        </tr>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>                            
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
</body>
</html>
