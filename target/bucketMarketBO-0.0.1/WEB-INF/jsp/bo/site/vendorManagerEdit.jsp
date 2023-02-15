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
                    <!-- container -->
                    <h2 class="title">
                        <span>제휴사 관리</span>
                    </h2>
                    <div class="push-guide instant">
                        <i class="icon"></i>
                        <h3 class="title">
                            <span>기본정보 (<i class="require"><em>필수입력</em></i>필수항목)</span>
                        </h3>
                    </div>
                    <!-- // push-guide -->
                    <form id="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>" />
                        <input type="hidden" name="searchVdrMstMngNm" value="<c:out value="${commandMap.searchVdrMstMngNm }"/>" />
                        <input type="hidden" name="searchVdrMstDmId" value="<c:out value="${commandMap.searchVdrMstDmId }"/>" />
                        <input type="hidden" name="searchVdrMstUseYn" value="<c:out value="${commandMap.searchVdrMstUseYn }"/>" />
                        <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>" />
                        <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    </form>
                    <form id="frm" name="frm">
                        <input type="hidden" name="VDR_MST_IDX" id="VDR_MST_IDX" value="<c:out value="${info.VDR_MST_IDX }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>" />
                        <input type="hidden" name="searchVdrMstMngNm" value="<c:out value="${commandMap.searchVdrMstMngNm }"/>" />
                        <input type="hidden" name="searchVdrMstDmId" value="<c:out value="${commandMap.searchVdrMstDmId }"/>" />
                        <input type="hidden" name="searchVdrMstUseYn" value="<c:out value="${commandMap.searchVdrMstUseYn }"/>" />
                        <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>" />
                        <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a">
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;"/>
                                <col style="width: 30%;"/>
                                <col style="width: 15%; min-width: 180px;"/>
                                <col style="width: 30%;"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>B2B 회사명<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <c:out value="${info.VDR_MST_NM }"/>
                                    </td>
                                    <th>
                                        <span>B2B코드</span>
                                    </th>
                                    <td>
                                        <c:out value="${info.VDR_MST_DLCC_B2B }"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상호/법인명 <i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan=3>
                                        <c:out value="${info.VDR_MST_CPN_NM }" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>사업자번호<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <c:out value="${info.VDR_MST_BUSI1 }" />
                                        -
                                        <c:out value="${info.VDR_MST_BUSI2 }" />
                                        -
                                        <c:out value="${info.VDR_MST_BUSI3 }" />
                                    </td>
                                    <th>
                                        <span>대표자명<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <c:out value="${info.VDR_MST_CEO_NM }"/>
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <th>
                                        <span>업종<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <c:out value="${info.VDR_MST_BUSI_CDT }"/>
                                    </td>
                                    <th>
                                        <span>업태<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <c:out value="${info.VDR_MST_BUSI_TYPE }"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>사업장주소<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" name="VDR_MST_ZIP_CODE" id="VDR_MST_ZIP_CODE" class="text number" maxlength="5" value="<c:out value="${info.VDR_MST_ZIP_CODE }"/>" readonly="readonly" />
                                        <a href="javascript:;" id="searchPostBtn" class="button button-a small">
                                            <span>우편번호 찾기</span>
                                        </a>
                                        <br/>
                                        <input type="text" name="VDR_MST_DR_ADDR1" id="VDR_MST_DR_ADDR1" class="text large" maxlength="60" value="<c:out value="${info.VDR_MST_DR_ADDR1 }"/>" readonly="readonly" style="margin-top: 5px;" />
                                        <input type="text" name="VDR_MST_DR_ADDR2" id="VDR_MST_DR_ADDR2" class="text large" maxlength="60" value="<c:out value="${info.VDR_MST_DR_ADDR2 }"/>" style="margin-top: 5px;" />
                                        <input type="hidden" name="VDR_MST_JB_ADDR1" id="VDR_MST_JB_ADDR1" value="<c:out value="${info.VDR_MST_JB_ADDR1 }"/>" />
                                        <input type="hidden" name="VDR_MST_JB_ADDR2" id="VDR_MST_JB_ADDR2" value="<c:out value="${info.VDR_MST_JB_ADDR2 }"/>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>전화번호/팩스</span>
                                    </th>
                                    <td colspan=3>
                                        <select class="select" name="VDR_MST_TEL1" id="VDR_MST_TEL1">
                                            <option value="" <c:if test="${empty info.VDR_MST_TEL1 }">selected="selected"</c:if>>선택</option>
                                            <c:if test="${not empty codes.TEL_CODE }">
                                                <c:forEach var="row" items="${codes.TEL_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${info.VDR_MST_TEL1 eq row.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <input type="text" name="VDR_MST_TEL2" id="VDR_MST_TEL2" class="text short number" maxlength="4" value="<c:out value="${info.VDR_MST_TEL2 }"/>" />
                                        -
                                        <input type="text" name="VDR_MST_TEL3" id="VDR_MST_TEL3" class="text short number" maxlength="4" value="<c:out value="${info.VDR_MST_TEL3 }"/>" />
                                        <span style="margin-top: 5px;">
                                            <br />
                                        </span>
                                        <select class="select" name="VDR_MST_FAX1" id="VDR_MST_FAX1">
                                            <option value="" <c:if test="${empty info.VDR_MST_FAX1 }">selected="selected"</c:if>>선택</option>
                                            <c:if test="${not empty codes.TEL_CODE }">
                                                <c:forEach var="row" items="${codes.TEL_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${info.VDR_MST_FAX1 eq row.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <input type="text" name="VDR_MST_FAX2" id="VDR_MST_FAX2" class="text short number" maxlength="4" value="<c:out value="${info.VDR_MST_FAX2 }"/>" />
                                        -
                                        <input type="text" name="VDR_MST_FAX3" id="VDR_MST_FAX3" class="text short number" maxlength="4" value="<c:out value="${info.VDR_MST_FAX3 }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>대표자 이메일</span>
                                    </th>
                                    <td colspan=3>
                                        <input type="text" name="VDR_MST_EMAIL_ID" id="VDR_MST_EMAIL_ID" class="text" value="<c:out value="${fn:split(info.VDR_MST_MAIL, '@')[0] }"/>" maxlength="20" />
                                        @
                                        <input type="text" name="VDR_MST_EMAIL_DOMAIN" id="VDR_MST_EMAIL_DOMAIN" class="text" value="<c:out value="${fn:split(info.VDR_MST_MAIL, '@')[1] }"/>" maxlength="20" />
                                        <input type="hidden" name="VDR_MST_MAIL" id="VDR_MST_MAIL" value="<c:out value="${fn:split(info.VDR_MST_MAIL, '@')[1] }"/>"/>
                                        <select class="select" name="emailDomain" id="emailDomain">
                                            <option value="">직접입력</option>
                                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                                <c:forEach var="row" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${row.CMN_COM_NM eq fn:split(info.VDR_MST_MAIL, '@')[1] }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>대명 담당자<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <select class="select" name="VDR_MST_DM_ID" id="VDR_MST_DM_ID" <c:if test="${isScm }"> readonly style='background-color:#ababab'onFocus='this.initialSelect = this.selectedIndex;'onChange='this.selectedIndex = this.initialSelect;' </c:if>>
                                            <option value="" <c:if test="${empty info.VDR_MST_DM_ID }">selected="selected"</c:if>>선택</option>
                                            <c:if test="${not empty authManagerList }">
                                                <c:forEach var="row" items="${authManagerList }" varStatus="i">
                                                    <c:if test="${not isScm or row.ADM_MST_ID eq info.VDR_MST_DM_ID }">
                                                        <option value="<c:out value="${row.ADM_MST_ID }"/>" <c:if test="${row.ADM_MST_ID eq info.VDR_MST_DM_ID }">selected="selected"</c:if>><c:out value="${row.ADM_MST_NM }" /></option>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상태<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <input type="radio" id="stateA" name="VDR_MST_USE_YN" value="Y" class="radio" <c:if test="${info.VDR_MST_USE_YN eq 'Y' }">checked="checked"</c:if> <c:if test="${isScm }">onclick="return(false);" </c:if>/>
                                        <label for="stateA">사용</label>
                                        <input type="radio" id="stateB" name="VDR_MST_USE_YN" value="N" class="radio" <c:if test="${info.VDR_MST_USE_YN eq 'N' }">checked="checked"</c:if> <c:if test="${isScm }">onclick="return(false);" </c:if>/>
                                        <label for="stateB">미사용</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="push-guide instant">
                            <i class="icon"></i>
                            <h3 class="title">
                                <span>업체 담당자정보</span>
                            </h3>
                        </div>
                        <!-- // push-guide -->
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;"/>
                                <col style="width: 30%;"/>
                                <col style="width: 15%; min-width: 180px;"/>
                                <col style="width: 30%;"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>담당자명<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" name="VDR_MST_MNG_NM" id="VDR_MST_MNG_NM" class="text" maxlength="10" value="<c:out value="${info.VDR_MST_MNG_NM }"/>" />
                                    </td>
                                    <th>
                                        <span>휴대폰<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <select class="select" name="VDR_MST_MNG_HP1" id="VDR_MST_MNG_HP1">
                                            <option value="" <c:if test="${empty info.VDR_MST_MNG_HP1}">selected="selected"</c:if>>선택</option>
                                            <c:if test="${not empty codes.HP_CODE }">
                                                <c:forEach var="row" items="${codes.HP_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${info.VDR_MST_MNG_HP1 eq row.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <input type="text" name="VDR_MST_MNG_HP2" id="VDR_MST_MNG_HP2" class="text short number" maxlength="4" value="<c:out value="${info.VDR_MST_MNG_HP2 }"/>" />
                                        -
                                        <input type="text" name="VDR_MST_MNG_HP3" id="VDR_MST_MNG_HP3" class="text short number" maxlength="4" value="<c:out value="${info.VDR_MST_MNG_HP3 }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>이메일</span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" name="VDR_MST_MNG_EMAIL_ID" id="VDR_MST_MNG_EMAIL_ID" class="text" value="<c:out value="${fn:split(info.VDR_MST_MNG_MAIL, '@')[0] }"/>" maxlength="15" />
                                        @
                                        <input type="text" name="VDR_MST_MNG_EMAIL_DOMAIN" id="VDR_MST_MNG_EMAIL_DOMAIN" class="text" value="<c:out value="${fn:split(info.VDR_MST_MNG_MAIL, '@')[1] }"/>" maxlength="15" />
                                        <input type="hidden" name="VDR_MST_MNG_MAIL" id="VDR_MST_MNG_MAIL" value="${info.VDR_MST_MNG_MAIL }"/>
                                        <select class="select" name="emailDomain" id="emailDomainMng">
                                            <option value="">직접입력</option>
                                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                                <c:forEach var="row" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${row.CMN_COM_NM eq fn:split(info.VDR_MST_MNG_MAIL, '@')[1] }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <c:if test="${not isScm }">
                                    <tr>
                                        <th>
                                            <span>고정IP사용</span>
                                        </th>
                                        <td colspan="3">
                                            <input type="radio" id="VDR_MST_LMT_YN0" name="VDR_MST_LMT_YN" value="Y" class="radio"  <c:if test="${info.VDR_MST_LMT_YN eq 'Y' }">checked="checked"</c:if> />
                                            <label for="VDR_MST_LMT_YN0">사용</label>
                                            <input type="radio" id="VDR_MST_LMT_YN1" name="VDR_MST_LMT_YN" value="N" class="radio"  <c:if test="${info.VDR_MST_LMT_YN eq 'N' }">checked="checked"</c:if> />
                                            <label for="VDR_MST_LMT_YN1">미사용</label>
                                            <input type="text" name="VDR_MST_LMT_IP" id="VDR_MST_LMT_IP" class="text" value="<c:out value="${info.VDR_MST_LMT_IP }"/>" maxlength="20"/>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${isScm }">
                                    <tr>
                                        <th>
                                            <span>고정IP사용</span>
                                        </th>
                                        <td colspan="3">
                                            <input type="radio" id="VDR_MST_LMT_YN0" name="VDR_MST_LMT_YN" value="Y" class="radio"  <c:if test="${info.VDR_MST_LMT_YN eq 'Y' }">checked="checked"</c:if> onclick="return(false);"/>
                                            <label for="VDR_MST_LMT_YN0">사용</label>
                                            <input type="radio" id="VDR_MST_LMT_YN1" name="VDR_MST_LMT_YN" value="N" class="radio"  <c:if test="${info.VDR_MST_LMT_YN eq 'N' }">checked="checked"</c:if> onclick="return(false);"/>
                                            <label for="VDR_MST_LMT_YN1">미사용</label>
                                            <input type="text" name="VDR_MST_LMT_IP" id="VDR_MST_LMT_IP" class="text" value="<c:out value="${info.VDR_MST_LMT_IP }"/>" maxlength="20" readonly="readonly"/>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </form>
                    <div class="push-guide instant">
                        <i class="icon"></i>
                        <h3 class="title">
                            <span>계약 정보</span>
                        </h3>
                    </div>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;"/>
                            <col style="width: 75%;"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <span>계약동의</span>
                                </th>
                                <td>동의 완료(<ui:formatDate value="${info.VDR_MST_AGR_DT }" pattern="yyyy.MM.dd HH:mm:ss" />/<c:out value="${info.VDR_MST_AGR_NM }"/>)</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="section-button">
                        <!-- section-button -->
                        <div class="wrap text-center">
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                            <c:if test="${not isScm }">
                                <a href="javascript:;" id="goList" class="button large">
                                    <span>목록</span>
                                </a>
                            </c:if>
                        </div>
                    </div>
                    <!-- // section-button -->
                </div>
                <!-- // container -->
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
    <%@ include file="/WEB-INF/jsp/common/template/zipCode.jsp"%>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 우편번호 검색 --%>
            new ZipCode("searchPostBtn", function(data) {
                $frm.find("#VDR_MST_ZIP_CODE").val(data.zipcode);
                $frm.find("#VDR_MST_DR_ADDR1").val(data.roadAddress);
                $frm.find("#VDR_MST_JB_ADDR1").val(data.jibunAddress);
            });
            <%-- 폼체크 --%>
            $frm.validate({
                rules : {
                    VDR_MST_ZIP_CODE : {
                        required : true,
                        number : true,
                        maxlength : 5
                    },
                    VDR_MST_DR_ADDR1 : {
                        required : true
                    },
                    VDR_MST_DR_ADDR2 : {
                        required : true
                    },
                    VDR_MST_TEL1 : {
                        number : true
                    },
                    VDR_MST_TEL2 : {
                        number : true
                    },
                    VDR_MST_TEL3 : {
                        number : true
                    },
                    VDR_MST_FAX1 : {
                        number : true
                    },
                    VDR_MST_FAX2 : {
                        number : true
                    },
                    VDR_MST_FAX3 : {
                        number : true
                    },
                    VDR_MST_EMAIL_ID : {
                        required : false,
                        emailId : true,
                        maxlength : 20
                    },
                    VDR_MST_EMAIL_DOMAIN : {
                        required : false,
                        emailDomain : true,
                        maxlength : 20
                    },
                    VDR_MST_DM_ID : {
                        required : true
                    },
                    VDR_MST_USE_YN : {
                        required : true
                    },
                    VDR_MST_MNG_NM : {
                        required : true
                    },
                    VDR_MST_MNG_HP1 : {
                        required : true,
                        number : true,
                        maxlength : 3
                    },
                    VDR_MST_MNG_HP2 : {
                        required : true,
                        number : true,
                        maxlength : 4
                    },
                    VDR_MST_MNG_HP3 : {
                        required : true,
                        number : true,
                        maxlength : 4
                    },
                    VDR_MST_MNG_EMAIL_ID : {
                        required : false,
                        emailId : true,
                        maxlength : 20
                    },
                    VDR_MST_MNG_EMAIL_DOMAIN : {
                        required : false,
                        emailDomain : true,
                        maxlength : 20
                    },
                    VDR_MST_LMT_IP : {
                        required : function (el) {
                            return ($frm.find("input[name='VDR_MST_LMT_YN']:checked").val() == "Y");
                        }
                    }
                }
            });
            <%-- 도메인 변경 이벤트 --%>
            $wrapper.on("change", "#emailDomain", function() {
                var $obj = $frm.find("#VDR_MST_EMAIL_DOMAIN");
                $obj.prop("readonly", !($(this).val() == ""));
                $obj.val($(this).val());
            });
            <%-- 도메인 변경 이벤트(담당자) --%>
            $wrapper.on("change", "#emailDomainMng", function() {
                var $obj = $frm.find("#VDR_MST_MNG_EMAIL_DOMAIN");
                $obj.prop("readonly", !($(this).val() == ""));
                $obj.val($(this).val());
            });
            <%-- 목록 버튼 클릭 이벤트 --%> 
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 수정 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                if ($frm.valid()) {
                    if ($frm.find("#VDR_MST_EMAIL_ID").val() != "" && $frm.find("#VDR_MST_EMAIL_DOMAIN").val() != "") {
                        $frm.find("#VDR_MST_MAIL").val($frm.find("#VDR_MST_EMAIL_ID").val() + "@" + $frm.find("#VDR_MST_EMAIL_DOMAIN").val()); // 대표_이메일
                    }
                    if ($frm.find("#VDR_MST_MNG_EMAIL_ID").val() != "" && $frm.find("#VDR_MST_MNG_EMAIL_DOMAIN").val() != "") {
                        $frm.find("#VDR_MST_MNG_MAIL").val($frm.find("#VDR_MST_MNG_EMAIL_ID").val() + "@" + $frm.find("#VDR_MST_MNG_EMAIL_DOMAIN").val()); // 담당자_이메일
                    }
                    $frm.find("#VDR_MST_JB_ADDR2").val($frm.find("#VDR_MST_DR_ADDR2").val()); // 도로명 상세주소 값을 지번 상세주소 값에 저장
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
        });
    </script>
</body>
</html>
