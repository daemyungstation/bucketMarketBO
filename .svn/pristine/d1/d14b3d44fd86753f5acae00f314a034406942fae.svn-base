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
                    <h2 class="title">
                        <span>미승인상품 목록</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchOrderBy" value="<c:out value="${Product.REG_SORT}" />" />
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
                                        <span>등록일</span>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
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
                                        <span>지원혜택</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchSupplyNm" id="searchSupplyNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchSupplyNm }"/>" maxlength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>모델명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchModelNm" id="searchModelNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchModelNm }"/>" maxlength="20" />
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchApvState" id="searchApvState0" class="radio" value="<c:out value="${Product.STATE_STOP}" />" <c:if test="${empty commandMap.searchApvState || commandMap.searchApvState eq Product.STATE_STOP  }">checked="checked"</c:if> />
                                        <label for="searchApvState0">전체</label>
                                        <input type="radio" name="searchApvState" id="searchApvState1" class="radio" value="<c:out value="${Product.STATE_DISAPPROVAL}" />" <c:if test="${commandMap.searchApvState eq Product.STATE_DISAPPROVAL}">checked="checked"</c:if> />
                                        <label for="searchApvState1">승인대기</label>
                                        <input type="radio" name="searchApvState" id="searchApvState2" class="radio" value="<c:out value="${Product.STATE_REJECT}" />" <c:if test="${commandMap.searchApvState eq Product.STATE_REJECT}">checked="checked"</c:if> />
                                        <label for="searchApvState2">승인거절</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>전용상품</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdMstPrpYn" id="searchPrdMstPrpYn0" class="radio" value="" <c:if test="${empty commandMap.searchPrdMstPrpYn }">checked="checked"</c:if>/>
                                        <label for="searchPrdMstPrpYn0">전체</label>
                                        <input type="radio" name="searchPrdMstPrpYn" id="searchPrdMstPrpYn1" class="radio" value="Y" <c:if test="${commandMap.searchPrdMstPrpYn eq 'Y' }">checked="checked"</c:if> />
                                        <label for="searchPrdMstPrpYn1">전용</label>
                                        <input type="radio" name="searchPrdMstPrpYn" id="searchPrdMstPrpYn2" class="radio" value="N" <c:if test="${commandMap.searchPrdMstPrpYn eq 'N' }">checked="checked"</c:if> />
                                        <label for="searchPrdMstPrpYn2">일반</label>
                                    </td>
                                    <th></th>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
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
                        <input type="hidden" name="PRD_MST_CD" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchSupplyNm" value="<c:out value="${commandMap.searchSupplyNm }"/>" />
                        <input type="hidden" name="searchModelNm" value="<c:out value="${commandMap.searchModelNm }"/>" />
                        <input type="hidden" name="searchApvState" value="<c:out value="${commandMap.searchApvState }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                        <input type="hidden" name="searchOrderBy" value="<c:out value="${Product.REG_SORT}" />" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <c:if test="${not isScm && isSuper}">
                                    <a href="javascript:;" id="goExcelDownload" class="button small info">
                                        <span>엑셀다운로드</span>
                                    </a>
                                    <a href="javascript:;" id="goApproval" class="button small">
                                        <span>승인완료 처리</span>
                                    </a>
                                    <a href="javascript:;" id="goForm" class="button small primary">
                                        <span>+상품 등록</span>
                                    </a>
                                </c:if>
                                <c:if test="${isScm }">
                                    <a href="javascript:;" id="goForm" class="button small primary">
                                        <span>+상품 등록</span>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                        <div class="box-scroll-table">
                            <table cellspacing="0" class="table-col table-b">
                                <!-- table -->
                                <colgroup>
                                    <c:if test="${not isScm }">
                                        <col style="width: 3%;" />
                                    </c:if>
                                    <col style="width: 5%;" />
                                    <col style="width: 15%;" />
                                    <col style="width: auto;" />
                                    <col style="width: 5%;" />
                                    <col style="width: 15%;" />
                                    <col style="width: 10%;" />
                                    <c:if test="${not isScm }">
                                        <col style="width: 10%;" />
                                    </c:if>
                                    <col style="width: 10%;" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <c:if test="${not isScm }">
                                            <th><input type="checkbox" class="checkbox check-all" /></th>
                                        </c:if>
                                        <th>NO</th>
                                        <th>제휴업체</th>
                                        <th>지원혜택명</th>
                                        <th>전용상품</th>
                                        <th>모델명</th>
                                        <th>공급가</th>
                                        <c:if test="${not isScm }">
                                            <th>승인요청일</th>
                                        </c:if>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list }">
                                            <c:set var="listNum" value="${paging.listNum}" />
                                            <c:forEach var="row" items="${list }" varStatus="i">
                                                <tr>
                                                    <c:if test="${not isScm }">
                                                        <td>
                                                            <input type="checkbox" name="PRD_MST_APV_STATE" class="checkbox check-row" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }"/>" value="A" <c:if test="${row.PRD_MST_APV_STATE eq Product.STATE_REJECT }">disabled="disabled"</c:if>/>
                                                        </td>
                                                    </c:if>
                                                    <td>
                                                        <c:out value="${paging.listNum - i.index }" />
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${isSuper || row.VDR_MST_NM eq null}">
                                                                <c:if test="${row.VDR_MST_NM eq null }">
                                                                    <c:out value="${Product.VDR_MST_DAEMYUNG_NM }" />
                                                                </c:if>
                                                                <c:if test="${row.VDR_MST_NM ne null }">
                                                                    <a href="javascript:$.common.popup.vender.manager.view('<c:out value="${row.VDR_MST_IDX }"/>');">
                                                                        <c:out value="${row.VDR_MST_NM }" />
                                                                    </a>
                                                                </c:if>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="javascript:$.common.popup.vender.manager.view('<c:out value="${row.VDR_MST_IDX }"/>');">
                                                                    <c:out value="${row.VDR_MST_NM }" />
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="list-product" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }"/>">
                                                            <c:out value="${row.PRD_MST_SPL_NM }" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PRD_MST_PRP_YN eq 'Y' ? '전용' : '일반' }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PRD_MST_MD }" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${row.PRD_MST_SPL_PRC }" type="number" />
                                                    </td>
                                                    <c:if test="${not isScm }">
                                                        <td>
                                                            <ui:formatDate value="${row.PRD_MST_REG_DT }" pattern="yyyy.MM.dd" />
                                                        </td>
                                                    </c:if>
                                                    <td>
                                                        <c:out value="${row.PRD_MST_APV_STATE_NM }" />
                                                        <c:if test="${row.PRD_MST_APV_STATE eq Product.STATE_REJECT }">
                                                            <br>
                                                            <a href="javascript:;" class="list-title" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />"> 거절사유보기 </a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <c:set var="listNum" value="${listNum-1}" />
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
                        </div>
                        <div class="section-pagination">
                            <!-- section pagination -->
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <!-- 개발 시 wrap 이하 모듈 시작 -->
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
                        <!-- // section pagination -->
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
            var $wrapper = $("#wrapper"), $frm = $wrapper.find("#frm")
            $searchForm = $wrapper.find("#searchForm");
            <%-- 체크박스 변경 이벤트 --%>
            $.checkBoxSelect("check-all", "check-row");            
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                    $frm.find("input[name='PRD_MST_CD']").val($(this).data("prd_mst_cd"));
                    $frm.postPop($.action.popup("View"), "productDisapprovalViewPopup", "width=1200,height=500,left=10,top=10");
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
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });    
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                    $frm.find("input[name='cPage']").val(cPage);
                    $frm.postSubmit($.action.list());
            };
            <%-- 엑셀다운로드 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            
            <%-- 승인완료 처리 --%>
            $wrapper.on("click", "#goApproval", function() {
                var $target = $frm.find("input[name='PRD_MST_APV_STATE']:checked");
                if ($target.length == 0) {
                    alert("승인완료 처리할 상품을 선택해 주십시오.");
                    return;
                }
                if (confirm("승인완료 처리를 하시겠습니까?")) {
                    var array = new Array();
                    $target.each(function () {
                        var $this = $(this);
                        array.push(TagUtil.createDynamicInput("hidden", "PRD_MST_CD_APV", $this.data("prd_mst_cd")));
                    });
                    $frm.append(array);
                    $frm.postSubmit($.action.modify("State"));
                }
            });
            
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $frm.on("click", ".list-product", function() {
                $frm.find("input[name='PRD_MST_CD']").val($(this).data("prd_mst_cd"));
                $frm.postSubmit($.action.edit());
            });
        });
    //-->
    </script>
</body>
</html>
