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
                        <span>사용자 관리</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>키워드검색</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchType" id="searchType">
                                            <option value="S_NAME" <c:if test="${empty commandMap.searchType or commandMap.searchType eq 'S_NAME' }">selected="selected"</c:if>>이름</option>
                                            <option value="S_ID" <c:if test="${commandMap.searchType eq 'S_ID' }">selected="selected"</c:if>>아이디</option>
                                            <option value="S_TEL" <c:if test="${commandMap.searchType eq 'S_TEL' }">selected="selected"</c:if>>휴대폰번호 뒷자리</option>
                                        </select>
                                        <input type="text" class="text" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" maxlength="10" />
                                    </td>
                                    <th>
                                        <span>관리자권한</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchAuthority" id="searchAuthority">
                                            <option value="">선택</option>
                                            <c:if test="${not empty authList }">
                                                <c:forEach var="row" items="${authList }" varStatus="i">
                                                    <option value="<c:out value="${row.AUT_MST_IDX }"/>" <c:if test="${row.AUT_MST_IDX eq commandMap.searchAuthority }">selected="selected"</c:if>><c:out value="${row.AUT_MST_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="stateA" name="searchAdmMstState" class="radio" <c:if test="${empty commandMap.searchAdmMstState }">checked="checked"</c:if> value="" />
                                        <label for="stateA">전체</label>
                                        <input type="radio" id="stateB" name="searchAdmMstState" class="radio" <c:if test="${commandMap.searchAdmMstState eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="stateB">사용</label>
                                        <input type="radio" id="stateC" name="searchAdmMstState" class="radio" <c:if test="${commandMap.searchAdmMstState eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="stateC">미사용</label>
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
                    <!-- // 검색 하단 버튼 -->
                    <form id="frm" name="frm">
                        <input type="hidden" name="ADM_MST_ID" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>" />
                        <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>" />
                        <input type="hidden" name="searchAuthority" value="<c:out value="${commandMap.searchAuthority }"/>" />
                        <input type="hidden" name="searchAdmMstState" value="<c:out value="${commandMap.searchAdmMstState }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <c:if test="${not isScm }">
                                    <a href="javascript:;" id="goForm" class="button small primary">
                                        <span>등록</span>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                    </form>
                    <table cellspacing="0" class="table-col table-b">
                        <!-- table -->
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 8%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>권한</th>
                                <th>휴대폰</th>
                                <th>등록일</th>
                                <th>상태</th>
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
                                                <a href="javascript:;" class="list-title" data-adm_mst_id="<c:out value="${row.ADM_MST_ID }" />">
                                                    <c:out value="${row.ADM_MST_ID }" />
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_MST_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_AUT_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_MST_HP1 }" />
                                                -
                                                <c:out value="${row.ADM_MST_HP2 }" />
                                                -
                                                <c:out value="${row.ADM_MST_HP3 }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.ADM_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_MST_STATE eq 'Y'?'사용':'미사용' }" />
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
                    <!-- // table -->
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
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='ADM_MST_ID']").val($(this).data("adm_mst_id"));
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
