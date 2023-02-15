(function($) {
    $.fn.extend(jQuery, {
        action : {
            main : function () {
                var _path = $.cookie($.resources.cookie.name.login);
                _path = _path == null ? "bo" : _path;
                if ($.resources.isLogin) {
                    return $.resources.domain.server + $.resources.page.main.administrator;
                } else {
                    return $.resources.domain.server + StringUtil.format($.resources.page.main.guest, _path);
                }
            },
            logout : function () {
                return $.resources.domain.server + "/bo/manager/logout.do";
            },
            common : {
                popup : function (subclass) {
                    if (typeof(subclass) == "undefined") {
                        subclass = "";
                    }
                    return $.resources.domain.server + StringUtil.format("/bo/common/popup/{0}Popup.do", subclass);
                },
                ajax  : function (subclass) {
                    if (typeof(subclass) == "undefined") {
                        subclass = "";
                    }
                    return $.resources.domain.server + StringUtil.format("/bo/common/{0}Ajax.do", subclass);
                },
                file : {
                    download : function () {
                        return $.resources.domain.server + "/common/commonFileDownload.do";
                    }
                },
                product : function  () {
                    return $.resources.domain.server + "/bo/product/productUnionEdit.do";
                }
            }
        },
        requestPage: function (target, action) {
            var $this = $(target);
            document.location.href = $.action[action]("", $this.data("menu_subclass"), $this.data("menu_group"));
        }
    });
})(jQuery);
function BOAction () {
    var actions = [
        "List", "Form", "Edit", "View", "Popup", "Regist", "Modify", "Remove", "Proc", "Accredit", "Ajax", "ExcelDownload", "Union", "UpdateData"
    ];
    function init () {
        var group = "",
            subClass = "";
        var $actives = $("#lnb").find(".nav li.active");
        if ($actives.length > 0) {
            var $li = $actives.filter(".d" + $actives.length);
            group = $li.find("a").data("menu_group");
            subClass = $li.find("a").data("menu_subclass");
        } else {
            var $body = $(".page-login, .popup");
            if ($body.length > 0) {
                group = $body.data("menu_group");
                subClass = $body.data("menu_subclass");
            }
        }
        $.each(actions, function (i, action) {
            $.action[action.toLowerCase()] = function (treeDepeh, twoDepth, oneDepth) {
                if (typeof(twoDepth) == "undefined") {
                    twoDepth = subClass;
                }
                if (typeof(oneDepth) == "undefined") {
                    oneDepth = group;
                }
                return $.resources.domain.server + StringUtil.format("/bo/{0}/{1}{2}{3}.do", oneDepth, twoDepth, (typeof(treeDepeh) != "undefined" ? treeDepeh : ""), action);
            };
        });
    }
    init();
}
$(function () {
    new BOAction();
})