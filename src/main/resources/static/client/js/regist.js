
/**
 * 点击手机注册，则显示手机输入框
 * @author dengxiao
 */
function phoneMethod(){
	window.location="/reg?type=phone";
}

/**
 * 点击邮箱注册，则显示邮箱输入框
 * @author dengxiao
 */
function emailMethod(){
	window.location="/reg?type=email";
}

/**
 * 更换验证码图片的方法
 * @author dengxiao
 */
function changeYzm(){
	var image = document.getElementById("yzm_image");
	image.src = "/code?date="+Math.random()
}

/**
 * 提交注册表单的方法
 */
function submitRegistForm(){
	var regist_form = document.getElementById("regist_form");
	regist_form.submit();
}
