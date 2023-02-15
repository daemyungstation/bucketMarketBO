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
                        <span>메뉴 관리</span>
                    </h2>
                    <h3 class="title">
                        <span>상세</span>
                    </h3>
                    <form id="frm" name="frm" method="post">
                        <input type="hidden" name="ADM_MNU_IDX" value="${info.ADM_MNU_IDX }" />
                        <input type="hidden" name="ADM_MNU_LEVEL" value="${info.ADM_MNU_LEVEL}" />
                        <input type="hidden" name="ADM_MNU_UP_IDX" value="${info.ADM_MNU_UP_IDX }" />
                        <input type="hidden" name="ADM_MNU_TOP_IDX" value="${info.ADM_MNU_TOP_IDX }" />
                        <!-- 상위 메뉴 정보 시작 -->
                        <c:if test="${not empty info and info.ADM_MNU_LEVEL ne '0'}">
                            <table cellspacing="0" class="table-row table-a">
                                <!-- table -->
                                <colgroup>
                                    <col style="width: 15%; min-width: 180px;" />
                                    <col style="width: auto;" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>
                                            <span>최상위 메뉴명</span>
                                        </th>
                                        <td>
                                            <c:out value="${info.ADM_MNU_TOP_NM }" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <span>상위 메뉴명</span>
                                        </th>
                                        <td>
                                            <c:out value="${info.ADM_MNU_UP_NM }" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- // table -->
                        </c:if>
                        <!-- // 상위 코드 정보 종료 -->
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>메뉴명<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" class="text" name="ADM_MNU_NM" id="ADM_MNU_NM" maxlength="50" value="<c:out value="${info.ADM_MNU_NM }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>링크 경로<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" class="text xlarge" name="ADM_MNU_URL" id="ADM_MNU_URL" maxlength="100" value="<c:out value="${info.ADM_MNU_URL }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>권한 체크 경로<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" class="text xlarge" name="ADM_MNU_AUTH_URL" id="ADM_MNU_AUTH_URL" maxlength="100" value="<c:out value="${info.ADM_MNU_AUTH_URL }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <label><input type="radio" cass="radio" id="stateA" name="ADM_MNU_ON_YN" value="Y" <c:if test="${info.ADM_MNU_ON_YN eq 'Y' }">checked="checked"</c:if> />사용</label>
                                        <label><input type="radio" cass="radio" id="stateB" name="ADM_MNU_ON_YN" value="N" <c:if test="${info.ADM_MNU_ON_YN eq 'N' }">checked="checked"</c:if> />미사용</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                    </form>
                    <div class="section-button">
                        <!-- section-button -->
                        <div class="wrap text-center">
                            <c:if test="${not empty info and info.ADM_MNU_LEVEL ne '0'}">
                                <a href="javascript:;" id="goEdit" class="button large">
                                    <span>상위 메뉴 목록</span>
                                </a>
                            </c:if>
                            <a href="javascript:;" id="goList" class="button large">
                                <span>목록</span>
                            </a>
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                        </div>
                    </div>
                    <!-- // section-button -->
                    <h3 class="title">
                        <span>하위 메뉴 목록</span>
                    </h3>
                    <div class="grid section-button-list">
                        <!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <span class="pages">
                                (총 <strong><c:out value="${fn:length(list)}" /></strong> 건)
                            </span>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="javascript:;" id="modifySort" class="button small">
                                <span>순서 저장</span>
                            </a>
                            <a href="javascript:;" id="goForm" class="button small primary">
                                <span>하위 메뉴 등록</span>
                            </a>
                        </div>
                    </div>
                    <!-- // 목록 상단 버튼 -->
                    <form id="childForm" name="childForm" method="post">
                        <input type="hidden" name="ADM_MNU_IDX" value="${info.ADM_MNU_IDX }" />
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th colspan="2">순서</th>
                                    <th>메뉴명</th>
                                    <th>링크 경로</th>
                                    <th>권한 체크 경로</th>
                                    <th>등록일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody class="sort-target">
                                <c:choose>
                                    <c:when test="${not empty list }">
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr>
                                                <td>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                </td>
                                                <td class="col-sort" data-adm_mnu_idx="<c:out value="${row.ADM_MNU_IDX }"/>">
                                                    <c:out value="${row.ADM_MNU_SORT }" />
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="list-title" data-adm_mnu_idx="<c:out value="${row.ADM_MNU_IDX }"/>">
                                                        <c:out value="${row.ADM_MNU_NM }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:out value="${row.ADM_MNU_URL }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.ADM_MNU_AUTH_URL }" />
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.ADM_MNU_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.ADM_MNU_ON_YN eq 'Y' ? '사용' : '미사용' }" />
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
                    </form>
                </div>
                <!-- // container -->
            </div>
            <!-- // contents -->
            <form id="searchForm" name="searchForm" method="post">
                <input type="hidden" name="ADM_MNU_IDX" value="${info.ADM_MNU_UP_IDX }" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                <input type="hidden" name="searchAdmMnuNm" value="<c:out value="${commandMap.searchAdmMnuNm }"/>" />
                <input type="hidden" name="searchAdmMnuOnYN" value="<c:out value="${commandMap.searchAdmMnuOnYN }"/>" />
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
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
                $searchForm = $wrapper.find("#searchForm"),
                $frm = $wrapper.find("#frm")
                $childForm = $wrapper.find("#childForm");
            <%-- 폼체크 --%>
            $frm.validate({
                rules : {
                    ADM_MNU_NM : {
                        required : true
                    },
                    ADM_MNU_URL : {
                        required : true
                    },
                    ADM_MNU_AUTH_URL : {
                        required : true
                    }
                }
            });
            <%-- 상위 메뉴 목록 버튼 클릭 이벤트 --%> 
            $wrapper.on("click", "#goEdit", function() {
                $searchForm.postSubmit($.action.edit());
            });
            <%-- 목록 버튼 클릭 이벤트 --%> 
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 하위 메뉴 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $childForm.postSubmit($.action.form());
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $childForm.find("input[name=ADM_MNU_IDX]").val($(this).data("adm_mnu_idx"));
                $childForm.postSubmit($.action.edit());
            })
            <%-- 수정 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
            <%-- 메뉴관리 순서 변경 이벤트 --%>
            $wrapper.on("click", ".row-sort", function() {
                var $this = $(this);
                var $tr = $this.closest("tr");
                if ($this.data("sort_type") == "up") {
                    var $prevTr = $tr.prev();
                    if ($prevTr.length > 0) {
                        $prevTr.before($tr.clone());
                        $tr.remove();
                    }
                } else {
                    var $nextTr = $tr.next();
                    if ($nextTr.length > 0) {
                        $tr.next().after($tr.clone());
                        $tr.remove();
                    }
                }
                $wrapper.find(".sort-target > tr").each(function (i) {
                    $(this).find(".col-sort").text(i + 1);
                });
            });
            <%-- 메뉴관리 순서 저장 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#modifySort", function() {
                if (confirm("저장 하시겠습니까?")) {
                    var idxArray = new Array();
                    var sortArray = new Array();
                    $wrapper.find(".sort-target > tr").each(function (i) {
                        var $tr = $(this).find(".col-sort");
                        idxArray.push($tr.data("adm_mnu_idx"));
                        sortArray.push($tr.text());
                    });
                    $.postSyncJsonAjax($.action.ajax("SortArray"), {"ADM_MNU_IDX" : idxArray, "ADM_MNU_SORT" : sortArray}, function(data) {
                        alert(data.message);
                    });
                }
            });
        });
    </script>
</body>
</html>
