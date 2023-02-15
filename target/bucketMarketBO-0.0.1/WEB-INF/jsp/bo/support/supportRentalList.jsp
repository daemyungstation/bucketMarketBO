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
                    <h2 class="title">
                        <span>렌탈접수 조회</span>
                    </h2>
                    <h3 class="title">
                        <span>검색</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: 35%;" />
                                <col style="width: 15%;" />
                                <col style="width: 35%;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>접수일</span>
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
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text date" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
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
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall">
                                            <span>두달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>제휴업체</span>
                                    </th>
                                    <td>
                                        <c:if test="${not isScm }">
                                            <select class="select" name="searchVdrMstIdx" id="searchVdrMstIdx">
                                                <option value="">전체</option>
                                                <c:if test="${not empty vendorList }">
                                                    <c:forEach var="row" items="${vendorList }" varStatus="i">
                                                        <option value="<c:out value="${row.VDR_MST_IDX }"/>" <c:if test="${row.VDR_MST_IDX eq commandMap.searchVdrMstIdx }">selected="selected"</c:if>>
                                                            <c:out value="${row.VDR_MST_NM }" />
                                                        </option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </c:if>
                                        <c:if test="${isScm }">
                                            <c:out value="${sessionManager.VDR_MST_NM }"/>
                                        </c:if>
                                    </td>
                                    <th>
                                        <span>모델분류(지원혜택)</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstMdTypeAndSplNm" id="searchPrdMstMdTypeAndSplNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>" maxlength="40"/>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <th>
                                        <span>온라인 상품명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstNm }"/>" maxlength="40"/>
                                    </td>
                                    <th>
                                        <span>고객명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchMemNm" id="searchMemNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchMemNm }"/>" maxlength="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>제휴사 승인결과</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchVdrApv" id="searchVdrApv0" class="radio" value="" <c:if test="${empty commandMap.searchVdrApv }">checked="checked"</c:if>/>
                                        <label for="searchVdrApv0">전체</label>
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="row" items="${codeList }" varStatus="i">
                                                <input type="radio" name="searchVdrApv" id="searchVdrApv<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchVdrApv }">checked="checked"</c:if>/>
                                                <label for="searchVdrApv<c:out value="${i.index + 1 }"/>"><c:out value="${row.CMN_COM_NM }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                    <th>
                                        <span>연락처 뒤 4자리</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchCell" id="searchCell" class="text xlarge" value="<c:out value="${commandMap.searchCell }"/>"/>
                                    </td>                                  
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색 조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="ORD_MST_IDX" value="" />
                        <input type="hidden" name="PRD_MST_NO" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                        <input type="hidden" name="searchPrdMstMdTypeAndSplNm" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>" />
                        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
                        <input type="hidden" name="searchMemNm" value="<c:out value="${commandMap.searchMemNm }"/>" />
                        <input type="hidden" name="searchVdrApv" value="<c:out value="${commandMap.searchVdrApv }"/>" />
                        <input type="hidden" name="searchCell" value="<c:out value="${commandMap.searchCell }"/>" />
                        <div class="grid section-button-list">
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
                        <div class="box-scroll-table">
                            <table cellspacing="0" class="table-col table-b">
                                <colgroup>
                                    <col style="width: 5%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: auto;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>주문번호</th>
                                        <th>접수일</th>
                                        <th>고객명</th>
                                        <th>연락처</th>
                                        <th>제휴업체</th>
                                        <th>모델분류(지원혜택)</th>
                                        <th>제품타입</th>
                                        <th>모델명</th>
                                        <th>제휴사 승인결과</th>
                                        <th>상세</th>
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
                                                    <td>
                                                        <c:out value="${row.ORD_MST_IDX }" />
                                                    </td>
                                                    <td>
                                                        <ui:formatDate value="${row.ORD_MST_REG_DT }" pattern="yyyy.MM.dd" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MEM_NM }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.CELL}" />
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="scm_detail" data-vdr_mst_idx="<c:out value="${row.VDR_MST_IDX }"/>">
                                                            <c:out value="${row.VDR_MST_NM}" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MODEL_CL_NM}" />
                                                        <BR>
                                                        <c:out value="${row.PRD_MST_SPL_NM}" />
                                                    </td>
                                                    <td>
                                                    <c:if test="${not empty row.PRD_OPT_DTL_LIST }">
                                                        <select class="select" name="PRD_OPT_IDX" id="PRD_OPT_IDX" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                            <c:forTokens  var="option" items="${row.PRD_OPT_DTL_LIST}" delims=",">
                                                            <c:set var="value" value="${fn:split(option,'|')}" />
                                                                <option value="<c:out value="${value[0] }"/>" <c:if test="${value[0] eq row.PRD_OPT_IDX }">selected="selected"</c:if>>
                                                                    <c:out value="${value[1] }" />
                                                                </option>
                                                            </c:forTokens>
                                                        </select>
                                                        <BR>
                                                        <a href="javascript:;" class="button xsmall option">
                                                            <span>저장</span>
                                                        </a>
                                                    </c:if>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MODEL_NM}" />
                                                    </td>
                                                    <td>
                                                        <select class="select" name="ORD_MST_VDR_APV" id="ORD_MST_VDR_APV"  data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                            <c:if test="${not empty codeList }">
                                                                <c:forEach var="code" items="${codeList }" varStatus="i">
                                                                    <option value="<c:out value="${code.CMN_COM_IDX }"/>" <c:if test="${code.CMN_COM_IDX eq row.ORD_MST_VDR_APV }">selected="selected"</c:if>>
                                                                        <c:out value="${code.CMN_COM_NM }" />
                                                                    </option>
                                                                </c:forEach>
                                                            </c:if>
                                                        </select>  
                                                        <c:if test="${(row.ORD_MST_VDR_APV eq Code.RENTAL_TM)||(row.ORD_MST_VDR_APV eq Code.RENTAL_READY)||(row.ORD_MST_VDR_APV eq Code.RENTAL_NO) }">
                                                            <BR>
                                                            <a href="javascript:;" class="button xsmall approval">
                                                                <span>저장</span>
                                                            </a>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="button xsmall list-contents" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                            <span>상세</span>
                                                        </a>                                                    
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
                        </div>
                        <div class="section-pagination">
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
                    </form>
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
                $frm = $wrapper.find("#frm")
                $searchForm = $wrapper.find("#searchForm");
            <%-- 엑셀다운로드 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            <%-- 온라인상품명 a Tag 클릭 이벤트 --%>
            $frm.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
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
            <%-- 주문상세 버튼 클릭 이벤트 --%>
            $frm.on("click", ".list-contents", function() {
                $frm.find("input[name='ORD_MST_IDX']").val($(this).data("ord_mst_idx"));
                $frm.postPop($.action.popup("Detail"), "orderDetailPopup", "width=1500,height=1000,left=10,top=10");
            });
            <%-- 옵션저장 클릭 이벤트 --%>
            $wrapper.on("click", ".option", function() {
                if (confirm("저장 하시겠습니까?")) {
                    var $target = $(this).siblings("select[name='PRD_OPT_IDX']");
                    var array = new Array(),
                        param = new Object();
                    $target.each(function () {
                        var $this = $(this);
                        param.ORD_MST_IDX = $this.data("ord_mst_idx");
                        param.PRD_OPT_IDX = $this.val();
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("OptionModify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                    });
                }
            });
            <%-- 제휴사 승인 클릭 이벤트 --%>
            $wrapper.on("click", ".approval", function() {
                if (confirm("저장 하시겠습니까?")) {
                    var $this = $(this);
                    var $target = $this.siblings("select[name='ORD_MST_VDR_APV']");
                    var array = new Array(),
                        param = new Object();
                    $target.each(function () {
                        var $this = $(this);
                        param.ORD_MST_IDX = $this.data("ord_mst_idx");
                        param.ORD_MST_VDR_APV = $this.val();
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("ApprovalModify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            if((data.ORD_MST_VDR_APV=="<c:out value="${Code.RENTAL_APPROVAL }"/>")||(data.ORD_MST_VDR_APV=="<c:out value="${Code.RENTAL_CANCEL }"/>")||(data.ORD_MST_VDR_APV=="<c:out value="${Code.RENTAL_REJECT }"/>")){
                                $this.remove();
                            }
                            alert("저장 되었습니다.");
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                    });
                }
            });
            <%-- 제휴사 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".scm_detail", function() {
                $.common.popup.scm.detail($(this).data("vdr_mst_idx"));
            });
        });
    </script>
</body>
</html>