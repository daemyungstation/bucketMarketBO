<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body>
    <div id="header">
        <%@ include file="/WEB-INF/jsp/bo/include/top.jsp"%>
    </div>
    <div id="container">
        <div id="aside" class="aside left">
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <div id="wrapper">
            <div id="breadcrumb"></div>
            <div id="contents">
                <div class="container">
                    <h2 class="title">
                        <span>이벤트 상세</span>
                    </h2>
                    <c:if test="${info.EVT_MST_RPL_YN eq 'Y' }">
                        <div class="tab-list">
                            <ul>
                                <li class="in">
                                    <a href="javascript:;" class="event-type-tab" data-type="edit">
                                        <span>이벤트 정보</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" class="event-type-tab" data-type="reply-list">
                                        <span>댓글</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </c:if>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${info.EVT_MST_IDX }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchEvtMstTitle" value="<c:out value="${commandMap.searchEvtMstTitle }"/>" />
                        <input type="hidden" name="searchEvtMstPsnYn" value="<c:out value="${commandMap.searchEvtMstPsnYn }"/>" />
                        <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>" />
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data">
                        <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${info.EVT_MST_IDX }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchEvtMstTitle" value="<c:out value="${commandMap.searchEvtMstTitle }"/>" />
                        <input type="hidden" name="searchEvtMstPsnYn" value="<c:out value="${commandMap.searchEvtMstPsnYn }"/>" />
                        <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>" />
                        <h3 class="title">
                            <span>기본정보</span>
                        </h3>
                        <p>
                            <span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.
                        </p>
                        <table cellspacing="0" class="table-row table-a">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: 35%;" />
                                <col style="width: 15%" />
                                <col style="width: 35%;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>이벤트 기간<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="EVT_MST_ST_DT" id="EVT_MST_ST_DT" class="text date" value="<ui:formatDate value="${info.EVT_MST_ST_DT }" pattern="yyyy-MM-dd"/>" data-target-end="#EVT_MST_ED_DT" />
                                        <select name="EVT_MST_ST_HH" id="EVT_MST_ST_HH" class="select small">
                                            <c:forEach var="hh" begin="0" end="23" step="1">
                                                <c:set var="hour" value="${hh }"/>
                                                <c:if test="${hh lt 10 }">
                                                    <c:set var="hour" value="0${hour }"/>
                                                </c:if>
                                                <c:out value="${hour }"/>
                                                <option value="<c:out value="${hour }"/>" <c:if test="${info.EVT_MST_ST_HH eq hour }">selected="selected"</c:if>><c:out value="${hour }"/></option>
                                            </c:forEach>
                                        </select>
                                        <select name="EVT_MST_ST_MI" id="EVT_MST_ST_MI" class="select small">
                                            <c:forEach var="mm" begin="0" end="59" step="1">
                                                <c:set var="minute" value="${mm }"/>
                                                <c:if test="${mm lt 10 }">
                                                    <c:set var="minute" value="0${minute }"/>
                                                </c:if>
                                                <option value="<c:out value="${minute }"/>" <c:if test="${info.EVT_MST_ST_MI eq minute }">selected="selected"</c:if>><c:out value="${minute }"/></option>
                                            </c:forEach>
                                        </select>
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="EVT_MST_ED_DT" id="EVT_MST_ED_DT" class="text date" value="<ui:formatDate value="${info.EVT_MST_ED_DT }" pattern="yyyy-MM-dd"/>" data-target-start="#EVT_MST_ST_DT" />
                                        <select name="EVT_MST_ED_HH" id="EVT_MST_ED_HH" class="select small">
                                            <c:forEach var="hh" begin="0" end="23" step="1">
                                                <c:set var="hour" value="${hh }"/>
                                                <c:if test="${hh lt 10 }">
                                                    <c:set var="hour" value="0${hour }"/>
                                                </c:if>
                                                <c:out value="${hour }"/>
                                                <option value="<c:out value="${hour }"/>" <c:if test="${info.EVT_MST_ED_HH eq hour }">selected="selected"</c:if>><c:out value="${hour }"/></option>
                                            </c:forEach>
                                        </select>
                                        <select name="EVT_MST_ED_MI" id="EVT_MST_ED_MI" class="select small">
                                            <c:forEach var="mm" begin="0" end="59" step="1">
                                                <c:set var="minute" value="${mm }"/>
                                                <c:if test="${mm lt 10 }">
                                                    <c:set var="minute" value="0${minute }"/>
                                                </c:if>
                                                <option value="<c:out value="${minute }"/>" <c:if test="${info.EVT_MST_ED_MI eq minute }">selected="selected"</c:if>><c:out value="${minute }"/></option>
                                            </c:forEach>
                                        </select>
                                        <a href="javascript:DateUtil.fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall">
                                            <span>오늘</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall">
                                            <span>일주일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall">
                                            <span>15일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall">
                                            <span>한달</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall">
                                            <span>두달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>제목<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" name="EVT_MST_TITLE" id="EVT_MST_TITLE" class="text xlarge" value="<c:out value="${info.EVT_MST_TITLE }"/>" maxlength="40" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>댓글 사용여부<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="EVT_MST_RPL_YN" id="EVT_MST_RPL_YN0" value="Y" class="radio" <c:if test="${info.EVT_MST_RPL_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_RPL_YN0">사용</label>
                                        <input type="radio" name="EVT_MST_RPL_YN" id="EVT_MST_RPL_YN1" value="N" class="radio" <c:if test="${info.EVT_MST_RPL_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_RPL_YN1">사용안함</label>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>이미지 사용여부<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="EVT_MST_IMG_YN" id="EVT_MST_IMG_YN0" value="Y" class="radio" <c:if test="${info.EVT_MST_IMG_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_IMG_YN0">사용</label>
                                        <input type="radio" name="EVT_MST_IMG_YN" id="EVT_MST_IMG_YN1" value="N" class="radio" <c:if test="${info.EVT_MST_IMG_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_IMG_YN1">사용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>개인정보 수집여부<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="EVT_MST_PSN_YN" id="EVT_MST_PSN_YN0" value="Y" class="radio" <c:if test="${info.EVT_MST_PSN_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_PSN_YN0">수집</label>
                                        <input type="radio" name="EVT_MST_PSN_YN" id="EVT_MST_PSN_YN1" value="N" class="radio" <c:if test="${info.EVT_MST_PSN_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_PSN_YN1">수집안함</label>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>전시여부<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="EVT_MST_USE_YN" id="EVT_MST_USE_YN0" value="Y" class="radio" <c:if test="${info.EVT_MST_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_USE_YN0">사용</label>
                                        <input type="radio" name="EVT_MST_USE_YN" id="EVT_MST_USE_YN1" value="N" class="radio" <c:if test="${info.EVT_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="EVT_MST_USE_YN1">사용안함</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <h3 class="title">
                            <span>목록 이미지</span>
                        </h3>
                        <p>
                            <span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.
                        </p>
                        <table cellspacing="0" class="table-row table-a">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: 75%;" />
                            </colgroup>
                            <tbody>
                                <c:forEach var="device" items="${Const.DEVICE }" varStatus="i">
                                    <tr>
                                        <th>
                                            <span><c:out value="${device.value }"/>이미지<i class="require"><em>필수입력</em></i></span>
                                            <small class="desc">
                                                <c:if test="${device.key eq Const.PC }">
                                                    <span style="color: #fd5490;">540px * 276px</span>
                                                </c:if>
                                                <c:if test="${device.key eq Const.MOBILE }">
                                                    <span style="color: #fd5490;">750px * 750px</span>
                                                </c:if>
                                            </small>
                                        </th>
                                        <td>
                                            <spring:eval var="fileSize" expression="@file['file.max.byte.size.image']"/>
                                            <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                                <jsp:param name="fileListName" value="${i.first ? 'pcFileList' : 'mobileFileList' }"/>
                                                <jsp:param name="fileName" value="FILE"/>
                                                <jsp:param name="order" value="${i.index }"/>
                                                <jsp:param name="isMulti" value="false"/>
                                                <jsp:param name="maxCount" value="1"/>
                                                <jsp:param name="allow" value="image"/>
                                                <jsp:param name="size" value="${fileSize }"/>
                                                <jsp:param name="isPreview" value="true"/>
                                                <jsp:param name="imageWidth" value="${device.key eq Const.PC ? '260' : '260' }"/>
                                                <jsp:param name="imageHeight" value="${device.key eq Const.PC ? '200' : '200' }"/>
                                                <jsp:param name="fileType" value="${device.key }"/>
                                            </jsp:include>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <h3 class="title">
                            <span>미디어</span>
                        </h3>
                        <table cellspacing="0" class="table-row table-a">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: 75%;" />
                            </colgroup>
                            <tbody>
                                <c:forEach var="device" items="${Const.DEVICE }" varStatus="i">
                                    <tr>
                                        <th>
                                            <span><c:out value="${device.value }"/>미디어</span>
                                        </th>
                                        <td>
                                            <textarea class="textarea" name="<c:out value="${device.key eq Const.PC ? 'EVT_MST_PC_MDA' : 'EVT_MST_MB_MDA' }"/>" id="<c:out value="${device.key eq Const.PC ? 'EVT_MST_PC_MDA' : 'EVT_MST_MB_MDA' }"/>" style="height: 500px; width: 100%"><c:out value="${device.key eq Const.PC ? info.EVT_MST_PC_MDA : info.EVT_MST_MB_MDA }"/></textarea>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <h3 class="title">
                            <span>이벤트 상세</span>
                        </h3>
                        <table cellspacing="0" class="table-row table-a">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: 75%;" />
                            </colgroup>
                            <tbody>
                                <c:forEach var="device" items="${Const.DEVICE }" varStatus="i">
                                    <tr>
                                        <th>
                                            <span><c:out value="${device.value }"/>상세<i class="require"><em>필수입력</em></i></span>
                                            <c:if test="${device.key eq Const.PC }">
                                                <span style="color: #fd5490;">가로 1280px</span>
                                            </c:if>
                                            <c:if test="${device.key eq Const.MOBILE }">
                                                <span style="color: #fd5490;">가로 750px</span>
                                            </c:if>
                                        </th>
                                        <td>
                                            <textarea class="textarea" name="<c:out value="${device.key eq Const.PC ? 'EVT_MST_PC_DTL' : 'EVT_MST_MB_DTL' }"/>" id="<c:out value="${device.key eq Const.PC ? 'EVT_MST_PC_DTL' : 'EVT_MST_MB_DTL' }"/>" style="height: 500px; width: 100%"><c:out value="${device.key eq Const.PC ? info.EVT_MST_PC_DTL : info.EVT_MST_MB_DTL }"/></textarea>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                    <div class="section-button">
                        <div class="wrap text-center">
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                            <a href="javascript:;" id="goList" class="button large">
                                <span>목록</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="quickmenu" class="aside right">
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
    </div>
    <div id="footer">
        <%@ include file="/WEB-INF/jsp/bo/include/footer.jsp"%>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <c:forEach var="device" items="${Const.DEVICE }" varStatus="i">
        <ui:editor objId="${device.key eq Const.PC ? '#EVT_MST_PC_MDA' : '#EVT_MST_MB_MDA' }" jsLoadYn="${i.first ? 'Y' : 'N' }" num="Media${device.key }"/>
        <ui:editor objId="${device.key eq Const.PC ? '#EVT_MST_PC_DTL' : '#EVT_MST_MB_DTL' }" jsLoadYn="N" num="Detail${device.key }"/>
    </c:forEach>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            $frm.validate({
                ignore : [],
                rules : {
                    EVT_MST_ST_DT : {
                        required : true
                    },
                    EVT_MST_ED_DT : {
                        required : true
                    },
                    EVT_MST_TITLE : {
                        required : true
                    },
                    EVT_MST_RPL_YN : {
                        required : true
                    },
                    EVT_MST_IMG_YN : {
                        required : true
                    },
                    EVT_MST_ED_DT : {
                        required : true
                    },
                    EVT_MST_USE_YN : {
                        required : true
                    },
                    FILE : {
                        required : true
                    },
                    EVT_MST_PC_DTL : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    },
                    EVT_MST_MB_DTL : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    }
                }
            });
            <%-- 탭 클릭 이벤트  --%>
            $wrapper.on("click", ".event-type-tab", function() {
                if ($(this).data("type") == "reply-list") {
                    $searchForm.postSubmit($.action.list("Reply"));
                }
            });
            <%-- 목록 버튼 클릭 이벤트  --%>
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 등록 이벤트  --%>
            $wrapper.on("click", "#save", function() {
                oEditorsMedia<c:out value="${Const.PC}"/>.getById["EVT_MST_PC_MDA"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditorsMedia<c:out value="${Const.MOBILE}"/>.getById["EVT_MST_MB_MDA"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditorsDetail<c:out value="${Const.PC}"/>.getById["EVT_MST_PC_DTL"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditorsDetail<c:out value="${Const.MOBILE}"/>.getById["EVT_MST_MB_DTL"].exec("UPDATE_CONTENTS_FIELD", []);
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