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
                    <h2 class="title"><span>가입분석</span></h2>
                    <div class="tab-list">
                        <ul>
                            <li class="col col-1-5" style="width: 18%"><a href="javascript:;" class="term-type-tab text-center" data-tab_type="Sex"><span>성별</span></a></li>
                            <li class="col col-1-5" style="width: 18%"><a href="javascript:;" class="term-type-tab text-center" data-tab_type="Age"><span>연령대</span></a></li>
                            <li class="col col-1-5" style="width: 18%"><a href="javascript:;" class="term-type-tab text-center" data-tab_type="ProductType"><span>상품유형</span></a></li>
                            <li class="col col-1-5 in" style="width: 18%"><a href="javascript:;" class="term-type-tab text-center" data-tab_type="Product"><span>상품</span></a></li>
                            <li class="col col-1-5" style="width: 18%"><a href="javascript:;" class="term-type-tab text-center" data-tab_type="ProductCategory"><span>카테고리</span></a></li>
                        </ul>
                    </div>
                    <div class="section-title"><h3 class="title"><span>검색</span></h3></div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchRdpYn" value="<c:out value="${commandMap.searchRdpYn }"/>"/>
                        <input type="hidden" name="searchPeriod" value="<c:out value="${commandMap.searchPeriod }"/>"/>
                        <input type="hidden" name="searchAgent" value="<c:out value="${commandMap.searchAgent }"/>"/>
                        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                        <input type="hidden" name="searchProdCd" value="<c:out value="${commandMap.searchProdCd }"/>"/>
                    </form>
                    <form id="searchForm" name="searchForm">
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span>조회기간</span></th>
                                    <td>
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" name="searchStartDate" id="searchStartDate" class="text date" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text date" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>회원 유형</span></th>
                                    <td>
                                        <input type="radio" name="searchRdpYn" id="searchRdpYn0" class="radio" <c:if test="${empty commandMap.searchRdpYn }">checked="checked"</c:if> value="" />
                                        <label for="searchRdpYn0">전체</label>
                                        <input type="radio" name="searchRdpYn" id="searchRdpYn1" class="radio" <c:if test="${commandMap.searchRdpYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="searchRdpYn1">일반</label>
                                        <input type="radio" name="searchRdpYn" id="searchRdpYn2" class="radio" <c:if test="${commandMap.searchRdpYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="searchRdpYn2">레디플래너</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>기간별 범위</span></th>
                                    <td>
                                        <c:forEach var="item" items="${Const.PERIODS }" varStatus="stat">
                                            <input type="radio" name="searchPeriod" id="searchPeriod<c:out value="${stat.index }"/>" class="radio" <c:if test="${commandMap.searchPeriod eq item.key }">checked="checked"</c:if> value="<c:out value="${item.key }"/>" />
                                            <label for="searchPeriod<c:out value="${stat.index }"/>"><c:out value="${item.value }"/></label>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>가입매체</span</th>
                                    <td>
                                        <input type="radio" name="searchAgent" id="searchAgent0" class="radio" <c:if test="${empty commandMap.searchAgent }">checked="checked"</c:if> value="" />
                                        <label for="searchAgent0">전체</label>
                                        <c:forEach var="item" items="${Const.DEVICE_TYPE }" varStatus="stat">
                                            <input type="radio" name="searchAgent" id="searchAgent<c:out value="${stat.index + 1 }"/>" class="radio" <c:if test="${commandMap.searchAgent eq item.key }">checked="checked"</c:if> value="<c:out value="${item.key }"/>" />
                                            <label for="searchAgent<c:out value="${stat.index + 1 }"/>"><c:out value="${item.value }"/></label>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>온라인 상품명</span</th>
                                    <td>
                                        <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text xlarge" value="<c:out value="${commandMap.searchPrdMstNm }"/>" maxlength="70"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>DLCC 상품코드</span</th>
                                    <td>
                                        <input type="text" name="searchProdCd" id="searchProdCd" class="text xlarge" value="<c:out value="${commandMap.searchProdCd }"/>" maxlength="20"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                        <a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
                    </div>
                    <div class="section-title">
                        <span>단위 : 건수</span>
                        <div class="more">
                            <a href="javascript:;" id="goExcelDownload" class="button small info"><span>엑셀다운로드</span></a>
                        </div>
                    </div>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 20%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th><c:out value="${Const.PERIODS[commandMap.searchPeriod] }"/></th>
                                <th>DLCC상품코드</th>
                                <th>상품명</th>
                                <th>접수</th>
                                <th>대기</th>
                                <th>가입</th>
                                <th>해약</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty list }">
                                <c:forEach var="row" items="${list }" varStatus="stat">
                                    <c:if test="${not stat.last }">
                                        <tr>
                                            <td><c:out value="${row.DAY }"/></td>
                                            <td><c:out value="${row.PROD_CD }"/></td>
                                            <td><c:out value="${row.PRD_MST_NM }"/></td>
                                            <td><fmt:formatNumber value="${row.CNT_R }" type="number"/></td>
                                            <td><fmt:formatNumber value="${row.CNT_W }" type="number"/></td>
                                            <td><fmt:formatNumber value="${row.CNT_J }" type="number"/></td>
                                            <td><fmt:formatNumber value="${row.CNT_C }" type="number"/></td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${stat.last }">
                                        <tr class="total">
                                            <td colspan="3" class="col"><c:out value="${row.DAY }"/></td>
                                            <td class="col"><fmt:formatNumber value="${row.CNT_R }" type="number"/></td>
                                            <td class="col"><fmt:formatNumber value="${row.CNT_W }" type="number"/></td>
                                            <td class="col"><fmt:formatNumber value="${row.CNT_J }" type="number"/></td>
                                            <td class="col"><fmt:formatNumber value="${row.CNT_C }" type="number"/></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty list }">
                                <tr><td class="td_no_result"></td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            <form id="tabNaviForm" name="tabNaviForm"></form>
        </div>
        <div id="quickmenu" class="aside right">
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
    </div>
    <div id="footer">
        <%@ include file="/WEB-INF/jsp/bo/include/footer.jsp"%>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $tabNaviForm = $wrapper.find("#tabNaviForm"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 탭 클릭 이벤트 --%>
            $wrapper.on("click", ".term-type-tab", function () {
                var $this = $(this);
                if (!$this.closest("li.col").hasClass("in")) {
                    $tabNaviForm.postSubmit($.action.view($this.data("tab_type"), "statsJoinAnalysis"));
                }
            });
            <%-- 검색 엔터 이벤트 --%>
            $searchForm.find("input[type='text']").keydown(function (e) {
                if (e.keyCode == 13) {
                    $wrapper.find("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.view("Product", "statsJoinAnalysis"));
            });
            <%-- 엑셀 다운로드 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload("Product", "statsJoinAnalysis"));
            });
        });
    </script>
</body>
</html>
