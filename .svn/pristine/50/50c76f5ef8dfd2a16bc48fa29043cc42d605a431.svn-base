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
                        <span>혜택/지원(포인트) 조회</span>
                    </h2>
                    <h3 class="title">
                        <span>검색</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: 35%;" />
                                <col style="width: 15%;" />
                                <col style="width: 35%;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>납입일</span>
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
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall">
                                            <span>두달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>제휴업체</span>
                                    </th>
                                    <td>
                                        <c:if test="${not isScm }">
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
                                        </c:if>
                                        <c:if test="${isScm }">
                                            <c:out value="${sessionManager.VDR_MST_NM }"/>
                                        </c:if>
                                    </td>
                                    <th>
                                        <span>모델분류(지원혜택)</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstMdTypeAndSplNm" id="searchPrdMstMdTypeAndSplNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>" maxlength="40"/>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <th>
                                        <span>회원번호</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchAccntNo" id="searchAccntNo" class="text xlarge" value="<c:out value="${commandMap.searchAccntNo }"/>"/>
                                    </td>
                                    <th>
                                        <span>연락처 뒤 4자리</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchCell" id="searchCell" class="text xlarge" value="<c:out value="${commandMap.searchCell }"/>"/>
                                    </td>                                  
                                </tr>
                                <tr>
                                    <th>
                                        <span>온라인 상품명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchPrdMstNm }"/>" maxlength="20"/>
                                    </td>
                                    <th>
                                        <span>기간계 상품코드</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchProdCd" id="searchProdCd" class="text serach-text xlarge" value="<c:out value="${commandMap.searchProdCd }"/>" maxlength="20"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>고객명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchMemNm" id="searchMemNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchMemNm }"/>" maxlength="20"/>
                                    </td>                                
                                    <th>
                                        <span>지급상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="searchBnfYn0" class="radio" name="searchBnfYn" value="" <c:if test="${empty commandMap.searchBnfYn }">checked="checked"</c:if>/>
                                        <label for="searchBnfYn0">전체</label>
                                        <input type="radio" id="searchBnfYn1" class="radio" name="searchBnfYn" value="N" <c:if test="${commandMap.searchBnfYn eq 'N' }">checked="checked"</c:if>/>
                                        <label for="searchBnfYn1">미지급</label>
                                        <input type="radio" id="searchBnfYn2" class="radio" name="searchBnfYn" value="Y" <c:if test="${commandMap.searchBnfYn eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="searchBnfYn2">지급완료</label>
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
                        <input type="hidden" name="ORD_MST_IDX" value="" />
                        <input type="hidden" name="PRD_MST_NO" value="" />
                        <input type="hidden" name="VDR_MST_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchDateType" value="<c:out value="${commandMap.searchDateType }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                        <input type="hidden" name="searchPrdMstMdTypeAndSplNm" value="<c:out value="${commandMap.searchPrdMstMdTypeAndSplNm }"/>" />
                        <input type="hidden" name="searchAccntNo" value="<c:out value="${commandMap.searchAccntNo }"/>" />
                        <input type="hidden" name="searchCell" value="<c:out value="${commandMap.searchCell }"/>" />
                        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
                        <input type="hidden" name="searchProdCd" value="<c:out value="${commandMap.searchProdCd }"/>" />
                        <input type="hidden" name="searchMemNm" value="<c:out value="${commandMap.searchMemNm }"/>" />
                        <input type="hidden" name="searchBnfYn" value="<c:out value="${commandMap.searchBnfYn }"/>" />
                        <div class="grid section-button-list">
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-1 text-right">
                                <a href="javascript:;" id="goExcelDownload" class="button small info">
                                    <span>엑셀다운로드</span>
                                </a>
                                <a href="javascript:;" id="goBatchBenefit" class="button small info">
                                    <span>일괄 지급</span>
                                </a>                                
                            </div>
                        </div>
                        <div class="box-scroll-table">
                            <table cellspacing="0" class="table-col table-b">
                                <colgroup>
                                    <col style="width: 5%;" />
                                    <col style="width: 5%;" />
                                    <col style="width: 5%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: auto;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />                                
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="checkbox check-all" /></th>
                                        <th>NO</th>
                                        <th>상품코드</th>
                                        <th>주문번호</th>
                                        <th>회원번호</th>
                                        <th>고객명</th>
                                        <th>온라인상품명</th>
                                        <th>연락처</th>
                                        <th>납입회차</th>
                                        <th>납입일</th>
                                        <th>제휴업체</th>
                                        <th>모델분류(지원혜택)</th>
                                        <th>가입상태</th>
                                        <th>추가정보</th>
                                        <th>혜택/지급일자</th>
                                        <th>지급내역</th>
                                        <th>지급상태</th>
                                        <th>특이사항</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list }">
                                            <c:forEach var="row" items="${list }" varStatus="i">
                                                <tr <c:if test="${row.KSTBIT eq Dlcc.JOIN_STATE_CANCEL }">
                                                        class="bg-red"
                                                    </c:if>
                                                    <c:if test="${row.UPD_YN eq 'Y' }">
                                                        class="bg-yellow"
                                                    </c:if>
                                                >
                                                    <td>
                                                    <c:if test="${row.ORD_BNF_YN ne 'Y' }">
                                                        <input type="checkbox" name="SELECT_ORD_BNF_YN" class="checkbox check-row" data-accnt_no="<c:out value="${row.ACCNT_NO }"/>" data-pay_no="<c:out value="${row.PAY_NO}" />" value="Y"/>
                                                    </c:if>
                                                    </td>
                                                    <td>
                                                        <c:out value="${paging.listNum - i.index }" />
                                                    </td>
                                                    <td>
                                                        <a href="https://www.bucketmarket.co.kr/fr/product/basicProductView.do?PRD_MST_NO=${row.PRD_MST_NO }" target="_blank">
                                                            <c:out value="${row.PRD_MST_NO }" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.ORD_MST_IDX }" />
                                                    </td>
                                                    <td>
                                                        <c:if test="${not isScm }">
                                                            <a href="javascript:;" class="order-detail" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                                <c:out value="${row.ACCNT_NO }" />
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${isScm }"><c:out value="${row.ACCNT_NO }" /></c:if>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MEM_NM }" />
                                                    </td>
                                                    <td  class="left">
                                                        <c:if test="${not isScm }">
                                                            <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                                                <c:out value="${row.PRD_MST_NM }" />
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${isScm }"><c:out value="${row.PRD_MST_NM }" /></c:if>
                                                    </td>                                                
                                                    <td>
                                                        <c:out value="${row.CELL}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PAY_NO}" />
                                                    </td>
                                                    <td>
                                                        <ui:formatDate value="${row.PAY_DAY }" pattern="yyyy-MM-dd" />
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="scm_detail" data-vdr_mst_idx="<c:out value="${row.VDR_MST_IDX }"/>">
                                                            <c:out value="${row.VDR_MST_NM}" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MODEL_CL_NM}" />
                                                        <BR>
                                                        <c:out value="${row.PRD_MST_SPL_NM}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.KSTBIT_NM}" />
                                                    </td>
                                                    <td>
                                                        <input type="text" name="ORD_MST_VDR_BNF_ID" id="ORD_MST_VDR_BNF_ID" class="text" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX}"/>" value="<c:out value="${row.ORD_MST_VDR_BNF_ID}" />" maxlength="20"/>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="js-datepickr align-right">
                                                            <span class="icon datepickr">
                                                                <em>날짜선택</em>
                                                            </span>
                                                        </a>
                                                        <input type="text" name="ORD_BNF_DT" id="ORD_BNF_DT" class="text date" value="<ui:formatDate value="${row.ORD_BNF_DT}" pattern="yyyy-MM-dd" />" maxlength="10"/>
                                                    </td>
                                                    <td>
                                                         <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text" value="<c:out value="${row.PRD_MST_SPT_TXT}" />" maxlength="40"/>
                                                    </td>
                                                    <td class="benefit-yn">
                                                        <c:out value="${row.ORD_BNF_YN eq 'Y' ? '지급완료' : '미지급' }" />
                                                        <br>
                                                        <c:if test="${row.ORD_BNF_YN eq 'N'}">
                                                            <a href="javascript:;" class="button xsmall save" data-accnt_no="<c:out value="${row.ACCNT_NO }"/>" data-pay_no="<c:out value="${row.PAY_NO}" />" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                                <span>혜택지급</span>
                                                            </a> 
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.ORD_MEMO_CTS }" />
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="button xsmall benefit-detail" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                            <span>상세</span>
                                                        </a>                                                    
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${empty list}">
                                                <tr>
                                                    <td class="td_no_result"></td>
                                                </tr>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                        <div class="section-pagination">
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
                    </form>
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
    <form name="giveForm" id="giveForm"></form>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function() {
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm")
                $searchForm = $wrapper.find("#searchForm"),
                $giveForm = $("#giveForm");
            <%-- 체크박스 변경 이벤트 --%>
            $.checkBoxSelect("check-all", "check-row");
            <%-- 엑셀다운로드 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            <%-- 일괄 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goBatchBenefit", function() {
                var targetArray = new Array(),
                    tempArray = new Array(),
                    isValid = true;
                if ($wrapper.find(".check-row:checked").length == 0) {
                    alert("일괄지급 대상을 선택해주세요.");
                    return;
                }
                $wrapper.find(".check-row:checked").each(function () {
                    var $this = $(this);
                    var accntNo = $this.data("accnt_no");
                    if (tempArray.indexOf(accntNo) == -1) {
                        if (tempArray.length > 0) {
                            alert("동일 회원번호일 경우에만 일괄지급이 가능합니다.");
                            isValid = false;
                            return false;
                        } else {
                            tempArray.push(accntNo);
                            targetArray.push($this);
                        }
                   } else {
                       tempArray.push(accntNo);
                       targetArray.push($this);
                   }
                });
                if (isValid) {
                    var params = new Array();
                    $.each(targetArray, function (i, target) {
                        params.push(TagUtil.createDynamicInput("hidden", "PAY_NO", target.data("pay_no")));
                        params.push(TagUtil.createDynamicInput("hidden", "ACCNT_NO", target.data("accnt_no")));
                    });
                    $giveForm
                        .empty()
                        .append(params)
                        .postPop($.action.popup("BatchTarget"), "supportBenefitBatchTargetPopup", "width=1000,height=500,left=10,top=10");
                }
            });            
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "input[type='text']", function(e) {
                    if (e.keyCode == 13) {
                        $("#search").trigger("click");
                        return false;
                    }
            });
            <%-- 온라인상품명 a Tag 클릭 이벤트 --%>
            $frm.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
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
            <%-- 주문상세 버튼 클릭 이벤트 --%>
            $frm.on("click", ".order-detail", function() {
                $frm.find("input[name='ORD_MST_IDX']").val($(this).data("ord_mst_idx"));
                $.common.popup.order.detail($(this).data("ord_mst_idx"));
            });
            <%-- 혜택/지원(포인트)상세 버튼 클릭 이벤트 --%>
            $frm.on("click", ".benefit-detail", function() {
                let cPage = $frm.find("input[name='cPage']").val();
                $frm.find("input[name='cPage']").val('1');
                $frm.find("input[name='ORD_MST_IDX']").val($(this).data("ord_mst_idx"));
                $frm.postPop($.action.popup("Detail"), "supportBenefitDetailPopup", "width=1000,height=800,left=10,top=10");
                $frm.find("input[name='cPage']").val(cPage);
            });
            <%-- 지급상태 저장 클릭 이벤트 --%>
            $wrapper.on("click", ".save", function() {
                var $this = $(this),
                    $td = $(this).closest("td").siblings("td");
                var isValid = true, 
                    params = new Object();
                var targets = [["ORD_BNF_DT", "지급일자"], ["ORD_MST_VDR_BNF_ID", "추가정보"], ["PRD_MST_SPT_TXT", "지급내역"]];
                $.each(targets, function (i, target) {
                    var value = $td.find("input[name='" + target[0] + "']").val();
                    if (value != "") {
                        params[target[0]] = value;
                    } else {
                        alert(target[1] + "을(를) 입력하세요.");
                        isValid = false;
                        return false;  
                    } 
                });
                if (isValid) {
                    if (confirm("저장 하시겠습니까?")) {
                        params.ACCNT_NO = $this.data("accnt_no");
                        params.PAY_NO = $this.data("pay_no");
                        params.ORD_MST_IDX = $this.data("ord_mst_idx");
                        $.postSyncJsonAjax($.action.ajax("BatchTargetModify"), params, function(data) {
                            if (data.isSuccess) {
                                alert("저장 되었습니다.");
                                //location.reload();
                                $this.closest("td").siblings("td:first").find("input[type='checkbox']").remove();
                                setBenefitYn($td);
                            } else {
                                alert("저장에 실패하였습니다.");
                            }
                        });
                    }
                }
            });
            function setBenefitYn ($object) {
                stat = "지급완료";
                $object.closest("td").siblings(".benefit-yn").text(stat)
            }
            <%-- 제휴사 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".scm_detail", function() {
                $.common.popup.scm.detail($(this).data("vdr_mst_idx"));
            });
            
        });
    </script>
</body>
</html>