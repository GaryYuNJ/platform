/**
 * 应用类,包含应用的常用方法.
 */
'use strict';

var App = {
    skins : [
        "skin-blue",
        "skin-black",
        "skin-red",
        "skin-yellow",
        "skin-purple",
        "skin-green",
        "skin-blue-light",
        "skin-black-light",
        "skin-red-light",
        "skin-yellow-light",
        "skin-purple-light",
        "skin-green-light"
    ],
    baseUrl : '',
    getUrl : function(url) {
        return ctx + url;
    },
    changeLang : function(local) {
        $.ajax({
            url : this.getUrl('/lang/' + local)
        }).done(function() {
            location.reload();
        });
    },
    changeSkin : function(cls) {
        $.each(App.skins, function(i) {
            $("body").removeClass(App.skins[i]);
        });
        $("body").addClass(cls);
        return false;
    },
    changeRole : function(id) {
        window.location.href = "${ctx}/account/changeRole?id=" + id;
    },
    logout : function(url) {
        top.location.href = '${ctx}/logout';
    },
    setup : function() {
        // 可避免布局没准备好时让用户看到
        $(document.body).css("visibility", "visible");
        $('.select2').select2({
            minimumResultsForSearch : Infinity
        });

        $("#logoutBtn").click(function() {
            App.logout();
        });

        $("[data-skin]").on('click', function(e) {
            if ($(this).hasClass('knob'))
                return;
            e.preventDefault();
            App.changeSkin($(this).data('skin'));
        });
    },
    dynIframeSize : function(frameId) {
        if (frameId === undefined) {
            frameId = 'mainFrame';
        }
        // 使iframe高度自适应
        $(window.parent.document).find('#' + frameId).load(function() {
            var main = $(window.parent.document).find('#' + frameId);
            var wrapper = $(window.parent.document).find('.content-wrapper');
            var height = ($(wrapper).height() > $(document).height() ? $(wrapper).height() : $(document).height()) + 0;
            main.height(height);
        });

        // 监听窗口事件，自动适应高度
        window.onresize = function() {
            App.dynIframeSize();
        }
    }
};
