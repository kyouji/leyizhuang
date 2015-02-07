
/*小郭封装：消息框*/
function ajax(b) {
    var c = {
        type: "post",
        url: "/",
        data: {"1":1},
        callback: function() {}
    };
    var b = $.extend({}, c, b);
    var d = $(this);
   $.ajax({
       type:b.type,
       url:b.url,
       data:b.data,
       success:
           b.callback
      
   })
};