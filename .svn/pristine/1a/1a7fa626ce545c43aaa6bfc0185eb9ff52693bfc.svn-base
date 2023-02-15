/*
 * jQuery XML Extension plugin - xmlprocess
 * Version 1.2 Beta (31. DEC. 2011)
 * by weggles 
 *
 * Examples: $.postJsonAjax(url, param, reponseFunction)
 *           
 *
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 */
(function($) {
    $.ajaxSetup({
        // Disable caching of AJAX responses */
        cache : false,
        beforeSend : function (jqXHR, settings) {
            var csrf = $.common.csrf.get();
            jqXHR.setRequestHeader(csrf.header, csrf.value);
        }
    });
    $.fn.extend(jQuery, {
        postXmlAjax : function(requestUrl, requestXml ,callback){
            try {
                    $.ajax({
                       type: "POST",
                       dataType: 'xml',
                       url:  requestUrl,
                       data: requestXml,
                       async: true,
                       success: function(responseXml){
                           if (typeof(callback) != "undefined") {
                               callback(responseXml);
                           }
                       },
                       error   : function(result){ alert( 'An error occurred.' + 'result : ' + result);}
                    });
                } catch (e) {
                    alert("[AJAX ERROR] " + e.message);
                }
        },
        
        postSyncXmlAjax : function(requestUrl, requestXml ,callback){
            try {
                    $.ajax({
                       type: "POST",
                       dataType: 'xml',
                       url:  requestUrl,
                       data: requestXml,
                       async: false,
                       success: function(responseXml){
                           if (typeof(callback) != "undefined") {
                               callback(responseXml);
                           }
                       },
                       error   : function(result){ alert( 'An error occurred.' + 'result : ' + result );}
                    });
                } catch (e) {
                    alert("[AJAX ERROR] " + e.message);
                }
        },
        
        postSyncJsonAjax : function(requestUrl, requestData ,callback){
            try {
                $.ajax({
                    type: "POST",
                    dataType: 'json',
                    url:  requestUrl,
                    data: requestData,
                    async: false,
                    success: function(responseJson){
                        if (typeof(callback) != "undefined") {
                            callback(responseJson);
                        }
                    },
                    error   : function(result){ alert( 'An error occurred.' );}
                });
            } catch (e) {
                alert("[AJAX ERROR] " + e.message);
            }
        },
        
        postSyncMultipartJsonAjax : function(requestUrl, requestData ,callback){
            try {
                $.ajax({
                    type: "POST",
                    enctype: "multipart/form-data",
                    url:  requestUrl,
                    data: requestData,
                    async: false,
                    processData: false,
                    contentType: false,
                    success: function(responseJson){
                        if (typeof(callback) != "undefined") {
                            callback(responseJson);
                        }
                    },
                    error   : function(result){ alert( 'An error occurred.' + 'result : ' + result );}
                });
            } catch (e) {
                alert("[AJAX ERROR] " + e.message);
            }
        },
        
        postSyncHtmlAjax : function(requestUrl, requestData ,callback){
            try {
                    $.ajax({
                       type: "POST",
                       dataType: 'html',
                       url:  requestUrl,
                       data: requestData,
                       async: false,
                       success: function(responseJson){
                           if (typeof(callback) != "undefined") {
                               callback(responseJson);
                           }
                       },
                       error   : function(result){ alert( 'An error occurred.' + 'result : ' + result );}
                    });
                } catch (e) {
                    alert("[AJAX ERROR] " + e.message);
                }
        },      
        
        postJsonAjax : function(requestUrl, requestData ,callback){
            try {
                    $.ajax({
                       type: "POST",
                       dataType: 'json',
                       url:  requestUrl,
                       data: requestData,
                       async: true,
                       success: function(responseJson){
                           if (typeof(callback) != "undefined") {
                               callback(responseJson);
                           }
                       },
                       error   : function(result){ alert( 'An error occurred.' + 'result : ' + result );}
                    });
                } catch (e) {
                    alert("[AJAX ERROR] " + e.message);
                }
        },

        postHtmlAjax : function(requestUrl, requestData ,callback){
            try {
                    $.ajax({
                       type: "POST",
                       dataType: 'html',
                       url:  requestUrl,
                       data: requestData,
                       async: true,
                       success: function(responseJson){
                           if (typeof(callback) != "undefined") {
                               callback(responseJson);
                           }
                       },
                       error   : function(result){ alert( 'An error occurred.' + 'result : ' + result );}
                    });
                } catch (e) {
                    alert("[AJAX ERROR] " + e.message);
                }
        }       
    }); 
})(jQuery);