<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body>
    <%-- PG 할부개월수 --%>
    <spring:eval var="pgCardQuotaBase" expression="@pg['pg.card.quota.base']"/>
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
                        <span>결합완료 상품 등록</span>
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
                        <input type="hidden" name="ZERO_YN" id="ZERO_YN" value="N"/>
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchSupplyNm" value="<c:out value="${commandMap.searchSupplyNm }"/>" />
                        <input type="hidden" name="searchModelNm" value="<c:out value="${commandMap.searchModelNm }"/>" />
                        <input type="hidden" name="searchApvState" value="<c:out value="${commandMap.searchApvState }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                        <input type="hidden" name="searchOrderBy" value="<c:out value="${Product.REG_SORT}" />" />                    
                        <h3 class="title">
                            <span>기간계 상품정보</span>
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
                                        <span>상품코드<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                                                                상품코드 : <input type="text" name="PROD_CD" id="PROD_CD" class="text" value="" readonly/>&nbsp;
                                                                                모델분류코드 : <input type="text" name="PROD_KIND" id="PROD_KIND" class="text" value="" readonly/>&nbsp;
                                                                                모델코드 : <input type="text" name="MODEL_CD" id="MODEL_CD" class="text" value="" readonly/>
                                        <a href="javascript:;" id="search-dlcc" class="button button-b small">
                                            <span>검색</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>총상품금액</span>
                                        </label>
                                    </th>
                                    <td>
                                        <span id="prodAmt"></span>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>모델분류</span>
                                        </label>
                                    </th>
                                    <td>
                                        <span id="modelClNm"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>월 납입금</span>
                                        </label>
                                    </th>
                                    <td>
                                        <span id="monPayAmt"></span>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>납입회차</span>
                                        </label>
                                    </th>
                                    <td>
                                        <span id="exprNo"></span>
                                    </td>
                                </tr>
                                <c:if test="${commandMap.VDR_MST_NM ne null}">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>총 지원금</span>
                                        </label>
                                    </th>
                                    <td>
                                        <span id="relAmt"></span>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>지원회차</span>
                                        </label>
                                    </th>
                                    <td>
                                        <span id="relCnt"></span>
                                    </td>
                                </tr>
                                </c:if>
                            </tbody>
                        </table>
                        
                        <p>
                        <label for="PRD_MST_IRG_YN">
                            <input type="checkbox" name="PRD_MST_IRG_YN" id="PRD_MST_IRG_YN" class="checkbox" value="Y"/>
                            <span>비 정기형 회차별 납입금액을 전시합니다.</span>
                        </label>
                        </p>
                        <table cellspacing="0" class="table-col table-b">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 50%;" />
                                <col style="width: 50%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>납입회차</th>
                                    <th>납입금액</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="text" name="PRD_MST_PAY_CNT1" id="PRD_MST_PAY_CNT1" class="text xlarge" value="" maxlength="40"/>
                                    </td>
                                    <td>
                                        <input type="text" name="PRD_MST_PAY_AMT1" id="PRD_MST_PAY_AMT1" class="text xlarge onlyNumber" value="" maxlength="10"/>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="PRD_MST_PAY_CNT2" id="PRD_MST_PAY_CNT2" class="text xlarge" value="" maxlength="40"/>
                                    </td>
                                    <td>
                                        <input type="text" name="PRD_MST_PAY_AMT2" id="PRD_MST_PAY_AMT2" class="text xlarge onlyNumber" value="" maxlength="10"/>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="PRD_MST_PAY_CNT3" id="PRD_MST_PAY_CNT3" class="text xlarge" value="" maxlength="40"/>
                                    </td>
                                    <td>
                                        <input type="text" name="PRD_MST_PAY_AMT3" id="PRD_MST_PAY_AMT3" class="text xlarge onlyNumber" value="" maxlength="10"/>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
                        
                        <h3 class="title">
                            <span>B2B 수수료 매핑</span>
                        </h3>
                        <table cellspacing="0" class="table-row table-a">
                            <colgroup>
                                <col style="width: 16%;" />
                                <col style="width: 16%;" />
                                <col style="width: 16%" />
                                <col style="width: 16%;" />
                                <col style="width: 16%" />
                                <col style="width: 16%;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>일반수수료<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="PRD_MST_CMS_CD" id="PRD_MST_CMS_CD" class="text onlyNumber" value="" readonly/>
                                        <a href="javascript:;" class="button button-b small search-b2b-company" data-type="basic">
                                            <span>검색</span>
                                        </a>                                        
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>법인 레디플래너 수수료<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="PRC_RDP_CMS_CD" id="PRC_RDP_CMS_CD" class="text onlyNumber" value="" readonly/>
                                        <a href="javascript:;" class="button button-b small search-b2b-company" data-type="planner">
                                            <span>검색</span>
                                        </a>  
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>개인 레디플래너 수수료<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" name="PRC_RDP_P_CMS_CD" id="PRC_RDP_P_CMS_CD" class="text onlyNumber" value="" readonly/>
                                        <a href="javascript:;" class="button button-b small search-b2b-company" data-type="plannerB2P">
                                            <span>검색</span>
                                        </a>
                                    </td>

                                </tr>
                            </tbody>
                        </table> 
                        
                                               
                        <h3 class="title">
                            <span>지원혜택정보</span>
                        </h3>
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
                                            <c:when test="${isSuper || row.VDR_MST_NM eq null}">
                                                <c:if test="${row.VDR_MST_NM eq null }">
                                                    <c:out value="${Product.VDR_MST_DAEMYUNG_NM }" />
                                                </c:if>
                                                <c:if test="${row.VDR_MST_NM ne null }">
                                                    <c:out value="${row.VDR_MST_NM }" />
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                    <c:out value="${row.VDR_MST_NM }" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <th>
                                        <span>노출할 제휴업체명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="VDR_MST_NM" id="VDR_MST_NM" class="text xlarge" value="<c:out value="${info.VDR_MST_NM_DIS }"/>" maxlength="50" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>지원혜택</span>
                                        </label>
                                    </th>
                                    <td>
                                        <c:out value="${info.PRD_MST_SPL_NM }"/>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>모델명</span>
                                        </label>
                                    </th>
                                    <td>
                                        <c:out value="${info.PRD_MST_MD }"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>공급가</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                         <fmt:formatNumber value="${info.PRD_MST_SPL_PRC }" type="number" />
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
                                                <input type="radio" name=id= "" class="radio" value="" checked="checked" />
                                                <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
                                                    <span>사용함</span>
                                                </c:if>
                                                <c:if test="${info.PRD_MST_OPT_YN eq 'N' }">
                                                    <span>사용안함</span>
                                                </c:if>
                                            </label>
                                        </div>
                                        <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
                                            <table cellspacing="0" class="table-row table-b">
                                                <colgroup>
                                                    <col style="width: auto;" />
                                                    <col style="width: auto;" />
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">옵션</th>
                                                        <th class="text-center">옵션값</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="row" items="${productOption }" varStatus="stat">
                                                        <tr>
                                                            <c:if test="${stat.first }">
                                                                <td rowspan="5">
                                                                    <input type="text" name="PRD_MST_OPT_NM" id="PRD_MST_OPT_NM" class="text xlarge" value="<c:out value="${info.PRD_MST_OPT_NM }"/>" maxlength="20" disabled="disabled"/>
                                                                </td>
                                                            </c:if>
                                                            <td><input type="text" name="PRD_OPT_DTL" id="PRD_OPT_DTL" class="text xlarge" value="<c:out value="${row.PRD_OPT_DTL }"/>" maxlength="20" disabled="disabled" /></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                             </table>
                                         </c:if>
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
                            </tbody>
                        </table>  
                        
                        <h3 class="title">
                            <span>온라인 전시 정보</span>
                        </h3>
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
                                        <label class="label">
                                            <span>온라인 상품코드</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <strong style="color: red;">시스템 자동생성</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>온라인 상품명<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" name="PRD_MST_NM" id="PRD_MST_NM" class="text xlarge" value="" maxlength="300"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>셀링문구</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" name="PRD_MST_SEL_TXT" id="PRD_MST_SEL_TXT" class="text xlarge" value="" maxlength="300"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>전시기간<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="PRD_MST_ST_DT" name="PRD_MST_ST_DT" value="" data-target-end="#PRD_MST_ED_DT" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="PRD_MST_ED_DT" name="PRD_MST_ED_DT" value="" data-target-start="#PRD_MST_ST_DT" />
                                        <a href="javascript:DateUtil.fnDateSet('PRD_MST_ST_DT', 'PRD_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall">
                                            <span>오늘</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PRD_MST_ST_DT', 'PRD_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall">
                                            <span>일주일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PRD_MST_ST_DT', 'PRD_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall">
                                            <span>15일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PRD_MST_ST_DT', 'PRD_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall">
                                            <span>한달</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('PRD_MST_ST_DT', 'PRD_MST_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall">
                                            <span>두달</span>
                                        </a>                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>검색키워드<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <textarea name="PRD_MST_KWD" id="PRD_MST_KWD" class="textarea xlarge" style="height: 100px; width: 100%;" 
                                        placeholder="고객이 쉽게 상품을 검색하기 위해 상품 관련 검색어를 입력합니다.
각 검색단어는 쉼표(,) 로 구분하며, 공백도 검색어에 포함됩니다.(특수문자 제외)" maxlength="2000"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>전시카테고리<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <jsp:include page="/WEB-INF/jsp/common/template/category.jsp">
                                            <jsp:param name="listName" value="productCategoryList"/>
                                            <jsp:param name="paramName" value="commandMap"/>
                                            <jsp:param name="maxLevel" value="2"/>
                                            <jsp:param name="name" value="PRD_CTG_IDX"/>
                                        </jsp:include>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>노출상태</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <c:forEach var="row" items="${Product.DISPLAYS }" varStatus="stat">
                                            <label for="PRD_MST_DPL_YN<c:out value="${stat.index }"/>">
                                                <input type="radio" name="PRD_MST_DPL_YN" id="PRD_MST_DPL_YN<c:out value="${stat.index }"/>" class="radio" value="<c:out value="${row.key }"/>" <c:if test="${stat.first }">checked="checked"</c:if>/>
                                                <span><c:out value="${row.value }"/></span>
                                            </label>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상품Q&A노출</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <label for="PRD_MST_QNA_YN0">
                                            <input type="radio" name="PRD_MST_QNA_YN" id="PRD_MST_QNA_YN0" class="radio" value="Y" checked="checked"/>
                                            <span>사용함</span>
                                        </label>
                                        <label for="PRD_MST_QNA_YN1">
                                            <input type="radio" name="PRD_MST_QNA_YN" id="PRD_MST_QNA_YN1" class="radio" value="N"/>
                                            <span>사용안함</span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상품후기노출</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <label for="PRD_MST_REV_YN0">
                                            <input type="radio" name="PRD_MST_REV_YN" id="PRD_MST_REV_YN0" class="radio" value="Y" checked="checked"/>
                                            <span>사용함</span>
                                        </label>
                                        <label for="PRD_MST_REV_YN1">
                                            <input type="radio" name="PRD_MST_REV_YN" id="PRD_MST_REV_YN1" class="radio" value="N"/>
                                            <span>사용안함</span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상품유형<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="row" items="${codeList }" varStatus="i">
                                                <input type="radio" name="PRD_MST_TYPE" id="PRD_MST_TYPE<c:out value="${i.index}"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${i.index eq '0' }">checked="checked"</c:if>/>
                                                <label for="PRD_MST_TYPE<c:out value="${i.index}"/>"><c:out value="${row.CMN_COM_NM }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>채권형태</span>
                                        </label>
                                    </th>
                                    <td colspan="3" class="add-info">
                                        <label for="PRD_MST_BND_YN0">
                                            <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN0" class="radio" value="Y" checked="checked"/>
                                            <span>채권</span>
                                        </label>
                                        <label for="PRD_MST_BND_YN1">
                                            <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN1" class="radio" value="N" />
                                            <span>비채권</span>
                                        </label>
                                            <br><br>
                                            <input type="text" name="PRD_MST_BND_ID" id="PRD_MST_BND_ID" class="text" value="" maxlength="40"/> 
                                            <strong style="color: red;">※ 비채권 상품 가입 시 받아야 하는 추가 정보가 있다면 입력해 주세요</strong>
                                    </td>
                                </tr> 
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>가입구좌 수량</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <select class="select" name="PRD_MST_JOIN_LMT" id="PRD_MST_JOIN_LMT">
                                            <c:forEach var="i" begin ="1" end = "4">
                                                <option value="${i}">${i}</option>
                                            </c:forEach>
                                        </select> 
                                        <strong style="color: red;">※ 동일상품에 한해 최대 가입가능한 구좌의 수량을 설정합니다. (1구좌 기본/최대 4구좌)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>주계약<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <c:if test="${not empty serviceList }">
                                            <c:forEach var="row" items="${serviceList }" varStatus="i">
                                                <input type="checkbox" name="PRD_MST_MAIN_CTRT" id="PRD_MST_MAIN_CTRT<c:out value="${i.index}"/>" value="<c:out value="${row.CMN_COM_IDX }"/>" />
                                                <label for="PRD_MST_MAIN_CTRT<c:out value="${i.index}"/>"><c:out value="${row.CMN_COM_NM }"/></label>
                                            </c:forEach>
                                        </c:if>
                                        <br>
                                        <strong style="color: red;">※ 상품 가입시 필수로 선택해야 하는 라이프 서비스를 선택해 주세요 (가입시에는 택1)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상품유형별 노출항목<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td class="product-type-item" colspan="3">
                                        <span>월지원 </span>
                                        <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text" placeholder="Ex) 월 3만원 지원" value="" maxlength="40" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>상품상세노출서비스<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <c:if test="${not empty serviceList }">
                                            <c:forEach var="row" items="${serviceList }" varStatus="i">
                                                <input type="checkbox" name="PRD_MST_DSP_SVC" id="PRD_MST_DSP_SVC<c:out value="${i.index}"/>" value="<c:out value="${row.CMN_COM_IDX }"/>" />
                                                <label for="PRD_MST_DSP_SVC<c:out value="${i.index}"/>"><c:out value="${row.CMN_COM_NM }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2">
                                        <label class="label">
                                            <span>레디플래너 수수료<!-- <i class="require"><em>필수입력</em></i> --></span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <label class="label">
                                            <span>법인</span>
                                        </label>
                                        &nbsp;&nbsp;
                                        &nbsp;&nbsp;
                                        <span>총수수료금액 :</span>
                                        <input type="text" name="PRC_RDP_CMS" id="PRC_RDP_CMS" class="text onlyNumber" value="" maxlength="10"/>
                                        &nbsp;&nbsp;
                                        <span>분할금액 :</span>
                                        <input type="text" name="PRC_RDP_DVD_PAY" id="PRC_RDP_DVD_PAY" class="text onlyNumber" value="" maxlength="10"/>
                                        &nbsp;&nbsp;
                                        <span>분할회차 :</span>
                                        <input type="text" name="PRC_RDP_DVD_CNT" id="PRC_RDP_DVD_CNT" class="text onlyNumber" value="1" readonly="readonly"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <label class="label">
                                            <span>개인</span>
                                        </label>
                                        &nbsp;&nbsp;                                        &nbsp;&nbsp;
                                        <span>총수수료금액 :</span>
                                        <input type="text" name="PRC_RDP_P_CMS" id="PRC_RDP_P_CMS" class="text onlyNumber" value="" type="number" />
                                        &nbsp;&nbsp;
                                        <span>분할금액 :</span>
                                        <input type="text" name="PRC_RDP_P_DVD_PAY" id="PRC_RDP_P_DVD_PAY" class="text onlyNumber" value="" type="number" />
                                        &nbsp;&nbsp;
                                        <span>분할회차 :</span>
                                        <input type="text" name="PRC_RDP_P_DVD_CNT" id="PRC_RDP_P_DVD_CNT" class="text onlyNumber" value="" type="number" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        
                        <h3 class="title">
                            <span>오디오 파일</span>
                        </h3>
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
                                        <label class="label">
                                            <span>파일 업로드</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <spring:eval var="fileSize" expression="@file['file.max.byte.size.video']"/>
                                        <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                            <jsp:param name="fileListName" value="fileList"/>
                                            <jsp:param name="fileName" value="FILE"/>
                                            <jsp:param name="order" value="0"/>
                                            <jsp:param name="isMulti" value="false"/>
                                            <jsp:param name="maxCount" value="1"/>
                                            <jsp:param name="allow" value="video"/>
                                            <jsp:param name="size" value="${fileSize }"/>
                                        </jsp:include>                                  
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
                        
                        <div id="relation-product-area">
                            <h3 class="title">
                                <span>연관상품</span>
                            </h3>
                            <table cellspacing="0" class="table-row table-a">
                                <colgroup>
                                    <col style="width: 15%;" />
                                    <col style="width: 75%;" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>
                                            <span>상품상세 하단 <br>연관 상품 노출<i class="require"><em>필수입력</em></i></span>
                                        </th>
                                        <td>
                                            <label for="PRD_MST_RLT_YN0">
                                                <input type="radio" name="PRD_MST_RLT_YN" id="PRD_MST_RLT_YN0" class="radio" value="N" checked="checked" />
                                                <span>노출안함</span>
                                            </label>
                                            <label for="PRD_MST_RLT_YN1">
                                                <input type="radio" name="PRD_MST_RLT_YN" id="PRD_MST_RLT_YN1" class="radio" value="Y" />
                                                <span>노출함</span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <span>전시 상품<i class="require"><em>필수입력</em></i></span>
                                        </th>
                                        <td>
                                            <input type="hidden" name="PRODUCT" value="0" />
                                            <div class="wrap text-right">
                                                <a href="javascript:;" class="button small warning relation-product-area">
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
                                </tbody>
                            </table>
                        </div>
                        
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
    <script id="productNotificationInfoTemplate" type="text/x-jquery-tmpl">
    <tr>
        <th><span>\${PRD_NFI_INFO}</span></th>
        <td class="left">
        <input type="text" class="text xlarge required" name="PRD_MST_NFI_INF\${PRD_NFI_IDX}" id="PRD_MST_NFI_INF\${PRD_NFI_IDX}" value="\${PRD_MST_NFI_INF}" maxlength ="150"/>
        </td>
    </tr>
    </script>
    <script id="productRelationTemplate" type="text/x-jquery-tmpl">
        {{if info == ""}}
            <tr>
                <td class="td_no_result text-center"></td>
            </tr>
        {{else}}
            <tr class="tr-\${info.PRD_MST_NO}">
                <td class="text-center">
                    <input type="hidden" name="PRD_RLT_MST_NO" value="\${info.PRD_MST_NO}"/>
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
    <script id="textAddInfoTemplate" type="text/x-jquery-tmpl">
        {{if PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_MONTHLY_SUPPORT}"/>"}}
            <label for="PRD_MST_BND_YN0">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN0" class="radio" value="Y" checked="checked"/>
                <span>채권</span>
            </label>
            <label for="PRD_MST_BND_YN1">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN1" class="radio" value="N" />
                <span>비채권</span>
            </label>
            <br><br>
            <input type="text" name="PRD_MST_BND_ID" id="PRD_MST_BND_ID" class="text" value="" maxlength="40"/> 
            <strong style="color: red;">※ 비채권 상품 가입 시 받아야 하는 추가 정보가 있다면 입력해 주세요</strong>
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE}"/>"}}
            <label for="PRD_MST_BND_YN0">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN0" class="radio" value="Y" checked="checked"/>
                <span>채권</span>
            </label>
            <label for="PRD_MST_BND_YN1">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN1" class="radio" value="N" />
                <span>비채권</span>
            </label>
            <br><br>
            <input type="text" name="PRD_MST_BND_ID" id="PRD_MST_BND_ID" class="text" value="" maxlength="40"/> 
            <strong style="color: red;">※ 비채권 상품 가입 시 받아야 하는 추가 정보가 있다면 입력해 주세요</strong>
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN}"/>"}}
            <label for="PRD_MST_BND_YN0">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN0" class="radio" value="Y" checked="checked"/>
                <span>채권</span>
            </label>
            <label for="PRD_MST_BND_YN1">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN1" class="radio" value="N" />
                <span>비채권</span>
            </label>
            <br><br>
            <input type="text" name="PRD_MST_BND_ID" id="PRD_MST_BND_ID" class="text" value="" maxlength="40"/> 
            <strong style="color: red;">※ 비채권 상품 가입 시 받아야 하는 추가 정보가 있다면 입력해 주세요</strong>
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_RENTAL}"/>"}}
            <label for="PRD_MST_BND_YN0">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN0" class="radio" value="Y" checked="checked"/>
                <span>채권</span>
            </label>
            <label for="PRD_MST_BND_YN1">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN1" class="radio" value="N" />
                <span>비채권</span>
            </label>
            <br><br>
            <input type="text" name="PRD_MST_BND_ID" id="PRD_MST_BND_ID" class="text" value="" maxlength="40"/> 
            <strong style="color: red;">※ 비채권 상품 가입 시 받아야 하는 추가 정보가 있다면 입력해 주세요</strong>
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_DAEMYUG}"/>"}}
            <label for="PRD_MST_BND_YN0">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN0" class="radio" value="Y" checked="checked"/>
                <span>채권</span>
            </label>
            <label for="PRD_MST_BND_YN1">
                <input type="radio" name="PRD_MST_BND_YN" id="PRD_MST_BND_YN1" class="radio" value="N" />
                <span>비채권</span>
            </label>
            <br><br>
            <input type="text" name="PRD_MST_BND_ID" id="PRD_MST_BND_ID" class="text" value="추가정보 필요없음" maxlength="40" placeholder="추가정보 필요없음" readonly="readonly"/> 
            <strong style="color: red;">※ 비채권 상품 가입 시 받아야 하는 추가 정보가 있다면 입력해 주세요</strong>
        {{/if}}
    </script>
    <script id="productTypeTemplate" type="text/x-jquery-tmpl">
        {{if PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_MONTHLY_SUPPORT}"/>"}}
            <span>월지원 </span>
            <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text" placeholder="Ex) 월 3만원 지원" value="" maxlength="40" />
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE}"/>"}}
            <span>즉발 </span>
            <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text" placeholder="Ex) 신혼가전 전액지원" value="" maxlength="40" />
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN}"/>"}}
            <span>할부지원 </span>&nbsp&nbsp
                <input type="checkbox" name="PRD_MST_ISTM_MTH" id="PRD_MST_ISTM_MTH1/>" value="0" />
                <label for="PRD_MST_ISTM_MTH1">일시불</label>
                <c:forEach var="i" begin ="2" end = "12">
                    <input type="checkbox" name="PRD_MST_ISTM_MTH" id="PRD_MST_ISTM_MTH<c:out value="${i}"/>" value="<c:out value="${i}"/>" />
                    <label for="PRD_MST_ISTM_MTH<c:out value="${i}"/>"><c:out value="${i }"/>개월</label>
                </c:forEach>
                <input type="checkbox" name="PRD_MST_ISTM_MTH" id="PRD_MST_ISTM_MTH18/>" value="18" />
                <label for="PRD_MST_ISTM_MTH18">18개월</label>
                <input type="checkbox" name="PRD_MST_ISTM_MTH" id="PRD_MST_ISTM_MTH24/>" value="24" />
                <label for="PRD_MST_ISTM_MTH24">24개월</label>
            <input type="text" name="PRD_MST_ISTM_SPT_PAY" id="PRD_MST_ISTM_SPT_PAY" class="text onlyNumber" placeholder="결제금액(숫자만 입력)" value="" maxlength="11"/>
            <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text" placeholder="Ex) 월 3만원 지원" value="" maxlength="40" />
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_RENTAL}"/>"}}
            <span>렌탈 </span>
            <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text" placeholder="Ex) 월 2만원 지원" value="" maxlength="40" />
            <input type="text" name="PRD_MST_RTL_PAY" id="PRD_MST_RTL_PAY" class="text onlyNumber" placeholder="기본월부금(숫자만입력)" value="${info.PRD_MST_SPL_PRC }" />
        {{else PRD_MST_TYPE == "<c:out value="${Code.PRODUCT_TYPE_DAEMYUG}"/>"}}
            <span>상조</span>
            <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text" placeholder="Ex) 월 5,900원" value="" maxlength="40" />
            <input type="text" name="PRD_MST_RTL_PAY" id="PRD_MST_RTL_PAY" class="text onlyNumber" placeholder="기본월부금(숫자만입력)" value="${info.PRD_MST_SPL_PRC }" />
        {{/if}}
    </script>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm"),
                $tab = $wrapper.find("#tab"),
                $tabItem = $wrapper.find(".tab-contents .item"),
                $relationProductArea = $wrapper.find("#relation-product-area");
                $productRelationTemplate = $("#productRelationTemplate"),
                $productTypeTemplate = $("#productTypeTemplate");
                $textAddInfoTemplate = $("#textAddInfoTemplate");
                
            var $createproductNotificationInfoTable = $frm.find("#createproductNotificationInfoTable"),
                $productNotificationInfoTemplate = $("#productNotificationInfoTemplate"),
                $detailReferenceToggle = $frm.find("#detailReferenceToggle");

            <%-- 래디플래너 전용 상품 추가 --%>
            var $productPRPArea = $frm.find(".product-prp-area");
            <%-- 래디플래너 전용 상품 추가 --%>

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
                    PRD_MST_RDP_TXT : {
                        required : true
                    },
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
                    },
                    PROD_CD : {
                        required : true
                    },
                    PRD_MST_CMS_CD : {
                        required : true
                    },
                    PRC_RDP_CMS_CD : {
                        required : true
                    },
                    PRC_RDP_P_CMS_CD : {
                        required : true
                    },
                    PRD_MST_NM : {
                        required : true
                    },  
                    PRD_MST_ST_DT : {
                        required : true
                    },
                    PRD_MST_ED_DT : {
                        required : true
                    },
                    PRD_MST_KWD : {
                        required : true
                    },
                    PRD_CTG_IDX1 : {
                        required : true
                    },
                    PRD_CTG_IDX2 : {
                        required : true
                    },
                    PRD_MST_MAIN_CTRT : {
                        required : true
                    },
                    PRD_MST_SPT_TXT : {
                        required : true
                    },
                    PRD_MST_DSP_SVC : {
                        required : true
                    }/* ,
                    PRD_MST_RDP_CMS : {
                        required : true
                    },
                    PRD_MST_RDP_DVD_PAY : {
                        required : true
                    },
                    PRD_MST_RDP_DVD_CNT : {
                        required : true
                    } */
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
            <%-- 온라인상품명 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
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
                if($frm.find('#ZERO_YN').val()=='Y'){
                    if($frm.find('#REL_AMT').val()==''){
                        alert("[총 지원금]이 필요합니다.");
                        $frm.find('#REL_AMT').focus();
                        return;
                    }
                    if($frm.find('#REL_CNT').val()==''){
                        alert("[지원회차]가 필요합니다.");
                        $frm.find('#REL_CNT').focus();
                        return;
                    }
                }
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.regist("Union"));
                    }
                }
            });
            
            <%-- dlcc 상품 검색 팝업 --%>
            $wrapper.on("click", "#search-dlcc", function() {
                $.common.popup.dlcc.search(function (data) {
                    var relCntHtml = "<input type='text' name='REL_CNT' id='REL_CNT' class='text onlyNumber' value='' />";
                    var relAmtHtml = "<input type='text' name='REL_AMT' id='REL_AMT' class='text onlyNumber' value='' />";
                    $frm.find("#prodAmt").text(data.PROD_AMT);
                    $frm.find("#modelClNm").text(data.MODEL_CL_NM);
                    $frm.find("#monPayAmt").text(data.MON_PAY_AMT);
                    $frm.find("#exprNo").text(data.EXPR_NO);
                    $frm.find("input[name='ZERO_YN']").val('N');
                    $frm.find("#relAmt").empty();
                    $frm.find("#relCnt").empty();

                    if (data.ZERO_YN!='Y') {
                        $frm.find("#relAmt").text(data.REL_AMT);
                        $frm.find("#relCnt").text(data.REL_CNT);
                    } else {
                        $frm.find("#relAmt").append(relAmtHtml);
                        $frm.find("#relCnt").append(relCntHtml);
                        $frm.find("input[name='ZERO_YN']").val(data.ZERO_YN);
                    }
                    
                    $frm.find("input[name='PROD_CD']").val(data.PROD_CD);
                    $frm.find("input[name='PROD_KIND']").val(data.PROD_KIND);
                    $frm.find("input[name='MODEL_CD']").val(data.MODEL_CD);
                });
            });   
            <%-- B2B 회사 검색 팝업 --%>
            $wrapper.on("click", ".search-b2b-company", function() {
                var type = $(this).data("type");
                $.common.popup.vender.b2b.search(function (data) {
                    if (type == "basic") {
                        $frm.find("input[name='PRD_MST_CMS_CD']").val(data.COM_CD);
                    } else if (type == "planner") {
                        $frm.find("input[name='PRC_RDP_CMS_CD']").val(data.COM_CD);
                    } else if (type == "plannerB2P") {
                        $frm.find("input[name='PRC_RDP_P_CMS_CD']").val(data.COM_CD);
                    }
                    
                });
            }); 
            
            <%-- 상품 검색 공통 팝업 --%>
            $relationProductArea.on("click", ".search-product-popup", function() {
                var $this = $(this),
                    $tbody = $this.closest("td").find("tbody");
                var planGroupNumber = $this.closest("tbody").find("input[name='PLN_GRP_NUMs']").val();
                $.common.popup.product.search(function (data) {
                    var html = new Array();
                    $.each(data, function(i, row) {
                        if ($tbody.find(".tr-" + row.PRD_MST_NO).length == 0) {
                            row.PLN_GRP_NUM = planGroupNumber;
                            html.push($productRelationTemplate.tmpl({info : row}));
                        }
                    });
                    $tbody.find(".td_no_result").closest("tr").remove();
                    $tbody.append(html);
                }, 0);
            });
            <%-- 선택 삭제 버튼 클릭 이벤트 --%>
            $relationProductArea.on("click", ".relation-product-area", function() {
                var $tbody = $(this).closest("div.wrap").siblings("table.table-row").find("tbody"),
                    $checkRow = $tbody.find(".check-row:checked");
                if ($checkRow.length > 0) {
                    $checkRow.closest("tr").remove();
                    if ($tbody.find("tr").length == 0) {
                        $productRelationTemplate.tmpl({info : ""}).appendTo($tbody);
                        TagUtil.setEmptyColspan();
                    }
                }
            });   
            <%-- 전시 상품 영역 전체 체크박스 변경 이벤트 --%>
            $relationProductArea.on("change", ".check-all", function () {
                var $this = $(this);
                $this.closest("thead").siblings("tbody").find(".check-row").prop("checked", $this.is(":checked"));
            });
            <%-- 전시 상품 영역 개별 체크박스 변경 이벤트 --%>
            $relationProductArea.on("change", ".check-row", function () {
                var $this = $(this),
                    $tbody = $this.closest("tbody");
                var checkRowLength = $tbody.find(".check-row:checked").length,
                    rowLength = $tbody.find("tr").length;
                $tbody.siblings("thead").find(".check-all").prop("checked", (checkRowLength > 0 && checkRowLength == rowLength));
            });
            <%-- 품목정보 등록/수정 폼 --%>
            $frm.on("change", "#PRD_MST_NFI_IDX", function (){
                var prdMstNfiIdx = "<c:out value="${productInfo.PRD_MST_NFI_IDX}" />";
                var prdMstnfiInf = "<c:out value="${PRD_MST_NFI_INF}" />";
                
                prdMstnfiInf = prdMstnfiInf.split("|");
                
                $createproductNotificationInfoTable.children("tr").remove();
                $detailReferenceToggle.attr("checked", false);
                if ($(this).val() == "") {
                    $createproductNotificationInfoTable.hide();
                    $detailReferenceToggle.attr("disabled", true);
                    return;
                } else {
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
                        $productNotificationInfoTemplate.tmpl(arrayObj).appendTo($createproductNotificationInfoTable);
                    } else {
                        alert("조회된 데이터가 없습니다.");
                    }
                });
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
            <%-- 상품 유형 변경 이벤트 --%>
            $frm.on("change", "input[name='PRD_MST_TYPE']", function () {
                var $productTypeItem = $frm.find(".product-type-item");
                var $textAddInfo = $frm.find(".add-info");
                $productTypeItem.empty();
                $textAddInfo.empty();
                $productTypeTemplate.tmpl({PRD_MST_TYPE : $(this).val()}).appendTo($productTypeItem);
                $textAddInfoTemplate.tmpl({PRD_MST_TYPE : $(this).val()}).appendTo($textAddInfo);
            });
        });
        
    </script>
</body>
</html>