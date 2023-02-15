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
                        <span>기획전 상세</span>
                    </h2>
                    <c:if test="${info.PLN_MST_RPL_YN eq 'Y' }">
                        <div class="tab-list">
                            <ul>
                                <li class="in">
                                    <a href="javascript:;" class="event-type-tab" data-type="edit">
                                        <span>기획전 정보</span>
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
                        <input type="hidden" name="PLN_MST_IDX" value="<c:out value="${info.PLN_MST_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>"/>
                        <input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>"/>
                        <input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>"/>
                        <input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>"/>
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data">
                        <input type="hidden" name="PLN_MST_IDX" value="<c:out value="${info.PLN_MST_IDX }"/>"/>
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
                                        <span>기획전 기간<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="PLN_MST_ST_DT" id="PLN_MST_ST_DT" class="text date" value="<ui:formatDate value="${info.PLN_MST_ST_DT }" pattern="yyyy-MM-dd"/>" data-target-end="#PLN_MST_ED_DT" />
                                        <select name="PLN_MST_ST_HH" id="PLN_MST_ST_HH" class="select small">
                                            <c:forEach var="hh" begin="0" end="23" step="1">
                                                <c:set var="hour" value="${hh }"/>
                                                <c:if test="${hh lt 10 }">
                                                    <c:set var="hour" value="0${hour }"/>
                                                </c:if>
                                                <c:out value="${hour }"/>
                                                <option value="<c:out value="${hour }"/>" <c:if test="${info.PLN_MST_ST_HH eq hour }">selected="selected"</c:if>><c:out value="${hour }"/></option>
                                            </c:forEach>
                                        </select>
                                        <select name="PLN_MST_ST_MI" id="PLN_MST_ST_MI" class="select small">
                                            <c:forEach var="mm" begin="0" end="59" step="1">
                                                <c:set var="minute" value="${mm }"/>
                                                <c:if test="${mm lt 10 }">
                                                    <c:set var="minute" value="0${minute }"/>
                                                </c:if>
                                                <option value="<c:out value="${minute }"/>" <c:if test="${info.PLN_MST_ST_MI eq minute }">selected="selected"</c:if>><c:out value="${minute }"/></option>
                                            </c:forEach>
                                        </select>
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="PLN_MST_ED_DT" id="PLN_MST_ED_DT" class="text date" value="<ui:formatDate value="${info.PLN_MST_ED_DT }" pattern="yyyy-MM-dd"/>" data-target-start="#PLN_MST_ST_DT" />
                                        <select name="PLN_MST_ED_HH" id="PLN_MST_ED_HH" class="select small">
                                            <c:forEach var="hh" begin="0" end="23" step="1">
                                                <c:set var="hour" value="${hh }"/>
                                                <c:if test="${hh lt 10 }">
                                                    <c:set var="hour" value="0${hour }"/>
                                                </c:if>
                                                <c:out value="${hour }"/>
                                                <option value="<c:out value="${hour }"/>" <c:if test="${info.PLN_MST_ED_HH eq hour }">selected="selected"</c:if>><c:out value="${hour }"/></option>
                                            </c:forEach>
                                        </select>
                                        <select name="PLN_MST_ED_MI" id="PLN_MST_ED_MI" class="select small">
                                            <c:forEach var="mm" begin="0" end="59" step="1">
                                                <c:set var="minute" value="${mm }"/>
                                                <c:if test="${mm lt 10 }">
                                                    <c:set var="minute" value="0${minute }"/>
                                                </c:if>
                                                <option value="<c:out value="${minute }"/>" <c:if test="${info.PLN_MST_ED_MI eq minute }">selected="selected"</c:if>><c:out value="${minute }"/></option>
                                            </c:forEach>
                                        </select>
                                        <a href="javascript:DateUtil.fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall">
                                            <span>오늘</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall">
                                            <span>일주일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall">
                                            <span>15일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall">
                                            <span>한달</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall">
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
                                        <input type="text" name="PLN_MST_TITLE" id="PLN_MST_TITLE" class="text xlarge" value="<c:out value="${info.PLN_MST_TITLE }"/>" maxlength="40" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>댓글 사용여부<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="PLN_MST_RPL_YN" id="PLN_MST_RPL_YN0" value="Y" class="radio" <c:if test="${info.PLN_MST_RPL_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="PLN_MST_RPL_YN0">사용</label>
                                        <input type="radio" name="PLN_MST_RPL_YN" id="PLN_MST_RPL_YN1" value="N" class="radio" <c:if test="${info.PLN_MST_RPL_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="PLN_MST_RPL_YN1">사용안함</label>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>전시여부<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" name="PLN_MST_USE_YN" id="PLN_MST_USE_YN0" value="Y" class="radio" <c:if test="${info.PLN_MST_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="PLN_MST_USE_YN0">사용</label>
                                        <input type="radio" name="PLN_MST_USE_YN" id="PLN_MST_USE_YN1" value="N" class="radio" <c:if test="${info.PLN_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="PLN_MST_USE_YN1">사용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상품목록 노출여부<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan = "3">
                                        <input type="radio" name="PLN_MST_PRD_DPL_YN" id="PLN_MST_PRD_DPL_YN0" value="Y" class="radio" <c:if test="${info.PLN_MST_PRD_DPL_YN eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="PLN_MST_PRD_DPL_YN0">사용</label>
                                        <input type="radio" name="PLN_MST_PRD_DPL_YN" id="PLN_MST_PRD_DPL_YN1" value="N" class="radio" <c:if test="${info.PLN_MST_PRD_DPL_YN eq 'N' }">checked="checked"</c:if>/>
                                        <label for="PLN_MST_PRD_DPL_YN1">사용안함</label>
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
                                            <textarea class="textarea" name="<c:out value="${device.key eq Const.PC ? 'PLN_MST_PC_MDA' : 'PLN_MST_MB_MDA' }"/>" id="<c:out value="${device.key eq Const.PC ? 'PLN_MST_PC_MDA' : 'PLN_MST_MB_MDA' }"/>" style="height: 500px; width: 100%"><c:out value="${device.key eq Const.PC ? info.PLN_MST_PC_MDA : info.PLN_MST_MB_MDA }"/></textarea>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <h3 class="title">
                            <span>기획전 상세</span>
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
                                            <textarea class="textarea" name="<c:out value="${device.key eq Const.PC ? 'PLN_MST_PC_DTL' : 'PLN_MST_MB_DTL' }"/>" id="<c:out value="${device.key eq Const.PC ? 'PLN_MST_PC_DTL' : 'PLN_MST_MB_DTL' }"/>" style="height: 500px; width: 100%"><c:out value="${device.key eq Const.PC ? info.PLN_MST_PC_DTL : info.PLN_MST_MB_DTL }"/></textarea>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div id="plan-product-area">
                            <c:if test="${info.PLN_MST_PRD_DPL_YN eq 'Y'}">
                                <h3 class="title">
                                    <span>상품구성</span>
                                </h3>
                            </c:if>
                            <c:if test="${info.PLN_MST_PRD_DPL_YN eq 'Y' and not empty productList}">
                                <c:forEach var="row" items="${productList }" varStatus="i">
                                    <table cellspacing="0" class="table-row table-a">
                                        <colgroup>
                                            <col style="width: 15%;" />
                                            <col style="width: 75%;" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>그룹명<i class="require"><em>필수입력</em></i></span>
                                                </th>
                                                <td>
                                                    <input type="hidden" name="PLN_GRP_NUMs" value="<c:out value="${i.index }"/>"/>
                                                    <input type="text" name="PLN_GRP_TITLE_<c:out value="${i.index }"/>" class="text xlarge required" value="<c:out value="${row.PLN_GRP_TITLE }"/>" maxlength="70"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>진열 개수<i class="require"><em>필수입력</em></i></span>
                                                </th>
                                                <td>
                                                    <c:forEach var="codeRow" items="${codeList }" varStatus="codeStat">
                                                        <input type="radio" name="PLN_GRP_COL_<c:out value="${i.index }"/>" id="PLN_GRP_COL_<c:out value="${i.index }"/>_<c:out value="${codeStat.index }"/>" class="radio required" value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${row.PLN_GRP_COL eq codeRow.CMN_COM_IDX }">checked="checked"</c:if>/>
                                                        <label for="PLN_GRP_COL_<c:out value="${i.index }"/>_<c:out value="${codeStat.index }"/>">
                                                            <c:out value="${codeRow.CMN_COM_NM }"/>
                                                        </label>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>전시 상품<i class="require"><em>필수입력</em></i></span>
                                                </th>
                                                <td>
                                                    <input type="hidden" name="PRODUCT" value="<c:out value="${i.index }"/>" />
                                                    <div class="wrap text-right">
                                                        <a href="javascript:;" class="button small warning plan-detail-remove">
                                                            <span>선택 삭제</span>
                                                        </a>
                                                        <a href="javascript:;" class="button small search-product-popup" "title="새 창 으로 열립니다.">
                                                            <span>상품 추가</span>
                                                        </a>
                                                    </div>
                                                    <table cellspacing="0" class="table-row table-b">
                                                        <colgroup>
                                                            <col style="width: auto;" />
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
                                                                <th class="text-center">
                                                                    <input type="checkbox" class="checkbox check-all" value=""/>
                                                                </th>
                                                                <th class="text-center">상품유형</th>
                                                                <th class="text-center">온라인상품명</th>
                                                                <th class="text-center">총상품금액</th>
                                                                <th class="text-center">기간계상품코드</th>
                                                                <th class="text-center">모델분류</th>
                                                                <th class="text-center">모델명</th>
                                                                <th class="text-center">노출상태</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:if test="${not empty row.planDetailList }">
                                                                <c:forEach var="detailRow" items="${row.planDetailList }" varStatus="y">
                                                                    <tr class="tr-<c:out value="${detailRow.PRD_MST_NO }"/>">
                                                                        <td class="text-center">
                                                                            <input type="hidden" name="PRD_MST_NO_<c:out value="${i.index }"/>" value="<c:out value="${detailRow.PRD_MST_NO }"/>"/>
                                                                            <input type="checkbox" class="checkbox check-row" value=""/>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <c:out value="${detailRow.PRD_MST_TYPE_NM }"/>
                                                                        </td>
                                                                        <td class="text-left">
                                                                            <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${detailRow.PRD_MST_NO }"/>">
                                                                            <c:out value="${detailRow.PRD_MST_NM }"/>
                                                                            </a>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <fmt:formatNumber value="${detailRow.PROD_AMT }" type="number"/>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <c:out value="${detailRow.PROD_CD }"/>
                                                                        </td>
                                                                        <td class="text-left">
                                                                            <c:out value="${detailRow.MODEL_CL_NM }"/><br/>(<c:out value="${detailRow.PRD_MST_SPL_NM }"/>)
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <c:out value="${detailRow.MODEL_NM }"/>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <c:out value="${detailRow.PRD_MST_DPL_TXT }"/>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${empty row.planDetailList }">
                                                                <tr>
                                                                    <td class="td_no_result text-center"></td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>관리</span>
                                                </th>
                                                <td>
                                                    <a href="javascript:;" class="button xsmall warning plan-group-remove">
                                                        <span>상품 그룹 삭제</span>
                                                    </a>
                                                    <a href="javascript:;" class="button xsmall plan-group-add">
                                                        <span>상품 그룹 추가</span>
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:forEach>
                            </c:if>
                            <c:if test="${info.PLN_MST_PRD_DPL_YN eq 'Y' and empty productList}">
                                <table cellspacing="0" class="table-row table-a">
                                    <colgroup>
                                        <col style="width: 15%;" />
                                        <col style="width: 75%;" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>
                                                <span>그룹명<i class="require"><em>필수입력</em></i></span>
                                            </th>
                                            <td>
                                                <input type="hidden" name="PLN_GRP_NUMs" value="0"/>
                                                <input type="text" name="PLN_GRP_TITLE_0" class="text xlarge required" value="" maxlength="70"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <span>진열 개수<i class="require"><em>필수입력</em></i></span>
                                            </th>
                                            <td>
                                                <c:forEach var="codeRow" items="${codeList }" varStatus="codeStat">
                                                    <input type="radio" name="PLN_GRP_COL_0" id="PLN_GRP_COL_0_<c:out value="${codeStat.index }"/>" class="radio required" value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${codeStat.first}">checked="checked"</c:if>/>
                                                    <label for="PLN_GRP_COL_0_<c:out value="${codeStat.index }"/>">
                                                        <c:out value="${codeRow.CMN_COM_NM }"/>
                                                    </label>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <span>전시 상품<i class="require"><em>필수입력</em></i></span>
                                            </th>
                                            <td>
                                                <input type="hidden" name="PRODUCT" value="0" />
                                                <div class="wrap text-right">
                                                    <a href="javascript:;" class="button small warning plan-detail-remove">
                                                        <span>선택 삭제</span>
                                                    </a>
                                                    <a href="javascript:;" class="button small search-product-popup" "title="새 창 으로 열립니다.">
                                                        <span>상품 추가</span>
                                                    </a>
                                                </div>
                                                <table cellspacing="0" class="table-row table-b">
                                                    <colgroup>
                                                        <col style="width: auto;" />
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
                                                            <th class="text-center">
                                                                <input type="checkbox" class="checkbox check-all" value=""/>
                                                            </th>
                                                            <th class="text-center">상품유형</th>
                                                            <th class="text-center">온라인상품명</th>
                                                            <th class="text-center">총상품금액</th>
                                                            <th class="text-center">기간계상품코드</th>
                                                            <th class="text-center">모델분류</th>
                                                            <th class="text-center">모델명</th>
                                                            <th class="text-center">노출상태</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="td_no_result text-center"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <span>관리</span>
                                            </th>
                                            <td>
                                                <a href="javascript:;" class="button xsmall warning plan-group-remove">
                                                    <span>상품 그룹 삭제</span>
                                                </a>
                                                <a href="javascript:;" class="button xsmall plan-group-add">
                                                    <span>상품 그룹 추가</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
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
        <ui:editor objId="${device.key eq Const.PC ? '#PLN_MST_PC_MDA' : '#PLN_MST_MB_MDA' }" jsLoadYn="${i.first ? 'Y' : 'N' }" num="Media${device.key }"/>
        <ui:editor objId="${device.key eq Const.PC ? '#PLN_MST_PC_DTL' : '#PLN_MST_MB_DTL' }" jsLoadYn="N" num="Detail${device.key }"/>
    </c:forEach>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
    <script id="planGroupTemplate" type="text/x-jquery-tmpl">
        {{if FIRST_YN == "Y"}}
            <h3 class="title">
                <span>상품구성</span>
            </h3>
        {{/if}}
        <table cellspacing="0" class="table-row table-a">
            <colgroup>
                <col style="width: 15%;" />
                <col style="width: 75%;" />
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <span>그룹명<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="hidden" name="PLN_GRP_NUMs" value="\${PLN_GRP_NUM}"/>
                        <input type="text" name="PLN_GRP_TITLE_\${PLN_GRP_NUM}" class="text xlarge required" value="" maxlength="70"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>진열 개수<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <c:forEach var="codeRow" items="${codeList }" varStatus="codeStat">
                            <input type="radio" name="PLN_GRP_COL_\${PLN_GRP_NUM}" id="PLN_GRP_COL_\${PLN_GRP_NUM}_<c:out value="${codeStat.index }"/>" class="radio required" value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${codeStat.first}">checked="checked"</c:if>/>
                            <label for="PLN_GRP_COL_\${PLN_GRP_NUM}_<c:out value="${codeStat.index }"/>">
                                <c:out value="${codeRow.CMN_COM_NM }"/>
                            </label>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>전시 상품<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="hidden" name="PRODUCT" value="\${PLN_GRP_NUM}" />
                        <div class="wrap text-right">
                            <a href="javascript:;" class="button small warning plan-detail-remove">
                                <span>선택 삭제</span>
                            </a>
                            <a href="javascript:;" class="button small search-product-popup" "title="새 창 으로 열립니다.">
                                <span>상품 추가</span>
                            </a>
                        </div>
                        <table cellspacing="0" class="table-row table-b">
                            <colgroup>
                                <col style="width: auto;" />
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
                                    <th class="text-center">
                                        <input type="checkbox" class="checkbox check-all" value=""/>
                                    </th>
                                    <th class="text-center">상품유형</th>
                                    <th class="text-center">온라인상품명</th>
                                    <th class="text-center">총상품금액</th>
                                    <th class="text-center">기간계상품코드</th>
                                    <th class="text-center">모델분류</th>
                                    <th class="text-center">모델명</th>
                                    <th class="text-center">노출상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{tmpl({info : ""}) "#planDetailTemplate"}}
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>관리</span>
                    </th>
                    <td>
                        <a href="javascript:;" class="button xsmall warning plan-group-remove">
                            <span>상품 그룹 삭제</span>
                        </a>
                        <a href="javascript:;" class="button xsmall plan-group-add">
                            <span>상품 그룹 추가</span>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </script>
    <script id="planDetailTemplate" type="text/x-jquery-tmpl">
        {{if info == ""}}
            <tr>
                <td class="td_no_result text-center"></td>
            </tr>
        {{else}}
            <tr class="tr-\${info.PRD_MST_NO}">
                <td class="text-center">
                    <input type="hidden" name="PRD_MST_NO_\${info.PLN_GRP_NUM}" value="\${info.PRD_MST_NO}"/>
                    <input type="checkbox" class="checkbox check-row" value=""/>
                </td>
                <td class="text-center">
                    \${info.PRD_MST_TYPE_NM}
                </td>
                <td class="text-left">
                    <a href="javascript:;" class="product-detail" data-prd_mst_no="\${info.PRD_MST_NO}">
                        \${info.PRD_MST_NM}
                    </a>
                </td>
                <td class="text-center">
                    \${StringUtil.setComma(info.PROD_AMT)}
                </td>
                <td class="text-center">
                    \${info.PROD_CD}
                </td>
                <td class="text-left">
                    \${info.MODEL_CL_NM}<br/>(\${info.PRD_MST_SPL_NM})
                </td>
                <td class="text-center">
                    \${info.MODEL_NM}
                </td>
                <td class="text-center">
                    \${info.PRD_MST_DPL_TXT}
                </td>
            </tr>
        {{/if}}
    </script>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
                
            var $planProductArea = $wrapper.find("#plan-product-area");
                $planGroupTemplate = $("#planGroupTemplate"),
                $planDetailTemplate = $("#planDetailTemplate"),
                $planGroupNumber = $planProductArea.find("input[name='PLN_GRP_NUMs']").length;
            $frm.validate({
                ignore : [],
                rules : {
                    PLN_MST_ST_DT : {
                        required : true
                    },
                    PLN_MST_ED_DT : {
                        required : true
                    },
                    PLN_MST_TITLE : {
                        required : true
                    },
                    PLN_MST_RPL_YN : {
                        required : true
                    },
                    PLN_MST_PRD_DPL_YN : {
                        required : true
                    },
                    PLN_MST_USE_YN : {
                        required : true
                    },
                    FILE : {
                        required : true
                    },
                    PLN_MST_PC_DTL : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    },
                    PLN_MST_MB_DTL : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    },
                    PRODUCT : {
                        product : true
                    }
                }
            });
            <%-- 전시 상품 Role 추가 --%>
            $.validator.addMethod("product", function(value, element) {
                if ($frm.find("input[name='PLN_MST_PRD_DPL_YN']:checked").val() == "Y") {
                    return this.optional(element) || ($(element).siblings("table.table-row").find(".td_no_result").length == 0);
                } else {
                    return true;
                }
            }, "은(는) 필수입력 사항입니다.");
            <%-- 탭 클릭 이벤트  --%>
            $wrapper.on("click", ".event-type-tab", function() {
                if ($(this).data("type") == "reply-list") {
                    $searchForm.postSubmit($.action.list("Reply"));
                }
            });
            <%-- 목록 버튼 클릭 기획전  --%>
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 상품목록 노출 여부 라디오 버튼 변경 이벤트  --%>
            $frm.on("change", "input[name='PLN_MST_PRD_DPL_YN']", function () {
                if ($(this).val() == "Y") {
                    $planGroupTemplate.tmpl({PLN_GRP_NUM : 0, FIRST_YN : "Y"}).appendTo($planProductArea);
                    $planGroupNumber = 1;
                    TagUtil.setEmptyColspan();
                } else {
                    $planProductArea.empty();
                }
            });
            <%-- 상품 그룹 추가 버튼 클릭 이벤트 --%>
            $planProductArea.on("click", ".plan-group-add", function () {
                $planGroupTemplate.tmpl({PLN_GRP_NUM : $planGroupNumber++, FIRST_YN : "N"}).appendTo($planProductArea);
                TagUtil.setEmptyColspan();
            });
            <%-- 상품 그룹 삭제 버튼 클릭 이벤트 --%>
            $planProductArea.on("click", ".plan-group-remove", function () {
                if ($planProductArea.find("table.table-row").length > 2) {
                    $(this).closest("table.table-row").remove();
                }
            });
            <%-- 상품 검색 공통 팝업 --%>
            $planProductArea.on("click", ".search-product-popup", function() {
                var $this = $(this),
                    $tbody = $this.closest("td").find("tbody");
                var planGroupNumber = $this.closest("tbody").find("input[name='PLN_GRP_NUMs']").val();
                $.common.popup.product.search(function (data) {
                    var html = new Array();
                    $.each(data, function(i, row) {
                        if ($tbody.find(".tr-" + row.PRD_MST_NO).length == 0) {
                            row.PLN_GRP_NUM = planGroupNumber;
                            html.push($planDetailTemplate.tmpl({info : row}));
                        }
                    });
                    $tbody.find(".td_no_result").closest("tr").remove();
                    $tbody.append(html);
                }, 0);
            });
            <%-- 선택 삭제 버튼 클릭 이벤트 --%>
            $planProductArea.on("click", ".plan-detail-remove", function() {
                var $tbody = $(this).closest("div.wrap").siblings("table.table-row").find("tbody"),
                    $checkRow = $tbody.find(".check-row:checked");
                if ($checkRow.length > 0) {
                    $checkRow.closest("tr").remove();
                    if ($tbody.find("tr").length == 0) {
                        $planDetailTemplate.tmpl({info : ""}).appendTo($tbody);
                        TagUtil.setEmptyColspan();
                    }
                }
            });
            <%-- 전시 상품 영역 전체 체크박스 변경 이벤트 --%>
            $planProductArea.on("change", ".check-all", function () {
                var $this = $(this);
                $this.closest("thead").siblings("tbody").find(".check-row").prop("checked", $this.is(":checked"));
            });
            <%-- 전시 상품 영역 개별 체크박스 변경 이벤트 --%>
            $planProductArea.on("change", ".check-row", function () {
                var $this = $(this),
                    $tbody = $this.closest("tbody");
                var checkRowLength = $tbody.find(".check-row:checked").length,
                    rowLength = $tbody.find("tr").length;
                $tbody.siblings("thead").find(".check-all").prop("checked", (checkRowLength > 0 && checkRowLength == rowLength));
            });
            <%-- 상품 상세 이동 --%>
            $planProductArea.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
            });
            <%-- 등록 기획전  --%>
            $wrapper.on("click", "#save", function() {
                oEditorsMedia<c:out value="${Const.PC}"/>.getById["PLN_MST_PC_MDA"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditorsMedia<c:out value="${Const.MOBILE}"/>.getById["PLN_MST_MB_MDA"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditorsDetail<c:out value="${Const.PC}"/>.getById["PLN_MST_PC_DTL"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditorsDetail<c:out value="${Const.MOBILE}"/>.getById["PLN_MST_MB_DTL"].exec("UPDATE_CONTENTS_FIELD", []);
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