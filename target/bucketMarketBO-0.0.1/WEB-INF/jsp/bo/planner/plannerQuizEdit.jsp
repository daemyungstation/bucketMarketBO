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
                        <span>교육이수 수정</span>
                    </h2>
                    <div class="grid section-button-list">
                        <div class="col-1-2 text-left">
                            <small class="desc">* 온라인 교육 동영상 업로드 및 동영상 시청 후 제출되는 퀴즈 질문과 문항 및 정답을 관리하는 화면입니다.</small>
                        </div>
                        <div class="col-1-2 text-right">
                            <small class="desc">
                                <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
                            </small>
                        </div>
                    </div>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" />
                        <input type="hidden" name="searchRdpEduYn" value="<c:out value="${commandMap.searchRdpEduYn }"/>" />
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data">
                        <input type="hidden" name="RDP_EDU_IDX" value="<c:out value="${info.RDP_EDU_IDX }"/>" />
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
                                            <span>그룹명<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" id="RDP_EDU_NM" name="RDP_EDU_NM" class="text xlarge" value="<c:out value="${info.RDP_EDU_NM }"/>"  maxlength="200" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상태</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" id="RDP_EDU_YN0" name="RDP_EDU_YN" value="Y" class="radio" <c:if test="${info.RDP_EDU_YN eq 'Y' }">checked="checked"</c:if> />
                                        <label for="RDP_EDU_YN0">노출</label>
                                        <input type="radio" id="RDP_EDU_YN1" name="RDP_EDU_YN" value="N" class="radio" <c:if test="${info.RDP_EDU_YN eq 'N' }">checked="checked"</c:if> />
                                        <label for="RDP_EDU_YN1">노출안함</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                        <h3 class="title">
                            <span>동영상 정보</span>
                        </h3>
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
                                            <span>동영상<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <table cellspacing="0" class="table-row table-a">
                                            <!-- table -->
                                            <colgroup>
                                                <col style="width: auto;" />
                                                <col style="width: 50px;" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>
                                                        <span>동영상<i class="require"><em>필수입력</em></i></span>
                                                    </th>
                                                    <th>
                                                        <span>PC 섬네일 이미지<i class="require"><em>필수입력</em></i></span>
                                                    </th>
                                                    <th>
                                                        <span>Mobile 섬네일 이미지<i class="require"><em>필수입력</em></i></span>
                                                    </th>
                                                </tr>
                                                
                                                <%-- 동영상 URL 목록 --%>
                                                <spring:eval var="imageFileSize" expression="@file['file.max.byte.size.image']"/>
                                                <spring:eval var="videoFileSize" expression="@file['file.max.byte.size.video']"/>
                                                
                                                <tr>
                                                    <td>
                                                        <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                                            <jsp:param name="fileListName" value="videoList"/>
                                                            <jsp:param name="fileName" value="FILE"/>
                                                            <jsp:param name="fileType" value="${Const.PLANNER_QUIZ_VIDEO }"/>
                                                            <jsp:param name="order" value="0"/>
                                                            <jsp:param name="isMulti" value="true"/>
                                                            <jsp:param name="maxCount" value="5"/>
                                                            <jsp:param name="allow" value="video"/>
                                                            <jsp:param name="size" value="${videoFileSize }"/>
                                                        </jsp:include>
                                                    </td>
                                                    <td>
                                                        <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                                            <jsp:param name="fileListName" value="pcThumbnailList"/>
                                                            <jsp:param name="fileName" value="FILE"/>
                                                            <jsp:param name="fileType" value="${Const.PLANNER_QUIZ_PC_THUMBNAIL }"/>
                                                            <jsp:param name="order" value="1"/>
                                                            <jsp:param name="isMulti" value="true"/>
                                                            <jsp:param name="maxCount" value="5"/>
                                                            <jsp:param name="allow" value="image"/>
                                                            <jsp:param name="size" value="${imageFileSize }"/>
                                                        </jsp:include>
                                                    </td>
                                                    <td>
                                                        <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                                            <jsp:param name="fileListName" value="mobileThumbnailList"/>
                                                            <jsp:param name="fileName" value="FILE"/>
                                                            <jsp:param name="fileType" value="${Const.PLANNER_QUIZ_MOBILE_THUMBNAIL }"/>
                                                            <jsp:param name="order" value="2"/>
                                                            <jsp:param name="isMulti" value="true"/>
                                                            <jsp:param name="maxCount" value="5"/>
                                                            <jsp:param name="allow" value="image"/>
                                                            <jsp:param name="size" value="${imageFileSize }"/>
                                                        </jsp:include>
                                                    </td>
                                                </tr>
                                                <%-- 업로드 목록 --%>
                                                
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <h3 class="title">
                            <span>퀴즈</span>
                        </h3>
                        
                        <%-- 퀴즈 목록 --%>
                        <div id="quizList">
                        
                            <c:forEach var="quiz" items="${info.QUIZ}" varStatus="status">
                            
                            <table cellspacing="0" class="table-row table-a quiz">
                                <!-- table -->
                                <input type="hidden" name="RDP_QUIZ_NO" value="<c:out value="${status.index }"/>" />
                                <input type="hidden" name="QUIZ[${status.index}].RDP_QUIZ_IDX" value="<c:out value="${quiz.RDP_QUIZ_ID }"/>" />
                                <input type="hidden" name="QUIZ[${status.index}].RDP_QUIZ_DEL_YN" value="N" />
                                <colgroup>
                                    <col style="width: 15%;" />
                                    <col style="width: auto;" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>노출순서<i class="require"><em>필수입력</em></i></span>
                                            </label>
                                        </th>
                                        <td>
                                            <input type="text" name="QUIZ[${status.index}].RDP_QUIZ_SORT" class="text number quizNo" value="${status.count}" readonly="readonly"/>
                                            <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                            <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>질문<i class="require"><em>필수입력</em></i></span>
                                            </label>
                                        </th>
                                        <td>
                                            <input type="text" name="QUIZ[${status.index}].RDP_QUIZ_NM" class="text xlarge" value="<c:out value="${quiz.RDP_QUIZ_NM }"/>" maxlength="200" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>문항<i class="require"><em>필수입력</em></i></span>
                                            </label>
                                        </th>
                                        <td>
                                            <table cellspacing="0" class="table-row table-a">
                                                <!-- table -->
                                                <colgroup>
                                                    <col style="width: 50px;" />
                                                    <col style="width: auto;" />
                                                    <col style="width: 150px;" />
                                                    <col style="width: 50px;" />
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>
                                                            <span>NO</span>
                                                        </th>
                                                        <th>
                                                            <span>선택문항<i class="require"><em>필수입력</em></i></span>
                                                        </th>
                                                        <th>
                                                            <span>정답(택1)<i class="require"><em>필수입력</em></i></span>
                                                        </th>
                                                        <th>
                                                        </th>
                                                    </tr>
                                                    
                                                    <%-- 문항 목록 --%>
                                                    <c:forEach var="item" items="${quiz.ITEM}" varStatus="itemStatus">
                                                    <tr class="answer">
                                                        <input type="hidden" name="QUIZ[${status.index}].RDP_ITEM_IDX" value="<c:out value="${item.RDP_ITEM_IDX }"/>" />
                                                        <input type="hidden" name="QUIZ[${status.index}].RDP_ITEM_DEL_YN" value="N" />
                                                        <td>
                                                            <span><c:out value="${itemStatus.count }"/></span>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="QUIZ[${status.index}].RDP_ITEM_NM" class="text xlarge" value="<c:out value="${item.RDP_ITEM_NM }"/>" maxlength="200" />
                                                        </td>
                                                        <td>
                                                            <input type="radio" id="QUIZ[${status.index}].RDP_ITEM_YN[${itemStatus.index}]_Y" name="QUIZ[${status.index}].RDP_ITEM_YN[${itemStatus.index}]" value="Y" class="radio answerYn" <c:if test="${item.RDP_ITEM_YN eq 'Y' }">checked="checked"</c:if> />
                                                            <label for="QUIZ[${status.index}].RDP_ITEM_YN[${itemStatus.index}]_Y">예</label>
                                                            <input type="radio" id="QUIZ[${status.index}].RDP_ITEM_YN[${itemStatus.index}]_N" name="QUIZ[${status.index}].RDP_ITEM_YN[${itemStatus.index}]" value="N" class="radio answerYn" <c:if test="${item.RDP_ITEM_YN eq 'N' }">checked="checked"</c:if> />
                                                            <label for="QUIZ[${status.index}].RDP_ITEM_YN[${itemStatus.index}]_N">아니오</label>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${itemStatus.index eq 0 }">
                                                                    <a href="javascript:;" class="button xsmall addAnswer">
                                                                        <span>추가</span>
                                                                    </a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="javascript:;" class="button xsmall warning delAnswer">
                                                                        <span>삭제</span>
                                                                    </a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                    <%-- 문항 목록 --%>
                                                    
                                                </tbody>
                                            </table>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>관리</span>
                                            </label>
                                        </th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${status.index eq 0 }">
                                                    <a href="javascript:;" class="button xsmall addQuiz">
                                                        <span>질문/문항 추가</span>
                                                    </a>
                                                    <a href="javascript:;" class="button xsmall warning delQuiz" style="display: none;">
                                                        <span>질문/문항 삭제</span>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="javascript:;" class="button xsmall addQuiz" style="display: none;">
                                                        <span>질문/문항 추가</span>
                                                    </a>
                                                    <a href="javascript:;" class="button xsmall warning delQuiz">
                                                        <span>질문/문항 삭제</span>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            </c:forEach>
                            
                        </div>
                        <%-- 퀴즈 목록 --%>
                        
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
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
    <%-- 동영상 정보 --%>
    <script id="videoUrlTemplate" type="text/x-jquery-tmpl">

    </script>
    <%-- 퀴즈 --%>
    <script id="quizTemplate" type="text/x-jquery-tmpl">
        <table cellspacing="0" class="table-row table-a quiz">
            <input type="hidden" name="RDP_QUIZ_NO" value="{{= QUIZ_NO }}" />
            <input type="hidden" name="QUIZ[{{= QUIZ_NO }}].RDP_QUIZ_IDX" value="" />
            <input type="hidden" name="QUIZ[{{= QUIZ_NO }}].RDP_QUIZ_DEL_YN" value="N" />
            <!-- table -->
            <colgroup>
                <col style="width: 15%;" />
                <col style="width: auto;" />
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label class="label">
                            <span>노출순서<i class="require"><em>필수입력</em></i></span>
                        </label>
                    </th>
                    <td>
                        <input type="text" name="QUIZ[{{= QUIZ_NO }}].RDP_QUIZ_SORT" class="text number quizNo" value="" readonly="readonly"/>
                        <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                        <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                    </td>
                </tr>
                <tr>
                    <th>
                        <label class="label">
                            <span>질문<i class="require"><em>필수입력</em></i></span>
                        </label>
                    </th>
                    <td>
                        <input type="text" name="QUIZ[{{= QUIZ_NO }}].RDP_QUIZ_NM" class="text xlarge" maxlength="200" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <label class="label">
                            <span>문항<i class="require"><em>필수입력</em></i></span>
                        </label>
                    </th>
                    <td>
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 50px;" />
                                <col style="width: auto;" />
                                <col style="width: 150px;" />
                                <col style="width: 50px;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>NO</span>
                                    </th>
                                    <th>
                                        <span>선택문항<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <th>
                                        <span>정답(택1)<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                                
                                <tr class="answer">
                                    <input type="hidden" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_IDX" value="" />
                                    <input type="hidden" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_DEL_YN" value="N" />
                                    <td>
                                        <span>1</span>
                                    </td>
                                    <td>
                                        <input type="text" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_NM" class="text xlarge" maxlength="200" />
                                    </td>
                                    <td>
                                        <input type="radio" id="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[0]_Y" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[0]" value="Y" class="radio answerYn" />
                                        <label for="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[0]_Y">예</label>
                                        <input type="radio" id="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[0]_N" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[0]" value="N" class="radio answerYn" checked="checked" />
                                        <label for="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[0]_N">아니오</label>
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="button xsmall addAnswer">
                                            <span>추가</span>
                                        </a>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                        
                    </td>
                </tr>
                <tr>
                    <th>
                        <label class="label">
                            <span>관리</span>
                        </label>
                    </th>
                    <td>
                        <a href="javascript:;" class="button xsmall addQuiz">
                            <span>질문/문항 추가</span>
                        </a>
                        <a href="javascript:;" class="button xsmall warning delQuiz">
                            <span>질문/문항 삭제</span>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </script>
    <%-- 퀴즈문항 --%>
    <script id="quizAnswerTemplate" type="text/x-jquery-tmpl">
        <tr class="answer">
            <input type="hidden" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_IDX" value="" />
            <input type="hidden" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_DEL_YN" value="N" />
            <td>
                <span></span>
            </td>
            <td>
                <input type="text" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_NM" class="text xlarge" maxlength="200" />
            </td>
            <td>
                <input type="radio" id="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[{{= ANSWER_NO }}]_Y" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[{{= ANSWER_NO }}]" value="Y" class="radio answerYn" />
                <label for="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[{{= ANSWER_NO }}]_Y">예</label>
                <input type="radio" id="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[{{= ANSWER_NO }}]_N" name="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[{{= ANSWER_NO }}]" value="N" class="radio answerYn" checked="checked" />
                <label for="QUIZ[{{= QUIZ_NO }}].RDP_ITEM_YN[{{= ANSWER_NO }}]_N">아니오</label>
            </td>
            <td>
                <a href="javascript:;" class="button xsmall warning delAnswer">
                    <span>삭제</span>
                </a>
            </td>
        </tr>
    </script>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            var $videoUrlTemplate = $("#videoUrlTemplate"),
                $quizTemplate = $("#quizTemplate"),
                $quizAnswerTemplate = $("#quizAnswerTemplate");
            var quizNo = Number('${fn:length(info.QUIZ)}') - 1;
            // 폼
            $frm.validate({
                ignore : [],
                rules : {
                    RDP_EDU_NM : {
                        required : true
                    },
                    RDP_EDU_YN : {
                        required : true
                    }
                }
            });
            // 퀴즈 추가
            $wrapper.on("click", ".addQuiz", function() {
                var param = {
                    QUIZ_NO : ++quizNo
                };
                $wrapper.find("#quizList").append($quizTemplate.tmpl(param));
                redrawAllQuiz();
            });
            // 퀴즈 삭제
            $wrapper.on("click", ".delQuiz", function() {
                var $table = $(this).closest("table"); 
                $table.hide();
                $table.find("input[name$='RDP_QUIZ_DEL_YN']").val('Y');
                $wrapper.find("#quizList").prepend($table.detach());
                redrawAllQuiz();
            });
            // 퀴즈 순서변경
            $wrapper.on("click", ".row-sort", function() {
                var $this = $(this);
                var $table = $this.closest("table.quiz");
                var maxIndex = $table.length;
                if ($this.data("sort_type") == "up" && $wrapper.find('#quizList').find('table.quiz:visible').index($table) > 0) {
                    $table.prev().before($table.detach());
                } else if ($this.data("sort_type") == "down" && $table.next(":visible").length > 0) {
                    $table.next().after($table.detach());
                }
                redrawAllQuiz();
            });
            // 퀴즈 순서 출력
            function redrawAllQuiz() {
                $wrapper.find("table.quiz:visible").each(function (i) {
                    $(this).find("input.quizNo").val(i + 1);
                    if (i == 0) {
                        $(this).find("a.addQuiz").show();
                        $(this).find("a.delQuiz").hide();
                    } else {
                        $(this).find("a.addQuiz").hide();
                        $(this).find("a.delQuiz").show();
                    }
                });
            }
            // 답변 추가
            $wrapper.on("click", ".addAnswer", function() {
                $tbody = $(this).closest("tbody");
                var param = {
                    QUIZ_NO : $(this).closest("table.quiz").find("input[name='RDP_QUIZ_NO']").val(),
                    ANSWER_NO : $(this).closest("tbody").find("tr.answer").size()
                };
                $tbody.append($quizAnswerTemplate.tmpl(param));
                $tbody.find("tr.answer:visible").each(function (i) {
                    $(this).children("td:first").text(i + 1);
                });
            });
            // 답변 삭제
            $wrapper.on("click", ".delAnswer", function() {
                $tbody = $(this).closest("tbody");
                $(this).closest("tr").hide();
                $(this).closest("tr").find("input[name$='RDP_ITEM_DEL_YN']").val("Y");
                $tbody.find("tr.answer:visible").each(function (i) {
                    $(this).children("td:first").text(i + 1);
                });
            });
            // 답변 정답 선택 (하나만)
            $wrapper.on("change", ".answerYn", function() {
                var $tr = $(this).closest("tr");
                $tr.closest("tbody").find("tr.answer").not($tr).find("input[value='N']").prop("checked", true);
            });
            // 목록
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            // 저장
            $wrapper.on("click", "#save", function() {
                if ($frm.valid()) {
                    var valid = true;
                    
                    // 동영상
                    var $videoLength = $wrapper.find("table.file-table0").find("tr").length;
                    var $pcThumbnailLength = $wrapper.find("table.file-table1").find("tr").length;
                    var $mobileThumbnailLength = $wrapper.find("table.file-table2").find("tr").length;
                    var $video = $wrapper.find("table.file-table0").find("input[name='FILE']");
                    var $pcThumbnail = $wrapper.find("table.file-table1").find("input[name='FILE']");
                    var $mobileThumbnail = $wrapper.find("table.file-table2").find("input[name='FILE']");
                    // 필수
                    $video.each(function() {
                        if (valid && !$(this).val()) {
                            alert("[동영상] 은(는) 필수입력 사항입니다.");
                            return valid = false;
                        }
                    })
                    $pcThumbnail.each(function() {
                        if (valid && !$(this).val()) {
                            alert("[PC 섬네일 이미지] 은(는) 필수입력 사항입니다.");
                            return valid = false;
                        }
                    })
                    $mobileThumbnail.each(function() {
                        if (valid && !$(this).val()) {
                            alert("[MOBILE 섬네일 이미지] 은(는) 필수입력 사항입니다.");
                            return valid = false;
                        }
                    })
                    // 개수
                    if (valid && ($videoLength != $pcThumbnailLength || $pcThumbnailLength != $mobileThumbnailLength)) {
                        alert("동영상, PC 섬네일 이미지, MOBILE 섬네일 이미지는 동일한 개수로 등록되어야 합니다.");
                        return valid = false;
                    }
                    
                    // 퀴즈
                    $wrapper.find("#quizList").find("table.quiz:visible").each(function() {
                        var $table = $(this);
                        
                        // 질문
                        var RDP_QUIZ_NM = $table.find("input[name$='RDP_QUIZ_NM']");
                        if (valid && !RDP_QUIZ_NM.val()) {
                            alert("[질문] 은(는) 필수입력 사항입니다.");
                            RDP_QUIZ_NM.focus();
                            return valid = false;
                        }
                        
                        // 선택문항
                        $table.find("tr.answer:visible").each(function() {
                            var $tr = $(this);
                            var RDP_ITEM_NM = $tr.find("input[name$='RDP_ITEM_NM']");
                            if (valid && !RDP_ITEM_NM.val()) {
                                alert("[선택문항] 은(는) 필수입력 사항입니다.");
                                RDP_ITEM_NM.focus();
                                return valid = false;
                            }
                        })
                        
                        // 정답
                        if (valid && $table.find("input.answerYn[value='Y']:checked:visible").length == 0) {
                            alert("[정답] 은(는) 필수입력 사항입니다.");
                            return valid = false;
                        }
                    });
                    
                    if (valid && confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
        });
    </script>
</body>
</html>
