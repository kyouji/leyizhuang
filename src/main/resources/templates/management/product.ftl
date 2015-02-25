<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>商品管理</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->
		<link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="/assets/css/ace.min.css" />
		<link rel="stylesheet" href="/js/kindleditor/themes/default/default.css" />
		<link rel="stylesheet" href="/css/select.css"/>
		<link rel="stylesheet" href="/css/pagination.css"/>
		
		<script src="/js/kindleditor/kindeditor-min.js" charset="utf-8"></script>
		<script src="/js/kindleditor/kindeditor.js" charset="utf-8"></script>
		<script src="/js/kindleditor/lang/zh_CN.js" charset="utf-8"></script>
		<script type="text/javascript">
			var editor1,editor2;
			KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="content1"]', {
					allowFileManager : true
				});
			    editor2 = K.create('textarea[name="content2"]', {
					allowFileManager : true
				});
			});
		</script>
		
	</head>

	<body>
		<#include "/management/common/page_head.ftl">

		<div class="main-container" id="main-container">

			<div class="main-container-inner">
				<div class="sidebar" id="sidebar">
                    <#include "/management/common/sidebar_shortcuts.ftl"/>
					
					<#include "/management/common/navi_list.ftl"/>
				</div>

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">商品</a>
							</li>
							<li class="active">类型</li>
						</ul><!-- .breadcrumb -->
					</div>

					<div class="page-content">
					    <input type="text" id="id-total-num" hidden value="<#if type_total??>${type_total}</#if>" />
                        <div class="row">
						    <#include "/management/product/add.ftl" >
                            <div id="id-modify"></div>
							<div id="id-table" class="col-xs-12">
								<div class="table-header">
                                    <a id="button-add" href="javascript:void(0)" class="col-sm-1 btn btn-success btn-sm">添加商品</a> 
                                    <div class="col-sm-7"></div>
                                    
                                    <label class="col-sm-3">关键字 <input id="keyword" type="text"></label>
                                    <a href="javascript:void(0)" class="btn btn-success btn-sm">检索</a> 
                                </div>

                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th width="4%" ></th>
                                            <th width="5%" class="center">排序</th>                                            
                                            <th width="5%" class="center">ID</th>
                                            <th width="7%" class="center">商品编码</th>
                                            <th width="7%" class="center">商品名称</th>
                                            <th width="7%" class="center">商品参数   </th>                                                                                        
                                            <th width="4%" class="center">选择</th>
                                            <th width="8%" class="center">市场价</th>
                                            <th width="8%" class="center">本网价</th>
                                            <th width="27%" class="center">状态(点击可改变状态)</th>
                                            <th width="8%" class="center">发布日期</th>
                                            <th width="8%" class="center">编辑</th>
                                        </tr>
                                    </thead>

                                    <tbody id="id-tbody">
                                        <#include "/management/product/tbody.ftl">
                                    </tbody>
                                </table>
                                
                                <div style="margin-top: 5px;float: left;">
                                    <button id="id-all-check" class="btn btn-xs">全选</button>
                                    <button id="id-all-uncheck" class="btn btn-xs">反选</button>
                                    <button id="id-sort" class="btn btn-xs">排序</button>
                                    <button id="id-delete" class="btn btn-xs">删除选中</button> 
                                </div>
                                
                                <div id="id-pagination" class="pagination" style="margin-top: 5px;float: right;"></div>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
			</div><!-- /.main-container-inner -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->
 
		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
        <script type="text/javascript">
            window.jQuery || document.write("<script src='/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
        </script>
        <![endif]-->

		<script src="/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<!-- ace scripts -->

		<script src="/assets/js/ace-elements.min.js"></script>
		<script src="/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		
        <script src="/js/management/product.js"></script>
        <script src="/js/management/product_add.js"></script>
        <script src="/js/jquery.pagination.js"></script>
        
	</body>
</html>
