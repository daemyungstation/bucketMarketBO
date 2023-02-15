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
                    <h2 class="title"><span>큐레이션</span></h2>
                    <div class="section-title"><h3 class="title"><span>검색</span></h3></div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchPeriod" value="<c:out value="${commandMap.searchPeriod }"/>"/>
                    </form>
                    <form id="searchForm" name="searchForm">
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span>조회기간</span></th>
                                    <td>
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }" />" readonly="readonly" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }" />" readonly="readonly" data-target-start="#searchStartDate" />
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>기간별 범위</span></th>
                                    <td>
                                        <c:forEach var="item" items="${Const.PERIODS }" varStatus="stat">
                                            <input type="radio" name="searchPeriod" id="searchPeriod<c:out value="${stat.index }"/>" class="radio" <c:if test="${commandMap.searchPeriod eq item.key }">checked="checked"</c:if> value="<c:out value="${item.key }"/>" />
                                            <label for="searchPeriod<c:out value="${stat.index }"/>"><c:out value="${item.value }"/></label>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                        <a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
                    </div>
                    <div class="section-title">
                        <span>단위 : 건수</span>
                        <div class="more">
                            <a href="javascript:;" id="goExcelDownload" class="button small info"><span>엑셀다운로드</span></a>
                        </div>
                    </div>
                    <div class="box-scroll-table">
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: 8%;" />
                                <col style="width: 8%;" />
                                <col style="width: 8%;" />
                                <col style="width: 8%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th rowspan="2"><c:out value="${Const.PERIODS[commandMap.searchPeriod] }"/></th>
                                    <th rowspan="2">주제별</th>
                                    <th rowspan="2">선택키워드</th>
                                    <th colspan="4">클릭수</th>
                                </tr>
                                <tr>
                                    <th>총합계</th>
                                    <th>PC</th>
                                    <th>Mobile</th>
                                    <th>Mobile App</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="stat">
                                        <c:if test="${not stat.last }">
                                            <tr>
                                                <td><c:out value="${row.DAY }"/></td>
                                                <td><c:out value="${row.CRT_MST_QST }"/></td>
                                                <td><c:out value="${row.CRT_KWD_SLT }"/></td>
                                                <td><fmt:formatNumber value="${row.TOT }" type="number"/></td>
                                                <td><fmt:formatNumber value="${row.PC }" type="number"/></td>
                                                <td><fmt:formatNumber value="${row.MO }" type="number"/></td>
                                                <td><fmt:formatNumber value="${row.APP }" type="number"/></td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${stat.last }">
                                            <tr class="total">
                                                <td colspan="3" class="col"><c:out value="${row.DAY }"/></td>
                                                <td class="col"><fmt:formatNumber value="${row.TOT }" type="number"/></td>
                                                <td class="col"><fmt:formatNumber value="${row.PC }" type="number"/></td>
                                                <td class="col"><fmt:formatNumber value="${row.MO }" type="number"/></td>
                                                <td class="col"><fmt:formatNumber value="${row.APP }" type="number"/></td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list }">
                                    <tr><td class="td_no_result"></td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="quickmenu" class="aside right">
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
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 검색 엔터 이벤트 --%>
            $searchForm.find("input[type='text']").keydown(function (e) {
                if (e.keyCode == 13) {
                    $wrapper.find("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.view());
            });
            <%-- 엑셀 다운로드 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
        });
    </script>
</body>
</html>
