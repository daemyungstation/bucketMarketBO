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
                        <span>상세</span>
                    </h3>
                    <p>
                        <span></span>표시된 항목은 필수 입력 사항입니다.
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
                                        <span>제휴업체</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.VDR_MST_NM ne null ? info.VDR_MST_NM : '전체' }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>상단공지여부</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.SCM_NTS_TOP_YN eq 'Y' ? '상단공지' : '공지' }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>제목</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.SCM_NTS_TITLE }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>내용</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.SCM_NTS_CONTENTS }" escapeXml="false"/>
                                </td>
                            </tr>
                            <c:if test="${not empty fileList }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>첨부파일</span>
                                        </label>
                                    </th>
                                    <td>
                                        <c:forEach var="row" items="${fileList }" varStatus="i">
                                            <a href="javascript:;" class="file-download" data-cmm_fle_idx="<c:out value="${row.CMM_FLE_IDX }"/>">
                                                <c:out value="${row.CMM_FLE_ORG_NM }"/>
                                            </a>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>등록일</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.SCM_NTS_REG_NM }"/>(<c:out value="${info.SCM_NTS_REG_ID }"/>)/<ui:formatDate value="${info.SCM_NTS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                </td>
                            </tr>
                            <c:if test="${not empty info.SCM_NTS_UPD_ID }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>수정일</span>
                                        </label>
                                    </th>
                                    <td>
                                        <c:out value="${info.SCM_NTS_UPD_NM }"/>(<c:out value="${info.SCM_NTS_UPD_ID }"/>)/<ui:formatDate value="${info.SCM_NTS_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                    <div class="section-button">
                        <div class="wrap text-center">
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
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 파일다운로드 --%>
            $wrapper.on("click", ".file-download", function() {
                $.common.file.download($(this).data("cmm_fle_idx"));
            });
            <%-- 목록 버튼 클릭 이벤트  --%>
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
        });
    </script>
</body>
</html>