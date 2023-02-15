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
                        <span>제휴사 공지사항</span>
                    </h2>
                    <h3 class="title">
                        <span>등록</span>
                    </h3>
                    <p>
                        <span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchScmNtsTitleAndContents" value="<c:out value="${commandMap.searchScmNtsTitleAndContents }"/>" />
                        <input type="hidden" name="searchScmNtsUseYn" value="<c:out value="${commandMap.searchScmNtsUseYn }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data">
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: auto;" />
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
                                        <input type="radio" name="SCM_NTS_USE_YN" id="SCM_NTS_USE_YN0" value="Y" class="radio" checked="checked" />
                                        <label for="SCM_NTS_USE_YN0">사용</label>
                                        <input type="radio" name="SCM_NTS_USE_YN" id="SCM_NTS_USE_YN1" value="N" class="radio" />
                                        <label for="SCM_NTS_USE_YN1">미사용</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상단공지여부</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="checkbox" name="SCM_NTS_TOP_YN" id="SCM_NTS_TOP_YN" value="Y" class="checkbox" />
                                        <label for="SCM_NTS_TOP_YN">상단공지</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>제휴업체<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="VDR_MST_TYPE" id="VDR_MST_TYPE0" class="radio" value="all" checked="checked"/>
                                        <label for="VDR_MST_TYPE0">전체</label>
                                        <input type="radio" name="VDR_MST_TYPE" id="VDR_MST_TYPE1" class="radio" value="scm"/>
                                        <label for="VDR_MST_TYPE1">제휴업체</label>
                                        <select name="VDR_MST_IDX" id="VDR_MST_IDX" class="select" disabled="disabled">
                                            <c:if test="${not empty vendorList }">
                                                <option value="">선택</option>
                                                <c:forEach var="row" items="${vendorList }" varStatus="i">
                                                    <option value="<c:out value="${row.VDR_MST_IDX }"/>"><c:out value="${row.VDR_MST_NM }"/></option>
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
                                        <input type="text" name="SCM_NTS_TITLE" id="SCM_NTS_TITLE" class="text xlarge" placeholder="공지사항 제목입니다." style="width: 80%;" maxlength="40" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>내용<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <textarea class="textarea" name="SCM_NTS_CONTENTS" id="SCM_NTS_CONTENTS" style="height: 500px; width: 100%"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>첨부파일</span>
                                        </label>
                                    </th>
                                    <td>
                                        <spring:eval var="fileSize" expression="@file['file.max.byte.size.default']"/>
                                        <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                            <jsp:param name="fileListName" value="fileList"/>
                                            <jsp:param name="fileName" value="FILE"/>
                                            <jsp:param name="order" value="0"/>
                                            <jsp:param name="isMulti" value="true"/>
                                            <jsp:param name="maxCount" value="5"/>
                                            <jsp:param name="allow" value="default"/>
                                            <jsp:param name="size" value="${fileSize }"/>
                                        </jsp:include>
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
    <ui:editor objId="#SCM_NTS_CONTENTS" />
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            $frm.validate({
                ignore : [],
                rules : {
                    SCM_NTS_USE_YN : {
                        required : true
                    },
                    VDR_MST_TYPE : {
                        required : true
                    },
                    VDR_MST_IDX : {
                        required : true
                    },
                    SCM_NTS_TITLE : {
                        required : true
                    },
                    SCM_NTS_CONTENTS : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    }
                }
            });
            <%-- 상단공지 변경 이벤트 --%>
            $frm.on("change", "#SCM_NTS_TOP_YN", function() {
                var $this = $(this);
                if ($this.is(":checked")) {
                    $.postSyncJsonAjax($.action.ajax("TopCount"), {}, function() {
                        if (data.resultYn == "N" || data.resultYn == "F") {
                            alert("상단공지 5개 모두 등록되었습니다.");
                            $this.prop("checked", false);
                            return;
                        }
                    });
                }
            });
            <%-- 제휴업체 변경 이벤트 --%>
            $frm.on("change", "input[name='VDR_MST_TYPE']", function() {
                $frm.find("#VDR_MST_IDX").attr("disabled", !($(this).val() == "scm"));
                $frm.find("#VDR_MST_IDX").val("");
            });
            <%-- 목록 버튼 클릭 이벤트  --%>
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 등록 이벤트  --%>
            $wrapper.on("click", "#save", function() {
                oEditors.getById["SCM_NTS_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);
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