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
                        <span>FAQ관리</span>
                    </h2>
                    <h3 class="title">
                        <span>수정</span>
                    </h3>
                    <p>
                        <span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchBrdFaqTitleAndContents" value="<c:out value="${commandMap.searchBrdFaqTitleAndContents }"/>" />
                        <input type="hidden" name="saerchBrdCmnComIdx" value="<c:out value="${commandMap.saerchBrdCmnComIdx }"/>" />
                        <input type="hidden" name="serachBrdFaqUseYn" value="<c:out value="${commandMap.serachBrdFaqUseYn }"/>" />
                    </form>
                    <form id="frm" name="frm">
                        <input type="hidden" name="BRD_FAQ_IDX" value="<c:out value="${info.BRD_FAQ_IDX }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchBrdFaqTitleAndContents" value="<c:out value="${commandMap.searchBrdFaqTitleAndContents }"/>" />
                        <input type="hidden" name="saerchBrdCmnComIdx" value="<c:out value="${commandMap.saerchBrdCmnComIdx }"/>" />
                        <input type="hidden" name="serachBrdFaqUseYn" value="<c:out value="${commandMap.serachBrdFaqUseYn }"/>" />
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상태<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="BRD_FAQ_USE_YN" id="BRD_FAQ_USE_YN0" value="Y" class="radio" <c:if test="${info.BRD_FAQ_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="BRD_FAQ_USE_YN0">사용</label>
                                        <input type="radio" name="BRD_FAQ_USE_YN" id="BRD_FAQ_USE_YN1" value="N" class="radio" <c:if test="${info.BRD_FAQ_USE_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="BRD_FAQ_USE_YN1">미사용</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>유형<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <select class="select" name="BRD_CMN_COM_IDX" id="BRD_CMN_COM_IDX">
                                            <option value="">선택</option>
                                            <c:if test="${not empty codeList }">
                                                <c:forEach var="row" items="${codeList }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${info.BRD_CMN_COM_IDX eq row.CMN_COM_IDX }">selected="selected"</c:if>>
                                                        <c:out value="${row.CMN_COM_NM }" />
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>제목<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="BRD_FAQ_TITLE" id="BRD_FAQ_TITLE" class="text xlarge" value="<c:out value="${info.BRD_FAQ_TITLE }"/>" style="width: 80%" placeholder="최대 40자까지 입력하실 수 있습니다." maxlength="40" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>내용<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <textarea class="textarea" name="BRD_FAQ_CONTENTS" id="BRD_FAQ_CONTENTS" style="height: 500px; width: 100%"><c:out value="${info.BRD_FAQ_CONTENTS }"/></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>등록일</span>
                                        </label>
                                    </th>
                                    <td>
                                        <c:out value="${info.BRD_FAQ_REG_NM }"/>(<c:out value="${info.BRD_FAQ_REG_ID }"/>)/<ui:formatDate value="${info.BRD_FAQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                    </td>
                                </tr>
                                <c:if test="${not empty info.BRD_FAQ_UPD_ID }">
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>수정일</span>
                                            </label>
                                        </th>
                                        <td>
                                            <c:out value="${info.BRD_FAQ_UPD_NM }"/>(<c:out value="${info.BRD_FAQ_UPD_ID }"/>)/<ui:formatDate value="${info.BRD_FAQ_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                        </td>
                                    </tr>
                                </c:if>
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
    <ui:editor objId="#BRD_FAQ_CONTENTS" />
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    BRD_FAQ_USE_YN : {
                        required : true
                    },
                    BRD_CMN_COM_IDX : {
                        required : true
                    },
                    BRD_FAQ_TITLE : {
                        required : true
                    },
                    BRD_FAQ_CONTENTS : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    }
                }
            });
            <%-- 목록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 수정 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                oEditors.getById["BRD_FAQ_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
        });
    </script>
</body>
</html>
