window.onload=function () {
	var lnumber = document.getElementById('l-number');
	var ladd = document.getElementById('l-add');
	var lreduce = document.getElementById('l-reduce');
	ladd.onclick = function (){
		lnumber.value ++; 
	}
	lreduce.onclick = function (){
		lnumber.value --; 
		if (lnumber.value == 0) {
		lnumber.value = 1;
	};
	}
	
	
}