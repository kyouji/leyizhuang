$(document).ready(function(){
  mouseXMove("outbox",500);
});

function mouseXMove(outid,_width){
	var _out = $("#"+outid);
	var _arr = $("#"+outid+" img");
	var _legth = _arr.length;
	_arr.css({"display":"none","position":"absolute","left":"0","top":"0"});
	_arr.eq(0).css("display","block");
	
	var _index = 0;
	var _left = _out.offset().left;//x轴位置
	var _part = _width / _legth;
	
	_out.mousemove(function(e){
		_index = (e.pageX-_left)/_part;
		_index = parseInt(_index);
		if(_index < _legth){
			_arr.eq(_index).css("display","block").siblings().css("display","none");
			}
		});	
}//END



