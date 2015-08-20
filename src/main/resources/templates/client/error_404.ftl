<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><#if site??>${site.seoTitle!''}-</#if>错误</title>
<script type="text/javascript" src="/client/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
</head>
<body>
    <!-- 顶部  -->
    <#include "/client/common_header.ftl" />
    <div>
        <center>
            <h3>抱歉！您访问的页面已经删除或更改地址</h3>
            <h4>请<a href="/">返回首页</a>查看</h4>
        </center>
    </div>
    <!--底部footer-->
    <#include "/client/common_footer.ftl" />
</body>
</html>