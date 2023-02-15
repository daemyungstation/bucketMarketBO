<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="contents-inner" data-cmn_com_idx="<c:out value="${commandMap.CMN_COM_IDX }"/>">
    <h3 class="title">
        <span><c:out value="${commandMap.CMN_COM_PATH }" escapeXml="false"/></span>
    </h3>
    <div class="grid section-button-list">
        <div class="col-1-2 text-left"><c:out value="${commandMap.CMN_COM_ETC1 }"/>(필수상품 <c:out value="${commandMap.CMN_COM_ETC2 }"/>개, 최대 <c:out value="${commandMap.CMN_COM_ETC3 }"/>개)</div>
        <div class="col-1-2 text-right">
            <a href="javascript:;" id="remove" class="button small">
                <span>선택삭제</span>
            </a>
            <a href="javascript:;" id="search-product-popup" class="button small primary" "title="새 창 으로 열립니다.">
                <span>상품추가</span>
            </a>
        </div>
    </div>
    <form id="frm" name="frm">
        <table cellspacing="0" class="table-col table-b">
            <colgroup>
                <col style="width: 4%;" />
                <col style="width: 20%;" />
                <col style="width: auto;" />
                <col style="width: 10%;" />
                <col style="width: 10%;" />
            </colgroup>
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" class="checkbox check-all" />
                    </th>
                    <th>온라인 상품코드</th>
                    <th>전시 타이틀</th>
                    <th>노출상태</th>
                    <th>전시순서</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="row" items="${list }" varStatus="i">
                            <tr class="tr-<c:out value="${row.PRD_MST_NO }"/>">
                                <td class="col-sort">
                                    <input type="checkbox" class="checkbox check-row" value="" />
                                </td>
                                <td>
                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>">
                                        <c:out value="${row.PRD_MST_NO }"/>
                                    </a>
                                </td>
                                <td class="left" style="padding-left: 10px">
                                    <input type="text" name="DSP_MST_TXT" class="text xlarge" value="<c:out value="${row.DSP_MST_TXT }" />" data-prd_mst_no="<c:out value="${row.PRD_MST_NO }"/>" maxlength="70"/>
                                </td>
                                <td>
                                    <c:out value="${Product.DISPLAYS[row.PRD_MST_DPL_YN] }"/>
                                </td>
                                <td>
                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                    <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
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
    <div class="section-button">
        <div class="wrap text-center">
            <a href="javascript:;" id="save" class="button small primary">
                <span>저장</span>
            </a>
        </div>
    </div>
</div>
<script id="productDisplayTemplate" type="text/x-jquery-tmpl">
    <tr class="tr-\${PRD_MST_NO}">
        <td class="col-sort">
            <input type="checkbox" class="checkbox check-row" value="" />
        </td>
        <td>
            <a href="javascript:;" class="product-detail" data-prd_mst_no="\${PRD_MST_NO}">
                \${PRD_MST_NO}
            </a>
        </td>
        <td class="left" style="padding-left: 10px">
            <input type="text" name="DSP_MST_TXT" class="text xlarge" value="\${PRD_MST_NM}" data-prd_mst_no="\${PRD_MST_NO}" maxlength="70"/>
        </td>
        <td>
            \${PRD_MST_DPL_TXT}
        </td>
        <td>
            <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
            <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
        </td>
    </tr>
</script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
<script>
    $(function () {
        var $contents = $(".contents-inner"),
            $frm = $contents.find("#frm"),
            $tbody = $frm.find("tbody");
        
        var $productDisplayTemplate = $("#productDisplayTemplate");
        <%-- 폼체크 --%>
        $frm.validate({
            ignore : [],
            rules : {
                DSP_MST_TXT : {
                    required : true
                }
            },
            messages : {
                DSP_MST_TXT : {
                    required : "[전시 타이틀]은(는) 필수입력 사항입니다."
                }
            }
        });
        <%-- 체크박스 변경 이벤트 --%>
        $.checkBoxSelect("check-all", "check-row");
        <%-- 상품 상세 이동 --%>
        $frm.on("click", ".product-detail", function() {
            $.common.popup.product.detail($(this).data("prd_mst_no"));
        });
        <%-- 상품 검색 공통 팝업 --%>
        $contents.on("click", "#search-product-popup", function() {
            var maxCount = StringUtil.getInt("<c:out value="${commandMap.CMN_COM_ETC3 }"/>", 0);
            var currentCount = $frm.find(".check-row").length;
            if (currentCount >= maxCount) {
                alert("상품은 최대 " + maxCount + "개 까지만 추가 가능합니다.");
                return;
            }
            $.common.popup.product.search(function (data) {
                var html = new Array();
                $.each(data, function(i, row) {
                    if (!isProductDup(row.PRD_MST_NO)) {
                        html.push($productDisplayTemplate.tmpl(row));
                    }
                });
                $tbody.find(".td_no_result").closest("tr").remove();
                $tbody.append(html);
            }, maxCount - currentCount);
        });
        <%-- 상품 중복 체크 --%>
        isProductDup = function (PRD_MST_NO) {
            return ($frm.find(".tr-" + PRD_MST_NO).length > 0);
        };
        <%-- 순서변경 --%>
        $frm.on("click", ".row-sort", function() {
            var $this = $(this);
            var $tr = $this.closest("tr");
            if ($this.data("sort_type") == "up" && $tr.prev().length > 0) {
                $tr.prev().before($tr.clone());
                $tr.remove();
            } else if ($this.data("sort_type") == "down" && $tr.next().length > 0) {
                $tr.next().after($tr.clone());
                $tr.remove();
            }
        });
        <%-- 전시 항목 삭제 --%>
        $contents.on("click", "#remove", function() {
            var $tr = $frm.find(".check-row:checked").closest("tr");
            if ($tr.length == 0) {
                alert("삭제할 상품을 선택해주십시오.");
                return;
            }
            $tr.remove();
            if ($tbody.find("tr").length == 0) {
                $tbody.append(TagUtil.createEmptyTr());
                TagUtil.setEmptyColspan();
            }
        });
        <%-- 전시 항목 저장 --%>
        $contents.on("click", "#save", function() {
            var $target = $frm.find("input[name='DSP_MST_TXT']");
            if ($frm.valid() && $target.length > 0) {
                if (confirm("저장하시겠습니까?")) {
                    var array = new Array();
                    $target.each(function (index) {
                        var $this = $(this);
                        var param = new Object();
                        param.PRD_MST_NO = $this.data("prd_mst_no");
                        param.DSP_MST_TXT = $this.val();
                        param.DSP_MST_SRT = (index + 1);
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("Regist"), {"CMN_COM_IDX" : $contents.data("cmn_com_idx"), "PARAMS" : JSON.stringify(array)}, function(data) {
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