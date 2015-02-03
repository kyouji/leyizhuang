    var time = null;
    function tm_update(obj,id){
        var nickname=$("#nickname").val();
        var name=$("#name").val();
        var sex=$("input[name='sex']:checked").val();
        var address=$("#address").val();
        var email=$("#email").val();
        var mobile=$("#mobile").val();
        var qq=$("#qq").val();
        if(isEmpty(nickname)){
             Tmtip({html:"您输入的昵称不能为空!!!",src:"/Tm/images/24.PNG"});
            $("#nickname").focus();
            return;
        }
        if(isEmpty(name)){
             Tmtip({html:"您输入的姓名不能为空!!!",src:"/Tm/images/24.PNG"});
            $("#name").focus();
            return;
        }
        if(isEmpty(sex)){
             Tmtip({html:"性别不能为空!!!",src:"/Tm/images/24.PNG"});
            $("#sex").focus();
            return;
        }
        if(isEmpty(email)){
             Tmtip({html:"邮件不能为空!!!",src:"/Tm/images/24.PNG"});
            $("#email").focus();
            return;
        }
        if(isEmail(email)==false){
             Tmtip({html:"邮件格式不正确!",src:"/Tm/images/24.PNG"});
            $("#email").focus();
            return;
        }
        if(is_QQNum(qq)==false){
             Tmtip({html:"你输入的QQ号不正确!",src:"/Tm/images/24.PNG"});
            $("#qq").focus();
            return;
        }
        var fromData={"nickname":nickname,"realName":name,"sex":sex,"detailAddress":address,"email":email,"mobile":mobile,"qq":qq,"id":id};
        clearInterval(time);
            time = setTimeout(function() {
        $.ajax({
            type:"post",
            url:"/user/update",
            data:fromData,
            success:function(data){
                if(data=="success"){
                    Tmtip({html:"用户信息修改成功!",src:"/Tm/images/2_1.PNG"});
                }
            }
        })
    }, 500);
        };