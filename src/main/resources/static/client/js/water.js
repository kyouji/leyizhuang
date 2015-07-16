$(document).ready(function(){
  waterfallList("mainbox","datebox","mainfloat","waterthings",40,200);//瀑布流最外层id,最外层id,瀑布流专用class,元素class名称,间距（单位px）,最佳宽度（单位px）
});

function waterfallList(mainid,boxid,_clname,_elname,_between,_width){
	var _main = $("#"+mainid);
	var _box = $("#"+boxid);
	var _arr = $("#"+boxid+" > li");
	var _win = 1000;//当前可视宽度
	var _bet02 = _between/2;
	var _outw = _win/(_between+_width);
	var _num = Math.floor(_outw);//取整，横排个数
	
	//if(_win > 1200){_win = 1200;}
	
	if(_num == 0){_num = 1;}
	var _mainw = _num*(_between+_width);//实际主体宽度
	
	_main.css({"position":"relative","margin":"0 auto","width":_mainw+"px"});//实际主体必要样式赋值
	_box.css("display","none");
	
	//第一次带入值
	var _str = "<div class='"+_clname+"' style='position:relative;float:left;display:inline;width:"+_width+"px;margin:0 "+_bet02+"px;_width:"+(_width-_num*2)+"px;'></div>";
	_main.html(_str);
	for(var i=1;i<_num;i++){
		_main.append(_str);	
	}
	var _flarr = _main.find("."+_clname);
	for(var i=0;i<_flarr.length;i++){
		for(var j=i;j<_arr.length;j++){
			_flarr.eq(i).append(_arr.eq(j).html());
			j = j+_flarr.length-1;
		}
	}
	
	var winRes = function(){
		var hisnum = _num;//获取当前的横排个数
		_win = $(window).width();
		if(_win > 1000){_win = 1000;}
		_outw = _win/(_between+_width);
		_num = Math.floor(_outw);//取整，横排个数
		if(_num == 0){_num = 1;}
		_mainw = _num*(_between+_width);//实际主体宽度
		_main.css({"width":_mainw+"px"});
		
		if(hisnum > _num){
			widthReplay(hisnum,_num);
		}//窗口变小事件
		
		if(hisnum < _num){
			widthReplay(hisnum,_num);
		}//窗口变大事件
		};
		

	//宽度增加后代用方法	
	var widthReplay = function(_before,_getnum){
		var newarr = new Array();
		var _maxnum = 1;
		
		for(var i=0;i<_before;i++){
			var _n01 = _flarr.eq(i).find("."+_elname).length;
			if(_n01 >= _maxnum){
				_maxnum = _n01;
				}
		}
		//alert(_maxnum);
		for(var i=0;i<_maxnum;i++){
			for(var j=0;j<_before;j++){
				var _thearr = _flarr.eq(j).find("."+_elname);
				var _thestr = _thearr.eq(i).prop("outerHTML");
				if(_thestr == undefined){}else{newarr.push(_thestr);}
			}
		}
		//alert(newarr.length);
		_main.html(_str);
	    for(var i=1;i<_getnum;i++){
		    _main.append(_str);	
	    }
	    _flarr = _main.find("."+_clname);
	    for(var i=0;i<_flarr.length;i++){
		    for(var j=i;j<newarr.length;j++){
			    _flarr.eq(i).append(newarr[j]);
			    j = j+_flarr.length-1;
		    }
	    }
		
	};
	_box.remove();//删除不必要的数据
	
	//放入数值方法
	var heightAdd = function(_getnum,_addstr){
		var _min = _flarr.eq(0).height();
		var _minind = 0;//最小高度的索引列
		for(var i=0;i<_getnum;i++){
			var _theh = _flarr.eq(i).height();
			if(_theh < _min){
			   	_min = _theh;
				_minind = i;
			}
		}
		_flarr.eq(_minind).append(_addstr);
	};
	
	$("#addNew").click(function(){
		    _flarr = _main.find("."+_clname);
			_num = _flarr.length;
			var _addstr = "<div class='things'><a href='#'><img src='img02.jpg' /></a><h2>我是新加入的哦~别搞错了啊</h2><p>比如文字内容链接什么的，很随意哦</p></div>";
		    heightAdd(_num,_addstr);
	});
	
}

