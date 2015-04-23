//登录
    function tm_register(obj){
        var name=$("#name").val()
        var password=$("#password").val()
        var verif=$("#verif").val();
        var length=name.length;
        if(isEmpty(name)){
            Tmtip({html:"您输入的用户名不能为空!!!",src:"Tm/images/24.PNG"});
            $("#name").focus();
            return;
        }

        if(isEmpty(password)){
            Tmtip({html:"您输入的密码不能为空!!!",src:"Tm/images/24.PNG"});
            $("#password").focus();
            return;
        }   
        $.ajax({
            type:"post",
            url:"login",
            data:{"usr":name,"pwd":password,"code":verif},
            success:function(data){
                
                var url = document.referrer;
                if(isEmpty(url)){
                    window.location.href="/";
                }else{
                    window.location.href = url; 
                }
                
                return;
                
                if(data=="false"){
                    $("#verifs").css({"display":"block"})
                    Tmtip({html:"您输入的用户名或密码错误!!!",src:"Tm/images/24.PNG"});
                    $("#name").select();
                    $("#password").val("");
                    $("#verif").val("");
                
                }else if(data=="success"){
                    var url = document.referrer;
                    if(isEmpty(url)){
                        window.location.href="/";
                    }else{
                        window.location.href = url; 
                    }
                }else if(data=="fnull"){
                    Tmtip({html:"您输入的验证码不能为空!!!",src:"Tm/images/24.PNG"});
                    $("#verif").focus();
                    return
                }else if(data=="vfalse"){
                    Tmtip({html:"您输入的验证码错误!!!",src:"Tm/images/24.PNG"});
                    $("#verif").select();
                }
                
            }
        })
    }
    
