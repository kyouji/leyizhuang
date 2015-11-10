<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><#if site??>${site.seoTitle!''}-</#if>门店地址</title>
<script type="text/javascript" src="/client/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=e69b85b23828f9b67895487525778c64"></script> 
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="shortcut icon" href="/root/images/goods/zphk_logo.ico">
</head>
<body>
    <!-- 顶部  -->
    <#include "/client/common_header.ftl" />
    <div style="width:1200px;display:block;overflow:hidden;">
        <div style="float:left;border:1px solid black;height:600px;width:188px;margin-top:20px;">
        </div>
        <div id="map" style="width:1010px;height:600px;float:right;margin-top:20px;">
        </div>
    </div>
    <script>
        var map = new AMap.Map("map",{
            zoom:10,
            center:[116.39,39.9]        
        });
    </script>
    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>