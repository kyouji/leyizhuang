//首页banner效果
function indexBanner(boxid,sumid,_go,_speed,numid){
	var startX,startY,endX,endY;//定义判断变量
	var _box = document.getElementById(boxid);
	var _sum = $("#"+sumid);
	var _arr = $("#"+sumid+" li");
	var _length = _arr.length;
	var _index = 0;
	var _nexti = 0;
	
	_sum.append(_sum.html());
	_arr = $("#"+sumid+" li");
	
	var _str = "<div id='"+numid+"'><a href='javascript:void(0);' class='sel'></a>";
	for(var i=1;i<_length;i++){
		_str += "<a href='javascript:void(0);'></a>";
		}
	_str += "</div>";
	$("#"+boxid).append(_str);
	var _num = $("#"+numid+" a");
	
	var _width = $(window).width();
	var _resize = function(){
		_width = $(window).width();
		_arr.width(_width);
		var _move = -_width * _index;
		_sum.css("left",_move+"px");
		};
	_resize();
	$(window).resize(function(){_resize();});
	
	var nextImg = function(){
		_index++;
		_nexti++;
		
		if(_index >= _length){
			_index = 0;
			}
		if(_nexti > _length){
			_nexti = _index;
			_sum.css("left","0px");
			}
		if(_sum.is(":animated")){
			_sum.stop(true,true);
			}
		var _move = -_width * _nexti;
		_sum.animate({left:_move+"px"},_go);
		_num.eq(_index).addClass("sel").siblings().removeClass("sel");
	};
	
	var lastImg = function(){
		_index--;
		_nexti--;
		
		if(_index < 0){
			_index = _length-1;
			}
		if(_nexti < 0){
			var _m = -_width * _length;
			_sum.css("left",_m+"px");
			_nexti = _index;
			}
		if(_sum.is(":animated")){
			_sum.stop(true,true);
			}
		var _move = -_width * _nexti;
		_sum.animate({left:_move+"px"},_go);
		_num.eq(_index).addClass("sel").siblings().removeClass("sel");
	};
	
	var cartoon = setInterval(nextImg,_speed);
	
	var touchStart = function(event){
		clearInterval(cartoon);
		var touch = event.touches[0];
        startX = touch.pageX;
		};
	var touchMove = function(event){
		event.preventDefault();//这里很重要！！！
		var touch = event.touches[0];
        endX = (startX-touch.pageX);
		};
	var touchEnd = function(event){
		if(endX > 30){
			nextImg();
			}
		if(endX < -30){
			lastImg();
			}
		cartoon = setInterval(nextImg,_speed);
		};
	
	_box.addEventListener("touchstart", touchStart, false);
    _box.addEventListener("touchmove", touchMove, false);
    _box.addEventListener("touchend", touchEnd, false);
	
}//该方法结束

//搜索框部分
function searchTextClear(_name,_text,color01,color02){
	var _obj = $(_name);
	_obj.val(_text);
	_obj.css("color",color01);
	_obj.click(function(){
		var _now = _obj.val();
		if(_now == _text){
			_obj.val("");
			_obj.css("color",color02);
		}
	});
	_obj.blur(function(){
		var _now = _obj.val();
		if(_now == ""){
			_obj.val(_text);
			_obj.css("color",color01);
		}
	});
}
