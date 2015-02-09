<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>后台管理首页</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->
		<link href="/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="/assets/css/font-awesome.min.css" type="text/css"/>
		<link rel="stylesheet" href="/assets/css/ace.min.css" type="text/css"/>
		<link rel="stylesheet" href="/css/select.css">
		<link rel="stylesheet" href="/css/pagination.css">
		<link rel="stylesheet" href="/assets/css/ace-ie.min.css" />
        <link rel="stylesheet" href="/assets/css/font-awesome-ie7.min.css" />
        <link rel="stylesheet" href="/assets/css/jquery-ui-1.10.3.full.min.css" />
        
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
							<li class="active">品牌</li>
						</ul><!-- .breadcrumb -->
					</div>

					<div class="page-content">
					    <input type="text" id="id-total-num" class="hide" value="<#if type_total??>${type_total}</#if>" />
						<div class="row">
						    <#include "/management/brand/brand_add.ftl">
                            <div id="id-modify"></div>
							<div id="id-table" class="col-sm-12">
								<!-- PAGE CONTENT BEGINS -->
                                <div class="table-header">
                                    <a id="id-new-brand" href="javascript:void(0)" class="col-sm-1 btn btn-success btn-sm">添加品牌</a> 
                                    <div class="col-sm-7"></div>
                                    <label class="col-sm-3">关键字 <input id="keyword" type="text"></label>
                                    
                                    <a href="javascript:void(0)" class="btn btn-success btn-sm">检索</a> 
                                </div>

                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th width="5%" class="center"></th>  
                                            <th width="5%" class="center">排序</th>                                                                                                 
                                            <th width="8%" class="center">ID</th>
                                            <th width="15%" class="center">类型</th>                                            
                                            <th width="15%" class="center">名称</th>
                                            <th width="20%" class="center">品牌图片</th>
                                            <th width="8%" class="center">是否推荐</th>
                                            <th width="16%" class="center">创建时间</th>
                                            <th width="8%" class="center">编辑</th>
                                        </tr>
                                    </thead>

                                    <tbody id="id-tbody">
                                            <#include "/management/brand/brand_tbody.ftl">
                                    </tbody>
                                </table>
                                
                                <div style="margin-top: 5px;float: left;">
                                    <button id="id-all-check" class="btn btn-xs">全选</button>
                                    <button id="id-all-uncheck" class="btn btn-xs">反选</button>
                                    <button id="id-sort" class="btn btn-xs">排序</button>
                                    <button id="id-delete" class="btn btn-xs">删除选中</button> 
                                </div>
                                
                                <input type="text" class="hide" /> 
                                <div id="id-pagination" class="pagination" style="margin-top: 5px;float: right;"></div>

								<!-- PAGE CONTENT ENDS -->
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
        <script src="/assets/js/jquery-ui-1.10.3.full.min.js"></script>
        <script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
        
        
		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<!-- ace scripts -->

		<script src="/assets/js/ace-elements.min.js"></script>
		<script src="/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->				
		
		<!--全选反选提交删除等-->
        <script src="/js/management/brand.js" type="text/javascript"></script>
        
        <!--pagination-->
		<script src="/js/jquery.pagination.js" type="text/javascript"></script>
        
        <!--新增参数提交-->        
        <script src="/js/management/brand_add.js" type="text/javascript"></script>
        
                
	</body>
</html>

