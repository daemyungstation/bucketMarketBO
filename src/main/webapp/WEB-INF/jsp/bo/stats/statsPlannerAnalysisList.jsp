<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
<style type="text/css">
<!--
-->
</style>
</head>
<body>
    <!-- body class, 중요 -->
    <div id="header">
        <!-- header -->
        <%@ include file="/WEB-INF/jsp/bo/include/top.jsp"%>
    </div>
    <!-- // header -->
    <div id="container">
        <!-- container -->
        <div id="aside" class="aside left">
            <!-- aside -->
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <!-- // aside -->
        <div id="wrapper">
            <!-- wrapper -->
            <div id="breadcrumb"></div>
            <!-- breadcrumb -->
            <div id="contents">
                <!-- contents -->
                <div class="container">
                    <!-- container -->
                    <h2 class="title">
                        <span>레디플래너 분석 조회</span>
                    </h2>
                    <h3 class="title">
                        <span>레디플래너 현황</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 18%;" />
                            <col style="width: 16%;" />
                            <col style="width: 16%;" />
                            <col style="width: 16%;" />
                            <col style="width: 16%;" />
                            <col style="width: 16%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th rowspan="2">
                                    전체
                                </th>
                                <th rowspan="2">
                                    신청플래너
                                </th>
                                <th rowspan="2">
                                    활동대기플래너
                                </th>
                                <th colspan="3">
                                    활동플래너
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    정상
                                </th>
                                <th>
                                    정지
                                </th>
                                <th>
                                    해제요청
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <c:out value="${summary1.PLANNER_TOTAL }" />
                                </td>
                                <td>
                                    <c:out value="${summary1.PLANNER_APPLY }" />
                                </td>
                                <td>
                                    <c:out value="${summary1.PLANNER_INACTIVE }" />
                                </td>
                                <td>
                                    <c:out value="${summary1.PLANNER_ACTIVE }" />
                                </td>
                                <td>
                                    <c:out value="${summary1.PLANNER_STOP }" />
                                </td>
                                <td>
                                    <c:out value="${summary1.PLANNER_REQUEST_RELEASE }" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="grid flex">
                        <div class="col-1-2 mr30">
                            <h3 class="title">
                                <span>사업자구분별 현황</span>
                            </h3>
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
                                        <th>개인</th>
                                        <th>개인사업자(세금N)</th>
                                        <th>법인/개인사업자(세금Y)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <c:out value="${summary2.PLANNER_PRIVATE + summary2.PLANNER_NATURAL_PERSON + summary2.PLANNER_LEGAL_PERSON }" />
                                        </td>
                                        <td>
                                            <c:out value="${summary2.PLANNER_PRIVATE }" />
                                        </td>
                                        <td>
                                            <c:out value="${summary2.PLANNER_NATURAL_PERSON }" />
                                        </td>
                                        <td>
                                            <c:out value="${summary2.PLANNER_LEGAL_PERSON }" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-1-2">
                            <h3 class="title">
                                <span>소속구분별 현황</span>
                            </h3>
                            <table cellspacing="0" class="table-col table-b">
                                <colgroup>
                                    <col style="width: 34%;" />
                                    <col style="width: 33%;" />
                                    <col style="width: 33%;" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>전체</th>
                                        <th>일반</th>
                                        <th>임직원</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <c:out value="${summary2.PLANNER_DM_N + summary2.PLANNER_DM_Y }" />
                                        </td>
                                        <td>
                                            <c:out value="${summary2.PLANNER_DM_N }" />
                                        </td>
                                        <td>
                                            <c:out value="${summary2.PLANNER_DM_Y }" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <h3 class="title">
                        <span>검색</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchOrderType" value="<c:out value="${commandMap.searchOrderType }"/>" />
                        <input type="hidden" name="searchContractType" value="" />
                        <input type="hidden" name="RDP_MST_IDX" value="<c:out value="${commandMap.RDP_MST_IDX }"/>" />
                        
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
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartYear" value="<c:out value="${commandMap.searchStartYear }"/>" />
                        <input type="hidden" name="searchStartMonth" value="<c:out value="${commandMap.searchStartMonth }"/>" />
                        <input type="hidden" name="searchEndYear" value="<c:out value="${commandMap.searchEndYear }"/>" />
                        <input type="hidden" name="searchEndMonth" value="<c:out value="${commandMap.searchEndMonth }"/>" />
                        <input type="hidden" name="searchOrderType" value="<c:out value="${commandMap.searchOrderType }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <!-- 정렬 -->
                                <select class="select" id="searchOrderType" name="searchOrderType" >
                                    <option value="orderRdpMstAtvDt" <c:if test="${commandMap.searchOrderType eq 'orderRdpMstAtvDt'}">selected="selected"</c:if>>활동시작일순</option>
                                    <option value="orderReceiptCount" <c:if test="${commandMap.searchOrderType eq 'orderReceiptCount'}">selected="selected"</c:if>>접수건수 높은순</option>
                                    <option value="orderWaitToJoinCount" <c:if test="${commandMap.searchOrderType eq 'orderWaitToJoinCount'}">selected="selected"</c:if>>가입대기건수 높은순</option>
                                    <option value="orderJoinCount" <c:if test="${commandMap.searchOrderType eq 'orderJoinCount'}">selected="selected"</c:if>>가입건수 높은순</option>
                                </select>
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
                                <col style="width: 8%" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: 10%;" />
                                <col style="width: 8%;" />
                                <col style="width: 12%;" />
                                <col style="width: 5%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>플래너번호</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>총 접수건수</th>
                                    <th>총 가입대기건수</th>
                                    <th>총 가입건수</th>
                                    <th>총 해약건수</th>
                                    <th>총 예상수익</th>
                                    <th>아이디</th>
                                    <th>소속</th>
                                    <th>사업자유형</th>
                                    <th>자격</th>
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
                                                    <a href="javascript:;" class="list-title" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>">
                                                        <c:out value="${row.RDP_MST_NO }"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_MEM_NM }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_HP1 }"/>-<c:out value="${row.RDP_MST_HP2 }"/>-<c:out value="${row.RDP_MST_HP3 }"/>
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="list-summary" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>" data-type="<c:out value="${Code.CONTRACT_STATUS_RECEIPT }"/>">
                                                        <c:out value="${row.TOTAL_RECEIPT }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="list-summary" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>" data-type="<c:out value="${Code.CONTRACT_STATUS_WAITING_TO_JOIN }"/>">
                                                        <c:out value="${row.TOTAL_WAITING_TO_JOIN }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="list-summary" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>" data-type="<c:out value="${Code.CONTRACT_STATUS_JOIN }"/>">
                                                        <c:out value="${row.TOTAL_JOIN }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="list-summary" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>" data-type="<c:out value="${Code.CONTRACT_STATUS_CANCEL }"/>">
                                                        <c:out value="${row.TOTAL_CANCEL }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${row.TOTAL_EXPECTED_RETURN }" type="number"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_ID }" />
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${row.RDP_MST_DM_YN eq 'Y' }">임직원(<c:out value="${row.RDP_MST_DM_NO }"/>)</c:when>
                                                        <c:when test="${row.RDP_MST_DM_YN eq 'N' }">일반</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_BUSI_CLS_NM }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_STATE_NM }" />
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
                </div>
                <!-- // container -->
            </div>
            <!-- // contents -->
        </div>
        <!-- // wrapper -->
        <div id="quickmenu" class="aside right">
            <!-- quickmenu-->
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
        <!-- // quickmenu -->
    </div>
    <!-- // container -->
    <div id="footer">
        <%@ include file="/WEB-INF/jsp/bo/include/footer.jsp"%>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
            $frm = $wrapper.find("#frm"),
            $searchForm = $wrapper.find("#searchForm");
            // 소속
            $wrapper.on("change", "input[name='searchRdpMstDmYn']", function() {
                $('#searchRdpMstDmNo').val('');
                $('#searchRdpMstDmNo').attr('disabled', $("input[name='searchRdpMstDmYn']:checked").val() != 'Y');
            });
            // 검색
            $wrapper.on("click", "#search", function() {
                var searchStartYear = $wrapper.find("#searchStartYear").val();
                var searchStartMonth = $wrapper.find("#searchStartMonth").val();
                var searchEndYear = $wrapper.find("#searchEndYear").val();
                var searchEndMonth = $wrapper.find("#searchEndMonth").val();
                if ((!searchStartYear && searchStartMonth) || (searchStartYear && !searchStartMonth)) {
                    alert("검색기간의 년도, 월을 모두 선택해주세요.");
                    return;
                }
                if ((!searchEndYear && searchEndMonth) || (searchEndYear && !searchEndMonth)) {
                    alert("검색기간의 년도, 월을 모두 선택해주세요.");
                    return;
                }
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            // 페이지 이동
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
            // 정렬
            $wrapper.on("change", "select[name='searchOrderType']", function() {
                $searchForm.find("input[name='searchOrderType']").val($(this).val());
                $searchForm.postSubmit($.action.list());
            });
            // 플래너 번호
            $wrapper.on("click", ".list-title", function() {
                $.common.popup.planner.detail($(this).data("rdp_mst_idx"));
            });
            // 접수, 가입대기, 가입 건수
            $wrapper.on("click", "a.list-summary", function() {
                $searchForm.find("input[name='RDP_MST_IDX']").val($(this).data("rdp_mst_idx"));
                $searchForm.find("input[name='searchContractType']").val($(this).data("type"));
                $searchForm.postPop($.action.popup("HistoryList"), "plannerStatusHistoryPopup", "width=1600,height=800,left=50,top=50");
            });
            // 엑셀 다운로드
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
        });
    </script>
</body>
</html>
