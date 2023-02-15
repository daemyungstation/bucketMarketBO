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
                        <span>공지사항</span>
                    </h2>
                    <h3 class="title">
                        <span>수정</span>
                    </h3>
                    <p>
                        <span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" />
                        <input type="hidden" name="searchRdpNtsUseYn" value="<c:out value="${commandMap.searchRdpNtsUseYn }"/>" />
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data">
                        <input type="hidden" name="RDP_NTS_IDX" value="<c:out value="${info.RDP_NTS_IDX }"/>" />
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
                                        <input type="radio" name="RDP_NTS_USE_YN" id="RDP_NTS_USE_YN0" value="Y" class="radio" <c:if test="${info.RDP_NTS_USE_YN eq 'Y' }">checked="checked"</c:if> />
                                        <label for="RDP_NTS_USE_YN0">노출</label>
                                        <input type="radio" name="RDP_NTS_USE_YN" id="RDP_NTS_USE_YN1" value="N" class="radio" <c:if test="${info.RDP_NTS_USE_YN eq 'N' }">checked="checked"</c:if> />
                                        <label for="RDP_NTS_USE_YN1">노출안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상단공지 여부</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="checkbox" name="RDP_NTS_TOP_YN" id="RDP_NTS_TOP_YN" value="Y" class="checkbox" <c:if test="${info.RDP_NTS_TOP_YN eq 'Y' }">checked="checked"</c:if> />
                                        <label for="RDP_NTS_TOP_YN">상단공지</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>제목<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="RDP_NTS_TITLE" id="RDP_NTS_TITLE" class="text xlarge" value="<c:out value="${info.RDP_NTS_TITLE }"/>" style="width: 80%" placeholder="최대 40자까지 입력하실 수 있습니다." maxlength="40" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>내용<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <textarea name="RDP_NTS_CONTENTS" id="RDP_NTS_CONTENTS" class="textarea xlarge" style="height: 500px; width: 100%;"><c:out value="${info.RDP_NTS_CONTENTS }"/></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>유튜브 링크</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="RDP_NTS_YTB_URL" id="RDP_NTS_YTB_URL" class="text xlarge" value="<c:out value="${info.RDP_NTS_YTB_URL }"/>" style="width: 80%" placeholder="최대 100자까지 입력하실 수 있습니다." maxlength="100" />
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
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>등록일</span>
                                        </label>
                                    </th>
                                    <td>
                                        <c:out value="${info.RDP_NTS_REG_NM }"/>(<c:out value="${info.RDP_NTS_REG_ID }"/>)/<ui:formatDate value="${info.RDP_NTS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                    </td>
                                </tr>
                                <c:if test="${not empty info.RDP_NTS_UPD_ID }">
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>수정일</span>
                                            </label>
                                        </th>
                                        <td>
                                            <c:out value="${info.RDP_NTS_UPD_NM }"/>(<c:out value="${info.RDP_NTS_UPD_ID }"/>)/<ui:formatDate value="${info.RDP_NTS_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                        </td>
                                    </tr>
                                </c:if>
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
        </div>ㄱ
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
    <ui:editor objId="#RDP_NTS_CONTENTS" />
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            // 폼
            $frm.validate({
                ignore : [],
                rules : {
                    RDP_NTS_USE_YN : {
                        required : true
                    },
                    RDP_NTS_TITLE : {
                        required : true
                    },
                    RDP_NTS_CONTENTS : {
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
                oEditors.getById["RDP_NTS_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);
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
