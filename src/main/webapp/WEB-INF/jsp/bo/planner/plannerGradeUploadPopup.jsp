<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="planner" data-menu_subclass="plannerGrade">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
            
                <%-- 타이틀 --%>
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>등급부여</span>
                    </h2>
                </div>
                
                <h3 class="title">
                    <span>등급</span>
                </h3>
                <table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                <label class="label">
                                    <span>등급명</span>
                                </label>
                            </th>
                            <td>
                                <c:out value="${info.RDP_LVL_NM }" />
                            </td>
                        </tr>
                    </tbody>
                </table> 
                
                <h3 class="title">
                    <span>등급부여</span>
                </h3>
                <%-- 등급부여 --%>
                <form id="frm" name="frm" enctype="multipart/form-data">
                    
                    <input type="hidden" name="RDP_LVL_IDX" value="<c:out value="${commandMap.RDP_LVL_IDX }"/>" />
                    <p>
                        <span><i class="require"><em>필수입력</em></i></span>아래의 샘플 양식 파일을 다운받은 후 양식에 맞게 입력하신 후 업로드 하시기 바랍니다.
                    </p>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 20%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>파일 업로드</span>
                                    </label>
                                </th>
                                <td>
                                    <spring:eval var="fileSize" expression="@file['file.max.byte.size.excel']"/>
                                    <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                        <jsp:param name="fileListName" value="fileList"/>
                                        <jsp:param name="fileName" value="EXCEL"/>
                                        <jsp:param name="order" value="0"/>
                                        <jsp:param name="isMulti" value="false"/>
                                        <jsp:param name="maxCount" value="1"/>
                                        <jsp:param name="allow" value="excel"/>
                                        <jsp:param name="size" value="${fileSize }"/>
                                    </jsp:include>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>샘플 양식</span>
                                    </label>
                                </th>
                                <td>
                                    <a href="javascript:;" id="sampleDownload" class="button large">sample.xls 다운로드</a>
                                </td>
                            </tr>
                        </tbody>
                    </table> 
                    
                </form>
                
                <%-- 엑셀 다운르도 --%>
                <form id="excelForm" name="excelForm"></form>
                
                <%-- 저장/닫기 --%>
                <div class="grid section-button-search">
                    <a href="javascript:;" id="save" class="button small primary">
                        <span>저장</span>
                    </a>
                    <a href="javascript:self.close();" class="button small">
                        <span>닫기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <%@ include file="/WEB-INF/jsp/common/template/zipCode.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm"),
                $excelForm = $popup.find("#excelForm");
            // 폼 체크
            $frm.validate({
                rules : {
                    EXCEL : { required : true }
                },
                messages : {
                    EXCEL : { required : "파일을 선택해주세요." }
                }
            });
            // 샘플 다운로드
            $popup.on("click", "#sampleDownload", function() {
                $excelForm.postSubmit($.action.exceldownload("Sample"));
            });
            // 저장
            $popup.on("click", "#save", function() {
                // 저장
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("Upload"));
                    }
                }
            });
        });
    </script>
</body>
</html>
