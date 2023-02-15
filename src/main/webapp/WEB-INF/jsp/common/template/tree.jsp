<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="float: left; margin-right: 5px; padding: 10px 20px 10px 10px; border: solid 1px #ccc; width: 15%">
    <ul id="customTree" class="filetree treeview-famfamfam">
        <ui:tree list="${requestScope[param.listName] }" colIdx="${param.colAs }_IDX" colName="${param.colAs }_NM" colLevel="${param.colAs }_LEVEL" colLeaf="${param.colAs }_LEAF"/>
    </ul>
</div>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins/jquery.treeview.js"></script>
<script>
function Tree (callback) {
    var $tree = $("#customTree");
    <%-- 트리 객체 생성 --%>
    $tree.treeview();
    <%-- 폴더 클릭 이벤트 --%>
    $tree.on("click", ".folder", function() {
        var $this = $(this);
        var treeData = $this.data("tree_data");
        if (typeof(treeData) != "undefined") {
            callback.call(this, eval(treeData));
        }
    });
}
</script>