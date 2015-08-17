<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站名称</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

<script src="/touch/js/jquery-1.9.1.min.js"></script>
<script src="/touch/js/common.js"></script>

<link href="/touch/css/base.css" rel="stylesheet" type="text/css" />
<link href="/touch/css/front.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
  
});
</script>
</head>

<body>
<div class="maintop_bg"></div>
<header class="maintop">
  <div class="main">
    <p>购物车</p>
    <a class="a1" href="javascript:history.go(-1);"><img src="/touch/images/back.png" height="22" /></a>
    <a class="a2" href="/touch"><img src="/touch/images/home.png" height="22" /></a>
  </div>
</header>
<div class="clear20"></div>

<div id="main" class="page-main">
    <#include "/touch/cart_goods.ftl" />
</div>

</body>
</html>
