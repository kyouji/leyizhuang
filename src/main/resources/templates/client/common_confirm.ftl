	<link rel="stylesheet" type="text/css" href="/client/css/my_base.css"/>
	
	<script src="/client/js/jquery-1.11.0.js" type="text/javascript"></script>
	<script type="text/javascript">
	    
		function win_yes(text,func){
			var he = ($(window).height() - $('.win_yn div').height())/2 - 50;
			$('.win_yn div').css({marginTop:he});	
			$('.win_yn').fadeIn(600);
			$("#title").html(text);
			$("#yes").attr("onclick",func);
		};
		
		function win_no(){	
			$('.win_yn').fadeOut(600);
		};	
	</script>
	<div class="win_yn" style="display:none;">
		<div>					
			<p id="title"></p>
			<span>
				<label id="yes">是</label>
				<label onclick="win_no();">否</label>
			</span>				
		</div>
	</div>
