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
                        <span>결합완료상품 목록</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 13%;" />
                                <col style="width: auto;" />
                                <col style="width: 13%;" />
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
                                        <span>상품코드</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstCd" id="searchPrdMstCd" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstCd }"/>" maxlength="20"/>
                                    </td>
                                    <th>
                                        <span>제휴업체</span>
                                    </th>
                                    <td>
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
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>모델분류/지원혜택</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstMdTypeAndSplNm" id="searchPrdMstMdTypeAndSplNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>" maxlength="40"/>
                                    </td>
                                    <th>
                                        <span>모델명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstMd" id="searchPrdMstMd" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstMd }"/>" maxlength="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>온라인 상품유형</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdMstType" id="searchPrdMstType0" class="radio" value="" <c:if test="${empty commandMap.searchPrdMstType }">checked="checked"</c:if>/>
                                        <label for="searchPrdMstType0">전체</label>
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="row" items="${codeList }" varStatus="i">
                                                <input type="radio" name="searchPrdMstType" id="searchPrdMstType<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchPrdMstType }">checked="checked"</c:if>/>
                                                <label for="searchPrdMstType<c:out value="${i.index + 1 }"/>"><c:out value="${row.CMN_COM_NM }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                    <th>
                                        <span>카테고리</span>
                                    </th>
                                    <td>
                                        <jsp:include page="/WEB-INF/jsp/common/template/category.jsp">
                                            <jsp:param name="listName" value="productCategoryList"/>
                                            <jsp:param name="paramName" value="commandMap"/>
                                            <jsp:param name="maxLevel" value="2"/>
                                            <jsp:param name="name" value="searchPrdCtgIdx"/>
                                        </jsp:include>
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
                                        <span>노출상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdMstDplYn" id="searchPrdMstDplYn0" class="radio" value="" <c:if test="${empty commandMap.searchPrdMstDplYn }">checked="checked"</c:if>/>
                                        <label for="searchPrdMstDplYn0">전체</label>
                                        <c:if test="${not empty Product.DISPLAYS }">
                                            <c:forEach var="codes" items="${Product.DISPLAYS }" varStatus="i">
                                                <input type="radio" name="searchPrdMstDplYn" id="searchPrdMstDplYn<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${codes.key }"/>" <c:if test="${codes.key eq commandMap.searchPrdMstDplYn }">checked="checked"</c:if>/>
                                                <label for="searchPrdMstDplYn<c:out value="${i.index + 1 }"/>"><c:out value="${codes.value }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
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
                        <input type="hidden" name="PRD_MST_NO" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                        <input type="hidden" name="searchPrdMstMdTypeAndSplNm" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>"/>
                        <input type="hidden" name="searchPrdMstMd" value="<c:out value="${commandMap.searchPrdMstMd }"/>"/>
                        <input type="hidden" name="searchPrdMstType" value="<c:out value="${commandMap.searchPrdMstType }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx1" value="<c:out value="${commandMap.searchPrdCtgIdx1 }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx2" value="<c:out value="${commandMap.searchPrdCtgIdx2 }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx3" value="<c:out value="${commandMap.searchPrdCtgIdx3 }"/>"/>
                        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                        <input type="hidden" name="searchPrdMstDplYn value="<c:out value="${commandMap.searchPrdMstDplYn }"/>"/>
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
                    </form>
                    <!-- // 목록 상단 버튼 -->
                    <div class="box-scroll-table">
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 10%;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 13%;" />
                                <col style="width: 8%;" />
                                <col style="width: auto;" />
                                <col style="width: 8%;" />
                                <col style="width: 8%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>상품유형</th>
                                    <th>상품코드</th>
                                    <th>온라인상품명</th>
                                    <th>총상품금액</th>
                                    <th>상품코드</th>
                                    <th>모델분류<br/>(지원혜택)</th>
                                    <th>모델명</th>
                                    <th>노출상태</th>
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
                                                    <c:out value="${row.PRD_MST_TYPE_NM }"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.PRD_MST_NO }"/>
                                                </td>
                                                <td class="text-left">
                                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                                        <c:out value="${row.PRD_MST_NM }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${row.PROD_AMT }" type="number"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.PROD_CD }"/>
                                                </td>
                                                <td class="text-left">
                                                    <c:out value="${row.MODEL_CL_NM }"/><br/>(<c:out value="${row.PRD_MST_SPL_NM }"/>)
                                                </td>
                                                <td>
                                                    <c:out value="${row.MODEL_NM }"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.PRD_MST_DPL_YN_NM }"/>
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
    <%-- 제목 a Tag 클릭 이벤트 --%>
    $wrapper.on("click", ".product-detail", function() {
            $frm.find("input[name='PRD_MST_NO']").val($(this).data("prd_mst_no"));
            $frm.postSubmit($.action.edit());
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
    <%-- 엑셀다운로드 버튼 클릭 이벤트 --%>
    $wrapper.on("click", "#goExcelDownload", function() {
        $frm.postSubmit($.action.exceldownload());
    });
});
    //-->
    </script>
</body>
</html>
