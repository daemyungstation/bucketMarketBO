/**
 * Debug Log
 */
if (!window.console) {
    var Console = function() {
        return {
            log : function(message) {
            },
            info : function(message) {
            },
            warn : function(message) {
            },
            error : function(message) {
            }
        };
    };
    console = Console();
}

/**
 * <pre>
 * 1. FuntionName : DateUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 날짜 관련 Class
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 23.
 * </pre>
 */
var DateUtil = {
    /**
     * <pre>
     * 1. FuntionName : fnDateReset
     * 2. ClassName  : common.js
     * 3. Comment    : 날짜 셋팅 - 초기화
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param v_start_name
     * @param v_end_name
     * @returns
     */
    fnDateReset : function(v_start_name, v_end_name) {
        document.getElementById(v_start_name).value = "";
        document.getElementById(v_end_name).value = "";
    },
    /**
     * <pre>
     * 1. FuntionName : fnDateSet
     * 2. ClassName  : common.js
     * 3. Comment    : 날짜 셋팅 - 오늘, 일주일, 15일, 한달, 두달
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param v_start_name
     * @param v_end_name
     * @param s_year
     * @param s_month
     * @param s_day
     * @param e_year
     * @param e_month
     * @param e_day
     * @param seperator
     * @returns
     */
    fnDateSet : function(v_start_name, v_end_name, s_year, s_month, s_day, e_year, e_month, e_day, seperator) {
        document.getElementById(v_start_name).value = getCalculatedDate(s_year, s_month, s_day, seperator);
        document.getElementById(v_end_name).value = getCalculatedDate(e_year, e_month, e_day, seperator)
        function getCalculatedDate(iYear, iMonth, iDay, seperator) {
            // 현재 날짜 객체를 얻어옴.
            var gdCurDate = new Date();

            // 현재 날짜에 날짜 게산.
            gdCurDate.setYear(gdCurDate.getFullYear() + iYear);
            gdCurDate.setMonth(gdCurDate.getMonth() + iMonth);
            gdCurDate.setDate(gdCurDate.getDate() + iDay);

            // 실제 사용할 연, 월, 일 변수 받기.
            var giYear = gdCurDate.getFullYear();
            var giMonth = gdCurDate.getMonth() + 1;
            var giDay = gdCurDate.getDate();

            // 월, 일의 자릿수를 2자리로 맞춘다.
            giMonth = "0" + giMonth;
            giMonth = giMonth.substring(giMonth.length - 2, giMonth.length);
            giDay = "0" + giDay;
            giDay = giDay.substring(giDay.length - 2, giDay.length);

            // display 형태 맞추기.
            return giYear + seperator + giMonth + seperator + giDay;
        }
    }
};
/**
 * <pre>
 * 1. FuntionName : TagUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 태그 관련 Class
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 23.
 * </pre>
 */
var TagUtil = {
    /**
     * <pre>
     * 1. FuntionName : createDynamicForm
     * 2. ClassName  : common.js
     * 3. Comment    : FORM 태그 동적 생성 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param id
     * @param action
     * @returns
     */
    createDynamicForm : function(id, action) {
        var $frm = $("<form></form>");
        $frm.attr({
            "id" : id,
            "action" : action,
            "target" : "_self",
            "method" : "POST"
        });
        return $frm;
    },
    /**
     * <pre>
     * 1. FuntionName : createDynamicInput
     * 2. ClassName  : common.js
     * 3. Comment    : INPUT 태그 동적 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param type
     * @param name
     * @param value
     * @returns
     */
    createDynamicInput : function(type, name, value) {
        var $input = $("<input/>");
        $input.attr({
            "type" : type,
            "name" : name,
            "value" : value
        });
        return $input;
    },
    /**
     * <pre>
     * 1. FuntionName : createEmptyTr
     * 2. ClassName  : common.js
     * 3. Comment    : empty tr 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @returns
     */
    createEmptyTr : function () {
        var tr = "<tr>";
        tr += "<td class=\"td_no_result\"></td>";
        tr += "</tr>";
        return tr;
    },
    /**
     * <pre>
     * 1. FuntionName : formClear
     * 2. ClassName  : common.js
     * 3. Comment    : FORM 태그 초기화
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param formId
     */
    formClear : function(formId) {
        var $form = $("#" + formId);
        $form.find("input[type=text]").val("");
        $.each($form.find("input[type=hidden]"), function (idx, item) {
            var isFormClear = $(item).data("is_form_clear");
            if (typeof(isFormClear) != "undefined" && isFormClear) {
                $(item).val("");
            }
        });
        $form.find("select").find("option:eq(0)").prop("selected", true);
        $form.find(":checkbox").prop("checked", false);
        var tmpRadioNm = "";
        $.each($form.find(":radio"), function(idx, item) {
            if (tmpRadioNm != $(item).attr("name")) {
                $form.find("input[name=" + $(item).attr("name") + "]:eq(0)").prop("checked", true);
            }
            tmpRadioNm = $(item).attr("name");
        });
    },
    /**
     * <pre>
     * 1. FuntionName : setEmptyColspan
     * 2. ClassName  : common.js
     * 3. Comment    : 데이터가 없는 table colspan 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param formId
     */
    setEmptyColspan : function () {
     // 데이터가 없는 table colspan 처리
        var _noResultColspan = 0;
        var _noResult = $("td.td_no_result");
        _noResult.closest("table").find("tr:first").children().each(function () {
            var _colspan = $(this).attr("colspan");
            _noResultColspan += typeof(_colspan) != "undefined" ? _colspan : 1;
        });
        _noResult.attr("colspan", _noResultColspan).text("검색 혹은 등록된 데이터가 없습니다.");
    },
    /**
     * <pre>
     * 1. FuntionName : setEmptyColspan
     * 2. ClassName  : common.js
     * 3. Comment    : 스마트 에디터 display:none 에서 show 로 바뀔때 height 값 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param textareaId
     * @param h
     * @param editorNum
     */
    showSmartEditor : function (textareaId, h, editorNum) {
        //가로폭 조정
        $('#'+textareaId).next().contents().find("#smart_editor2").css("width","100%");
        $('#'+textareaId).next().contents().find(".se2_input_area").css("width","100%");
        
        //세로폭 조정
        $('#'+textareaId).next().height($('#'+textareaId).height() + (h+50)); //height값 강제 지정
        
        var editor;
        if(editorNum == undefined){
            editor = eval("oEditors");
        }else{
            editor = eval("oEditors" + editorNum);
        }   
        
        editor.getById[textareaId].exec('MSG_EDITING_AREA_RESIZE_STARTED', []); 
        editor.getById[textareaId].exec('RESIZE_EDITING_AREA', [0, $('#'+textareaId).height()+h]); 
        editor.getById[textareaId].exec('MSG_EDITING_AREA_RESIZE_ENDED', []);
    },
    /**
     * <pre>
     * 1. FuntionName : formClear
     * 2. ClassName  : common.js
     * 3. Comment    : Object Name 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param formId
     */
    getObjectClass : function  (obj) {
        if (obj && obj.constructor && obj.constructor.toString) {
            var arr = obj.constructor.toString().match(
                /function\s*(\w+)/);
            if (arr && arr.length == 2) {
                return arr[1];
            }
        }
        return undefined;
    }
};
/**
 * <pre>
 * 1. FuntionName : StringUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 문자열 관련 Class
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 23.
 * </pre>
 */
var StringUtil = {
    /**
     * <pre>
     * 1. FuntionName : getString
     * 2. ClassName  : common.js
     * 3. Comment    : 문자열확인 후 문자열 또는 기본값 리턴
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param str
     *            체크 문자열
     * @param def
     *            기본값
     * @returns
     */
    getString : function(str, def) {
        if (str != undefined && str && str != "" && str != "null") {
            return $.trim(str);
        } else {
            return $.trim(def);
        }
    },
    /**
     * <pre>
     * 1. FuntionName : getInt
     * 2. ClassName  : common.js
     * 3. Comment    : 정수형 확인 후 정수형 또는 기본값 리턴
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param num
     *            체크 정수형
     * @param def
     *            기본값
     * @returns
     */
    getInt : function(num, def) {
        var val = parseInt(num, 10);

        if (isNaN(val)) {
            return def;
        } else {
            return val;
        }
    },
    /**
     * <pre>
     * 1. FuntionName : trim
     * 2. ClassName  : common.js
     * 3. Comment    : 공백제거
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param str
     *            공백 제거 할 문자열
     * @returns
     */
    trim : function(str) {
        return $.trim(str);
    },
    /**
     * <pre>
     * 1. FuntionName : setComma
     * 2. ClassName  : common.js
     * 3. Comment    : 콤마 추가
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param num
     * @returns
     */
    setComma : function(num) {
        var pattern = /(^[+-]?\d+)(\d{3})/;
        num += '';
        while (pattern.test(num)) {
            num = num.replace(pattern, '$1' + ',' + '$2');
        }
        return num;
    },
    /**
     * <pre>
     * 1. FuntionName : removeComma
     * 2. ClassName  : common.js
     * 3. Comment    : 콤마 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param num
     * @returns
     */
    removeComma : function(num) {
        return num.replace(/,/gi, "");
    },
    /**
     * <pre>
     * 1. FuntionName : getStrByte
     * 2. ClassName  : common.js
     * 3. Comment    : 글자제한 onkeyup=&quot;getStrByte(this,'#byte', 200, 3);&quot;
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * focus 원치 않는 경우에만 noFocusYn 파라미터를 추가해준다. (ex: 화면 초기 로딩시 textarea byte수 보여줘야
     * 하는경우) getStrByte(this,'#byte', 200, 3, 'Y');
     * 
     * @param obj
     * @param tgt
     * @param size
     * @param korSize
     * @param noFocusYn
     * @returns
     */
    getStrByte : function(obj, tgt, size, korSize, noFocusYn) {
        var korByte = korSize != undefined && korSize != "" ? parseInt(korSize, 10) : 3; // 한글 바이트 (기본값 3)
        var str = obj.value;
        var str_max = size;
        var p = 0;
        var bytes = 0;
        var len_num = 0;
        var str2 = "";
        if (str != "") {
            for (p = 0; p < str.length; p++) {
                (str.charCodeAt(p) > 255) ? bytes += korByte : bytes++; // 한글은 korByte, 영문, 숫자, 공백은 1byte
                if (bytes <= str_max) {
                    len_num = p + 1;
                } else {
                    alert(size + " byte를 초과 입력할수 없습니다.\n초과된 내용은 자동으로 삭제 됩니다.");
                    str2 = str.substr(0, len_num);
                    obj.value = str2;
                    break;
                }
                $(tgt).text(bytes);
            }
        } else {
            $(tgt).text("0");
        }

        if (noFocusYn == undefined || noFocusYn != "Y") {
            obj.focus();
        }
    },
    /**
     * <pre>
     * 1. FuntionName : format
     * 2. ClassName  : common.js
     * 3. Comment    : 문자열 치환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * ex ) StringUtil.format("test-{0}-{1}", "1", "2")
     *     => return "test-1-2
     * @param arguments
     * @returns
     */
    format : function () {
        var args = arguments,
            target = args[0],
            replaceArgs = new Array();
        $.each(args, function (i) {
            if (i > 0) {
                replaceArgs.push(this);
            }
        });
        return target.replace(/{(\d+)}/g, function(match, number) {
            return typeof replaceArgs[number] != "undefined" ? replaceArgs[number] : match;
        });
    },
    /**
     * <pre>
     * 1. FuntionName : formatDate
     * 2. ClassName  : common.js
     * 3. Comment    : 문자열 치환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * ex ) StringUtil.formatDate('20200427', 'yyyy-MM-dd')
     * @param regdt
     * @param f
     * @returns
     */
    formatDate : function (regdt, f) {
        var yyyy = regdt.substring(0, 4);
        var yy = regdt.substring(2, 4);
        var MM = regdt.substring(4, 6);
        var dd = regdt.substring(6, 8);
        var hh = regdt.substring(8, 10);
        var mm = regdt.substring(10, 12);
        var ss = regdt.substring(12, 14);
        return f.replace(/(yyyy|yy|MM|dd|hh|mm|ss)/gi, function($1) {
            switch ($1) {
                case "yyyy":
                    return yyyy;
                case "yy":
                    return yy.zf(2);
                case "MM":
                    return MM.zf(2);
                case "dd":
                    return dd.zf(2);
                case "hh":
                    return hh.zf(2);
                case "mm":
                    return mm.zf(2);
                case "ss":
                    return ss.zf(2);
                default:
                    return $1;
            }
        });
    }
};

/**
 * <pre>
 * 1. FuntionName : ValidationUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 유효성 검증
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 4. 13.
 * </pre>
 */
var ValidationUtil = {
        
    /**
     * <pre>
     * 1. FuntionName : checkSsn
     * 2. ClassName  : common.js
     * 3. Comment    : 주민등록번호 검증
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     * 
     * @param num1
     *            앞자리 숫자 6자리
     * @param num2
     *            뒷자리 숫자 7자리
     * @returns boolean
     */
    checkSsn : function(num1, num2) {
        
        var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
        var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

        for (var i=0; i<num1.length; i++) {
            arrNum1[i] = num1.charAt(i);
        } // 주민번호 앞자리를 배열에 순서대로 담는다.

        for (var i=0; i<num2.length; i++) {
            arrNum2[i] = num2.charAt(i);
        } // 주민번호 뒷자리를 배열에 순서대로 담는다.

        var tempSum=0;

        for (var i=0; i<num1.length; i++) {
            tempSum += arrNum1[i] * (2+i);
        } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

        for (var i=0; i<num2.length-1; i++) {
            if(i>=2) {
                tempSum += arrNum2[i] * i;
            }
            else {
                tempSum += arrNum2[i] * (8+i);
            }
        } // 같은방식으로 앞 번호 계산한것의 합에 뒷번/*  */호 계산한것을 모두 더함
        
        if((11-(tempSum%11))%10!=arrNum2[6]) {
            return false;
        }else{
            return true;
        }
    },
        
    /**
     * <pre>
     * 1. FuntionName : checkBizNo
     * 2. ClassName  : common.js
     * 3. Comment    : 사업자번호 검증
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     * 
     * @param num1
     *            앞자리 숫자 3자리
     * @param num2
     *            중간 숫자 2자리
     * @param num3
     *            뒷자리 숫자 5자리
     * @returns boolean
     */
    checkBizNo : function(num1, num2, num3) {
        
        var bizID = new String(num1) + new String(num2) + new String(num3)
        var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
        var tmpBizID, i, chkSum = 0, c2, remander; 
        bizID = bizID.replace(/-/gi,''); 
         
        for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i); 
        c2 = "0" + (checkID[8] * bizID.charAt(8)); 
        c2 = c2.substring(c2.length - 2, c2.length); 
        chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
        remander = (10 - (chkSum % 10)) % 10 ; 
         
        if (Math.floor(bizID.charAt(9)) == remander) {
            return true 
        } else {
            return false; 
        }
    }
}

/**
 * <pre>
 * 1. FuntionName : windowPopupCallback
 * 2. ClassName  : common.js
 * 3. Comment    : 윈도우 팝업 공통 callback 함수 
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 25.
 * </pre>
 *
 * @param type
 * @param data
 * @returns
 */
function windowPopupCallback (type, data) {
    switch (type) {
        case "common.popup.product.search" :
            $.common.popup.callback.product.search.call(this, data);
            break;
        case "common.popup.vendor.b2b.search" :
            $.common.popup.callback.vendor.b2b.search.call(this, data);
            break;
        case "display.curation.search" :
            $.display.curation.search.call(this, data);
            break;
        case "common.popup.dlcc.search" :
            $.common.popup.callback.dlcc.search.call(this, data);
            break;            
    }
}

// 필터
function setInputFilter(element, inputFilter) {
    [ "input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop" ].forEach(function(event) {
        element.addEventListener(event, function() {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            } else {
                this.value = "";
            }
        });
    });
}