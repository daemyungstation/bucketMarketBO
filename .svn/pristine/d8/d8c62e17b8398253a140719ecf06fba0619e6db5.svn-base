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
                        <span>약관관리</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <div class="tab-list">
                        <ul>
                            <c:if test="${not empty codes.TERM_CODE }">
                                <c:forEach var="row" items="${codes.TERM_CODE }" varStatus="i">
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
                                <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_PERSONAL_INFORMATION_CODE or commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE or commandMap.CMN_COM_IDX eq Code.TERM_READY_PLANNER_CODE }">
                                    <c:set var="gbunCodeList" value=""/>
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_PERSONAL_INFORMATION_CODE }">
                                        <c:set var="gbunCodeList" value="${codes.TERM_PERSONAL_INFORMATION_CODE }"/>
                                    </c:if>
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE }">
                                        <c:set var="gbunCodeList" value="${codes.TERM_CONTRACT_CODE }"/>
                                    </c:if>
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_READY_PLANNER_CODE }">
                                        <c:set var="gbunCodeList" value="${codes.TERM_READY_PLANNER_CODE }"/>
                                    </c:if>
                                    <tr>
                                        <th>
                                            <span>구분</span>
                                        </th>
                                        <td>
                                            <label for="searchAgrMstGbn0">
                                                <input type="radio" name="searchAgrMstGbn" id="searchAgrMstGbn0" class="radio" value="" <c:if test="${empty commandMap.searchAgrMstGbn }">checked="checked"</c:if>/>
                                                <span>전체</span>
                                            </label>
                                            <c:if test="${not empty gbunCodeList}">
                                                <c:forEach var="row" items="${gbunCodeList }" varStatus="i">
                                                    <label for="searchAgrMstGbn<c:out value="${i.index + 1 }"/>">
                                                        <input type="radio" name="searchAgrMstGbn" id="searchAgrMstGbn<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchAgrMstGbn }">checked="checked"</c:if>/>
                                                        <span><c:out value="${row.CMN_COM_NM }"/></span>
                                                    </label>
                                                </c:forEach>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>
                                        <span>키워드검색</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchType" id="searchType">
                                            <option value="S_TITLE" <c:if test="${empty commandMap.searchType or commandMap.searchType eq 'S_TITLE' }">selected="selected"</c:if>>제목</option>
                                            <option value="S_CONTENTS" <c:if test="${commandMap.searchType eq 'S_CONTENTS' }">selected="selected"</c:if>>내용</option>
                                            <option value="S_REG_NM" <c:if test="${commandMap.searchType eq 'S_REG_NM' }">selected="selected"</c:if>>등록자명</option>
                                        </select>
                                        <input type="text" class="text" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" maxlength="10" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>노출여부</span>
                                    </th>
                                    <td>
                                        <label for="searchAgrMstUseYn0">
                                            <input type="radio" id="searchAgrMstUseYn0" name="searchAgrMstUseYn" class="radio" <c:if test="${empty commandMap.searchAgrMstUseYn }">checked="checked"</c:if> value="" />
                                            <span>전체</span>
                                        </label>
                                        <label for="searchAgrMstUseYn1">
                                            <input type="radio" id="searchAgrMstUseYn1" name="searchAgrMstUseYn" class="radio" <c:if test="${commandMap.searchAgrMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                            <span>노출</span>
                                        </label>
                                        <label for="searchAgrMstUseYn2">
                                            <input type="radio" id="searchAgrMstUseYn2" name="searchAgrMstUseYn" class="radio" <c:if test="${commandMap.searchAgrMstUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                            <span>미노출</span>
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
                        <input type="hidden" name="AGR_MST_IDX" value=""/>
                        <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchAgrMstGbn" value="<c:out value="${commandMap.searchAgrMstGbn }"/>"/>
                        <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                        <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                        <input type="hidden" name="searchAgrMstUseYn" value="<c:out value="${commandMap.searchAgrMstUseYn }"/>"/>
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
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: auto;" />
                                <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_PERSONAL_INFORMATION_CODE or commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE }">
                                    <col style="width: auto;" />
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE }">
                                        <col style="width: auto;" />
                                    </c:if>
                                </c:if>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_PERSONAL_INFORMATION_CODE or commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE }">
                                        <th>구분</th>
                                        <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE }">
                                            <th>결합상품코드</th>
                                        </c:if>
                                    </c:if>
                                    <th>제목</th>
                                    <th>개정일</th>
                                    <th>등록일</th>
                                    <th>등록자</th>
                                    <th>노출여부</th>
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
                                                <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_PERSONAL_INFORMATION_CODE or commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE }">
                                                    <td>
                                                        <c:out value="${row.AGR_MST_GBN_NM }"/>
                                                    </td>
                                                    <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE }">
                                                        <td>
                                                            <c:if test="${fn:contains(Code.TERM_CONTRACT_CONFIRM_FIRST_LIST, row.AGR_MST_GBN) }">
                                                                <c:out value="${row.AGR_MST_PRD_NO }"/>
                                                            </c:if>
                                                        </td>
                                                    </c:if>
                                                </c:if>
                                                <td class="text-left">
                                                    <a href="javascript:;" class="list-title" data-agr_mst_idx="<c:out value="${row.AGR_MST_IDX }"/>">
                                                        <c:out value="${row.AGR_MST_TITLE }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.AGR_MST_CRT_DAY }" pattern="yyyy.MM.dd" />
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.AGR_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.AGR_MST_REG_NM }"/>(<c:out value="${row.AGR_MST_REG_ID }"/>)
                                                </td>
                                                <td>
                                                    <c:out value="${row.AGR_MST_USE_YN eq 'Y' ? '노출' : '미노출' }" />
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
                $frm.find("input[name='AGR_MST_IDX']").val($(this).data("agr_mst_idx"));
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
