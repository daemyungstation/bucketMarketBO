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
                        <span>플래너 정산 지급</span>
                    </h2>
                    <h3 class="title">
                        <span>검색</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <div class="box-scroll-table">
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
                                            <select class="select" id="searchPaymentYear" name="searchPaymentYear" >
                                                <c:forEach begin="0" end="10" var="idx" step="1">
                                                    <option value="<c:out value="${todayYear - idx}" />" <c:if test="${commandMap.searchPaymentYear eq todayYear - idx}">selected="selected"</c:if>>
                                                        <c:out value="${todayYear - idx}" />
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <select class="select" id="searchPaymentMonth" name="searchPaymentMonth" >
                                                <c:forEach begin="1" end="${todayMonth }" var="month" step="1">
                                                    <option value="<c:out value="${todayMonth - month + 1}"/>" <c:if test="${commandMap.searchPaymentMonth eq todayMonth - month + 1}">selected="selected"</c:if>>
                                                        <c:out value="${todayMonth - month + 1}" />
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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
                        <input type="hidden" name="searchPaymentYear" value="<c:out value="${commandMap.searchPaymentYear }"/>" />
                        <input type="hidden" name="searchPaymentMonth" value="<c:out value="${commandMap.searchPaymentMonth }"/>" />
                        <input type="hidden" name="searchCalculateYear" value="<c:out value="${commandMap.searchPaymentYear }"/>" />
                        <input type="hidden" name="searchCalculateMonth" value="<c:out value="${commandMap.searchPaymentMonth }"/>" />
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
                                    <span>일괄 지급</span>
                                </a>
                            </div>
                        </div>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 2%;" />
                                <col style="width: 3%;" />
                                <col style="width: 5%;" />
                                <col style="width: 5%;" />
                                <col style="width: 5%;" />
                                <col style="width: 5%;" />
                                <col style="width: 5%;" />
                                <col style="width: 8%;" />
                                <col style="width: 15%;" />
                                <col style="width: 10%;" />
                                <col style="width: 10%;" />
                                <col style="width: 8%;" />
                                <col style="width: 5%;" />
                                <col style="width: auto%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="checkbox check-all" /></th>
                                    <th>NO</th>
                                    <th>플래너번호</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>사업자유형</th>
                                    <th>사업자정보</th>
                                    <th>법인명</th>
                                    <th>주소</th>
                                    <th>이메일</th>
                                    <th>정산정보</th>
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
                                                    <c:if test="${row.RMT_ORD_YN ne 'Y' }">
                                                        <input type="checkbox" class="checkbox check-row" value="" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>"/>
                                                    </c:if>
                                                </td>
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
                                                    <c:out value="${row.RDP_MST_BUSI_CLS_NM }" />
                                                </td>
                                                <td>
                                                    <c:if test="${row.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                                                        <c:out value="${row.RDP_MST_SSN1 }" />-<c:out value="${row.RDP_MST_SSN2 }" />
                                                    </c:if>
                                                    <c:if test="${row.RDP_MST_BUSI_CLS ne Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                                                        <c:out value="${row.RDP_MST_BUSI1 }"/>-<c:out value="${row.RDP_MST_BUSI2 }"/>-<c:out value="${row.RDP_MST_BUSI3 }"/>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_BUSI_NM }" />
                                                </td>
                                                <td>
                                                    (<c:out value="${row.RDP_MST_ZIP_CODE }" />)&nbsp;<c:out value="${row.RDP_MST_DR_ADDR1 }" />&nbsp;<c:out value="${row.RDP_MST_DR_ADDR2 }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_MAIL }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.RDP_MST_BNK_CD_NM }"/> / 
                                                    <c:out value="${row.RDP_MST_BNK_ACT }"/> / 
                                                    <c:out value="${row.RDP_MST_ACT_HDR }"/>
                                                </td>
                                                <td class="text-right">
                                                    <a href="javascript:;" class="list-total" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>">
                                                        <fmt:formatNumber value="${row.TOTAL_ALOW_AMT }" pattern="#,###" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${row.RMT_ORD_YN eq 'Y' }">지급완료</c:when>
                                                        <c:when test="${row.RMT_ORD_YN eq 'N' }">미지급</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${row.RMT_ORD_YN eq 'Y' }">
                                                            <ui:formatDate value="${row.RMT_ORD_PAY_DT }" pattern="yyyy.MM.dd"/>
                                                        </c:when>
                                                        <c:when test="${row.RMT_ORD_YN eq 'N' }">
                                                            <a href="javascript:;" class="js-datepickr align-right">
                                                                <span class="icon datepickr">
                                                                    <em>날짜선택</em>
                                                                </span>
                                                            </a>
                                                            <input type="text" class="text small paymentDate" readonly="readonly">
                                                            <a href="javascript:;" class="button xsmall payment" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>">
                                                                <span>저장</span>
                                                            </a>
                                                        </c:when>
                                                    </c:choose>
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
            
            <form id="paymentAllForm" name="paymentAllForm">
                <input type="hidden" name="paymentYear" value="<c:out value="${commandMap.searchPaymentYear }"/>" />
                <input type="hidden" name="paymentMonth" value="<c:out value="${commandMap.searchPaymentMonth }"/>" />
                <input type="hidden" name="plannerCount" value="" />
                <input type="hidden" name="PARAMS" value="" />
            </form>
        
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
                $paymentAllForm = $wrapper.find("#paymentAllForm"),
                $searchForm = $wrapper.find("#searchForm");
            // 검색
            $wrapper.on("click", "#search", function() {
                var searchPaymentYear = $wrapper.find("#searchPaymentYear").val();
                var searchPaymentMonth = $wrapper.find("#searchPaymentMonth").val();
                if (!searchPaymentYear && searchPaymentMonth) {
                    alert("정산월의 년도, 월을 모두 선택해주세요.");
                    return;
                }
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            // 체크박스
            $.checkBoxSelect("check-all", "check-row");
            // 페이지 이동
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
            // 엑셀 다운로드
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            // 플래너 번호
            $wrapper.on("click", ".list-title", function() {
                $.common.popup.planner.detail($(this).data("rdp_mst_idx"));
            });
            // 정산금액
            $wrapper.on("click", ".list-total", function() {
                $frm.find("input[name='RDP_MST_IDX']").val($(this).data("rdp_mst_idx"));
                $frm.postPop($.action.popup("HistoryList"), "plannerCalculateHistoryListPopup", "width=1600,height=800,left=50,top=50");
            });
            // 지급 처리
            $wrapper.on("click", "a.payment", function() {
                var paymentDate = $(this).siblings("input.paymentDate").val();
                if (paymentDate && paymentDate.length == 10) {
                    if (confirm("지급 처리 하시겠습니까?")) {
                        var param = {
                            RDP_MST_IDX : $(this).data("rdp_mst_idx"),
                            RMT_ORD_PAY_DT : paymentDate,
                            paymentYear : '<c:out value="${commandMap.searchPaymentYear }"/>',
                            paymentMonth : '<c:out value="${commandMap.searchPaymentMonth }"/>'
                        }
                        $.postSyncJsonAjax($.action.ajax("Complete"), param, function(data) {
                            if (data.isSuccess) {
                                alert("지급이 처리 되었습니다.");
                                goPage(1);
                            } else {
                                alert("지급 처리가 실패하였습니다.");
                            }
                        });
                    }                
                } else {
                    alert("지급일자를 입력해주세요.");
                }
            });
            // 일괄 지급 처리
            $wrapper.on("click", "#paymentProc", function() {
                var $target = $frm.find(".check-row:checked");
                if ($target.length == 0) {
                    alert("지급 처리 할 플래너를 선택해 주십시오.");
                    return;
                }
                if (confirm("지급 처리 하시겠습니까?")) {
                    var array = [];
                    $target.each(function() {
                        var $this = $(this);
                        array.push({
                            RDP_MST_IDX : $this.data("rdp_mst_idx")
                        });
                    });
                    $paymentAllForm.find("input[name='plannerCount']").val(array.length);
                    $paymentAllForm.find("input[name='PARAMS']").val(JSON.stringify(array));
                    $paymentAllForm.postPop($.action.popup("CompleteAll"), "paymentCompleteAll", "width=900,height=400,left=10,top=10");
                }
            });
        });
    </script>
</body>
</html>
