window.onload = function(){
	nav_go();
	follow();
}


function nav_go(){
	var nav = $('.new_left_nav dl dd');
	var show =$('.new_posi');
	
	$('.new_posi').css({borderLeft:'none'})
	$('.new_posi').eq(0).css({borderTop:'none'})
		

	
	nav.each(function(i){
		//show.eq(0).height(nav.eq(0).height());
		//alert(nav.eq(0).height())
		
		
		
		$(this).hover(
			function(){
				
					show.eq(i).animate({width:'300px'},160);
					nav.eq(i).css({background:'white',borderBottom:'#b61d1d 1px solid'});
					nav.eq(i).children().css({color:'#333333'});
					//show.eq(i).css({background:'white'});
					//$('.new_box01 h3 ').eq(i).css({color:'#333333'});
					$('.new_box01').eq(i).children().css({color:'#333333'});
					//$('.new_left_nav dl dd h3').eq(i).children().css({color:'#333333'});
					//$('.new_box02 a').css({color:'#333333'});
					
					
					
			},function(){
				show.eq(i).animate({width:'1px'},160)
				nav.eq(i).css({background:'#b61d1d',borderBottom:'white 1px solid'});
				nav.eq(i).children().css({color:'white'});
				$('.new_box01').eq(i).children().css({color:'white'});
				//$('.new_left_nav dl dd h3').eq(i).children().css({color:'white'});
				
				//show.eq(i).css({background:'#b61d1d'});
				
			}
			
		);
		
		
		
		
	});
	
	
	
	
	
	
	
};


function follow(){
	
	/*$( '.follow' ).scrollFollow({
			relativeTo:'bottom'
			
			
		});
	
	var T1 = $('.c_R_tab').offset().top;
	var T2 = $('.c_R_consult').offset().top;
	var T =T2 - T1 + 150;
	alert(T)
	$('.follow_box').css({height:T})*/
	
	
	//var hei = $(document).height() - 350 - $('.follow').height()
	
	
	//alert(hei)
	$(window).scroll(function(){
		
		var s = $(window).scrollTop();
		/*if(s>1600){
			//alert()
			$('.follow').addClass('pos')
	
		}else if(s<1600){
			$('.follow').removeClass('pos')
		};*/
		
		
		var s1 = $('.follow_box').height() + $('.footerall').height() + 30;//计算滚轮在下方触动高度
		var T1 = $('.c_L_frame').offset().top + $('.c_L_frame').height() + 20;
		//alert(s1)
		if(s>s1){
			//alert()
			$('.follow').removeClass('pos01')
			$('.follow').addClass('pos02')
		}else if(s>T1){
			$('.follow').removeClass('pos02')
			$('.follow').addClass('pos01')
		}else if(s<T1){
			$('.follow').removeClass('pos01')
		};
		
	})
	
	
		/*var T1 = $('.c_R_parameter').offset().top;
		var T2 = $('.footerall').offset().top;
		
		var T =T2 - T1 - 40;
		//alert(T)
		//alert(T)*/
		
		//var hei01 = $('.c_R').outerHeight();
		//var hei02 = $('.c_R_tab').outerHeight();
		//var hei03 = $('.c_R_introduce').outerHeight();
		var hei01 = $('.footerall').offset().top;
		var hei02 = $('.c_L_frame').offset().top;
		var hei03 = $('.c_L_frame').height();
		//alert(hei01)
		T = hei01 - hei02 - hei03 - 52;
		$('.follow_box').css({height:T})
	
	//alert($(window).scrollTop())  //3753
	//alert($(document).height())   //4715
	//	alert($(window).height())   //962
		var hei04 = $('.c_R').height() -  $('.c_L_frame').height() -36;
		var hei05 = $(window).height();
		//alert(hei04)
		if(hei05>hei04){
			
			$('.follow_box').hide();
			
			
		};
	
	
	
	
};















