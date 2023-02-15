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
                        <span>플래너 정산</span>
                    </h2>
                    <h3 class="title">
                        <span>검색</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
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
                                        <span>정산월</span>
                                    </th>
                                    <td colspan="3">
                                        <c:set var="today" value="<%=new java.util.Date()%>" />
                                        <fmt:formatDate value="${today}" pattern="yyyy" var="todayYear"/> 
                                        <fmt:formatDate value="${today}" pattern="MM" var="todayMonth"/> 
                                        <select class="select" id="searchCalculateYear" name="searchCalculateYear" >
                                            <c:forEach begin="0" end="10" var="idx" step="1">
                                                <option value="<c:out value="${todayYear - idx}" />" <c:if test="${commandMap.searchCalculateYear eq todayYear - idx}">selected="selected"</c:if>>
                                                    <c:out value="${todayYear - idx}" />
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <select class="select" id="searchCalculateMonth" name="searchCalculateMonth" >
                                            <c:forEach begin="1" end="${todayMonth }" var="month" step="1">
                                                <option value="<c:out value="${todayMonth - month + 1}"/>" <c:if test="${commandMap.searchCalculateMonth eq todayMonth - month + 1}">selected="selected"</c:if>>
                                                    <c:out value="${todayMonth - month + 1}" />
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
                                <a href="javascript:;" id="paymentProc" class="button small primary">
                                    <span>지급 요청</span>
                                </a>
                            </div>
                        </div>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 8%;" />
                                <col style="width: 12%;" />
                                <col style="width: 12%;" />
                                <col style="width: auto;" />
                                <col style="width: 5%;" />
                                <col style="width: 8%;" />
                                <col style="width: 8%;" />
                                <col style="width: 12%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>플래너번호</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>정산금액</th>
                                    <th>사업자유형</th>
                                    <th>번호</th>
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
                                                <td class="text-right">
                                                    <a href="javascript:;" class="list-total" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>">
                                                        <fmt:formatNumber value="${row.TOTAL_ALOW_AMT }" pattern="#,###" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_BUSI_CLS_NM }" />
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${row.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                                                            <c:out value="${row.RDP_MST_SSN1 }" />-<c:out value="${row.RDP_MST_SSN2 }" />
                                                        </c:when>
                                                        <c:when test="${row.RDP_MST_BUSI_CLS ne Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                                                            <c:out value="${row.RDP_MST_BUSI1 }" />-<c:out value="${row.RDP_MST_BUSI2 }" />-<c:out value="${row.RDP_MST_BUSI3 }" />
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${row.RMT_ORD_YN eq 'Y' }">지급완료</c:when>
                                                        <c:when test="${row.RMT_ORD_YN eq 'N' }">미지급</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.RMT_ORD_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
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

            // 검색
            $wrapper.on("click", "#search", function() {
                var searchCalculateYear = $wrapper.find("#searchCalculateYear").val();
                var searchCalculateMonth = $wrapper.find("#searchCalculateMonth").val();
                if (!searchCalculateYear && searchCalculateMonth) {
                    alert("정산월의 년도, 월을 모두 선택해주세요.");
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
            // 플래너 번호
            $wrapper.on("click", ".list-title", function() {
                $.common.popup.planner.detail($(this).data("rdp_mst_idx"));
            });
            // 정산금액
            $wrapper.on("click", ".list-total", function() {
                $frm.find("input[name='RDP_MST_IDX']").val($(this).data("rdp_mst_idx"));
                $frm.postPop($.action.popup("HistoryList"), "plannerCalculateHistoryListPopup", "width=1600,height=800,left=50,top=50");
            });
            // 엑셀 다운로드
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            // 지급 요청
            $wrapper.on("click", "#paymentProc", function() {
                var searchCalculateYear = $wrapper.find("#searchCalculateYear").val();
                var searchCalculateMonth = $wrapper.find("#searchCalculateMonth").val();
                if (!searchCalculateYear && searchCalculateMonth) {
                    alert("정산월의 년도, 월을 모두 선택해주세요.");
                    return;
                }
                if (confirm("지급 요청 하시겠습니까?")) {
                    var param = {
                        calculateYear : searchCalculateYear,
                        calculateMonth : searchCalculateMonth
                    };
                    $.postSyncJsonAjax($.action.ajax("Payment"), param, function(data) {
                        if (data.isSuccess) {
                            alert("지급이 요청 되었습니다.");
                            goPage(1);
                        } else {
                            alert("지급 요청이 실패하였습니다.");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
