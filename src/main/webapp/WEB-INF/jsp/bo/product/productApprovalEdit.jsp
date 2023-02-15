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
                        <span>승인상품 수정</span>
                    </h2>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchSupplyNm" value="<c:out value="${commandMap.searchSupplyNm }"/>" />
                        <input type="hidden" name="searchModelNm" value="<c:out value="${commandMap.searchModelNm }"/>" />
                        <input type="hidden" name="searchApvState" value="<c:out value="${commandMap.searchApvState }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                        <input type="hidden" name="searchOrderBy" value="<c:out value="${Product.REG_SORT}" />" />
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data">
                        <input type="hidden" name="PRD_MST_CD" value="<c:out value="${info.PRD_MST_CD }"/>"/>
                        <input type="hidden" name="VDR_MST_IDX" value="<c:out value="${info.VDR_MST_IDX }"/>"/>
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchSupplyNm" value="<c:out value="${commandMap.searchSupplyNm }"/>" />
                        <input type="hidden" name="searchModelNm" value="<c:out value="${commandMap.searchModelNm }"/>" />
                        <input type="hidden" name="searchApvState" value="<c:out value="${commandMap.searchApvState }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                        <input type="hidden" name="searchOrderBy" value="<c:out value="${Product.REG_SORT}" />" />                    
                        <h3 class="title">
                            <span>지원혜택정보</span>
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
                                        <span>기존 제휴업체명</span>
                                    </th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${isSuper || info.VDR_MST_NM eq null}">
                                                <c:if test="${info.VDR_MST_NM eq null }">
                                                    <c:out value="${Product.VDR_MST_DAEMYUNG_NM }" />
                                                </c:if>
                                                <c:if test="${info.VDR_MST_NM ne null }">
                                                    <c:out value="${info.VDR_MST_NM }" />
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                    <c:out value="${info.VDR_MST_NM }" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <th>
                                        <span>노출할 제휴업체명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="VDR_MST_NM" id="VDR_MST_NM" class="text xlarge" value="${info.VDR_MST_NM_DIS }" maxlength="50" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>지원혜택<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="PRD_MST_SPL_NM" id="PRD_MST_SPL_NM" class="text xlarge" value="<c:out value="${info.PRD_MST_SPL_NM }"/>" maxlength="50" <c:if test="${isScm }">readonly </c:if>/>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>모델명<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="PRD_MST_MD" id="PRD_MST_MD" class="text xlarge" value="<c:out value="${info.PRD_MST_MD }"/>" maxlength="20" <c:if test="${not isScm }">readonly </c:if>/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>공급가</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" name="PRD_MST_SPL_PRC" id="PRD_MST_SPL_PRC" class="text xlarge onlyNumber" value="<c:out value="${info.PRD_MST_SPL_PRC }"/>" maxlength="10" <c:if test="${isScm }">readonly </c:if> />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>가전제품타입 설정</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <div class="wrap text-left">
                                            <li><strong style="color: red;">※ 가전제품으로 모델명이 동일하지만, 색상/종류(스탠드/벽결이 등) 등의 옵션이 필수선택 되어야 하는 경우 등록합니다.</strong></li>
                                            <li><strong style="color: red;">※ 1개의 옵션에 최대 5개의 옵션값을 등록할 수 있습니다.</strong></li>
                                            <label for="PRD_MST_OPT_YN0">
                                                <input type="radio" name="PRD_MST_OPT_YN" id="PRD_MST_OPT_YN0" class="radio" value="Y" <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">checked="checked"</c:if> disabled="disabled"/>
                                                <span>사용함</span>
                                            </label>
                                            <label for="PRD_MST_OPT_YN1">
                                                <input type="radio" name="PRD_MST_OPT_YN" id="PRD_MST_OPT_YN1" class="radio" value="N" <c:if test="${info.PRD_MST_OPT_YN eq 'N' }">checked="checked"</c:if> disabled="disabled"/>
                                                <span>사용안함</span>
                                            </label>
                                        </div>
                                        <span class="product-option-area">
                                            <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
                                                <table cellspacing="0" class="table-row table-b" style="margin-bottom:0;">
                                                    <colgroup>
                                                        <col style="width: 45%;" />
                                                        <col style="width: 45%;" />
                                                        <col style="width: 10%;" />
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th class="text-center">옵션</th>
                                                            <th class="text-center" colspan="2">옵션값</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="option-tbody">
                                                        <c:forEach var="row" items="${productOption }" varStatus="stat">
                                                            <tr>
                                                                <c:if test="${stat.first }">
                                                                    <td rowspan="5">
                                                                        <input type="text" name="PRD_MST_OPT_NM" id="PRD_MST_OPT_NM" class="text xlarge" value="<c:out value="${info.PRD_MST_OPT_NM }"/>" maxlength="20" disabled="disabled"/>
                                                                    </td>
                                                                </c:if>
                                                                <td><input type="text" name="PRD_OPT_DTL" id="PRD_OPT_DTL" data-prd_opt_idx="${row.PRD_OPT_IDX }" class="text xlarge" value="<c:out value="${row.PRD_OPT_DTL }"/>" maxlength="20"/></td>
                                                                <td>
                                                                    <c:if test="${stat.first }">
                                                                        <a href="javascript:;" class="button xsmall add-product-option"><span>+</span></a>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                 </table>
                                                 <div><a href="javascript:;" id="option_save" class="button large primary" style="width:100%;"><span>옵션저장</span></a></div>
                                             </c:if>
                                        </span>
                                    </td>
                                </tr>
                                <%--  래디플래너 전용 상품 추가--%>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>레디플래너 전용 상품 설정</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <div class="wrap text-left">
                                            <label for="PRD_MST_PRP_YN0">
                                                <input type="radio" name="PRD_MST_PRP_YN" id="PRD_MST_PRP_YN0" class="radio" value="Y" <c:if test="${info.PRD_MST_PRP_YN eq 'Y' }">checked="checked"</c:if> />
                                                <span>사용함</span>
                                            </label>
                                            <label for="PRD_MST_PRP_YN1">
                                                <input type="radio" name="PRD_MST_PRP_YN" id="PRD_MST_PRP_YN1" class="radio" value="N" <c:if test="${info.PRD_MST_PRP_YN eq 'N' }">checked="checked"</c:if> />
                                                <span>사용안함</span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>

                                <tr class="product-prp-area">
                                    <th>
                                        <span>등록 래디플러너</span>
                                    </th>
                                    <td colspan="3">
                                        <div class="wrap text-left">
                                            <a href="javascript:;" class="button small search-prp-list-popup" title="새 창 으로 열립니다.">
                                                <span>등록 관리</span>
                                            </a>
                                        </div>
                                        <table cellspacing="0" class="table-row table-b">
                                            <colgroup>
                                                <col style="width: auto;" />
                                            </colgroup>
                                            <tbody>
                                            <tr class="tr-prp">
                                                <input type="hidden" class='input_prp_list' name="PRP_LIST_JSON" value="<c:out value="${prpListJson}"/>" />
                                                <c:if test="${not empty prpList }">
                                                    <td class="text-left ">
                                                        <c:forEach var="prp" items="${prpList }" varStatus="y">
                                                            <c:out value="${prp.RDP_MST_MEM_NM}(${prp.RDP_MST_NO })"/>
                                                            <c:if test="${!y.last}">,</c:if>
                                                        </c:forEach>
                                                    </td>
                                                </c:if>
                                                <c:if test="${empty prpList }">
                                                    <td class="td_no_result text-left"></td>
                                                </c:if>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <%--  래디플래너 전용 상품 추가--%>

                                <tr>
                                        <th>
                                            <label class="label">
                                                <span>등록일</span>
                                            </label>
                                        </th>
                                        <td colspan="3">
                                            <c:out value="${info.PRD_MST_REG_NM }"/>(<c:out value="${info.PRD_MST_REG_ID }"/>) / <ui:formatDate value="${info.PRD_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>승인상태</span>
                                            </label>
                                        </th>
                                        <td colspan="3">
                                            <span><c:out value="${Product.STATE_APPROVAL_NM}" /></span>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>처리자</span>
                                            </label>
                                        </th>
                                        <td colspan="3">
                                            <c:out value="${info.PRD_MST_APV_NM }"/>(<c:out value="${info.PRD_MST_APV_ID }"/>) / <ui:formatDate value="${info.PRD_MST_APV_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                        </td>                                        
                                    </tr>                                    
                            </tbody>
                        </table>
                        
                        <div id="tab" class="tab-list">
                            <ul>
                                <li><a href="javascript:;" class="tab-item active">상품이미지</a></li>
                                <li><a href="javascript:;" class="tab-item">상품상세설명</a></li>
                                <li><a href="javascript:;" class="tab-item">상품정보고시</a></li>
                            </ul>
                        </div>
                        
                        <div class="tab-contents">       
                            <div class="item">
                                <h3 class="title"><span>상품이미지</span><i class="require"><em>필수입력</em></i></h3>
                                <div class="section-form">
                                 <%-- 상품이미지 내용 추가 --%>
                                    <spring:eval var="fileAllows" expression="@file['file.allowed.extensions.image']" />
                                    <spring:eval var="fileMaxSize" expression="@file['file.max.byte.size.image']" />
                                    <div class="edit-product-image">
                                        <div class="default">
                                            <h5 class="title"><span>대표 이미지 ( 750px * 750px )</span></h5>
                                            <div class="grid main-img">
                                                <div class="col thumb">
                                                    <a href="javascript:;">
                                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${productImageInfo[Product.IMG_MAIN].PRD_IMG_URL_PATH }"/>" class="pic" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/img/blank.png'"/>
                                                    </a>
                                                    <div class="section-button action">
                                                        <input type="file" class="product-image-file" name="<c:out value="${Product.IMG_MAIN_NM }"/>" style="display: none;" disabled="disabled"/>
                                                        <a href="javascript:;" class="button small product-image-file-add"><span>파일 찾기</span></a>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <ul class="list list-a">
                                                        <li>비율이 맞지 않는 이미지를 올리면 이미지가 일부 잘릴 수 있습니다.</li>
                                                        <li>등록이미지 : <ui:byteCal bytes="${fileMaxSize }"/> 이하 /
                                                            <c:forTokens var="allow" items="${fileAllows }" delims="\\|" varStatus="allowStat">
                                                                <c:out value="${allow }" />
                                                                <c:if test="${not allowStat.last }">,&nbsp;</c:if>
                                                            </c:forTokens>
                                                        </li>
                                                        <li>새로운 이미지를 등록할 경우 기존 등록된 이미지는 자동 삭제 됩니다.</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="optional">
                                            <h3 class="title">
                                                <span>추가이미지</span>
                                            </h3>
                                            <ul class="list list-a">
                                                <li><strong style="color: red;">등록된 추가 이미지는 상품 상세 페이지 하단에 대표이미지와 함께  나타나는 이미지 입니다.</strong></li>
                                                <li>비율이 맞지 않는 이미지를 올리면 이미지가 일부 잘릴 수 있습니다.</li>
                                                <li>등록이미지 : <ui:byteCal bytes="${fileMaxSize }"/> 이하 /
                                                    <c:forTokens var="allow" items="${fileAllows }" delims="\\|" varStatus="allowStat">
                                                        <c:out value="${allow }" />
                                                        <c:if test="${not allowStat.last }">,&nbsp;</c:if>
                                                    </c:forTokens>
                                                </li>
                                                <li>새로운 이미지를 등록할 경우 기존 등록된 이미지는 자동 삭제 됩니다.</li>
                                            </ul>
                                            <div class="grid img-list">
                                                <c:forEach var="productSubImageNm" items="${Product.IMG_SUB_NMS }" varStatus="i">
                                                    <c:set var="productSubImageKey" value="${Product.IMG_SUB }_${i.index + 1 }"/>
                                                    <div class="col module">
                                                        <a href="javascript:;">
                                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${productImageInfo[productSubImageKey].PRD_IMG_URL_PATH }"/>" class="pic" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/img/blank.png'"/>
                                                        </a>
                                                        <div class="action">
                                                            <small class="desc">( 750px * 750px )</small>
                                                        </div>
                                                        <div class="section-button action">
                                                            <input type="file" class="product-image-file" name="<c:out value="${productSubImageNm }"/>" style="display: none;" disabled="disabled"/>
                                                            <a href="javascript:;" class="button small product-image-file-add"><span>파일 찾기</span></a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <%-- 2020-7-16 요건 수정
                                        <div class="optional">
                                            <h3 class="title">
                                                <span>레디플레너 캠페인 문구<i class="require"><em>필수입력</em></i></span>
                                            </h3>
                                            <ul class="list list-a">
                                                <li><strong style="color: red;">레디플래너 캠페인 HTML 코드 생성시 노출될 캠페인 문구를 입력해 주세요. (최대 500자)</strong></li>
                                            </ul>
                                            <div class="grid img-list">
                                                <textarea name="PRD_MST_RDP_TXT" id="PRD_MST_RDP_TXT" class="textarea xlarge" style="height: 100px; width: 100%;" maxlength="500"><c:out value="${info.PRD_MST_RDP_TXT }"/></textarea>
                                            </div>
                                        </div>
                                        --%>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="section-form">
                                    <h3 class="title">
                                        <span>유의사항 및 배송관련 정보</span>
                                    </h3>
                                    <table cellspacing="0" class="table-row table-a">
                                        <colgroup>
                                            <col style="width: 15%;" />
                                            <col style="width: 75%;" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>유의사항</span>
                                                </th>
                                                <td>
                                                    <textarea class="textarea" name="PRD_MST_NTC_DSC" id="PRD_MST_NTC_DSC" editor="true"><c:out value="${info.PRD_MST_NTC_DSC }"/></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>배송관련 정보</span>
                                                </th>
                                                <td>
                                                    <textarea class="textarea" name="PRD_MST_DLV_DSC" id="PRD_MST_DLV_DSC" editor="true"><c:out value="${info.PRD_MST_DLV_DSC }"/></textarea>
                                                </td>
                                            </tr>                                                
                                        </tbody>
                                    </table>
                                    <h3 class="title">
                                        <span>유튜브 관련 동영상</span>
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
                                                        <span><c:out value="${device.value }"/></span>
                                                    </th>
                                                    <td>
                                                        <textarea class="textarea" name="<c:out value="${device.key eq Const.PC ? 'PRD_MST_PC_YTB' : 'PRD_MST_MB_YTB' }"/>" id="<c:out value="${device.key eq Const.PC ? 'PRD_MST_PC_YTB' : 'PRD_MST_MB_YTB' }"/>"  editor="true">
                                                            <c:out value="${device.key eq Const.PC ? info.PRD_MST_PC_YTB : info.PRD_MST_MB_YTB }"/>
                                                        </textarea>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <h3 class="title">
                                        <span>상세설명</span>
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
                                                        <span><c:out value="${device.value }"/>상세<i class="require"><em>필수입력</em></i></span><br>
                                                        <span><c:out value="${device.key eq Const.PC ? '(가로 930px 기준)' : '(가로 750px 기준)' }"/></span>
                                                    </th>
                                                    <td>
                                                        <textarea class="textarea" name="<c:out value="${device.key eq Const.PC ? 'PRD_MST_PC_DTL_DSC' : 'PRD_MST_MB_DTL_DSC' }"/>" id="<c:out value="${device.key eq Const.PC ? 'PRD_MST_PC_DTL_DSC' : 'PRD_MST_MB_DTL_DSC' }"/>" editor="true">
                                                            <c:out value="${device.key eq Const.PC ? info.PRD_MST_PC_DTL_DSC : info.PRD_MST_MB_DTL_DSC }"/>
                                                        </textarea>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="item">
                                <h3 class="title"><span>상품정보고시</span></h3>
                                <div class="section-form">
                                    <%-- 상품 정보고시 내용 추가 --%>
                                    <table cellspacing="0" class="table-row table-a">
                                        <colgroup> 
                                            <col style="width: 25%;" />
                                            <col style="width: auto;" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th><span>상품 정보 고시 품목<i class="require"><em>필수입력</em></i></span></th>
                                                <td class="left">
                                                    <select class="select" name="PRD_MST_NFI_IDX" id="PRD_MST_NFI_IDX">
                                                        <option value="">==선택==</option>
                                                        <c:choose>
                                                            <c:when test="${not empty productNfiList}">
                                                                <c:forEach var="productNfiList" items="${productNfiList }" varStatus="status">
                                                                    <option value="<c:out value="${productNfiList.PRD_NFI_IDX }"/>"<c:if test="${info.PRD_MST_NFI_IDX eq productNfiList.PRD_NFI_IDX }">selected="selected"</c:if>>
                                                                        <c:out value="${productNfiList.PRD_NFI_NM }" />
                                                                    </option>
                                                                </c:forEach>
                                                            </c:when>
                                                        </c:choose>
                                                    </select>
                                                    <label for="detailReferenceToggle"><input type="checkbox" id="detailReferenceToggle" class="checkbox"/>상세설명 참조 일괄입력</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <tbody id="createproductNotificationInfoTable">
                                                    <c:forEach var="productNfiList" items="${productNfiNmList }" varStatus="i">
                                                    <tr>
                                                        <th><span>${productNfiList.PRD_NFI_INFO}</span></th>
                                                        <td class="left">
                                                            <c:set var="PRD_MST_NFI_INF" value="PRD_MST_NFI_INF${i.index + 1 }"/>
                                                            <input type="text" class="text xlarge required" name="<c:out value="${PRD_MST_NFI_INF}"/>" id="<c:out value="${info[PRD_MST_NFI_INF]}"/>" value="<c:out value="${info[PRD_MST_NFI_INF]}"/>" maxlength ="150"/>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </tr>                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
    <ui:editor objId="#PRD_MST_NTC_DSC" num="1" jsLoadYn="Y"/>
    <ui:editor objId="#PRD_MST_DLV_DSC" num="2" jsLoadYn="N"/>
    <ui:editor objId="#PRD_MST_PC_YTB" num="3" jsLoadYn="N"/>
    <ui:editor objId="#PRD_MST_MB_YTB" num="4" jsLoadYn="N"/>
    <ui:editor objId="#PRD_MST_PC_DTL_DSC" num="5" jsLoadYn="N"/>
    <ui:editor objId="#PRD_MST_MB_DTL_DSC" num="6" jsLoadYn="N"/>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
    <script id="productOptionItemTemplate" type="text/x-jquery-tmpl">
        <tr>
            <td><input type="text" name="PRD_OPT_DTL" id="PRD_OPT_DTL" class="text xlarge" value="" maxlength="20" /></td>
            <td>
                <a href="javascript:;" class="button xsmall warning remove-product-option"><span>-</span></a>
            </td>
        </tr>
    </script>
    <script id="productNotificationInfoTemplate" type="text/x-jquery-tmpl">
    <tr>
        <th><span>\${PRD_NFI_INFO}</span></th>
        <td class="left">
        <input type="text" class="text xlarge required" name="PRD_MST_NFI_INF\${PRD_NFI_IDX}" id="PRD_MST_NFI_INF\${PRD_NFI_IDX}" value="\${PRD_MST_NFI_INF}" maxlength ="150"/>
        </td>
    </tr>
    </script>    
    
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm"),
                $tab = $wrapper.find("#tab"),
                $tabItem = $wrapper.find(".tab-contents .item");
            
            var $productOptionArea = $frm.find(".product-option-area"),
            $productOptionItemTemplate = $("#productOptionItemTemplate");
            
            var $createproductNotificationInfoTable = $frm.find("#createproductNotificationInfoTable"),
                $productNotificationInfoTemplate = $("#productNotificationInfoTemplate"),
                $detailReferenceToggle = $frm.find("#detailReferenceToggle");
            <%-- 래디플래너 전용 상품 추가 --%>
            var $productPRPArea = $frm.find(".product-prp-area");
            <%-- 래디플래너 전용 상품 추가 --%>

            <%-- 옵션 추가 a태그 클릭 이벤트 --%>
            $frm.on("click", ".add-product-option", function () {
                var $tbody = $productOptionArea.find(".option-tbody");
                if ($tbody.children("tr").length < 5) {
                    $productOptionItemTemplate.tmpl({"OPTION_FIRST_YN" : "N"}).appendTo($tbody);
                }
            });
            <%-- 옵션 삭제 a태그 클릭 이벤트 --%>
            $frm.on("click", ".remove-product-option", function () {
                $(this).closest("tr").remove();
            });
            
            <%-- 옵션 수정  --%>
            $wrapper.on("click", "#option_save", function() {
                var option_validate = true;
                var array = new Array();
                $frm.find("input[name='PRD_OPT_DTL']").each(function(){
                    if($.trim($(this).val()) == "") {
                        option_validate = false;
                    }else {
                        var param = new Object();
                        param.PRD_OPT_IDX = $(this).data("prd_opt_idx") !== undefined ? $(this).data("prd_opt_idx") : "";
                        param.PRD_OPT_DTL = $(this).val();
                        param.PRD_MST_CD = "<c:out value="${info.PRD_MST_CD }"/>";
                        array.push(param);
                    }
                });
                if(option_validate == true) {
                    if (confirm("저장 하시겠습니까?")) {
                        $.postSyncJsonAjax($.action.ajax("OptionModify"), {"PARAMS" : JSON.stringify(array)}, function(response){
                            if(response.result == "SUCCESS") {
                                alert("수정완료");
                            }else {
                                alert("에러가발생하였습니다. 다시 시도해주세요.");
                            }
                            location.reload();
                        });
                    }
                }else {
                    alert("빈값이 존재합니다.");
                }
            });

            $tab.on("click", ".tab-item", function () {
                var $this = $(this),
                    $li = $this.closest("li");
                $li.siblings("li").find("a").removeClass("active");
                $this.addClass("active");
                tabContentsToggle($li.index());
            });
            <%-- 탭 토글 --%>
            function tabContentsToggle (index) {
                $tabItem.hide();
                $tabItem.eq(index).show();
                var $textarea = $tabItem.eq(index).find("textarea[editor='true']");
                if ($textarea.length > 0) {
                    $textarea.each(function (i) {
                        TagUtil.showSmartEditor($(this).attr("id"), 200, (i + 1));
                    });
                }
            }
            <%-- 래디플래너 전용 상품 추가 --%>
            <%-- 래디플래너 전용 상품 변경 이벤트 --%>
            if( $("input[name='PRD_MST_PRP_YN']").attr('checked') == "checked" ) {
                $productPRPArea.css('display', 'table-row');
            }
            $frm.on("change", "input[name='PRD_MST_PRP_YN']", function () {
                var $this = $(this);
                if ($this.val() == "N") {
                    $productPRPArea.css('display', 'none');
                } else {
                    $productPRPArea.css('display', 'table-row');
                }
            });
            <%-- 래디플래너 검색공통 팝업 --%>
            $productPRPArea.on("click", ".search-prp-list-popup", function() {
                var $this = $(this),
                    $tbody = $this.closest("td").find("tbody");
                $.common.popup.planner.search(function (data) {
                    let prpList = "";
                    $.each(data, function(i, row) {
                        prpList += (i>0 ? ", " :"") + row.RDP_MST_MEM_NM + "(" + row.RDP_MST_NO + ")";
                    });
                    $tbody.find(".tr-prp td").text(prpList);
                    if( prpList === "") {
                        $tbody.find(".tr-prp td").addClass("td_no_result");
                        $tbody.find(".tr-prp .input_prp_list").val("");
                        TagUtil.setEmptyColspan();
                    } else {
                        $tbody.find(".tr-prp .td_no_result").toggleClass("td_no_result");
                        $tbody.find(".tr-prp .input_prp_list").val(StringUtil.utoa(JSON.stringify(data)));
                    }
                }, $tbody.find(".input_prp_list").val()  );
            });
            <%-- 래디플래너 전용 상품 추가 --%>

            tabContentsToggle(0);
            
            $frm.validate({
                ignore : [],
                rules : {
                    PRD_MST_SPL_NM : {
                        required : true
                    },
                    PRD_MST_MD : {
                        required : true
                    },
                    /* 2020-7-16 요건 수정
                    PRD_MST_SPL_PRC : {
                        required : true
                    },
                    PRD_MST_RDP_TXT : {
                        required : true
                    },
                    */
                    PRD_MST_PC_DTL_DSC : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    },
                    PRD_MST_MB_DTL_DSC : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    },
                    PRD_MST_NFI_IDX : {
                        required : true
                    },
                    "<c:out value="${Product.IMG_MAIN_NM}"/>" : {
                        required : true
                    }
                },
                messages : {
                    "<c:out value="${Product.IMG_MAIN_NM}"/>" : {
                        required : "[대표 이미지]은(는) 필수입력 사항입니다."
                    },
                    PRD_MST_RDP_TXT : {
                        required : "[레디플래너 컴페인 문구]은(는) 필수입력 사항입니다."
                    }
                }
            });
            <%-- 목록 버튼 클릭 상품  --%>
            $wrapper.on("click", "#goList", function() {
                if (confirm("변경사항이 저장되지 않을 수 있습니다.\n이동하시겠습니까?")) {
                    $searchForm.postSubmit($.action.list());
                }
            });
            <%-- 파일찾기 버튼 클릭 이벤트 --%>
            $frm.on("click", ".product-image-file-add", function () {
                $(this).siblings(".product-image-file").prop("disabled", false).trigger("click");
            });
            <%-- 파일변경 이벤트 --%>
            $frm.on("change", ".product-image-file", function () {
                var $this = $(this);
                if ($this.val() != "") {
                    if (validFileExt($this.val()) && validFileSize(this)) {
                        readFile(this);
                    } else {
                        $this.val("");
                        imageClear($this);
                    }
                } else {
                    imageClear($this);
                }
            });
            <%-- 첨부파일 확장자 확인 --%>
            function validFileExt(value) {
                var valid = false,
                    extName = value.substring(value.lastIndexOf(".") + 1).toLowerCase(),
                    allows = "<c:out value="${fileAllows }"/>".split("|");
                for (var i = 0; i < allows.length; i++) {
                    if (extName == $.trim(allows[i])) {
                        valid = true;
                        break;
                    }
                }
                if (!valid) {
                    alert("업로드 불가능한 파일 입니다.\n*업로드 가능 파일[" + allows.join(", ") + "]");
                }
                return valid;
            }
            <%-- 첨부파일 용량 확인 --%> 
            function validFileSize(object) {
                var valid = false,
                    sizeinbytes = 0;
                if (window.ActiveXObject) {
                    sizeinbytes = new ActiveXObject("Scripting.FileSystemObject").getFile(object.value).size;
                } else { 
                    sizeinbytes = object.files[0].size;
                }
                var i = 0,
                    fSExt = ["Bytes", "KB", "MB", "GB"],
                    maxSize = StringUtil.getInt("<c:out value="${fileMaxSize}"/>");
                while (maxSize > 900) {
                    maxSize /= 1024;
                    i++;
                }
                if (sizeinbytes > StringUtil.getInt("<c:out value="${fileMaxSize}"/>")) {
                    alert("첨부파일은 " + ((Math.round(maxSize * 100) / 100) + fSExt[i]) + " 이하로 등록가능합니다.");
                } else {
                    valid = true;
                }
                return valid;
            }
            <%-- 이미지 미리보기 --%>
            function readFile(object) {
                if (object.files && object.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var $img = $(object).closest("div.col").find("img.pic");
                        $img.attr("src", e.target.result);
                        $img.show();
                    }
                    reader.readAsDataURL(object.files[0]);
                }
            }
            <%-- 이미지 초기화 --%>
            function imageClear($object) {
                var $img = $object.closest("div.col").find("img.pic");
                $img.attr("src", "<spring:eval expression="@resource['img.ssl.domain']"/>/resources/img/blank.png");
            }        
            
            <%-- 등록 상품  --%>
            $wrapper.on("click", "#save", function() {
                oEditors1.getById["PRD_MST_NTC_DSC"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditors2.getById["PRD_MST_DLV_DSC"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditors3.getById["PRD_MST_PC_YTB"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditors4.getById["PRD_MST_MB_YTB"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditors5.getById["PRD_MST_PC_DTL_DSC"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditors6.getById["PRD_MST_MB_DTL_DSC"].exec("UPDATE_CONTENTS_FIELD", []);
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
            <%-- 품목정보 등록/수정 폼 --%>
            $frm.on("change", "#PRD_MST_NFI_IDX", function (){
                var prdMstNfiIdx = "<c:out value="${productInfo.PRD_MST_NFI_IDX}" />";
                var prdMstnfiInf = "<c:out value="${PRD_MST_NFI_INF}" />";
                prdMstnfiInf = prdMstnfiInf.split("|");
                $createproductNotificationInfoTable.children("tr").remove();
                $detailReferenceToggle.attr("checked", false);
                if($(this).val() == ""){
                    $createproductNotificationInfoTable.hide();
                    $detailReferenceToggle.attr("disabled", true);
                    return;
                }else{
                    $createproductNotificationInfoTable.show();
                    $detailReferenceToggle.attr("disabled", false);
                }
                
                $.postSyncJsonAjax($.action.ajax("NotificationInfo"), {"PRD_NFI_IDX" : $(this).val()}, function (data) {
                    if (data.prdNfiList != null) {
                        var arrayObj = new Array();
                        $.each(data.prdNfiList, function (index,item) {
                            var obj = new Object();
                            obj.PRD_NFI_INFO = item.PRD_NFI_INFO;
                            obj.PRD_NFI_IDX = index + 1;
                            arrayObj.push(obj);
                        });
                        $createproductNotificationInfoTable.html($productNotificationInfoTemplate.tmpl( arrayObj ));
                    } else {
                        alert("조회된 데이터가 없습니다.");
                    }
                });
            });
            <%-- 품목정보 등록/수정 폼 --%>
            $frm.on("change", "input[name='PRD_MST_APV_STATE']", function (){
                if ($(this).val() == "<c:out value="${Product.STATE_APPROVAL}" />") {
                    $(".rfs-rsn-tr").hide();
                    $(".rfs-rsn-tr").find("textarea[name='PRD_MST_RFS_RSN']").val("");
                } else {
                    $(".rfs-rsn-tr").show();
                }
                
            });
            <%-- 상품상세 참조 체크박스 변경 이벤트 --%>
            $frm.on("change", "#detailReferenceToggle", function () {
                var $tragets = $createproductNotificationInfoTable.find("input[type='text']");
                if ($tragets.length) {
                    if ($(this).is(":checked")) {
                        $tragets.val("상세설명 참조");
                    } else {
                        $tragets.val("");
                    }
                }
            });
            
        });
    </script>
</body>
</html>