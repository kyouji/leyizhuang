<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>后台管理首页</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->
		<link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="/assets/css/ace.min.css" />
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
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<input type="text" id="id-total-num" hidden value="<#if type_total??>${type_total}</#if>" />
                                <div class="table-header">
                                    <a id="id-new-paramter" href="javascript:void(0)" class="col-sm-1 btn btn-success btn-sm">添加类型</a> 
                                    <div class="col-sm-7"></div>
                                    
                                    <label class="col-sm-3">关键字 <input id="keyword" type="text"></label>
                                    <a href="javascript:void(0)" class="btn btn-success btn-sm">检索</a> 
                                </div>

                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th width="5%" class="center"></th>  
                                            <th width="5%" class="center">排序</th>                                                                                                 
                                            <th width="10%" class="center">id</th>
                                            <th width="40%" class="center">名称</th>                                            
                                            <th width="32%" class="center">父类型</th>
                                            <th width="8%" class="center">编辑</th>
                                        </tr>
                                    </thead>

                                    <tbody id="id-tbody">
                                        <#include "/management/product_type/product_type_tbody.ftl">
                                    </tbody>
                                </table>
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

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<!-- ace scripts -->

		<script src="/assets/js/ace-elements.min.js"></script>
		<script src="/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
        <script src="/js/management/product_type.js"></script>
        <script src="/js/jquery.pagination.js"></script>
        
	</body>
</html>
