<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="planner" data-menu_subclass="plannerPopup">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
            
                <%-- 타이틀 --%>
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>레디 플래너 정보 (활동)</span>
                    </h2>
                </div>
                
                <%-- 탭 --%>
                <div class="tab-list">
                    <ul>
                        <li>
                            <a href="javascript:;" class="term-type-tab" id="tabProfile"><span>프로필</span></a>
                        </li>
                        <li>
                            <a href="javascript:;" class="term-type-tab" id="tabPerformance"><span>실적</span></a>
                        </li>
                        <li class="in">
                            <a href="javascript:;" class="term-type-tab"><span>지급</span></a>
                        </li>
                    </ul>
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
                    <span>목록</span>
                </h3>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="RDP_MST_IDX" value="<c:out value="${info.RDP_MST_IDX }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                        <!-- table -->
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <span>기간</span>
                                </th>
                                <td colspan="3">
                                    <c:set var="today" value="<%=new java.util.Date()%>" />
                                    <fmt:formatDate value="${today}" pattern="yyyy" var="todayYear"/> 
                                    <select class="select" id="searchStartYear" name="searchStartYear" >
                                        <option value="">년도 선택</option>
                                        <c:forEach begin="0" end="10" var="idx" step="1">
                                            <option value="<c:out value="${todayYear - idx}" />" <c:if test="${commandMap.searchStartYear eq todayYear - idx}">selected="selected"</c:if>>
                                                <c:out value="${todayYear - idx}" />
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <select class="select" id="searchStartMonth" name="searchStartMonth" >
                                        <option value="">월 선택</option>
                                        <c:forEach begin="1" end="12" var="month" step="1">
                                            <option value="<c:out value="${month }"/>" <c:if test="${commandMap.searchStartMonth eq month}">selected="selected"</c:if>>
                                                <c:out value="${month }" />
                                            </option>
                                        </c:forEach>
                                    </select>
                                    ~
                                    <select class="select" id="searchEndYear" name="searchEndYear" >
                                        <option value="">년도 선택</option>
                                        <c:forEach begin="0" end="10" var="idx" step="1">
                                            <option value="<c:out value="${todayYear - idx}" />" <c:if test="${commandMap.searchEndYear eq todayYear - idx}">selected="selected"</c:if>>
                                                <c:out value="${todayYear - idx}" />
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <select class="select" id="searchEndMonth" name="searchEndMonth" >
                                        <option value="">월 선택</option>
                                        <c:forEach begin="1" end="12" var="month" step="1">
                                            <option value="<c:out value="${month }"/>" <c:if test="${commandMap.searchEndMonth eq month}">selected="selected"</c:if>>
                                                <c:out value="${month }" />
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- // table -->
                </form>
                <div class="grid section-button-search">
                    <!-- 검색 하단 버튼 -->
                    <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                        <span>검색조건 초기화</span>
                    </a>
                    <a href="#none" id="search" class="button small primary">
                        <span>검색</span>
                    </a>
                </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="RDP_MST_IDX" value="<c:out value="${info.RDP_MST_IDX }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartYear" value="<c:out value="${commandMap.searchStartYear }"/>" />
                        <input type="hidden" name="searchStartMonth" value="<c:out value="${commandMap.searchStartMonth }"/>" />
                        <input type="hidden" name="searchEndYear" value="<c:out value="${commandMap.searchEndYear }"/>" />
                        <input type="hidden" name="searchEndMonth" value="<c:out value="${commandMap.searchEndMonth }"/>" />
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
                                <col style="width: 5%;" />
                                <col style="width: auto;" />
                                <col style="width: auto" />
                                <col style="width: 10%;" />
                                <col style="width: 10%;" />
                            </colgroup>
                            <thead>
                                
                                <tr>
                                    <th>NO</th>
                                    <th>정산년월</th>
                                    <th>정산금액</th>
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
                                                    <c:out value="${row.RMT_ORD_RQT_DT }" />
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${row.PRD_MST_RDP_DVD_PAY }" type="number"/>원
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${row.RMT_ORD_YN eq 'Y' }">지급완료</c:when>
                                                        <c:when test="${row.RMT_ORD_YN eq 'N' }">지급요청</c:when>
                                                        <c:when test="${row.RMT_ORD_YN eq null }">지급요청 전</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.RMT_ORD_PAY_DT }" pattern="yyyyMM"/>
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
                
                <%-- 탭 폼 --%>
                <form id="tabFrm" name="tabFrm">
                    <input type="hidden" name="RDP_MST_IDX" value="<c:out value="${info.RDP_MST_IDX }"/>" />
                </form>

                <%-- 닫기 --%>
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
                $searchForm = $popup.find("#searchForm"),
                $tabFrm = $popup.find("#tabFrm");
            // 탭
            $popup.on("click", "#tabProfile", function() {
                $tabFrm.postSubmit($.action.popup("Profile"));
            });
            $popup.on("click", "#tabPerformance", function() {
                $tabFrm.postSubmit($.action.popup("Performance"));
            });
            // 검색
            $popup.on("click", "#search", function() {
                var searchStartYear = $popup.find("#searchStartYear").val();
                var searchStartMonth = $popup.find("#searchStartMonth").val();
                var searchEndYear = $popup.find("#searchEndYear").val();
                var searchEndMonth = $popup.find("#searchEndMonth").val();
                if ((!searchStartYear && searchStartMonth) || (searchStartYear && !searchStartMonth)) {
                    alert("검색기간의 년도, 월을 모두 선택해주세요.");
                    return;
                }
                if ((!searchEndYear && searchEndMonth) || (searchEndYear && !searchEndMonth)) {
                    alert("검색기간의 년도, 월을 모두 선택해주세요.");
                    return;
                }
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.popup("Payment"));
            });
            // 페이지 이동
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.popup("Payment"));
            };
            // 엑셀 다운로드
            $popup.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload("Payment"));
            });
        });
    </script>
</body>
</html>
