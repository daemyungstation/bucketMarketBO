<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="board" data-menu_subclass="faqBoard">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h3 class="title">
                        <span>FAQ 일괄 순서변경</span>
                    </h3>
                </div>
                <p>
                    <span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="sampleForm" name="sampleForm">
                    <input type="hidden" name="BRD_FAQ_SAMPLE_YN" value="Y" />
                </form>
                <form id="frm" name="frm" enctype="multipart/form-data">
                    <input type="hidden" name="BRD_FAQ_EXCEL_YN" value="Y" />
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 30%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>엑셀 업로드<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <input type="file" name="EXCEL" class="file" value="" />
                                    <p>
                                        <small class="desc">*아래의 샘플 양식 파일을 다운받은 후 정렬순서를 입력하신 후 업로드 하시기 바랍니다.</samll>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>샘플 양식</span>
                                    </label>
                                </th>
                                <td>
                                    <a href="javascript:;" id="goSampleDownload">Sample 다운로드</a>
                                    <p>
                                        <small class="desc">먼저 Excel 등록 양식을 내려 받은 후에 엑셀 파일에 내용을 추가하시기 바랍니다.</samll>
                                    </P>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
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
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm"),
                $sampleForm = $popup.find("#sampleForm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    EXCEL : {
                        required : true
                    }
                }
            });
            <%-- 샘플다운로드 --%>
            $frm.on("click", "#goSampleDownload", function() {
                $sampleForm.postSubmit($.action.exceldownload());
            });
            <%-- 저장버튼 클릭 이벤트 --%>
            $popup.on("click", "#save", function() {
                if ($frm.valid() && validFileExt($frm.find(".file").val())) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("Sort"));
                    }
                }
            });
            <%-- 첨부파일 확장자 확인 --%>
            function validFileExt(value) {
                var valid = false,
                    extName = value.substring(value.lastIndexOf(".") + 1).toLowerCase(),
                    allows = "<spring:eval expression="@file['file.allowed.extensions.excel']"/>".split("|");
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
            
        });
    </script>
</body>
</html>
