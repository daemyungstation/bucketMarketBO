<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="contents-inner" data-cmn_com_idx="<c:out value="${commandMap.CMN_COM_IDX }"/>">
    <h3 class="title">
        <span>카테고리 상세</span>
    </h3>
    
    <table cellspacing="0" class="table-row table-a">
        <colgroup>
            <col style="width: 20%;"/>
            <col style="width: auto;" />
        </colgroup>
        <tbody>
            <tr>
                <th>
                    <span>현재 카테고리</span>
                </th>
                <td>
                    <c:out value="${commandMap.PRD_CTG_PATH }" escapeXml="false"/>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="grid section-button-list">
        <div class="col-1-1 text-right">
            <a href="javascript:;" id="save" class="button small info">
                <span>순서저장</span>
            </a>
        </div>
    </div>
    <form id="frm" name="frm">
        <table cellspacing="0" class="table-col table-b">
            <colgroup>
                <col style="width: 10%;" />
                <col style="width: 20%;" />
                <col style="width: auto;" />
                <col style="width: 20%;" />
                <col style="width: 20%;" />
                <col style="width: 10%;" />
            </colgroup>
            <thead>
                <tr>
                    <th>전시순서</th>
                    <th>상품유형</th>
                    <th>온라인상품명</th>
                    <th>지원혜택</th>
                    <th>모델명</th>
                    <th>노출상태</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="row" items="${list }" varStatus="i">
                            <tr class="tr-sort" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                <td>
                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                    <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                </td>
                                <td>
                                    <c:out value="${row.PRD_MST_TYPE_NM }"/>
                                </td>
                                <td>
                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                        <c:out value="${row.PRD_MST_NM }"/>
                                    </a>
                                </td>
                                <td>
                                    <c:out value="${row.PRD_MST_SPL_NM }"/>
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
    </form>
</div>
<script>
    $(function () {
        var $contents = $(".contents-inner"),
            $frm = $contents.find("#frm");
        <%-- 상품 상세 이동 --%>
        $contents.on("click", ".product-detail", function() {
            $.common.popup.product.detail($(this).data("prd_mst_no"));
        });
        <%-- 순서변경 --%>
        $frm.on("click", ".row-sort", function() {
            var $this = $(this);
            var $tr = $this.closest("tr.tr-sort");
            if ($this.data("sort_type") == "up" && $tr.prev().length > 0) {
                $tr.prev().before($tr.clone());
                $tr.remove();
            } else if ($this.data("sort_type") == "down" && $tr.next().length > 0) {
                $tr.next().after($tr.clone());
                $tr.remove();
            }
        });
        <%-- 순서저장 버튼 클릭 이벤트 --%>
        $contents.on("click", "#save", function() {
            var $tr = $frm.find(".tr-sort");
            if ($tr.length > 0) {
                if (confirm("저장 하시겠습니까?")) {
                    var array = new Array();
                    $tr.each(function (i) {
                        var param = new Object();
                        param.PRD_MST_NO = $(this).data("prd_mst_no");
                        param.PRD_MST_SRT = (i + 1);
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("Modify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                    });
                }
            }
        });
    });
    
</script>