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
                        <span>템플릿관리</span>
                    </h2>
                    <h3 class="title">
                        <span>수정</span>
                    </h3>
                    <p>
                        <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="searchForm">
                        <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchPrdTplSvc" value="<c:out value="${commandMap.searchPrdTplSvc }"/>"/>
                        <input type="hidden" name="searchPrdTplNm" value="<c:out value="${commandMap.searchPrdTplNm }"/>"/>
                        <input type="hidden" name="searchPrdTplYn" value="<c:out value="${commandMap.searchPrdTplYn }"/>"/>
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />                        
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                    </form>
                    <form id="frm" name="frm">
                        <input type="hidden" name="PRD_TPL_IDX" value="<c:out value="${info.PRD_TPL_IDX }"/>"/>
                        <input type="hidden" name="PRD_TPL_TYPE" value="<c:out value="${info.PRD_TPL_TYPE }"/>"/>
                        <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchPrdTplSvc" value="<c:out value="${commandMap.searchPrdTplSvc }"/>"/>
                        <input type="hidden" name="searchPrdTplNm" value="<c:out value="${commandMap.searchPrdTplNm }"/>"/>
                        <input type="hidden" name="searchPrdTplYn" value="<c:out value="${commandMap.searchPrdTplYn }"/>"/>
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />                        
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE or commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE}">
                                    <tr>
                                        <th>
                                            <span>유형<i class="require"><em>필수입력</em></i></span>
                                        </th>
                                        <td>
                                            <c:set var="gbunCodeList" value=""/>
                                            <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE }">
                                                <c:set var="gbunCodeList" value="${codes.LIFE_SERVICE }"/>
                                            </c:if>
                                            <c:if test="${commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE }">
                                                <c:set var="gbunCodeList" value="${codes.PRODUCT_TYPE }"/>
                                            </c:if>
                                            <c:if test="${not empty gbunCodeList}">
                                                <c:forEach var="row" items="${gbunCodeList }" varStatus="i">
                                                    <label for="PRD_TPL_SVC<c:out value="${i.index}"/>">
                                                        <input type="radio" name="PRD_TPL_SVC" id="PRD_TPL_SVC<c:out value="${i.index}"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq info.PRD_TPL_SVC }">checked="checked"</c:if>/>
                                                        <span><c:out value="${row.CMN_COM_NM }"/></span>
                                                    </label>
                                                </c:forEach>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE}">
                                <tr>
                                    <th>
                                        <span>채권구분<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <label for="PRD_TPL_BND_YN0">
                                            <input type="radio" name="PRD_TPL_BND_YN" id="PRD_TPL_BND_YN0" class="radio" value="Y" <c:if test="${info.PRD_TPL_BND_YN eq 'Y' }">checked="checked"</c:if>/>
                                            <span>채권</span>
                                        </label>
                                        <label for="PRD_TPL_BND_YN1">
                                            <input type="radio" name="PRD_TPL_BND_YN" id="PRD_TPL_BND_YN1" class="radio" value="N" <c:if test="${info.PRD_TPL_BND_YN eq 'N' }">checked="checked"</c:if>/>
                                            <span>비채권</span>
                                        </label>
                                    </td>
                                </tr>                                
                                </c:if>                                
                                <tr>
                                    <th>
                                        <span>템플릿명<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" name="PRD_TPL_NM" id="PRD_TPL_NM" class="text xlarge" value="<c:out value="${info.PRD_TPL_NM }"/>" maxlength="70"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상태<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <label for="PRD_TPL_YN0">
                                            <input type="radio" name="PRD_TPL_YN" id="PRD_TPL_YN0" class="radio" value="Y" <c:if test="${info.PRD_TPL_YN eq 'Y' }">checked="checked"</c:if>/>
                                            <span>사용</span>
                                        </label>
                                        <label for="PRD_TPL_YN1">
                                            <input type="radio" name="PRD_TPL_YN" id="PRD_TPL_YN1" class="radio" value="N"<c:if test="${info.PRD_TPL_YN eq 'N' }">checked="checked"</c:if>/>
                                            <span>사용안함</span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>PC 템플릿<i class="require"><em>필수입력</em></i></span>
                                        <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE }">
                                            (가로 930px 기준)
                                        </c:if>
                                        <c:if test="${commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE }">
                                            (가로 1280px 기준)
                                        </c:if>
                                    </th>
                                    <td>
                                        <textarea name="PRD_TPL_PC_DTL_DSC" id="PRD_TPL_PC_DTL_DSC" class="textarea xlarge" style="height: 500px; width: 100%"><c:out value="${info.PRD_TPL_PC_DTL_DSC }"/></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>Mobile 템플릿<i class="require"><em>필수입력</em></i></span>
                                        <c:if test="${commandMap.CMN_COM_IDX eq Code.LIFE_SERVICE }">
                                            (가로 750px 기준)
                                        </c:if>
                                        <c:if test="${commandMap.CMN_COM_IDX eq Code.PRODUCT_TYPE }">
                                            (가로 750px 기준)
                                        </c:if>
                                    </th>
                                    <td>
                                        <textarea name="PRD_TPL_MB_DTL_DSC" id="PRD_TPL_MB_DTL_DSC" class="textarea xlarge" style="height: 500px; width: 100%"><c:out value="${info.PRD_TPL_MB_DTL_DSC }"/></textarea>
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
    <ui:editor objId="#PRD_TPL_PC_DTL_DSC" num="1"/>
    <ui:editor objId="#PRD_TPL_MB_DTL_DSC" num="2"/>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    PRD_TPL_NM : {
                        required : true,
                        maxlength : 70
                    }, // 제목
                    PRD_TPL_PC_DTL_DSC : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    }, // pc 템플릿
                    PRD_TPL_MB_DTL_DSC : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    } // 모바일 템플릿               
                }
            });
            <%-- 목록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goList", function() {
                if (confirm("변경사항이 저장되지 않을 수 있습니다.\n이동하시겠습니까?")) {
                    $searchForm.postSubmit($.action.list());
                }
            });
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                oEditors1.getById["PRD_TPL_PC_DTL_DSC"].exec("UPDATE_CONTENTS_FIELD", []);
                oEditors2.getById["PRD_TPL_MB_DTL_DSC"].exec("UPDATE_CONTENTS_FIELD", []);
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
        });
    //-->
    </script>
</body>
</html>
