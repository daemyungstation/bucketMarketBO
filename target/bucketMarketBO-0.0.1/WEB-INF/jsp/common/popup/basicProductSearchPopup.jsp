<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>상품검색</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 13%;" />
                                <col style="width: auto;" />
                                <col style="width: 13%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>등록일</span>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
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
                                        <span>상품코드</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstNo" id="searchPrdMstNo" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstNo }"/>" maxlength="20"/>
                                    </td>
                                    <th>
                                        <span>제휴업체</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchVdrMstIdx" id="searchVdrMstIdx">
                                            <option value="">전체</option>
                                            <c:if test="${not empty vendorList }">
                                                <c:forEach var="row" items="${vendorList }" varStatus="i">
                                                    <option value="<c:out value="${row.VDR_MST_IDX }"/>" <c:if test="${row.VDR_MST_IDX eq commandMap.searchVdrMstIdx }">selected="selected"</c:if>>
                                                        <c:out value="${row.VDR_MST_NM }" />
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>모델분류/지원혜택</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstMdTypeAndSplNm" id="searchPrdMstMdTypeAndSplNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>" maxlength="40"/>
                                    </td>
                                    <th>
                                        <span>모델명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstMd" id="searchPrdMstMd" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstMd }"/>" maxlength="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>온라인 상품유형</span>
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
                                    <th>
                                        <span>카테고리</span>
                                    </th>
                                    <td>
                                        <jsp:include page="/WEB-INF/jsp/common/template/category.jsp">
                                            <jsp:param name="listName" value="productCategoryList"/>
                                            <jsp:param name="paramName" value="commandMap"/>
                                            <jsp:param name="maxLevel" value="2"/>
                                            <jsp:param name="name" value="searchPrdCtgIdx"/>
                                        </jsp:include>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>온라인 상품명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstNm }"/>" maxlength="40"/>
                                    </td>
                                    <th>
                                        <span>노출상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPrdMstDplYn" id="searchPrdMstDplYn0" class="radio" value="" <c:if test="${empty commandMap.searchPrdMstDplYn }">checked="checked"</c:if>/>
                                        <label for="searchPrdMstDplYn0">전체</label>
                                        <c:if test="${not empty Product.DISPLAYS }">
                                            <c:forEach var="codes" items="${Product.DISPLAYS }" varStatus="i">
                                                <input type="radio" name="searchPrdMstDplYn" id="searchPrdMstDplYn<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${codes.key }"/>" <c:if test="${codes.key eq commandMap.searchPrdMstDplYn }">checked="checked"</c:if>/>
                                                <label for="searchPrdMstDplYn<c:out value="${i.index + 1 }"/>"><c:out value="${codes.value }"/></label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색 조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchPrdMstNo" value="<c:out value="${commandMap.searchPrdMstNo }"/>"/>
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                        <input type="hidden" name="searchPrdMstMdTypeAndSplNm" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>"/>
                        <input type="hidden" name="searchPrdMstMd" value="<c:out value="${commandMap.searchPrdMstMd }"/>"/>
                        <input type="hidden" name="searchPrdMstType" value="<c:out value="${commandMap.searchPrdMstType }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx1" value="<c:out value="${commandMap.searchPrdCtgIdx1 }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx2" value="<c:out value="${commandMap.searchPrdCtgIdx2 }"/>"/>
                        <input type="hidden" name="searchPrdCtgIdx3" value="<c:out value="${commandMap.searchPrdCtgIdx3 }"/>"/>
                        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                        <input type="hidden" name="searchPrdMstDplYn value="<c:out value="${commandMap.searchPrdMstDplYn }"/>"/>
                        <div class="grid section-button-list">
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                        </div>
                    </form>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 3%;" />
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 13%;" />
                            <col style="width: 8%;" />
                            <col style="width: auto;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" class="checkbox check-all"/>
                                </th>
                                <th>NO</th>
                                <th>상품유형</th>
                                <th>온라인상품명</th>
                                <th>총상품금액</th>
                                <th>상품코드</th>
                                <th>모델분류<br/>(지원혜택)</th>
                                <th>모델명</th>
                                <th>노출상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="checkbox check-row"/>
                                                <span class="data">
                                                    <input type="hidden" class="PRD_MST_NO" value="<c:out value="${row.PRD_MST_NO }"/>" />
                                                    <input type="hidden" class="PRD_MST_NM" value="<c:out value="${row.PRD_MST_NM }"/>" />
                                                    <input type="hidden" class="PRD_MST_DPL_YN" value="<c:out value="${row.PRD_MST_DPL_YN }"/>" />
                                                    <input type="hidden" class="PRD_MST_DPL_TXT" value="<c:out value="${Product.DISPLAYS[row.PRD_MST_DPL_YN] }"/>" />
                                                    <input type="hidden" class="PRD_MST_TYPE" value="<c:out value="${row.PRD_MST_TYPE }"/>" />
                                                    <input type="hidden" class="PRD_MST_TYPE_NM" value="<c:out value="${row.PRD_MST_TYPE_NM }"/>" />
                                                    <input type="hidden" class="MODEL_NM" value="<c:out value="${row.MODEL_NM }"/>" />
                                                    <input type="hidden" class="PRD_MST_SPL_NM" value="<c:out value="${row.PRD_MST_SPL_NM }"/>" />
                                                    <input type="hidden" class="PROD_CD" value="<c:out value="${row.PROD_CD }"/>" />
                                                    <input type="hidden" class="PROD_AMT" value="<c:out value="${row.PROD_AMT }"/>" />
                                                    <input type="hidden" class="MODEL_CL_NM" value="<c:out value="${row.MODEL_CL_NM }"/>" />
                                                </span>
                                            </td>
                                            <td>
                                                <c:out value="${paging.listNum - i.index }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.PRD_MST_TYPE_NM }"/>
                                            </td>
                                            <td class="text-left">
                                                <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                                    <c:out value="${row.PRD_MST_NM }" />
                                                </a>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${row.PROD_AMT }" type="number"/>
                                            </td>
                                            <td>
                                                <c:out value="${row.PROD_CD }"/>
                                            </td>
                                            <td class="text-left">
                                                <c:out value="${row.MODEL_CL_NM }"/><br/>(<c:out value="${row.PRD_MST_SPL_NM }"/>)
                                            </td>
                                            <td>
                                                <c:out value="${row.MODEL_NM }"/>
                                            </td>
                                            <td>
                                                <c:out value="${Product.DISPLAYS[row.PRD_MST_DPL_YN] }"/>
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
                    <!-- // table -->
                    <div class="section-pagination">
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                        <div class="wrap text-right">
                            <a href="javascript:;" id="choice" class="button samll primary">
                                <span>선택</span>
                            </a>
                            <a href="javascript:self.close();" class="button samll">
                                <span>닫기</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm"),
                $searchForm = $popup.find("#searchForm");
            <%-- 체크박스 변경 이벤트 --%>
            $.checkBoxSelect("check-all", "check-row");
            <%-- 온라인상품명 a Tag 클릭 이벤트 --%>
            $popup.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
            });
            <%-- 검색 엔터 이벤트 --%>
            $searchForm.find("input[type='text']").keydown(function (e) {
                if (e.keyCode == 13) {
                    $wrapper.find("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $popup.on("click", "#search", function() {
                $searchForm.postSubmit($.action.common.popup("basicProductSearch"));
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.common.popup("basicProductSearch"));
            };
            <%-- 선택버튼 클릭 이벤트 --%>
            $popup.on("click", "#choice", function() {
                var $checkbox = $popup.find(".check-row:checked");
                if ($checkbox.length == 0) {
                    alert("상품을 선택해 주세요.");
                    return;
                }
                var maxCount = StringUtil.getInt("<c:out value="${commandMap.MAX_COUNT}"/>", 0);
                if (maxCount > 0 && $checkbox.length > maxCount) {
                    alert(maxCount + "개 이상의 상품을 선택할 수 없습니다.");
                    return;
                }
                var data = new Array();
                $checkbox.each(function () {
                    var param = new Object(); 
                    $(this).siblings(".data").children("input[type='hidden']").each(function () {
                        var $this = $(this); 
                        param[$this.attr("class")] = $this.val();
                    });
                    data.push(param);
                });
                opener.parent.windowPopupCallback("common.popup.product.search", data);
                self.close();
            });
        });
    </script>
</body>
</html>
