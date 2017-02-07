/**
 * 验证扩展
 */
'use strict';

// 验证是否是邮政编码
jQuery.validator.addMethod('zipCode', function(value, element) {
    var tel = /^[0-9]{6}$/;
    return this.optional(element) || (tel.test(value));
}, '请正确填写您的邮政编码');


// 全局扩展验证
jQuery.validator.setDefaults({
    errorClass : "text-red error",
    errorElement : "span"
});
