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
                    <h2 class="title"><span>개요</span></h2>
                    <div class="section-title"><h3 class="title"><span>검색</span></h3></div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchPeriod" value="<c:out value="${commandMap.searchPeriod }"/>"/>
                        <input type="hidden" name="searchAgent" value="<c:out value="${commandMap.searchAgent }"/>"/>
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
                                        <input type="text" name="searchStartDate" id="searchStartDate" class="text date" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text date" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
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
                                <tr>
                                    <th><span>가입매체</span</th>
                                    <td>
                                        <input type="radio" name="searchAgent" id="searchAgent0" class="radio" <c:if test="${empty commandMap.searchAgent }">checked="checked"</c:if> value="" />
                                        <label for="searchAgent0">전체</label>
                                        <c:forEach var="item" items="${Const.DEVICE_TYPE }" varStatus="stat">
                                            <input type="radio" name="searchAgent" id="searchAgent<c:out value="${stat.index + 1 }"/>" class="radio" <c:if test="${commandMap.searchAgent eq item.key }">checked="checked"</c:if> value="<c:out value="${item.key }"/>" />
                                            <label for="searchAgent<c:out value="${stat.index + 1 }"/>"><c:out value="${item.value }"/></label>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                        <a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
                    </div>
                    <div class="section-title"><h3 class="title"><span>실적 비중</span></h3></div>
                    <div class="section-chart">
                        <div class="grid">
                            <div class="col col-1-4">
                                <h3 class="title"><span>접수</span></h3>
                                <div class="stats-canvas-holder">
                                    <c:if test="${info.TOT_R gt 0 }">
                                        <canvas id="chartReady" width="280" height="280" />
                                    </c:if>
                                    <c:if test="${info.TOT_R eq 0 }">
                                        <p>등록된 데이터가 없습니다.</p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col col-1-4">
                                <h3 class="title"><span>대기</span></h3>
                                <div class="stats-canvas-holder">
                                    <c:if test="${info.TOT_W gt 0 }">
                                        <canvas id="chartWait" width="280" height="280" />
                                    </c:if>
                                    <c:if test="${info.TOT_W eq 0 }">
                                        <p>등록된 데이터가 없습니다.</p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col col-1-4">
                                <h3 class="title"><span>가입</span></h3>
                                <div class="stats-canvas-holder">
                                    <c:if test="${info.TOT_J gt 0 }">
                                        <canvas id="chartJoin" width="280" height="280" />
                                    </c:if>
                                    <c:if test="${info.TOT_J eq 0 }">
                                        <p>등록된 데이터가 없습니다.</p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col col-1-4">
                                <h3 class="title"><span>해약</span></h3>
                                <div class="stats-canvas-holder">
                                    <c:if test="${info.TOT_C gt 0 }">
                                        <canvas id="chartCancel" width="280" height="280" />
                                    </c:if>
                                    <c:if test="${info.TOT_C eq 0 }">
                                        <p>등록된 데이터가 없습니다.</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section-title">
                        <h3 class="title"><span>실적 상세 현황</span></h3>
                        <div class="more">
                            <a href="javascript:;" id="goExcelDownload" class="button small info"><span>엑셀다운로드</span></a>
                        </div>
                    </div>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th rowspan="2"><c:out value="${Const.PERIODS[commandMap.searchPeriod] }"/></th>
                                <th colspan="4">일반</th>
                                <th colspan="4">레디플래너</th>
                            </tr>
                            <tr>
                                <c:forEach begin="1" end="2">
                                    <th>접수</th>
                                    <th>대기</th>
                                    <th>가입</th>
                                    <th>해약</th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty list }">
                                <c:forEach var="row" items="${list }" varStatus="stat">
                                    <tr <c:if test="${stat.last }">class="total"</c:if>>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><c:out value="${row.DAY }"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.CST_R }" type="number"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.CST_W }" type="number"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.CST_J }" type="number"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.CST_C }" type="number"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.RDP_R }" type="number"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.RDP_W }" type="number"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.RDP_J }" type="number"/></td>
                                        <td <c:if test="${stat.last }">class="col"</c:if>><fmt:formatNumber value="${row.RDP_C }" type="number"/></td>
                                    </tr>
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
            <%-- 차트 --%>
            var setChart = function (el, obj, type, data) {
                if (el.length < 1) return false;
                var element = el[0].getContext("2d");
                obj = new Chart(element, {type : type, data : data});
            };
            var chartData = [
                ["#chartReady", {labels: ["일반", "레디플래너"], datasets: [{data: [<c:out value="${info.CNT_R}"/>, <c:out value="${info.RDP_R}"/>], backgroundColor : ["#36A2EB", "#FF6384"]}]}],
                ["#chartWait", {labels: ["일반", "레디플래너"], datasets: [{data: [<c:out value="${info.CNT_W}"/>, <c:out value="${info.RDP_W}"/>], backgroundColor : ["#36A2EB", "#FF6384"]}]}],
                ["#chartJoin", {labels: ["일반", "레디플래너"], datasets: [{data: [<c:out value="${info.CNT_J}"/>, <c:out value="${info.RDP_J}"/>], backgroundColor : ["#36A2EB", "#FF6384"]}]}],
                ["#chartCancel", {labels: ["일반", "레디플래너"], datasets: [{data: [<c:out value="${info.CNT_C}"/>, <c:out value="${info.RDP_C}"/>], backgroundColor : ["#36A2EB", "#FF6384"]}]}]
            ];
            $.each(chartData, function (i, data) {
                setChart($.find(data[0]), null, "pie", data[1]);
            });
        });
    </script>
</body>
</html>
