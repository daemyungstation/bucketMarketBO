<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="planner" data-menu_subclass="plannerCalculate">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
            
                <%-- 타이틀 --%>
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>플래너별 상세 실적 조회</span>
                    </h2>
                </div>
            
                <%-- 기본정보 --%>
                <h3 class="title">
                    <span>프로필</span>
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
                                    <span>플래너 번호</span>
                                </label>
                            </th>
                            <td>
                                <c:out value="${info.RDP_MST_NO }"/>
                            </td>
                            <th>
                                <label class="label">
                                    <span>이름 / 아이디</span>
                                </label>
                            </th>
                            <td>
                                <c:out value="${info.RDP_MST_MEM_NM }"/> / <c:out value="${info.RDP_MST_ID }"/>
                            </td>
                    </tbody>
                </table>
                
                <h3 class="title">
                    <span>정산년월 <c:out value="${commandMap.searchCalculateYear }"/>년 <c:out value="${commandMap.searchCalculateMonth }"/>월</span>
                </h3>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchCalculateYear" value="<c:out value="${commandMap.searchCalculateYear }"/>" />
                    <input type="hidden" name="searchCalculateMonth" value="<c:out value="${commandMap.searchCalculateMonth }"/>" />
                </form>
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="RDP_MST_IDX" value="<c:out value="${commandMap.RDP_MST_IDX }"/>" />
                    <input type="hidden" name="searchCalculateYear" value="<c:out value="${commandMap.searchCalculateYear }"/>" />
                    <input type="hidden" name="searchCalculateMonth" value="<c:out value="${commandMap.searchCalculateMonth }"/>" />
                    <div class="grid section-button-list">
                        <!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                            <span class="pages">
                                (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="javascript:;" id="goExcelDownload" class="button small info">
                                <span>엑셀다운로드</span>
                            </a>
                        </div>
                    </div>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 4%;" />
                            <col style="width: 8%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 8%;" />
                            <col style="width: 10%;" />
                            <col style="width: 8%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>가입자명</th>
                                <th>연락처</th>
                                <th>온라인 상품명</th>
                                <th>접수일자</th>
                                <th>가입일자</th>
                                <th>가입상태</th>
                                <th>수당</th>
                                <th>지급여부</th>
                                <th>지급일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list}">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${paging.listNum - i.index }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.MEM_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.CELL }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.PRD_MST_NM }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.ORD_MST_ORD_DT }" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.JOIN_DT }" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${row.KSTBIT eq Dlcc.JOIN_STATE_RECEIPT }">가입대기</c:when>
                                                    <c:when test="${row.KSTBIT eq Dlcc.JOIN_STATE_JOIN }">가입</c:when>
                                                    <c:when test="${row.KSTBIT eq Dlcc.JOIN_STATE_CANCEL }">해약</c:when>
                                                    <c:when test="${row.KSTBIT eq Dlcc.JOIN_STATE_USE }">행사</c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${row.PAY }" pattern="#,###" />
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${row.RMT_ORD_YN eq 'Y' }">지급완료</c:when>
                                                    <c:when test="${row.RMT_ORD_YN eq 'N' }">지급요청</c:when>
                                                    <c:when test="${row.RMT_ORD_YN eq null }">지급요청 전</c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.RMT_ORD_PAY_DT }" pattern="yyyy.MM.dd"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td class="td_no_result"></td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                    <div class="section-pagination">
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                    </div>
                </form>
                
                <%-- 저장/닫기 --%>
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
                $frm = $popup.find("#frm"),
                $searchForm = $popup.find("#searchForm");
            // 페이지 이동
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.popup("HistoryList"));
            };
            // 엑셀 다운로드
            $popup.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload("HistoryListPopup"));
            });
        });
    </script>
</body>
</html>
