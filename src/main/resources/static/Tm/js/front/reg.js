//注册 
function tm_reg(obj){
        var name=$("#name").val();
        var phone=$("#phone").val();
        var password=$("#password").val();
        var newpassword=$("#newpassword").val();
        var verif=$("#verif").val();
        var length=name.length;
        //空判断
        if(isEmpty(name)){
             Tmtip({html:"您输入的用户名不能为空!!!",src:"Tm/images/24.PNG"});
             $("#name").focus();
             return;
        }else{
            $.ajax({
                type:"post",
                url:"/regsuccess",
                data:{"name":name},
                success:function(data){
                var Jdata=data.trim();
                    if(Jdata=="Already"){
                    
                         Tmtip({html:"该用户已经存在!!!",src:"Tm/images/24.PNG"});
                         $("#name").select();
                    }
                    return;
                }
            })
        
        }
    
        if(is_user_s(name)==false){
           Tmtip({html:"用户名格式错误,必须6位以上的数字，字母组合!",src:"Tm/images/24.PNG"});
            $("#name").select();
            return;
        }
        if(isEmpty(phone)){
             Tmtip({html:"您输入的手机号码不能为空!!!",src:"Tm/images/24.PNG"});
             $("#phone").focus();
             return;
        }
        if(is_cellphoneNum(phone)==false){
             Tmtip({html:"您输入的手机号码格式不正确!!!",src:"Tm/images/24.PNG"});
             $("#phone").select();
             return;
        }
        if(isEmpty(password)){
             Tmtip({html:"您输入的密码不能为空!!!",src:"Tm/images/24.PNG"});
             $("#password").focus();
             return;
        }
        if(is_passwd_s(password)==false){
             Tmtip({html:"您输入的密码强度过于简单!!!",src:"Tm/images/24.PNG"});
             $("#password").select();
             return;
        }
        if(isEmpty(newpassword)){
             Tmtip({html:"密码不能为空!!!",src:"Tm/images/24.PNG"});
             $("#newpassword").focus();
             return;
        }
         if(password!=newpassword){
          Tmtip({html:"两次输入的密码不一致!!!",src:"Tm/images/24.PNG"});
            $("#newpassword").select();
            return;
        }
        if(isEmpty(verif)){
             Tmtip({html:"验证码不能为空!!!",src:"Tm/images/24.PNG"});
             $("#verif").focus();
             return;
        }
        $.ajax({
            type:"post",
            url:"/regsuccess",
            data:{"name":name,"mobile":phone,"password":password,"newpassword":newpassword,"verify":verif},
            success:function(data){
            //验证码错误
                if(data=="vfalse"){
                     Tmtip({html:"验证码错误!!!",src:"Tm/images/24.PNG"});
                    $("#verif").select();
                }else if(data=="success"){
                    window.location.href="/logutil";
                    $("#name").val("");
                    $("#phone").val("");
                    $("#password").val("");
                    $("#newpassword").val("");
                    $("#verif").val("");
                    
                }
            }
        })
    }