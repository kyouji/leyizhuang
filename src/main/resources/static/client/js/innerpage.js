


//选项卡 - 本效果由昆明天度网络IRIS原创制作
function checkBoxShow(menuid,_mname,sumid,_sname,_hover){
	var _menu = $("#"+menuid);
	var _marr = _menu.find(_mname);
	var _sum = $("#"+sumid);
	var _sarr = _sum.find(_sname);
	var _index = 0;
	_marr.eq(0).addClass(_hover);
	_sarr.eq(0).css("display","block").siblings().css("display","none");
	_marr.hover(function(){
		_index = $(this).index();
		_marr.eq(_index).addClass(_hover).siblings().removeClass(_hover);
		_sarr.eq(_index).css("display","block").siblings().css("display","none");
		});
}




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

function openMyWin(objid,_speed){
	$("#"+objid).slideToggle(_speed);
}

//顶部浮动 - 本效果由昆明天度网络IRIS原创制作
function topTitFloat(boxid,_top,_hover){
	var _box = $("#"+boxid);
	$(window).scroll(function(){
		var _now = $(window).scrollTop();
		if(_now > _top){
			_box.addClass(_hover);
			}else {
				_box.removeClass(_hover);
				}
	});
}
//login背景切换 - 本效果由昆明天度网络IRIS原创制作
function loginBgChange(boxid,_name,_speed){
	var _arr = $("#"+boxid+" "+_name);
	var _length = _arr.length;
	var _index = 0;
	_arr.eq(_index).siblings().css({"display":"none","opacity":"0"});
	
	var _nextShow = function(){
		var _last = _index;
		_index++;
		if(_index >= _length){ _index = 0; }
		_arr.eq(_index).css("display","block");
		_arr.eq(_index).animate({"opacity":"1"},500);
		_arr.eq(_last).animate({"opacity":"0"},500,function(){
			_arr.eq(_last).css("display","none");});
		};
	
	setInterval(_nextShow,_speed);
}

//左右箭头滚动 - 本效果由昆明天度网络IRIS原创制作
function arrowListGo(boxid,_sumname,_width,_num,_mga,_name,_lastid,_nextid){
	var _box = $("#"+boxid);
	var _sum =  _box.find(_sumname);
	var _arr = _box.find(_name);
	var _length = _arr.length;
	_box.css({"width":_width+"px","overflow":"hidden"});
	var _ww = (_width/_num)-(_mga*2);
	_arr.css({"width":_ww+"px","margin":"0 "+_mga+"px"});
	var _index = 0;
	
	var _nextGo = function(){
		_index++;
		if(_index > _length-_num){_index = _length-_num;}
		if(_sum.is(":animated")){
            _sum.stop(true,true);
           }
		var _move = -_index*(_mga*2+_ww);
		_sum.animate({left:_move+"px"},300);
	};
	
	var _lastGo = function(){
		_index--;
		if(_index < 0){_index = 0;}
		if(_sum.is(":animated")){
            _sum.stop(true,true);
           }
		var _move = -_index*(_mga*2+_ww);
		_sum.animate({left:_move+"px"},300);
	};
	
	
	
	if(_length > _num){
		$("#"+_nextid).click(function(){ _nextGo(); });
		$("#"+_lastid).click(function(){ _lastGo(); });
		}
}

//帮助中心 - 本效果由昆明天度网络IRIS原创制作
function comMenuList(boxid,_part,_name,_hover,_showbox){
	var _box = $("#"+boxid);
	var _arr = _box.find(_part);
	var _length = _arr.length;
	var _showlist = _box.find(_showbox);
	var _clicklist = _box.find(_name);
	_showlist.css("display","none");
	_clicklist.click(function(){
		var _obj = $(this).parent().find(_showbox);
		var _block = _obj.css("display");
		if(_block == "none"){
			_clicklist.removeClass(_hover);
	        _showlist.slideUp("fast");
			$(this).addClass(_hover);
	        _obj.slideToggle("fast");			
			}else{}
		});	
}
//选项卡 - 本效果由昆明天度网络IRIS原创制作
function productBoxShow(menuid,_mname,sumid,_sname,thisid,_tname,_hover){
	var _menu = $("#"+menuid);
	var _marr = _menu.find(_mname);
	var _sum = $("#"+sumid);
	var _sarr = _sum.find(_sname);
	var _show = $("#"+thisid);
	var _tarr = _show.find(_tname);
	var _index = 0;
	var _bindex = 0;
	
	var _startshow = function(){
		_marr.eq(_index).addClass(_hover).siblings().removeClass(_hover);
		var _nowol = _sarr.eq(_index);
		var _nowa = _nowol.find("a");
	    _nowol.css("display","block").siblings().css("display","none");
		_nowa.eq(_bindex).addClass(_hover).siblings().removeClass(_hover);
		var _nowul = _tarr.eq(_index);
		var _nowarr = _nowul.find("li");
	    _nowul.css("display","block").siblings().css("display","none");
		_nowarr.eq(_bindex).css("display","block").siblings().css("display","none");
		}; //fun END
	_startshow();
	
	_marr.hover(function(){
		if(_index != $(this).index()){ _bindex = 0; }
		_index = $(this).index();
		_startshow();	
		});
	
	_sum.find("a").hover(function(){
		_bindex = $(this).index();
		var _nowol = _sarr.eq(_index);
		var _nowa = _nowol.find("a");
		_nowa.eq(_bindex).addClass(_hover).siblings().removeClass(_hover);
		var _nowul = _tarr.eq(_index);
		var _nowarr = _nowul.find("li");
		_nowarr.eq(_bindex).css("display","block").siblings().css("display","none");
		});
}

function productBoxWidth(_name){
	var _arr = $(_name);
	var _length = _arr.length;
	for(var i=0;i<_length;i++){
		var _box = _arr.eq(i).find(".partside_out");
		var _sum = _arr.eq(i).find("div");
		var _num = _sum.length;
		var _ww = (_num-1)*160;
		_box.css({"width":_ww+"px"});
		_box.parent().css("height","190px");
		if(_num == 6){
			_box.parent().css({"overflow":"hidden","height":"172px"});
			}
	}	
}

function menuNextPage(boxid,_name,_li,_width,_height,lastid,nextid,_move,_num){
	var _box = $(boxid);
	var _menu = _box.find(_name);
	var _last = $(lastid);
	var _next = $(nextid);
	var _length = _menu.find(_li).length;
	var _index = 0;
	var _max = _length - _num;
	
	_box.css({"width":_width+"px","height":_height+"px","overflow":"hidden","":"","":""});
	_menu.css("width","99999px");
	
	var _nextpage = function(){
		_index++;
		if(_index > _max){_index=_max;}
		var _mm = -_move*_index;
		_menu.animate({left:_mm+"px"},200);
		};//fun end
	
	var _lastpage = function(){
		_index--;
		if(_index < 0){_index=0;}
		var _mm = -_move*_index;
		_menu.animate({left:_mm+"px"},200);
		};//fun end
		
	if(_length > _num){
		_next.click(function(){
			_nextpage();
			});
		_last.click(function(){
			_lastpage();
			});
		}//大于才有效
}

function floatBoxQQ(){
	var _box = $("#floatbox");
	var _obj = $("#floatqq");
	var _menu = $("#floatboxlist");
	_obj.hover(function(){
		_menu.fadeIn(200);
		});
	_box.find(".a0").hover(function(){
		_menu.fadeOut(200);
		});
	_box.mouseleave(function(){
		_menu.fadeOut(200);
		});
}