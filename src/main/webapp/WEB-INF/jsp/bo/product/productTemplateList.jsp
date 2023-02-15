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
                        <span>템플릿관리</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <div class="tab-list">
                        <ul>
                            <c:if test="${not empty codes.TEMPLATE_CODE }">
                                <c:forEach var="row" items="${codes.TEMPLATE_CODE }" varStatus="i">
                                    <li <c:if test="${row.CMN_COM_IDX eq commandMap.CMN_COM_IDX }">class="in"</c:if>>
                                        <a href="javascript:;" class="term-type-tab" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>">
                                            <span><c:out value="${row.CMN_COM_NM }"/></span>
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>"/>
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>등록일</span>
                                    </th>
                                    <td>
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
                                <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE or commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE}">
                                    <c:set var="gbunCodeList" value=""/>
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE }">
                                        <c:set var="gbunCodeList" value="${codes.LIFE_SERVICE }"/>
                                    </c:if>
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE }">
                                        <c:set var="gbunCodeList" value="${codes.PRODUCT_TYPE }"/>
                                    </c:if>
                                    <tr>
                                        <th>
                                            <span>구분</span>
                                        </th>
                                        <td>
                                            <label for="searchPrdTplSvc0">
                                                <input type="radio" name="searchPrdTplSvc" id="searchPrdTplSvc0" class="radio" value="" <c:if test="${empty commandMap.searchPrdTplSvc }">checked="checked"</c:if>/>
                                                <span>전체</span>
                                            </label>
                                            <c:if test="${not empty gbunCodeList}">
                                                <c:forEach var="row" items="${gbunCodeList }" varStatus="i">
                                                    <label for="searchPrdTplSvc<c:out value="${i.index + 1 }"/>">
                                                        <input type="radio" name="searchPrdTplSvc" id="searchPrdTplSvc<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchPrdTplSvc }">checked="checked"</c:if>/>
                                                        <span><c:out value="${row.CMN_COM_NM }"/></span>
                                                    </label>
                                                </c:forEach>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>
                                        <span>템플릿명</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text serach-text xlarge" name="searchPrdTplNm" id="searchPrdTplNm" value="<c:out value="${commandMap.searchPrdTplNm }"/>" maxlength="100" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <label for="searchPrdTplYn0">
                                            <input type="radio" id="searchPrdTplYn0" name="searchPrdTplYn" class="radio" <c:if test="${empty commandMap.searchPrdTplYn }">checked="checked"</c:if> value="" />
                                            <span>전체</span>
                                        </label>
                                        <label for="searchPrdTplYn1">
                                            <input type="radio" id="searchPrdTplYn1" name="searchPrdTplYn" class="radio" <c:if test="${commandMap.searchPrdTplYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                            <span>사용</span>
                                        </label>
                                        <label for="searchPrdTplYn2">
                                            <input type="radio" id="searchPrdTplYn2" name="searchPrdTplYn" class="radio" <c:if test="${commandMap.searchPrdTplYn eq 'N' }">checked="checked"</c:if> value="N" />
                                            <span>사용안함</span>
                                        </label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색 조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form name="frm" id="frm">
                        <input type="hidden" name="PRD_TPL_IDX" value=""/>
                        <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchPrdTplSvc" value="<c:out value="${commandMap.searchPrdTplSvc }"/>"/>
                        <input type="hidden" name="searchPrdTplNm" value="<c:out value="${commandMap.searchPrdTplNm }"/>"/>
                        <input type="hidden" name="searchPrdTplYn" value="<c:out value="${commandMap.searchPrdTplYn }"/>"/>
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <div class="grid section-button-list">
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <a href="javascript:;" id="goForm" class="button small primary">
                                    <span>등록</span>
                                </a>
                            </div>
                        </div>
                        <div class="box-scroll-table">
                            <table cellspacing="0" class="table-col table-b">
                                <colgroup>
                                    <col style="width: auto;" />
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE or commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE }">
                                        <col style="width: auto;" />
                                    </c:if>
                                    <col style="width: auto;" />
                                    <col style="width: auto;" />
                                    <col style="width: auto;" />
                                    <col style="width: auto;" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE or commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE }">
                                            <th>유형</th>
                                        </c:if>
                                        <th>템플릿명</th>
                                        <th>등록자</th>
                                        <th>등록일</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list}">
                                            <c:forEach var="row" items="${list}" varStatus="i">
                                                <tr>
                                                    <td>
                                                        <c:out value="${paging.listNum - i.index }" />
                                                    </td>
                                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE or commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE }">
                                                        <td>
                                                            <c:out value="${row.PRD_TPL_TYPE }"/>/<c:out value="${row.PRD_TPL_SVC }"/>
                                                        </td>
                                                    </c:if>
                                                    <td class="text-left">
                                                        <a href="javascript:;" class="list-title" data-prd_tpl_idx="<c:out value="${row.PRD_TPL_IDX }"/>">
                                                            <c:out value="${row.PRD_TPL_NM }" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PRD_TPL_REG_NM }"/>(<c:out value="${row.PRD_TPL_REG_ID }"/>)
                                                    </td>
                                                    <td>
                                                        <ui:formatDate value="${row.PRD_TPL_REG_DT }" pattern="yyyy.MM.dd" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PRD_TPL_YN eq 'Y' ? '사용' : '사용안함' }" />
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
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
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
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 탭 클릭 이벤트 --%>
            $wrapper.on("click", ".term-type-tab", function() {
                $frm.find("input[type='hidden']").val("");
                $frm.find("input[name='CMN_COM_IDX']").val($(this).data("cmn_com_idx"));
                goPage(1);
            });
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='PRD_TPL_IDX']").val($(this).data("prd_tpl_idx"));
                $frm.postSubmit($.action.edit());
            });
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
                $searchForm.postSubmit($.action.list());
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
        });
    </script>
</body>
</html>
