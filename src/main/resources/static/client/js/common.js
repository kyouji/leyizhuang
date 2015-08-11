//商品展示 - 本效果由昆明天度网络IRIS原创制作
function productImgShow(boxid,_name,_menuid,_hover,_width,_height){
	var _box = $("#"+boxid);
	var _menu = $("#"+_menuid);
	var _arr = _box.find(_name);
	_menu.html(_box.html());//创建menu部分
	var _sum = _menu.find(_name);
	var _index = 0;
	
	//这里是各个必须样式的写入
	_sum.eq(0).addClass(_hover);
	_arr.eq(0).css("display","block").siblings().css("display","none");
	_box.css({"width":_width+"px","height":_height+"px","position":"relative"});
	_arr.css({"width":_width+"px","height":_height+"px","overflow":"hidden","position":"absolute","left":"0","top":"0"});
	_arr.find("img").css({"width":_width+"px","height":_height+"px"});
	
	//加入放大框
	var _showwidth = 500;
	var _showheight = 500;
	var _boxshowstr = "<div class='myboxshowstr' style='position:absolute;top:0;left:"+_width+"px;width:"+_showwidth+"px;height:"+_showheight+"px;border:1px solid #ddd;background:#fff;display:none;overflow:hidden;margin-left:20px;transition-duration:0;'></div>";
	_box.append(_boxshowstr);
	var _cha = 100;
	var _showmovestr = "<div class='myboxmovestr' style='position:absolute;top:0;left:0;width:"+_cha+"px;height:"+_cha+"px;border:1px solid #ccc;background:#fff;z-index:10;opacity:0.5;filter:alpha(Opacity=50);-moz-opacity:0.5;display:none;transition: all 0s ease-in-out 0s;'></div>";
	_box.append(_showmovestr);
	var _showout = _box.find(".myboxshowstr");//放大镜盒子
	var _mouse = _box.find(".myboxmovestr");//鼠标移动100px框
	
	//放大镜鼠标移动事件
	var _score = _showwidth/_cha;
	
	_box.mousemove(function(e){
		
		var _nowX = e.pageX - _box.offset().left;
		var _nowY = e.pageY - _box.offset().top;
		var _moveX,_moveY;
		var _jian = _cha/2;
		if(_nowX <= _jian){_moveX=0;}
		if(_nowX > _jian){_moveX=_nowX-_jian;}
		if(_nowX >= _width-_jian){_moveX=_width-_cha;}
		if(_nowY <= _jian){_moveY=0;}
		if(_nowY > _jian){_moveY=_nowY-_jian;}
		if(_nowY >= _height-_jian){_moveY=_height-_cha;}
		
		_mouse.css({"left":_moveX+"px","top":_moveY+"px"});
		
		_moveX = -_moveX * _score;
		_moveY = -_moveY * _score;
		_showout.find("img").css({"left":_moveX+"px","top":_moveY+"px"});
		
		});//fun END
	_arr.hover(function(){
		_showout.html($(this).html());
		var _imgwidth = _width*_score;
		var _imgheight = _height*_score;
		_showout.find("img").css({"width":_imgwidth+"px","height":_imgheight+"px","position":"absolute"});
		});	
	_box.mouseenter(function(){
		_showout.fadeIn(100);
		_mouse.fadeIn(100);
		});
	_box.mouseleave(function(){
		_showout.fadeOut(100);
	    _mouse.fadeOut(100);
		});
	//menu切换
	_sum.hover(function(){
		_index = $(this).index();
		_arr.eq(_index).css("display","block").siblings().css("display","none");
		_sum.eq(_index).addClass(_hover).siblings().removeClass(_hover);
		});
	//alert(_arr.length);
	
	
}


