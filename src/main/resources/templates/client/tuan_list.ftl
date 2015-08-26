<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>正品惠客-惠客团购</title>
<!--css-->
<link href="/client/css/base.css" rel="stylesheet" type="text/css" />
<link href="/client/css/Groupbuy.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/client/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
    function checkTime(i)  
    {  
        if (i < 10) {  
            i = "0" + i;  
        }  
        return i;  
    }
</script>
</head>

<body>

<#include "/client/common_header.ftl">

<!--团购开始-->
<div class="hui_groupbuy">
    <!--即将开团开始-->
    <div id="soon_tuan_by_dx" class="today_gb">
        <#include "/client/going_tuan.ftl">
    </div>
    <!--即将开团结束-->
    
    <!--正在团购开始-->
    <div class="whole_gb">
        <#include "/client/now_tuan.ftl">
    </div>
    <!--正在团购结束-->
</div>
<!--团购结束-->

<!--底部footer-->
<#include "/client/common_footer.ftl" >
</body>
</html>
