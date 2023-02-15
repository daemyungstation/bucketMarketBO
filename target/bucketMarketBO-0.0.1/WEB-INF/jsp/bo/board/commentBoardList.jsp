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
                        <span>가입후기</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <!-- row -->
                                    <th>
                                        <span>등록일</span>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchStartDate" id="searchStartDate" class="text date" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text date" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
                                        <a href="javascript:DateUtil.fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall">
                                            <span>전체</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall">
                                            <span>오늘</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall">
                                            <span>일주일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall">
                                            <span>15일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall">
                                            <span>한달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>기간계 상품코드</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchProdCd" id="searchProdCd" class="text serach-text xlarge" value="<c:out value="${commandMap.searchProdCd }"/>" maxlength="10"/>
                                    </td>
                                    <th>
                                        <span>상품유형</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdMstType" id="searchPrdMstType0" class="radio" value="" <c:if test="${empty commandMap.searchPrdMstType }">checked="checked"</c:if>/>
                                        <label for="searchPrdMstType0">전체</label>
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="row" items="${codeList }" varStatus="i">
                                                <input type="radio" name="searchPrdMstType" id="searchPrdMstType<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchPrdMstType }">checked="checked"</c:if>/>
                                                <label for="searchPrdMstType<c:out value="${i.index + 1 }"/>"><c:out value="${row.CMN_COM_NM }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>온라인 상품코드</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstNo" id="searchPrdMstNo" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstNo }"/>" maxlength="10" />
                                    </td>
                                    <th>
                                        <span>평점</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdRevPit" id="searchPrdRevPit0" class="radio"value="" <c:if test="${empty commandMap.searchPrdRevPit }">checked="checked"</c:if>/>
                                        <label for="searchPrdMstType0">전체</label>
                                        <c:set var="pit" value="5"/>
                                        <c:forEach begin="0" end="4" step="1" varStatus="i">
                                            <input type="radio" name="searchPrdRevPit" id="searchPrdRevPit<c:out value="${pit - i.index }"/>" class="radio" value="<c:out value="${pit - i.index }"/>" <c:if test="${(pit - i.index) eq commandMap.searchPrdRevPit }">checked="checked"</c:if>/>
                                            <label for="searchPrdRevPit<c:out value="${pit - i.index }"/>"><c:out value="${pit - i.index }"/>점</label>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>베스트 여부</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdRevBstYn" id="searchPrdRevBstYn0" class="radio" <c:if test="${empty commandMap.searchPrdRevBstYn }">checked="checked"</c:if> value="" />
                                        <label for="searchPrdRevBstYn0">전체</label>
                                        <input type="radio" name="searchPrdRevBstYn" id="searchPrdRevBstYn1" class="radio" <c:if test="${commandMap.searchPrdRevBstYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="searchPrdRevBstYn1">베스트</label>
                                        <input type="radio" name="searchPrdRevBstYn" id="searchPrdRevBstYn2" class="radio" <c:if test="${commandMap.searchPrdRevBstYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="searchPrdRevBstYn2">일반</label>
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdRevUseYn" id="searchPrdRevUseYn0" class="radio" <c:if test="${empty commandMap.searchPrdRevUseYn }">checked="checked"</c:if> value="" />
                                        <label for="searchPrdRevUseYn0">전체</label>
                                        <input type="radio" name="searchPrdRevUseYn" id="searchPrdRevUseYn1" class="radio" <c:if test="${commandMap.searchPrdRevUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="searchPrdRevUseYn1">노출</label>
                                        <input type="radio" name="searchPrdRevUseYn" id="searchPrdRevUseYn2" class="radio" <c:if test="${commandMap.searchPrdRevUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="searchPrdRevUseYn2">노출안함</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                    </form>
                    <div class="grid section-button-search">
                        <!-- 검색 하단 버튼 -->
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색 조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="PRD_REV_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchProdCd" value="<c:out value="${commandMap.searchProdCd }"/>" />
                        <input type="hidden" name="searchPrdMstType" value="<c:out value="${commandMap.searchPrdMstType }"/>" />
                        <input type="hidden" name="searchPrdMstNo" value="<c:out value="${commandMap.searchPrdMstNo }"/>" />
                        <input type="hidden" name="searchPrdRevPit" value="<c:out value="${commandMap.searchPrdRevPit }"/>" />
                        <input type="hidden" name="searchPrdRevBstYn" value="<c:out value="${commandMap.searchPrdRevBstYn }"/>" />
                        <input type="hidden" name="searchPrdRevUseYn" value="<c:out value="${commandMap.searchPrdRevUseYn }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <a href="javascript:;" id="bestModify" class="button small">
                                    <span>베스트지정</span>
                                </a>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                        <table cellspacing="0" class="table-col table-b">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 3%;" />
                                <col style="width: 5%;" />
                                <col style="width: 12%;" />
                                <col style="width: 8%;" />
                                <col style="width: auto;" />
                                <col style="width: 8%;" />
                                <col style="width: 5%;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 14%;" />
                                <col style="width: 7%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="checkbox check-all" /></th>
                                    <th>NO</th>
                                    <th>기간계상품코드</th>
                                    <th>상품유형</th>
                                    <th>온라인상품명</th>
                                    <th>베스트 여부</th>
                                    <th>평점</th>
                                    <th>이름</th>
                                    <th>내용</th>
                                    <th>등록일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody id="list-field">
                                <c:choose>
                                    <c:when test="${not empty list }">
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr>
                                                <td>
                                                    <input type="checkbox" name="PRD_REV_BST_YN" class="checkbox check-row" data-prd_rev_idx="<c:out value="${row.PRD_REV_IDX }"/>" value="Y"/>
                                                </td>
                                                <td>
                                                    <c:out value="${paging.listNum - i.index }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PROD_CD }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PRD_MST_TYPE_NM }" />
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                                        <c:out value="${row.PRD_MST_NM }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:out value="${row.PRD_REV_BST_YN eq 'Y' ? '베스트' : '일반' }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PRD_REV_PIT }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PRD_REV_REG_NM }" />
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="list-contents" data-prd_rev_idx="<c:out value="${row.PRD_REV_IDX }"/>">
                                                        <c:out value="${row.PRD_REV_CTS }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PRD_REV_USE_YN eq 'Y' ? '노출' : '노출안함' }" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="td_no_result"></td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        <div class="section-pagination">
                            <!-- section pagination -->
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <!-- 개발 시 wrap 이하 모듈 시작 -->
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
                        <!-- // section pagination -->
                    </form>
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
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 체크박스 변경 이벤트 --%>
            $.checkBoxSelect("check-all", "check-row");
            <%-- 온라인상품명 a Tag 클릭 이벤트 --%>
            $frm.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
            });
            <%-- 내용 a Tag 클릭 이벤트 --%>
            $frm.on("click", ".list-contents", function() {
                $frm.find("input[name='PRD_REV_IDX']").val($(this).data("prd_rev_idx"));
                $frm.postPop($.action.popup("Edit"), "commentBoardEditPopup", "width=1200,height=600,left=10,top=10");
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $searchForm.on("keydown", "input[type='text']", function(e) {
                if (e.keyCode == 13) {
                    $wrapper.find("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
            <%-- 베스트 지정 --%>
            $wrapper.on("click", "#bestModify", function() {
                var $target = $frm.find("input[name='PRD_REV_BST_YN']:checked");
                if ($target.length == 0) {
                    alert("베스트로 지정할 후기를 선택해 주십시오.");
                    return;
                }
                if (confirm("베스트지정 하시겠습니까?")) {
                    var array = new Array(),
                        param = new Object();
                    $target.each(function () {
                        var $this = $(this);
                        param.PRD_REV_IDX = $this.data("prd_rev_idx");
                        param.PRD_REV_BST_YN = $this.val();
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("Modify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("베스트 지정이 완료되었습니다.");
                            location.reload();
                        } else {
                            alert("베스트 지정에 실패하였습니다.");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>