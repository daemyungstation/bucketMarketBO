/**
 * <pre>
 * 1. FuntionName : showSmartEditor
 * 2. ClassName  : common.js
 * 3. Comment    : 스마트 에디터 display:none 에서 show 로 바뀔때 height 값 0으로 되는 부분 수정하는 function
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 23.
 * </pre>
 * 
 * textareaId 해당 textarea id h 원하는 height 값 editorNum 해당 editor 번호(없는 경우 입력 안한다)
 * 
 * @param textareaId
 * @param h
 * @param editorNum
 * @returns
 */
function showSmartEditor(textareaId, h, editorNum) {
    // 가로폭 조정
    $('#' + textareaId).next().contents().find("#smart_editor2").css("width", "100%");
    $('#' + textareaId).next().contents().find(".se2_input_area").css("width", "100%");
    // 세로폭 조정
    $('#' + textareaId).next().height($('#' + textareaId).height() + (h + 50)); // height값 강제 지정
    var editor;
    if (editorNum == undefined) {
        editor = eval("oEditors");
    } else {
        editor = eval("oEditors" + editorNum);
    }
    editor.getById[textareaId].exec('MSG_EDITING_AREA_RESIZE_STARTED', []);
    editor.getById[textareaId].exec('RESIZE_EDITING_AREA', [ 0, $('#' + textareaId).height() + h ]);
    editor.getById[textareaId].exec('MSG_EDITING_AREA_RESIZE_ENDED', []);
}