/**
 * 判断非空
 * 
 * @param val
 * @returns {Boolean}
 */
function isEmpty(val) {
	val = $.trim(val);
	if (val == null)
		return true;
	if (val == undefined || val == 'undefined')
		return true;
	if (val == "")
		return true;
	if (val.length == 0)
		return true;
	if (!/[^(^\s*)|(\s*$)]/.test(val))
		return true;
	return false;
}

function isNotEmpty(val) {
	return !isEmpty(val);
}

//判断两个元素是否相等
function eqauls(str,tstr){
	if(str == tstr){
		return true;
	}
	return false;
};

/* 
用途：检查输入字符串是否只由英文字母和数字组成 
输入： 
s：字符串 
返回： 
如果通过验证返回true,否则返回false 

*/ 
function isNumberOrLetter(s){//判断是否是数字或字母 

var regu = "^[0-9a-zA-Z]+$"; 
var re = new RegExp(regu); 
if (re.test(s)) { 
return true; 
}else{ 
return false; 
} 
} 

function checkNumbers(str){
    var re = /^\+?[1-9][0-9]*$/;
    var my = false;
    if(str!=''&&str!='0'){
    if (re.test(str)) {my = true;}
    if(!my){
    alert('只能输入整位数字');
    $('#[id="foodOrder.numbers"]').select();
    return 0;
    }
    }else{
    alert('不能为空，并大于零');
    $('#[id="foodOrder.numbers"]').select();
    return 0;
    }
    }

//验证中国大陆手机号,支持18、15和13开头,支持+86
function is_cellphoneNum(str)
{
    var regExp = /^(\+86)?(13|18|15)\d{9}(?!\d)$/;
    return regExp.test(str);
}

 //验证email    
function is_email(str)
{ 
    var regExp = /^([\w\.])+@\w+\.([\w\.])+$/;
    return regExp.test(str);
}

//验证中国邮政编码    
function is_zip_code(str)
{          
    var regExp = /^[1-9]\d{5}$/;
    return regExp.test(str);
}
//验证强用户名,3-16位, 允许数字、大小写英文字母、下划线以及常用英文符号
function is_user_s(str)
{
    var regExp = /^[\w~\`\'\"\;\:\@\#\%\,\/\!\$\^\&\*\(\)\-\+\=\{\}\[\]\>\<\.\?\|\\]{6,16}$/;
    return regExp.test(str);
}
//验证强密码,3-16位, 允许数字、大小写英文字母、下划线以及常用英文符号
function is_passwd_s(str)
{
    var regExp = /^[\w\~\`\'\"\;\:\@\#\%\,\/\!\$\^\&\*\(\)\-\+\=\{\}\[\]\>\<\.\?\|\\]{8,18}$/;
    return regExp.test(str);
}
