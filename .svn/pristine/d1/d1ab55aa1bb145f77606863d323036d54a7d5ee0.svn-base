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
                    <h2 class="title">
                        <span>결제수단변경 신청</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>등록일</span>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchStartDate" id="searchStartDate" class="text date" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text date"value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
                                        <a href="javascript:DateUtil.fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall">
                                            <span>전체</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall">
                                            <span>오늘</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall">
                                            <span>일주일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall">
                                            <span>15일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall">
                                            <span>한달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>회원번호</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchAccntNo" id="searchAccntNo" class="text xlarge" value="<c:out value="${commandMap.searchAccntNo }"/>"/>
                                    </td>
                                    <th>
                                        <span>고객명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchMemNm" id="searchMemNm" class="text xlarge" value="<c:out value="${commandMap.searchMemNm }"/>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>연락처 뒤 4자리</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchCell" id="searchCell" class="text xlarge" value="<c:out value="${commandMap.searchCell }"/>"/>
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchCmnComIdx" id="searchCmnComIdx0" class="radio" <c:if test="${empty commandMap.searchCmnComIdx }">checked="checked"</c:if> value="" />
                                        <label for="searchCmnComIdx0">전체</label>
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="row" items="${codeList }" varStatus="i">
                                                <input type="radio" name="searchCmnComIdx" id="searchCmnComIdx<c:out value="${i.index + 1 }"/>" class="radio" <c:if test="${row.CMN_COM_IDX eq commandMap.searchCmnComIdx }">checked="checked"</c:if> value="<c:out value="${row.CMN_COM_IDX }"/>" />
                                                <label for="searchCmnComIdx<c:out value="${i.index + 1 }"/>"><c:out value="${row.CMN_COM_NM }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="grid section-button-search">
                        <!-- 검색 하단 버튼 -->
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색 조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="CLM_ACT_IDX" value=""/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchAccntNo" value="<c:out value="${commandMap.searchAccntNo }"/>" />
                        <input type="hidden" name="searchMemNm" value="<c:out value="${commandMap.searchMemNm }"/>" />
                        <input type="hidden" name="searchCell" value="<c:out value="${commandMap.searchCell }"/>" />
                        <input type="hidden" name="searchCmnComIdx" value="<c:out value="${commandMap.searchCmnComIdx }"/>" />
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
                        <!-- // 목록 상단 버튼 -->
                        <div class="box-scroll-table">
                            <table cellspacing="0" class="table-col table-b">
                                <!-- table -->
                                <colgroup>
                                    <col style="width: 5%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 15%;" />
                                    <col style="width: 6%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 5%;" />
                                    <col style="width: 5%;" />
                                    <col style="width: 9%;" />
                                    <col style="width: 5%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 5%;" />
                                    <col style="width: 12%;" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>회원번호</th>
                                        <th>온라인상품명</th>
                                        <th>고객명</th>
                                        <th>연락처</th>
                                        <th>기간계상품코드</th>
                                        <th>잔여<br/>회차</th>
                                        <th>납입<br/>회차</th>
                                        <th>모델분류<br/>(지원혜택)</th>
                                        <th>모델명</th>
                                        <th>신청정보</th>
                                        <th>신청일</th>
                                        <th>진행상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list }">
                                            <c:forEach var="row" items="${list }" varStatus="i">
                                                <tr>
                                                    <td>
                                                        <c:out value="${paging.listNum - i.index }" />
                                                    </td>
                                                    <td class="left">
                                                        <a href="javascript:;" class="account-detail" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                            <c:out value="${row.ACCNT_NO }" />
                                                        </a>
                                                    </td>
                                                    <td class="left">
                                                        <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                                            <c:out value="${row.PRD_MST_NM }" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MEM_NM }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.CELL }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PROD_CD }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${row.REMAINDER_CNT }" type="number"/>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${row.TRUE_CNT }" type="number"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MODEL_CD }" />
                                                        <br/>
                                                        (
                                                        <c:out value="${row.PRD_MST_SPL_NM }" />
                                                        )
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MODEL_NM }" />
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="button xsmall detail" data-clm_act_idx="<c:out value="${row.CLM_ACT_IDX }"/>">
                                                            <span>상세</span>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <ui:formatDate value="${row.CLM_ACT_REG_DT }" pattern="yyyy.MM.dd" />
                                                    </td>
                                                    <td>
                                                        <select name="CMN_COM_IDX" class="select half" data-clm_act_idx="<c:out value="${row.CLM_ACT_IDX }"/>">
                                                            <c:if test="${not empty codeList }">
                                                                <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                                                    <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${codeRow.CMN_COM_IDX eq row.CMN_COM_IDX }">selected="selected"</c:if>><c:out value="${codeRow.CMN_COM_NM }"/></option>
                                                                </c:forEach>
                                                            </c:if>
                                                        </select>
                                                        <a href="javascript:;" class="button xsmall save">
                                                            <span>저장</span>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${empty topList and empty list}">
                                                <tr>
                                                    <td class="td_no_result"></td>
                                                </tr>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                        <div class="section-pagination">
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <!-- 개발 시 wrap 이하 모듈 시작 -->
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
                    </form>
                </div>
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
                $frm = $wrapper.find("#frm")
                $searchForm = $wrapper.find("#searchForm");
            <%-- 엑셀다운로드 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            <%-- 가입 상세 팝업 호출 --%>
            $wrapper.on("click", ".account-detail", function() {
                $.common.popup.order.detail($(this).data("ord_mst_idx"));
            });
            <%-- 상품 상세 팝업 호출 --%>
            $wrapper.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
            });
            <%-- 상품 상세 팝업 호출 --%>
            $wrapper.on("click", ".detail", function() {
                $frm.find("input[name='CLM_ACT_IDX']").val($(this).data("clm_act_idx"));
                $frm.postPop($.action.popup("Edit"), "payMethodEditPopup", "width=1200,height=600,left=10,top=10");
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "input[type='text']", function(e) {
                if (e.keyCode == 13) {
                    $("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
            <%-- 저장버튼 클릭 이벤트 --%>
            $wrapper.on("click", ".save", function() {
                if (confirm("저장 하시겠습니까?")) {
                    var $target = $(this).siblings("select[name='CMN_COM_IDX']");
                    var array = new Array(),
                        param = new Object();
                    $target.each(function () {
                        var $this = $(this);
                        param.CLM_ACT_IDX = $this.data("clm_act_idx");
                        param.CMN_COM_IDX = $this.val();
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("Modify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                    });
                }
            });
        });
    //-->
    </script>
</body>
</html>