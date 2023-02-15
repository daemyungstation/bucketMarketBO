<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<c:forEach var="level" begin="1" end="${param.maxLevel }" step="1">
    <select name="<c:out value="${param.name }"/><c:out value="${level }"/>" id="<c:out value="${param.name }"/><c:out value="${level }"/>" class="select product-category">
        <option value="">선택</option>
        <c:if test="${level eq 1 and not empty requestScope[param.listName] }">
            <c:set var="paramName" value="${param.name }${level }"/>
            <c:set var="paramValue" value="${requestScope[param.paramName][paramName] }"/>
            <c:forEach var="row" items="${requestScope[param.listName] }" varStatus="fileStat">
                <option value="<c:out value="${row.PRD_CTG_IDX }"/>" <c:if test="${row.PRD_CTG_IDX eq paramValue}">selected="selected"</c:if>><c:out value="${row.PRD_CTG_NM }"/></option>
            </c:forEach>
        </c:if>
    </select>
</c:forEach>
<input type="hidden" name="<c:out value="${param.name }"/>" id="<c:out value="${param.name }"/>" value="<c:out value="${requestScope[param.paramName][param.name] }"/>" data-is_form_clear="true"/>
<script>
$(function () {
    $.fn.requestProductCategoryList = function(PRD_CTG_UP_IDX, PARAM_IDX) {
        var $target = $(this).filter(":first");
        $.postSyncJsonAjax($.action.common.ajax("productCategoryList"), {"PRD_CTG_UP_IDX" : PRD_CTG_UP_IDX}, function(data) {
            var list = data.list;
            var option = "";
            $.each(list, function(i, row) {
                var selected = "";
                if (row.PRD_CTG_IDX == PARAM_IDX) {
                    selected = "selected=\"selected\"";
                }
                option += "<option value=\"" + row.PRD_CTG_IDX  + "\" " + selected + ">" + row.PRD_CTG_NM + "</option>";
            });
            $target.children("option").not(":first").remove();
            $target.append(option);
        });
    }
    $(".product-category").on("change", function() {
        var $this = $(this),
            $prev = $this.prevAll(".product-category"),
            $next = $this.nextAll(".product-category"),
            $target = $("#<c:out value="${param.name }"/>");
        var value = $this.val();
        if ($next.length > 0 && value == "") {
            $next.find("option").not("[value='']").remove();
            if ($prev.length == 0) {
                $target.val(value);
            } else {
                $target.val($prev.filter(":first").val());
            }
        } else if ($next.length == 0 && value == "") {
            $target.val($prev.filter(":first").val());
        } else {
            if (value != "") {
                $next.requestProductCategoryList(value);
                $target.val(value);
            }
        }
    });
    <c:forEach var="level" begin="2" end="${param.maxLevel}" step="1">
        <c:set var="prevParamName" value="${param.name }${level-1}"/>
        <c:set var="prevParamValue" value="${requestScope[param.paramName][prevParamName]}"/>
        <c:set var="paramName" value="${param.name}${level}"/>
        <c:set var="paramValue" value="${requestScope[param.paramName][paramName]}"/>
        <c:if test="${not empty paramValue}">
            $("#<c:out value="${paramName}"/>").requestProductCategoryList("<c:out value="${prevParamValue}"/>", "<c:out value="${paramValue}"/>");
        </c:if>
    </c:forEach>
});
</script>