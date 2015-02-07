 
/**
 * jQuery dialog
 * @author songxiuliang
 * @Date：2015-01-28
 */

(function($){
	$.dialog = {
		ops:{
			speed:0,//窗口延迟 0ms
			title:'',
			width:230,
			height:132,
			close_callback:null,
			shade:0.3,//0-1之間，0：無蒙版
			shadeSpeed:500
		},
		open:function(a){
			$.dialog.init(a);
			$.dialog.speedIn();
			if($.dialog.o.url){
				if($.dialog.o.iframe){
					$.dialog.c.addClass('w_noPadding').html('<iframe frameborder="0" width="'+$.dialog.o.width+'" height="'+$.dialog.o.height+'" src="' + $.dialog.o.url + '"></iframe>');
				}else{
					$.dialog.c.load($.dialog.o.url);
				}
			}
			return;
		},
		init:function(a){
			$.dialog.o = $.extend({},$.dialog.ops,a);
			$.dialog.w = $(".w_Win");
			$.dialog.s = $('.w_Shade');
			$.dialog.c = $.dialog.w.find('.w_Content');
			$.dialog.c.empty().css({width:$.dialog.o.width,height:$.dialog.o.height}).removeClass('w_noPadding');
			$.dialog.d = $(window);
			$.dialog.w.css({top:($.dialog.d.outerHeight()-$.dialog.o.height)/2,left:($.dialog.d.width()-$.dialog.o.width)/2,width:$.dialog.o.width})
			.find('.w_Title').text($.dialog.o.title); 
			this.dragAndDrop();
			$.dialog.w.find('.w_Close').unbind('click').click(function(){
				if($.dialog.o.close_callback != null){
					$.dialog.o.close_callback();
				}
				$.dialog.speedOut();
			});
		},
		msg:function(msg,a){
			$.dialog.o = $.extend({},$.dialog.ops,{width:180,height:40,timeout:1500},a);
			$.dialog.w = $(".w_Win_msg");
			$.dialog.s = $('.w_Shade');
			$.dialog.w.find('.w_Content_msg').empty().html(msg);
			$.dialog.d = $(window);
			$.dialog.w.css({top:($.dialog.d.height()-$.dialog.o.height)/2,left:($.dialog.d.width()-$.dialog.o.width)/2,width:$.dialog.o.width,height:'auto'}); 
			$.dialog.speedIn();
			setTimeout($.dialog.speedOut, $.dialog.o.timeout);  
		},
		alert:function(msg,a){
			var op = {msg:msg,title:'\u63d0\u793a\u4fe1\u606f',btu:[{n:'\u786e\u5b9a',f:a.confirm}]};
			$.dialog.common_dialog($.extend(op,a));
		},
		confirm:function(msg,a){
			var op = {msg:msg,title:'\u8be2\u95ee\u7a97\u53e3',btu:[{n:'\u786e\u5b9a',f:a.confirm},{n:'\u53d6\u6d88',f:a.cancel}]};
			$.dialog.common_dialog($.extend(op,a));
		},
		common_dialog:function(a){
			var op = {btu:[],speed:0},btu_html = '',b_u,b_f = [];
			$.dialog.init($.extend(op,a));
			$.dialog.c.css({width:'auto',height:'auto'});
			if($.dialog.o.btu.length > 0){
				btu_html += '<div class="d_botton">';
				for ( var i in $.dialog.o.btu) {
					b_u = $.dialog.o.btu[i];
					b_f.push(b_u.f);
					btu_html += '<a href="javascript:;">' + b_u.n + '</a>';
				}
				btu_html += '</div>';
			}
			$.dialog.c.html('<div><div class="d_content"><span class="d_img d_question"></span><span class="d_msg">' + $.dialog.o.msg + '</span><div style="clear:both;"></div></div>' + btu_html + '</div>')
			.find('.d_botton').find('a').each(function(i){
				$(this).click(function(){
					$.dialog.speedOut();
					b_f[i]();
				});
			});
			$.dialog.c.find('.d_msg').css({width:($.dialog.o.width - 83)});
			$.dialog.w.css({top:($.dialog.d.height()-$.dialog.w.height())/2,left:($.dialog.d.width()-$.dialog.w.width())/2});
			$.dialog.speedIn();
		},
		speedIn:function(){
			if($.dialog.o.shade > 0){
				$.dialog.s.css({width:'100%',height:'100%'}).animate({opacity: $.dialog.o.shade}, $.dialog.o.shadeSpeed);
			}
			if($.dialog.o.speed > 0){
				$.dialog.w.slideDown($.dialog.o.speed);
			}else{
				$.dialog.w.show();
			}
		},
		speedOut:function(){
			if($.dialog.o.shade > 0){
				$.dialog.s.animate({opacity: 0}, $.dialog.o.shadeSpeed , function(){
					 $.dialog.s.css({width:0,height:0});
				});
			}
			$.dialog.w.slideUp($.dialog.o.speed);
		},
		dragAndDrop:function(){
			var m=false,_x,_y;
			$(".w_Top").unbind('mousedown').mousedown(function(e){ 
			m=true; 
			_x=e.pageX-parseInt($.dialog.w.css("left")); 
			_y=e.pageY-parseInt($.dialog.w.css("top")); 
			}); 
			$(document).unbind('mousemove mouseup').mousemove(function(e){ 
			if(m){ 
			var x=e.pageX-_x;
			var y=e.pageY-_y; 
			$.dialog.w.css({top:y,left:x});
			} 
			}).mouseup(function(){m=false;});
		}
	};
	document.writeln('<div class="w_Shade"></div><div class="w_Win_msg"><div class="w_Content_msg"></div></div><div class="w_Win"><div class="w_Top"><div class="w_Title"></div><div class="w_Close" title="关闭">×</div></div><div class="w_Content"></div></div>');
})(jQuery);
