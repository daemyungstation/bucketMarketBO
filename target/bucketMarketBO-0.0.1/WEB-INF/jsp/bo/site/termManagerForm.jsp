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
                        <span>등록</span>
                    </h3>
                    <p>
                        <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="searchForm">
                        <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchAgrMstGbn" value="<c:out value="${commandMap.searchAgrMstGbn }"/>"/>
                        <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                        <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                        <input type="hidden" name="searchAgrMstUseYn" value="<c:out value="${commandMap.searchAgrMstUseYn }"/>"/>
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                    </form>
                    <form id="frm" name="frm">
                        <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>"/>
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>약관 유형<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <select name="AGR_MST_TYPE" id="AGR_MST_TYPE" class="select">
                                            <option value="">선택</option>
                                            <c:if test="${not empty codes.TERM_CODE }">
                                                <c:forEach var="row" items="${codes.TERM_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.CMN_COM_IDX }">selected="selected"</c:if>>
                                                        <c:out value="${row.CMN_COM_NM }" />
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>개정일<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="AGR_MST_CRT_DAY" id="AGR_MST_CRT_DAY" class="text" value="" readonly="readonly"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>노출여부<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <label for="AGR_MST_USE_YN0">
                                            <input type="radio" name="AGR_MST_USE_YN" id="AGR_MST_USE_YN0" class="radio" value="Y" checked="checked"/>
                                            <span>노출</span>
                                        </label>
                                        <label for="AGR_MST_USE_YN1">
                                            <input type="radio" name="AGR_MST_USE_YN" id="AGR_MST_USE_YN1" class="radio" value="N"/>
                                            <span>미노출</span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>약관제목<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" name="AGR_MST_TITLE" id="AGR_MST_TITLE" class="text xlarge" value="" maxlength="70"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>약관내용<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <textarea name="AGR_MST_CONTENTS" id="AGR_MST_CONTENTS" class="textarea xlarge" style="height: 500px; width: 100%"></textarea>
                                    </td>
                                </tr>
                                <tr class="prev-tr" <c:if test="${commandMap.CMN_COM_IDX ne Code.TERM_BUCKET_MARKET_USE}">style="display: none;"</c:if>>
                                    <th>
                                        <span>이전약관</span>
                                    </th>
                                    <td>
                                        <label for="AGR_MST_PRE_YN">
                                            <span>이전약관 노출</span>
                                            <input type="checkbox" name="AGR_MST_PRE_YN" id="AGR_MST_PRE_YN" class="checkbox" value="Y"/>
                                        </label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
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
    <ui:editor objId="#AGR_MST_CONTENTS"/>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
    <script id="termGubunTemplate" type="text/x-jquery-tmpl">
        <select name="AGR_MST_GBN" id="AGR_MST_GBN" class="select">
            <option value="">선택</option>
            {{if AGR_MST_TYPE == "<c:out value="${Code.TERM_PERSONAL_INFORMATION_CODE }"/>"}}
                <c:if test="${not empty codes.TERM_PERSONAL_INFORMATION_CODE }">
                    <c:forEach var="row" items="${codes.TERM_PERSONAL_INFORMATION_CODE }" varStatus="i">
                        <option value="<c:out value="${row.CMN_COM_IDX }"/>">
                            <c:out value="${row.CMN_COM_NM }" />
                        </option>
                    </c:forEach>
                </c:if>
            {{/if}}
            {{if AGR_MST_TYPE == "<c:out value="${Code.TERM_CONTRACT_CODE }"/>"}}
                <c:if test="${not empty codes.TERM_CONTRACT_CODE }">
                    <c:forEach var="row" items="${codes.TERM_CONTRACT_CODE }" varStatus="i">
                        <option value="<c:out value="${row.CMN_COM_IDX }"/>">
                            <c:out value="${row.CMN_COM_NM }" />
                        </option>
                    </c:forEach>
                </c:if>
            {{/if}}
            {{if AGR_MST_TYPE == "<c:out value="${Code.TERM_READY_PLANNER_CODE }"/>"}}
                <c:if test="${not empty codes.TERM_READY_PLANNER_CODE }">
                    <c:forEach var="row" items="${codes.TERM_READY_PLANNER_CODE }" varStatus="i">
                        <option value="<c:out value="${row.CMN_COM_IDX }"/>">
                            <c:out value="${row.CMN_COM_NM }" />
                        </option>
                    </c:forEach>
                </c:if>
            {{/if}}
        </select>
    </script>
    <script id="termProductCodeTemplate" type="text/x-jquery-tmpl">
        <input type="text" name="AGR_MST_PRD_NO" id="AGR_MST_PRD_NO" class="text" maxlengt="5" placeholder="상품코드 입력"/>
    </script>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            var $termGubunTemplate = $("#termGubunTemplate"),
                $termProductCodeTemplate = $("#termProductCodeTemplate");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    AGR_MST_TYPE : {
                        required : true
                    }, // 약관유형
                    AGR_MST_GBN : {
                        required : true
                    }, // 약관구분
                    AGR_MST_PRD_NO : {
                        required : true
                    }, // 상품코드
                    AGR_MST_CRT_DAY : {
                        required : true
                    }, // 개정일
                    AGR_MST_USE_YN : {
                        required : true
                    }, // 노출여부
                    AGR_MST_TITLE : {
                        required : true,
                        maxlength : 70
                    }, // 약관제목
                    AGR_MST_CONTENTS : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    } // 약관내용
                }
            });
            <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_PERSONAL_INFORMATION_CODE}">
            $frm.find("#AGR_MST_TYPE").after($termGubunTemplate.tmpl({AGR_MST_TYPE : "<c:out value="${Code.TERM_PERSONAL_INFORMATION_CODE }"/>"}));
            </c:if>
            <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_CONTRACT_CODE}">
            $frm.find("#AGR_MST_TYPE").after($termGubunTemplate.tmpl({AGR_MST_TYPE : "<c:out value="${Code.TERM_CONTRACT_CODE }"/>"}));
            </c:if>
            <c:if test="${commandMap.CMN_COM_IDX eq Code.TERM_READY_PLANNER_CODE}">
            $frm.find("#AGR_MST_TYPE").after($termGubunTemplate.tmpl({AGR_MST_TYPE : "<c:out value="${Code.TERM_READY_PLANNER_CODE }"/>"}));
            </c:if>
            <%-- 약관유형 변경 이벤트 --%>
            $wrapper.on("change", "#AGR_MST_TYPE", function() {
                var value = this.value;
                $frm.find("#AGR_MST_GBN").remove();
                $frm.find("#AGR_MST_PRD_NO").remove();
                $wrapper.find("#AGR_MST_PRE_YN").attr("checked", false);
                $wrapper.find(".prev-tr").hide();
                if (value == "<c:out value="${Code.TERM_PERSONAL_INFORMATION_CODE }"/>" || value == "<c:out value="${Code.TERM_READY_PLANNER_CODE }"/>") {
                    $(this).after($termGubunTemplate.tmpl({AGR_MST_TYPE : value}));
                } else if (value == "<c:out value="${Code.TERM_CONTRACT_CODE }"/>") {
                    $(this).after($termGubunTemplate.tmpl({AGR_MST_TYPE : value}));
                } else if (value == "<c:out value="${Code.TERM_BUCKET_MARKET_USE }"/>") {
                    $wrapper.find(".prev-tr").show();
                }
            });
            <%-- 약관유형 구분 변경 이벤트 --%>
            $wrapper.on("change", "#AGR_MST_GBN", function() {
                var $this = $(this);
                var value = $this.val(),
                    array = [ "<c:out value="${Code.TERM_CONTRACT_CONFIRM_FIRST_A}"/>",
                        "<c:out value="${Code.TERM_CONTRACT_CONFIRM_FIRST_B}"/>",
                        "<c:out value="${Code.TERM_CONTRACT_CONFIRM_FIRST_C}"/>",
                        "<c:out value="${Code.TERM_CONTRACT_CONFIRM_FIRST_D}"/>"
                    ];
                $frm.find("#AGR_MST_PRD_NO").remove();
                if (array.indexOf(value) > -1) {
                    $this.after($termProductCodeTemplate.tmpl());
                }
            });
            <%-- 목록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                oEditors.getById["AGR_MST_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.regist());
                    }
                }
            });
        });
    //-->
    </script>
</body>
</html>
