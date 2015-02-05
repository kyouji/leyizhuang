//用户中心收货地址
    function tm_up(obj,id){
        var name=$("#name").val();
        var province=$("#province").val();
        var city=$("#city").val();
        var town=$("#town").val();
        var address=$("#address").val();
        var postcode=$("#postcode").val();
        var carts=$("#carts").val();
        var receiverTelephone=$("#receiverTelephone").val();
        var receiverMobile=$("#receiverMobile").val();
        var formDate={"id":id,"receiverName":name,"province":province,"city":city,"disctrict":town,"detailAddress":address,"postcode":postcode,"receiverTelephone":carts+receiverTelephone,"receiverMobile":receiverMobile};
        $.ajax({
            type:"post",
            url:"/user/saveaddress",
            data:formDate,
            success:function(data){
                if(data=="success"){
                     Tmtip({html:"修改成功!",src:"/Tm/images/2_1.PNG"});
                    $("#name").val("");
                    $("#province").val("");
                    $("#city").val("");
                    $("#town").val("");
                    $("#address").val("");
                    $("#postcode").val("");
                    $("#carts").val("");
                    $("#receiverTelephone").val("");
                    $("#receiverMobile").val("");
                    location.reload();
                }
            }
        })
    }

    function tm_delete(obj,id){
    
     if (window.confirm('确定要删除该条记录吗？')) {
        $.ajax({
            type:"post",
            url:"/user/addressdelete",
            data:{"id":id},
            success:function(data){
                if(data=="success"){
                    
                    $(obj).parents(".tr_td").slideUp("slow",function(){
                                $(this).remove();
                                Tmtip({html:"删除成功!",src:"/Tm/images/2_1.PNG"});
                            });
                }
            }
        })
        }
    }
    
    function tm_save(obj){
        var name=$("#name").val();
        var province=$("#province").val();
        var city=$("#city").val();
        var town=$("#town").val();
        var address=$("#address").val();
        var postcode=$("#postcode").val();
        var carts=$("#carts").val();
        var receiverTelephone=$("#receiverTelephone").val();
        var receiverMobile=$("#receiverMobile").val();
        if(isEmpty(name)){
            Tmtip({html:"您输入的收货人姓名不能为空!!!",src:"/Tm/images/24.PNG"});
            $("#name").focus();
            return
        }
        if(isEmpty(province) || isEmpty(city) || isEmpty(town)){
            $("#province").css("border","1px solid red")
            $("#city").css("border","1px solid red")
            $("#town").css("border","1px solid red")
             Tmtip({html:"地区不能为空!",src:"/Tm/images/24.PNG",callback: function() {
                 $("#province").css("border","1px solid #e5e5e5")
                 $("#city").css("border","1px solid #e5e5e5")
                 $("#town").css("border","1px solid #e5e5e5")
             }});
             $("#name").focus();
             return
         }
        if(isEmpty(address)){
            Tmtip({html:"您输入的详细地址不能为空!!!",src:"/Tm/images/24.PNG"});
            $("#address").focus();
            return
        }
        if(isEmpty(receiverMobile)){
            Tmtip({html:"您输入的手机号码不能为空!!!",src:"/Tm/images/24.PNG"});
            $("#receiverMobile").focus();
            return
        }

        var formDate={"receiverName":name,"province":province,"city":city,"disctrict":town,"detailAddress":address,"postcode":postcode,"receiverTelephone":receiverTelephone,"receiverMobile":receiverMobile};
        $.ajax({
            type:"post",
            url:"/user/saveaddress",
            data:formDate,
            success:function(data){
                if(data=="success"){
                     Tmtip({html:"添加成功!",src:"/Tm/images/2_1.PNG"});
                    $("#name").val("");
                    $("#province").val("");
                    $("#city").val("");
                    $("#town").val("");
                    $("#address").val("");
                    $("#postcode").val("");
                    $("#carts").val("");
                    $("#receiverTelephone").val("");
                    $("#receiverMobile").val("");
                    location.reload();
                }
            }
        })
    }
    
    
    function tm_update(obj,id){
        var name=($(obj).parents(".tr_td").find(".td_name")).text();
        var province=($(obj).parents(".tr_td").find(".td_province")).text();
        var city=($(obj).parents(".tr_td").find(".td_city")).text();
        var town=($(obj).parents(".tr_td").find(".td_disctrict")).text();
        var postcode=($(obj).parents(".tr_td").find(".td_postcode")).text();
        var receiverTelephone=($(obj).parents(".tr_td").find(".td_receiverTelephone")).text();
        var receiverMobile=($(obj).parents(".tr_td").find(".td_receiverMobile")).text();
        var address=($(obj).parents(".tr_td").find(".td_detailAddress")).text();
        
        $("#centent").empty();
        $("#centent").append("<form action='' method='post'>"+
 "           <div class='h50 black'><span class='fll mt5 fontsize'>收货人姓名：</span>"+
 "             <input type='text' id='name'  class='inp ml10 gr_sz fll' style='width:320px;' value="+name+" ></div>"+
 "           <div class='h50 color666 clear'><span class='fll black fontsize'>　　　地区：</span>"+
 "             <select class='ml10 ' id='province'>"+
  "             <option >"+province+"</option>"+
 "             </select>"+
 "             <b class='black' style='margin-left:10px;margin-right:10px;'>省</b>"+
 "             <select  style='width:90px;' id='city'>"+
 "              <option >"+city+"</option>"+
 "             </select >"+
 "             <b class='black' style='margin-left:10px;margin-right:10px;'>市</b>"+
 "             <select style='width:90px;' id='town'>"+
  "             <option >"+town+"</option>"+
 "             </select>"+
 "             <b class='black' style='margin-left:10px;margin-right:10px;'>区</b> </div>"+
 "           <div class='h50 black clear'><span class='fll mt5 fontsize'>　　　地址：</span>"+
 "             <input type='text' id='address' class='inp ml10 gr_sz fll' style='width:320px;'  value="+address+" />"+
 "             <span class=' ml10 fll mt5 black'>（填写详细地址有助于快速配送）</span></div>"+
 "           <div class='h50 black clear'><span class='fll mt5 fontsize'>　邮政编码：</span>"+
 "             <input type='text' id='postcode' class='inp ml10 gr_sz fll' style='width:320px;' value="+postcode+" />"+
 "           </div>"+
 "           <div class='h50 color666 clear'><span class='fll mt5 black fontsize'>　固定电话：</span>"+
 "                                                                                                  "+
 "             <input type='text' id='receiverTelephone' class='inp ml5 gr_sz fll' style='width:320px;'value="+receiverTelephone+" />"+
 "           </div>"+
 "           <div class='h50 black clear'><span class='fll mt5 fontsize'>　　　手机：</span>"+
 "             <input type='text' id='receiverMobile' class='inp ml10 gr_sz fll' style='width:320px;' value="+receiverMobile+" />"+
 "           </div>"+
 "           <div class=' ha oh ml68'>"+
 "            <input type='button' value='提交' onclick='tm_up(this,"+id+")' class='user_r_btn'/>"+
 "           </div>"+
 "        </form>")
  $(document).ready(function(){init("province","","city","","town","");});

  }