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
        <div id="contents">
            <!-- contents -->
            <div class="container">
                <i class="icon"></i>
                <!-- container -->
                <h2 class="title" style="padding-top: 0px;">
                    <span>플래너 선택</span>
                </h2>
                <h3 class="title">
                    <span>검색</span>
                </h3>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="PRP_LIST" value="<c:out value="${commandMap.PRP_LIST }"/>" />
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
                            <th>
                                <span>이름</span>
                            </th>
                            <td>
                                <input type="text" name="searchRdpMstMemNm" id="searchRdpMstMemNm" class="text large" value="<c:out value="${commandMap.searchRdpMstMemNm }"/>" />
                            </td>
                            <th>
                                <span>이메일주소</span>
                            </th>
                            <td>
                                <input type="text" name="searchRdpMstMail" id="searchRdpMstMail" class="text large" value="<c:out value="${commandMap.searchRdpMstMail }"/>" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>플래너 번호</span>
                            </th>
                            <td>
                                <input type="text" name="searchRdpMstNo" id="searchRdpMstNo" class="text large" value="<c:out value="${commandMap.searchRdpMstNo }"/>" />
                            </td>
                            <th>
                                <span>-</span>
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>연락처 뒤 4 자리</span>
                            </th>
                            <td>
                                <input type="text" name="searchRdpMstHp3" id="searchRdpMstHp3" class="text large" value="<c:out value="${commandMap.searchRdpMstHp3 }"/>" />
                            </td>
                            <th>
                                <span>소속</span>
                            </th>
                            <td>
                                <input type="radio" id="searchRdpMstDmYn0" class="radio" name="searchRdpMstDmYn" value="" <c:if test="${empty commandMap.searchRdpMstDmYn }">checked="checked"</c:if>/>
                                <label for="searchRdpMstDmYn0">전체</label>
                                <input type="radio" id="searchRdpMstDmYn1" class="radio" name="searchRdpMstDmYn" value="N" <c:if test="${commandMap.searchRdpMstDmYn eq 'N' }">checked="checked"</c:if>/>
                                <label for="searchRdpMstDmYn1">일반</label>
                                <input type="radio" id="searchRdpMstDmYn2" class="radio" name="searchRdpMstDmYn" value="Y" <c:if test="${commandMap.searchRdpMstDmYn eq 'Y' }">checked="checked"</c:if>/>
                                <label for="searchRdpMstDmYn2">임직원</label>
                                <%-- 임직원 --%>
                                <c:if test="${commandMap.searchRdpMstDmYn ne 'Y' }">
                                    <input type="text" name="searchRdpMstDmNo" id="searchRdpMstDmNo" class="text" disabled="disabled" placeholder="사번"/>
                                </c:if>
                                <c:if test="${commandMap.searchRdpMstDmYn eq 'Y' }">
                                    <input type="text" name="searchRdpMstDmNo" id="searchRdpMstDmNo" class="text" value="<c:out value="${commandMap.searchRdpMstDmNo }"/>"/>
                                </c:if>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <!-- // table -->
                </form>
                <div class="grid section-button-search">
                    <!-- 검색 하단 버튼 -->
                    <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                        <span>검색조건 초기화</span>
                    </a>
                    <a href="#none" id="search" class="button small primary">
                        <span>검색</span>
                    </a>
                </div>

                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="searchRdpMstMemNm" value="<c:out value="${commandMap.searchRdpMstMemNm }"/>" />
                    <input type="hidden" name="searchRdpMstNo" value="<c:out value="${commandMap.searchRdpMstNo }"/>" />
                    <input type="hidden" name="searchRdpMstMail" value="<c:out value="${commandMap.searchRdpMstMail }"/>" />
                    <input type="hidden" name="searchRdpMstHp3" value="<c:out value="${commandMap.searchRdpMstHp3 }"/>" />
                    <input type="hidden" name="searchRdpMstDmYn" value="<c:out value="${commandMap.searchRdpMstDmYn }"/>" />
                    <input type="hidden" name="searchRdpMstDmNo" value="<c:out value="${commandMap.searchRdpMstDmNo }"/>" />
                    <input type="hidden" name="PRP_LIST" value="<c:out value="${commandMap.PRP_LIST }"/>" />


                    <div class="grid section-button-list">
                        <!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                            <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                        </div>

                        <div class="all-delete">
                            <a href="javascript:;" id="all-delete-btn" class="button samll primary" >
                                <span>전체삭제</span>
                            </a>
                        </div>
                    </div>
                    <div class="box-scroll-table">
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 3%;" />
                                <col style="width: 3%;" />
<%--                                <col style="width: auto;" />--%>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" class="checkbox check-all"/>
                                </th>
                                <th>NO</th>
<%--                                <th>고유번호</th>--%>
                                <th>플래너번호</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>아이디</th>
                                <th>사업자유형</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${not empty list}">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="checkbox check-row"/>
                                                <span class="data">
                                                    <input type="hidden" name="RDP_MST_IDX" class="RDP_MST_IDX" value="<c:out value="${row.RDP_MST_IDX }"/>" />
                                                    <input type="hidden" name="RDP_MST_NO" class="RDP_MST_NO" value="<c:out value="${row.RDP_MST_NO }"/>" />
                                                    <input type="hidden" name="RDP_MST_MEM_NM" class="RDP_MST_MEM_NM" value="<c:out value="${row.RDP_MST_MEM_NM }"/>" />
                                                </span>
                                            </td>
                                            <td>
                                                <c:out value="${paging.listNum - i.index }" />
                                            </td>
<%--                                            <td>--%>
<%--                                                <c:out value="${row.RDP_MST_IDX }"/>--%>
<%--                                            </td>--%>
                                            <td>
                                                <a href="javascript:;" class="list-title" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>">
                                                    <c:out value="${row.RDP_MST_NO }"/>
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_MEM_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_HP1 }"/>-<c:out value="${row.RDP_MST_HP2 }"/>-<c:out value="${row.RDP_MST_HP3 }"/>
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_ID }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_BUSI_CLS_NM }" />
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
                    </div>
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
                </form>
            </div>
            <!-- // container -->
        </div>
        <!-- // contents -->
        </div> <!-- //modal-inner -->
    </div> <!-- //modal-wrapper -->
</div> <!-- //modal -->

<%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
<script>
    $(function() {
        var $popup = $(".popup"),
            $frm = $popup.find("#frm"),
            $searchForm = $popup.find("#searchForm");
        // 소속
        $popup.on("change", "input[name='searchRdpMstDmYn']", function() {
            $('#searchRdpMstDmNo').val('');
            $('#searchRdpMstDmNo').attr('disabled', $("input[name='searchRdpMstDmYn']:checked").val() != 'Y');
        });
        // 검색
        $popup.on("click", "#search", function() {
            $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
            $searchForm.find("input[name='PRP_LIST']").val($frm.find("input[name='PRP_LIST']").val());
            $searchForm.postSubmit($.action.common.popup("basicPlannerSearch"));
        });
        // 페이지 이동
        goPage = function(cPage) {
            $frm.find("input[name='cPage']").val(cPage);
            $frm.postSubmit($.action.common.popup("basicPlannerSearch"));
        };
        // 플래너 번호
        $popup.on("click", ".list-title", function() {
            $.common.popup.planner.detail($(this).data("rdp_mst_idx"));
        });
        var PRP_LIST = $frm.find("input[name='PRP_LIST']").val() != "" ? JSON.parse( StringUtil.atou($frm.find("input[name='PRP_LIST']").val())) : [];
        <%-- 체크박스 변경 이벤트 --%>
        $.checkBoxSelect("check-all", "check-row");
        $popup.on("change", ".check-row", (t) => {
            let rdpMstIdx = $(t.target).siblings(".data").find(".RDP_MST_IDX").val();
            if( $(t.target).val() == "on" ) {
                var param = {};
                $(t.target).siblings(".data").children("input[type='hidden']").each(function () {
                    var $this = $(this);
                    param[$this.attr("class")] = $this.val();
                });
                if( PRP_LIST.findIndex( t => t.RDP_MST_IDX == rdpMstIdx)  < 0) {
                    PRP_LIST.push(param);
                }

            } else {
                PRP_LIST.forEach(function (item, index, object) {
                    if (item.RDP_MST_IDX === rdpMstIdx) {
                        PRP_LIST.splice(index, 1);
                    }
                });
            }
            $frm.find("input[name='PRP_LIST']").val(StringUtil.utoa(JSON.stringify(PRP_LIST)));
        });
        <%-- 전체삭제버튼 클릭 이벤트 --%>
        $popup.on("click", "#choice", function() {
            var $checkbox = $popup.find(".check-row:checked");
            // if ($checkbox.length == 0) {
            //     alert("플래너를 선택해 주세요.");
            //     return;
            // }
            var data = PRP_LIST;
            $checkbox.each(function () {
                var param = {};
                $(this).siblings(".data").children("input[type='hidden']").each(function () {
                    var $this = $(this);
                    param[$this.attr("class")] = $this.val();
                });
                if( PRP_LIST.findIndex( t => t.RDP_MST_IDX == param.RDP_MST_IDX)  < 0) {
                    data.push(param);
                }
            });
            opener.parent.windowPopupCallback("common.popup.planner.search", data);
            self.close();
        });

        <%-- 선택버튼 클릭 이벤트 --%>
        $popup.on("click", "#all-delete-btn", function() {
            var $checkbox = $popup.find(".check-row:checked");
            opener.parent.windowPopupCallback("common.popup.planner.search", []);
            self.close();
        });

        if( PRP_LIST.length > 0 ) {
            PRP_LIST.forEach( t =>   {
              let rdpMstIdxInput = $frm.find("input[name='RDP_MST_IDX'][value='" + t.RDP_MST_IDX + "']");
              rdpMstIdxInput.closest("td").find('.checkbox').attr('checked', true);
            });
        }
    });
</script>
</body>
</html>
