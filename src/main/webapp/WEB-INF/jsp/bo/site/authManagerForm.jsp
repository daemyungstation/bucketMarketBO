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
                        <span>권한 관리</span>
                    </h2>
                    <div class="section-title">
                        <!-- section-title -->
                        <h3 class="title">
                            <span>기본 정보</span>
                        </h3>
                    </div>
                    <!-- // section-title -->
                    <form id="frm" name="frm">
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: auto;" />
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>권한명<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="text xlarge" name="AUT_MST_NM" id="AUT_MST_NM" maxlength="40" placeholder="예) 전체 서비스 관리자" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>권한 구분<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="radio" id="AUT_MST_VDR_YN1" name="AUT_MST_VDR_YN" value="N" class="radio" checked="checked" />
                                        <label for="AUT_MST_VDR_YN1">관리자</label>
                                        <input type="radio" id="AUT_MST_VDR_YN2" name="AUT_MST_VDR_YN" value="Y" class="radio" />
                                        <label for="AUT_MST_VDR_YN2">입점업체</label>
                                    </td>
                                    <th>
                                        <span>상태<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="radio" id="AUT_MST_STATE1" name="AUT_MST_STATE" value="Y" class="radio" checked="checked" />
                                        <label for="AUT_MST_STATE1">사용</label>
                                        <input type="radio" id="AUT_MST_STATE2" name="AUT_MST_STATE" value="N" class="radio" />
                                        <label for="AUT_MST_STATE2">미사용</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                        <div class="section-title">
                            <!-- section-title -->
                            <h3 class="title">
                                <span>권한 설정</span>
                            </h3>
                            <div class="more">
                                <a href="javascript:;" id="checkAll" class="button small">
                                    <span>전체선택</span>
                                </a>
                                <a href="javascript:;" id="unCheckAll" class="button small">
                                    <span>선택해제</span>
                                </a>
                            </div>
                        </div>
                        <!-- // section-title -->
                        <c:if test="${not empty menuList }">
                            <table cellspacing="0" class="table-row table-a is-td-valign-top menuList">
                                <!-- table -->
                                <colgroup>
                                    <col style="width: 15%; min-width: 180px;" />
                                    <col style="width: 35%;" />
                                    <col style="width: 15%; min-width: 180px;" />
                                    <col style="width: 35%;" />
                                </colgroup>
                                <tbody id="menuCheckList">
                                    <c:set var="k" value="1" />
                                    <c:forEach var="row" items="${menuList }" varStatus="i">
                                        <c:if test="${row.ADM_MNU_LEVEL eq 0 and k % 2 eq 1}">
                                            <tr>
                                        </c:if>
                                        <c:if test="${row.ADM_MNU_LEVEL eq '0' }">
                                            <th>
                                                <span>
                                                    <label>
                                                        <input type="checkbox" name="ADM_ADM_MNU_IDX" class="checkbox admin_mnu_depth1" value="<c:out value="${row.ADM_MNU_IDX }"/>" />
                                                        <c:out value="${row.ADM_MNU_NM }" />
                                                    </label>
                                                </span>
                                            </th>
                                            <td>
                                        </c:if>
                                        <c:if test="${row.PREV_ADM_MNU_IDX eq row.ADM_MNU_UP_IDX and row.ADM_MNU_LEVEL eq 1}">
                                            <ul class="d1">
                                        </c:if>
                                        <c:if test="${row.PREV_ADM_MNU_IDX eq row.ADM_MNU_UP_IDX and row.ADM_MNU_LEVEL eq 2}">
                                            <ul class="d2">
                                        </c:if>
                                        <c:if test="${row.ADM_MNU_LEVEL > 0 and row.ADM_MNU_LEVEL eq 1}">
                                            <li class="d1">
                                                <label>
                                                    <input type="checkbox" class="checkbox admin_mnu_depth2" name="ADM_ADM_MNU_IDX" value="<c:out value="${row.ADM_MNU_IDX }"/>" />
                                                    <c:out value="${row.ADM_MNU_NM }" />
                                                </label>
                                        </c:if>
                                        <c:if test="${row.ADM_MNU_LEVEL > 0 and row.ADM_MNU_LEVEL eq 2}">
                                            <li class="d2">
                                                <label>
                                                    <input type="checkbox" class="checkbox admin_mnu_depth3" name="ADM_ADM_MNU_IDX" value="<c:out value="${row.ADM_MNU_IDX }"/>" />
                                                    <c:out value="${row.ADM_MNU_NM }" />
                                                </label>
                                        </c:if>
                                        <c:if test="${row.ADM_MNU_LEVEL gt 0 and row.ADM_MNU_CHILD_CNT eq '0' }">
                                            </li>
                                        </c:if>
                                        <c:if test="${row.ADM_MNU_LEVEL gt 0 and row.NEXT_ADM_MNU_LEVEL < row.ADM_MNU_LEVEL}">
                                            <c:forEach begin="1" end="${row.NEXT_ADM_MNU_LEVEL eq '0' ? row.ADM_MNU_LEVEL : (row.ADM_MNU_LEVEL-row.NEXT_ADM_MNU_LEVEL)}" varStatus="j">
                                                </ul>
                                                <c:if test="${row.ADM_MNU_LEVEL gt 1 and (not j.last or row.NEXT_ADM_MNU_LEVEL ne 0)}">
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${row.NEXT_ADM_MNU_LEVEL eq 0 }">
                                            </td>
                                            <c:set var="k" value="${k+1}" />
                                        </c:if>
                                        <c:if test="${row.NEXT_ADM_MNU_LEVEL eq 0 and k % 2 eq 1}">
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- // table -->
                        </c:if>
                    </form>
                    <div class="section-button">
                        <!-- section-button -->
                        <div class="wrap text-center">
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                            <a href="javascript:;" id="goList" class="button large">
                                <span>목록</span>
                            </a>
                        </div>
                    </div>
                    <!-- // section-button -->
                </div>
            </div>
            <!-- // contents -->
            <form id="searchForm" name="searchForm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                <input type="hidden" name="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>" />
                <input type="hidden" name="searchAutMstState" value="<c:out value="${commandMap.searchAutMstState }"/>" />
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
    <script type="text/javascript">
        $(function() {
            var $wrapper = $("#wrapper"),
                $searchForm = $wrapper.find("#searchForm"),
                $frm = $wrapper.find("#frm");
            var $menuList = $frm.find(".menuList");
            <%-- 폼체크 --%>
            $frm.validate({
                rules : {
                    AUT_MST_NM : {
                        required : true
                    },
                    AUT_MST_STATE : {
                        required : true
                    },
                    AUT_MST_STATE : {
                        required : true
                    }
                }
            });
            <%-- 권한 전체 선택 --%>
            $wrapper.on("click", "#checkAll", function() {
                $menuList.find("input[type='checkbox']").prop("checked", true);
            });
            <%-- 권한 전체 선택 해제 --%>
            $wrapper.on("click", "#unCheckAll", function() {
                $menuList.find("input[type='checkbox']").prop("checked", false);
            });
            <%-- 메뉴 선택 --%>
            $wrapper.on("click", "input[type=checkbox]", function() {
                var $this = $(this);
                var thisClass = $this.attr("class");
                var checkYn = $this.is(":checked");
                if (thisClass.indexOf("admin_mnu_depth1") != -1) { // 1depth click
                    var targetTh = $this.parent().parent().parent();
                    var targetTd = $(targetTh).next();
                    // 2depth, 3depth checked
                    $(targetTd).find("input[type=checkbox]").prop("checked", checkYn);
                } else if (thisClass.indexOf("admin_mnu_depth2") != -1) { // 2depth click
                    var targetTd = $this.parent().parent().parent().parent();
                    var targetTh = $(targetTd).prev();
                    var targetUl = $this.parent().parent().find("ul");
                    // 3depth checked
                    $(targetUl).find(".admin_mnu_depth3").prop("checked", checkYn);
                    // 1depth checked
                    if ($(targetTd).find("input[type=checkbox]:checked").length == 0) {
                        $(targetTh).find(".admin_mnu_depth1").prop("checked", false);
                    } else {
                        $(targetTh).find(".admin_mnu_depth1").prop("checked", true);
                    }
                } else if (thisClass.indexOf("admin_mnu_depth3") != -1) { // 3depth click
                    var targetTd = $this.parent().parent().parent().parent().parent().parent();
                    var targetTh = $(targetTd).prev();
                    var targetUl = $this.parent().parent().parent();
                    // 2depth checked
                    if ($(targetUl).find("input[type=checkbox]:checked").length == 0) {
                        $(targetUl).siblings("label").find(".admin_mnu_depth2").prop("checked", false);
                    } else {
                        $(targetUl).siblings("label").find(".admin_mnu_depth2").prop("checked", true);
                    }
                    // 1depth checked
                    if ($(targetTd).find("input[type=checkbox]:checked").length == 0) {
                        $(targetTh).find(".admin_mnu_depth1").prop("checked", false);
                    } else {
                        $(targetTh).find(".admin_mnu_depth1").prop("checked", true);
                    }
                }
            });
            <%-- 목록 버튼 클릭 이벤트 --%> 
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 등록 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.regist());
                    }
                }
            });
        });
    </script>
</body>
</html>