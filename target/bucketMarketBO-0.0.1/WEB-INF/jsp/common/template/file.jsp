<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="maxFileAddCount" value="${empty param.maxCount ? 5 : param.maxCount }" />
<c:set var="editable" value="${empty param.editable ? true : false }" />
<c:set var="useFileType" value="${empty param.fileType ? false : true }" />
<input type="hidden" name="CMM_FLE_NM" value="<c:out value="${param.fileName }"/>" />
<c:if test="${not empty param.imageWidth }">
    <input type="hidden" name="CMM_FLE_Ws" value="<c:out value="${param.imageWidth }"/>" />
</c:if>
<c:if test="${not empty param.imageHeight }">
    <input type="hidden" name="CMM_FLE_Hs" value="<c:out value="${param.imageHeight }"/>" />
</c:if>

<c:if test="${param.allow eq 'image' and (not empty param.isPreview and param.isPreview) }">
    <style>
        .common-image .thumb img {
          width: <c:out value="${not empty param.imageWidth ? param.imageWidth : 200 }"/>px;
          height: <c:out value="${not empty param.imageHeight ? param.imageHeight : 200 }"/>px;
          border: 1px solid #ddd;
          background-color: #f5f5f5;
          margin-bottom: 15px;
        }
    </style>
</c:if>
<table class="file-table<c:out value="${param.order }"/> table-a">
    <c:if test="${not empty requestScope[param.fileListName] }">
        <c:forEach var="fileRow" items="${requestScope[param.fileListName] }" varStatus="fileStat">
            <tr>
                <td class="col-1-2 text-left">
                    <c:if test="${param.allow eq 'image' and (not empty param.isPreview and param.isPreview) }">
                        <div class="grid common-image">
                            <div class="col thumb">
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${fileRow.CMM_FLE_ATT_PATH }"/><c:out value="${fileRow.CMM_FLE_SYS_NM }"/>" class="pic preview"/>
                            </div>
                        </div>
                    </c:if>
                    <a href="javascript:;" class="file-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>">
                        <span><c:out value="${fileRow.CMM_FLE_ORG_NM }" /></span>
                    </a>
                    <c:if test="${editable }">
                        <a href="javascript:;" class="file-remove fonti-remove" style="color: red;" data-cmm_fle_del_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>">
                            <i class="fonti um-remove"></i>
                        </a>
                    </c:if>
                </td>
                <c:if test="${editable and param.isMulti and fileStat.first }">
                    <td class="col-1-2 text-right">
                        <a href="javascript:;" class="button file-add">
                            <span>추가</span>
                        </a>
                    </td>
                </c:if>
                <c:if test="${editable and param.isMulti and not fileStat.first }">
                    <td class="col-1-2 text-right">
                        <a href="javascript:;" class="button warning file-remove" data-cmm_fle_del_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>">
                            <span>삭제</span>
                        </a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty requestScope[param.fileListName] }">
        <tr>
            <td class="col-1-2 text-left">
                <c:if test="${param.allow eq 'image' and (not empty param.isPreview and param.isPreview) }">
                    <div class="grid common-image">
                        <div class="col thumb">
                            <img class="pic preview" style="display:none;"/>
                        </div>
                    </div>
                </c:if>
                <input type="file" name="<c:out value="${param.fileName }"/>" class="file" value="" />
                <c:if test="${useFileType }">
                    <input type="hidden" name="CMM_FLE_TB_TYPEs" value="${param.fileType }" />
                </c:if>
                <a href="javascript:;" class="file-remove fonti-remove" style="display: none; color: red;">
                    <i class="fonti um-remove"></i>
                </a>
            </td>
            <c:if test="${param.isMulti }">
                <td class="col-1-2 text-right">
                    <a href="javascript:;" class="button file-add">
                        <span>추가</span>
                    </a>
                </td>
            </c:if>
        </tr>
    </c:if>
</table>
<c:choose>
    <c:when test="${param.allow eq 'image'}">
        <spring:eval var="allows" expression="@file['file.allowed.extensions.image']" />
    </c:when>
    <c:when test="${param.allow eq 'excel'}">
        <spring:eval var="allows" expression="@file['file.allowed.extensions.excel']" />
    </c:when>
    <c:when test="${param.allow eq 'video'}">
        <spring:eval var="allows" expression="@file['file.allowed.extensions.video']" />
    </c:when>
    <c:otherwise>
        <spring:eval var="allows" expression="@file['file.allowed.extensions.default']" />
    </c:otherwise>
</c:choose>
<p>
    <small class="desc">
        <span>* 업로드 가능 파일 : </span>
        <span>
            <c:forTokens var="allow" items="${allows }" delims="\\|" varStatus="allowStat">
                <c:out value="${allow }" />
                <c:if test="${not allowStat.last }">,&nbsp;</c:if>
            </c:forTokens>
        </span>
    </small>
</p>
<small class="desc">* 업로드 가능 용량 : <ui:byteCal bytes="${param.size }"/></small>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
<script id="fileTemplate<c:out value="${param.order }"/>Template" type="text/x-jquery-tmpl">
    <input type="file" name="<c:out value="${param.fileName }"/>" class="file" value=""/>
    <c:if test="${useFileType }">
        <input type="hidden" name="CMM_FLE_TB_TYPEs" value="${param.fileType }" />
    </c:if>
</script>
<script id="fileRowTemplate<c:out value="${param.order }"/>Template" type="text/x-jquery-tmpl">
    <tr>
        <td class="col-1-2 text-left">
            <c:if test="${param.allow eq 'image' and (not empty param.isPreview and param.isPreview) }">
                <div class="grid common-image">
                    <div class="col thumb">
                        <img class="pic preview" style="display:none;"/>
                    </div>
                </div>
            </c:if>
            {{tmpl "#fileTemplate<c:out value="${param.order }"/>Template"}}
            <c:if test="${editable}">
                <a href="javascript:;" class="file-remove fonti-remove" style="display:none; color: red;"><i class="fonti um-remove"></i></a>
            </c:if>
        </td>
        <td class="col-1-2 text-right">
            <a href="javascript:;" class="button warning file-remove"><span>삭제</span></a>
        </td>
    </tr>
</script>
<script id="fileKeyTemplate<c:out value="${param.order }"/>Template" type="text/x-jquery-tmpl">
    <input type="hidden" name="\${INPUT_NAME}" value="\${CMM_FLE_IDX}" />
</script>
<script>
    $(function() {
        var $fileTable = $(".file-table<c:out value="${param.order }"/>");
        var $fileTemplate = $("#fileTemplate<c:out value="${param.order }"/>Template"), 
            $fileRowTemplate = $("#fileRowTemplate<c:out value="${param.order }"/>Template"), 
            $fileKeyTemplate = $("#fileKeyTemplate<c:out value="${param.order }"/>Template");
        
        var fileUtil = new FileUtil();
        
        <%-- 파일 다운로드 이벤트 --%>
        $fileTable.on("click", ".file-title", function() {
            $.common.file.download($(this).data("cmm_fle_idx"));
        });
        <%-- 파일 추가 이벤트 --%>
        $fileTable.on("click", ".file-add", function() {
            var maxCount = <c:out value="${maxFileAddCount }"/>;
            if ($fileTable.find("tr").length < maxCount) {
                $fileRowTemplate.tmpl().appendTo($fileTable);
            }
        });
        <%-- 파일 삭제 이벤트 --%>
        $fileTable.on("click", ".file-remove", function() {
            var $this = $(this);
            var cmmFleDelIdx = $this.data("cmm_fle_del_idx");
            if (typeof (cmmFleDelIdx) != "undefined") {
                if ($fileTable.find("input[value='" + cmmFleDelIdx + "']").length == 0) {
                    $fileKeyTemplate.tmpl({INPUT_NAME : "CMM_FLE_DEL_IDXs", CMM_FLE_IDX : cmmFleDelIdx}).prependTo($fileTable);
                }
                if ($this.hasClass("fonti-remove")) {
                    $this.removeAttr("data-cmm_fle_del_idx");
                    $this.removeData("cmm_fle_del_idx");
                    $this.siblings(".file-title").remove();
                    $this.before($fileTemplate.tmpl());
                }
            }
            if ($this.hasClass("fonti-remove")) {
                $this.siblings(".file").val("");
                $this.hide();
                fileUtil.imageClear($this.siblings(".common-image").find(".preview"));
            } else {
                $this.closest("tr").remove();
            }
        });
        <%-- 파일 변경 이벤트 --%>
        $fileTable.on("change", ".file", function() {
            var $this = $(this);
            if ($this.val() != "") {
                if (fileUtil.validFileExt($this.val()) && fileUtil.validFileSize(this)) {
                    $this.siblings(".fonti-remove").show();
                    <c:if test="${param.allow eq 'image' and (not empty param.isPreview and param.isPreview) }">
                        fileUtil.readFile(this);
                    </c:if>
                } else {
                    $this.val("");
                    $this.siblings(".fonti-remove").hide();
                    fileUtil.imageClear($this.siblings(".common-image").find(".preview"));
                }
            } else {
                $this.siblings(".fonti-remove").hide();
                fileUtil.imageClear($this.siblings(".common-image").find(".preview"));
            }
        });
        
        function FileUtil () {
            <%-- 첨부파일 확장자 확인 --%>
            this.validFileExt = function (value) {
                var valid = false,
                    extName = value.substring(value.lastIndexOf(".") + 1).toLowerCase(),
                    allows = "<c:out value="${allows }"/>".split("|");
                for (var i = 0; i < allows.length; i++) {
                    if (extName == $.trim(allows[i])) {
                        valid = true;
                        break;
                    }
                }
                if (!valid) {
                    alert("업로드 불가능한 파일 입니다.\n*업로드 가능 파일[" + allows.join(", ") + "]");
                }
                return valid;
            }
            <%-- 첨부파일 용량 확인 --%> 
            this.validFileSize = function (object) {
                var valid = false,
                    sizeinbytes = 0;
                if (window.ActiveXObject) {
                    sizeinbytes = new ActiveXObject("Scripting.FileSystemObject").getFile(object.value).size;
                } else { 
                    sizeinbytes = object.files[0].size;
                }
                var i = 0,
                    fSExt = ["Bytes", "KB", "MB", "GB"],
                    maxSize = parseInt("<c:out value="${param.size}"/>");
                while (maxSize > 900) {
                    maxSize /= 1024;
                    i++;
                }
                if (sizeinbytes > parseInt("<c:out value="${param.size}"/>")) {
                    alert("첨부파일은 " + ((Math.round(maxSize * 100) / 100) + fSExt[i]) + " 이하로 등록가능합니다.");
                } else {
                    valid = true;
                }
                return valid;
            }
            <%-- 이미지 미리보기 --%>
            this.readFile = function (object) {
                if (object.files && object.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var $img = $(object).siblings(".common-image").find(".preview");
                        $img.attr("src", e.target.result);
                        $img.show();
                    }
                    reader.readAsDataURL(object.files[0]);
                }
            }
            <%-- 이미지 초기화 --%>
            this.imageClear = function ($img) {
                $img.removeAttr("src");
                $img.hide();
            }
        }
    });
</script>