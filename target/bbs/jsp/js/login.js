// // JavaScript Document
// //支持Enter键登录
// 		document.onkeydown = function(e){
// 			if($(".bac").length==0)
// 			{
// 				if(!e) e = window.event;
// 				if((e.keyCode || e.which) == 13){
// 					var obtnLogin=document.getElementById("submit_btn")
// 					obtnLogin.focus();
// 				}
// 			}
// 		}
//
//     	$(function(){
// 			//提交表单
// 			$('#submit_btn').click(function(){
// 				show_loading();
// 				var myReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //邮件正则
// 				if($('#email').val() == ''){
// 					show_err_msg('邮箱还没填呢！');
// 					$('#email').focus();
// 				}else if(!myReg.test($('#email').val())){
// 					show_err_msg('您的邮箱格式错咯！');
// 					$('#email').focus();
// 				}else if($('#password').val() == ''){
// 					show_err_msg('密码还没填呢！');
// 					$('#password').focus();
// 				}else{
// 					//ajax提交表单，#login_form为表单的ID。 如：$('#login_form').ajaxSubmit(function(data) { ... });
// 					show_msg('登录成功咯！  正在为您跳转...','/');
// 				}
// 			});
// 		});
$(function() {



	/*
	 * 3. 输入框得到焦点时隐藏错误信息
	 */
    $(".input").focus(function() {
        var inputName = $(this).attr("name");
        $("#" + inputName + "Error").css("display", "none");
    });

	/*
	 * 4. 输入框推动焦点时进行校验
	 */
    $(".input").blur(function() {
        var inputName = $(this).attr("name");
        invokeValidateFunction(inputName);
    })
});
function invokeValidateFunction(inputName) {
    inputName = inputName.substring(0, 1).toUpperCase() + inputName.substring(1);
    var functionName = "validate" + inputName;
    return eval(functionName + "()");
}
function validateLoginname() {
    var bool = true;
    $("#loginnameError").css("display", "none");
    var value = $("#loginname").val();
    if(!value) {// 非空校验
        $("#loginnameError").css("display", "");
        $("#loginnameError").text("用户名不能为空！");
        bool = false;
    } else if(value.length < 3 || value.length > 20) {//长度校验
        $("#loginnameError").css("display", "");
        $("#loginnameError").text("用户名长度必须在3 ~ 20之间！");
        bool = false;
    }
    return bool;
}
function validateLoginpass() {
    var bool = true;
    $("#loginpassError").css("display", "none");
    var value = $("#loginpass").val();
    if(!value) {// 非空校验
        $("#loginpassError").css("display", "");
        $("#loginpassError").text("密码不能为空！");
        bool = false;
    } else if(value.length < 3 || value.length > 20) {//长度校验
        $("#loginpassError").css("display", "");
        $("#loginpassError").text("密码长度必须在3 ~ 20之间！");
        bool = false;
    }
    return bool;
}
/*
 * 校验验证码
 */
function validateVerifyCode() {
    var bool = true;
    $("#verifyCodeError").css("display", "none");
    var value = $("#verifyCode").val();
    if(!value) {//非空校验
        $("#verifyCodeError").css("display", "");
        $("#verifyCodeError").text("验证码不能为空！");
        bool = false;
    } else if(value.length != 4) {//长度不为4就是错误的
        $("#verifyCodeError").css("display", "");
        $("#verifyCodeError").text("错误的验证码长度！");
        bool = false;
    } else {//验证码是否正确
        $.ajax({
            cache: false,
            async: false,
            type: "POST",
            dataType: "json",
            data: "verifyCode="+$("#verifyCode").val(),
            url: "/bbs/captcha/checkCaptcha.action",
            success: function(flag) {
                if(!flag) {
                    $("#verifyCodeError").css("display", "");
                    $("#verifyCodeError").text("错误的验证码！");
                    bool = false;
                }
            }
        });
    }
    return bool;
}

function _hzt() {
	/*
	 * 1. 获取<img>元素
	 * 2. 重新设置它的src
	 * 3. 使用毫秒来添加参数
	 */
    $("#vCode").attr("src", "/bbs/captcha/getCaptchaImage.action?timestamp=" +new Date().getTime());
}