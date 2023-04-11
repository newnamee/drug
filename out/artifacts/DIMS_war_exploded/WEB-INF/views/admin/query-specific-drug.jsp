<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>查看${specificDrug.PDname}的库存明细 - 基于SSM的药店销售管理系统</title>
		<meta name="description" content="查看${specificDrug.PDname}的库存明细 - 基于SSM的药店销售管理系统" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<!-- page specific plugin styles -->
		<!-- text fonts -->
		<link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../assets/css/ace-ie.min.css" />
		<![endif]-->
		<!-- inline styles related to this page -->
		<!-- ace settings handler -->
		<script src="../assets/js/ace-extra.min.js"></script>
		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
		<!--[if lte IE 8]>
			<script src="../assets/js/html5shiv.min.js"></script>
			<script src="../assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="navbar-header pull-left">
					<a href="../admin/index" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							基于SSM的药店销售管理系统
						</small>
					</a>
				</div>
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-tasks"></i>
								<span class="badge badge-grey">3</span>
							</a>
							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-check"></i>
									统计信息
								</li>
								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="../admin/query-specific-admin?Ano=${currentAdmin.ano}">
												<div class="clearfix">
													<span class="pull-left">由我入库的药品总批数占比</span>
													<span class="pull-right">
														<fmt:formatNumber value="${myPDbatchesNum / (inventoryPDbatchesNum + destroyedPDbatchesNum) * 100}" pattern="#.00"/>
														%
													</span>
												</div>
												<div class="progress progress-mini progress-striped active">
													<div style="width:${myPDbatchesNum / (inventoryPDbatchesNum + destroyedPDbatchesNum) * 100}%" class="progress-bar"></div>
												</div>
											</a>
										</li>
										<li>
											<a href="../admin/query-specific-admin?Ano=${currentAdmin.ano}">
												<div class="clearfix">
													<span class="pull-left">由我入库的库存药品批数占比</span>
													<span class="pull-right">
														<fmt:formatNumber value="${myInventoryPDbatchesNum / inventoryPDbatchesNum * 100}" pattern="#.00"/>
														%
													</span>
												</div>
												<div class="progress progress-mini progress-striped active">
													<div style="width:${myInventoryPDbatchesNum / inventoryPDbatchesNum * 100}%" class="progress-bar progress-bar-warning"></div>
												</div>
											</a>
										</li>
										<li>
											<a href="../admin/query-specific-admin?Ano=${currentAdmin.ano}">
												<div class="clearfix">
													<span class="pull-left">由我销毁的药品批数占比</span>
													<span class="pull-right">
														<fmt:formatNumber value="${myDestroyedPDbatchesNum / destroyedPDbatchesNum * 100}" pattern="#.00"/>
														%
													</span>
												</div>
												<div class="progress progress-mini progress-striped active">
													<div style="width:${myDestroyedPDbatchesNum / destroyedPDbatchesNum * 100}%" class="progress-bar progress-bar-success"></div>
												</div>
											</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="green dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-success">${lowInventoryDrugsNum + close2ExpiryPDbatchesNum}</span>
							</a>
							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-exclamation-triangle"></i>
									警报
								</li>
								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											<a href="../admin/query-low-inventory-drug-list">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														库存药品数量到达下限警报
													</span>
													<span class="pull-right badge badge-info">${lowInventoryDrugsNum}</span>
												</div>
											</a>
										</li>
										<li>
											<a href="../admin/query-close-2-expiry-pdbatch-list">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
														库存药品批次临期警报
													</span>
													<span class="pull-right badge badge-success">${close2ExpiryPDbatchesNum}</span>
												</div>
											</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="../assets/images/avatars/Admin.png" alt="头像" />
								<span class="user-info">
									<small>欢迎，</small>
									${currentAdmin.aname}
								</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>
							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="../admin/profile">
										<i class="ace-icon fa fa-user"></i>
										个人信息
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="../logout">
										<i class="ace-icon fa fa-power-off"></i>
										登出
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
			<div id="sidebar" class="sidebar responsive ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>
						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>
						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>
						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
					</div>
					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>
						<span class="btn btn-info"></span>
						<span class="btn btn-warning"></span>
						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->
				<ul class="nav nav-list">
					<li class="">
						<a href="../admin/welcome">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> 欢迎页面 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="../admin/profile">
							<i class="menu-icon fa fa-tag"></i>
							<span class="menu-text"> 个人信息页面 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="../admin/query-supplier-list">
							<i class="menu-icon fa fa-briefcase"></i>
							<span class="menu-text"> 查看供应商信息列表 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="../admin/add-supplier-form">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text"> 填写新增供应商表单 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="../admin/query-low-inventory-drug-list">
							<i class="menu-icon fa fa-cogs"></i>
							<span class="menu-text"> 查看库存紧张的药品 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="../admin/query-close-2-expiry-pdbatch-list">
							<i class="menu-icon fa fa-exclamation-circle"></i>
							<span class="menu-text"> 查看临期的药品批次 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> 查看药品库存信息 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="../admin/query-drug-list">
									<i class="menu-icon fa fa-caret-right"></i>
									查看库存药品列表
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="../admin/query-pdbatch-list">
									<i class="menu-icon fa fa-caret-right"></i>
									查看库存药品批次明细
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="../admin/query-destroyed-pdbatch-list">
									<i class="menu-icon fa fa-caret-right"></i>
									查看已销毁药品批次列表
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class="">
						<a href="../admin/add-storage-form">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> 填写药品入库表单 </span>
						</a>
						<b class="arrow"></b>
					</li>
				</ul><!-- /.nav-list -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="../admin/index">首页</a>
							</li>
							<li>
								<a href="../admin/query-drug-list">查看药品库存信息</a>
							</li>
							<li class="active">查看${specificDrug.PDname}的库存明细</li>
						</ul><!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								查看${specificDrug.PDname}的库存明细
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									${specificDrug.PDname}的相关信息
								</small>
							</h1>
						</div><!-- /.page-header -->
						<c:choose>
							<c:when test="${echo != null}">
								<div class="alert alert-info">
									<button class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>
									<i class="ace-icon fa fa-hand-o-right"></i>
									${echo}
								</div>
							</c:when>
						</c:choose>
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<form class="form-horizontal" role="form" method="post" action="../admin/submit-storage-form">
									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-1"> 药品编号 </label>
										<div class="col-sm-4">
											<input class="form-control" id="form-field-1" type="text" readonly="readonly" placeholder="药品编号" name="PDno" value="${specificDrug.PDno}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-2"> 药品名称 </label>
										<div class="col-sm-4">
											<input class="form-control" id="form-field-2" type="text" readonly="readonly" placeholder="药品名称" name="PDname" value="${specificDrug.PDname}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-3"> 药品保质期 (天数) </label>
										<div class="col-sm-4">
											<input class="form-control" id="form-field-3" type="text" readonly="readonly" placeholder="药品保质期 (天数)" name="PDlife" value="${specificDrug.PDlife}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-4"> 药品库存总数 </label>
										<div class="col-sm-4">
											<input class="form-control" id="form-field-4" type="text" readonly="readonly" placeholder="药品库存总数" name="PDnum" value="${specificDrug.PDnum}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right" for="form-field-4"> 药品状态 </label>
										<div class="col-sm-4">
											<c:if test="${specificDrug.PDnum <= 50}">
												<span class="label label-sm label-warning arrowed-in-right arrowed">
													<i class="ace-icon fa fa-fire bigger-110"></i>
													库存紧张
												</span>
											</c:if>
											<c:if test="${specificDrug.existClose2ExpiryPDbatch}">
												<span class="label label-sm label-danger arrowed-in-right arrowed">
													<i class="ace-icon fa fa-bolt bigger-110"></i>
													存在临期批次
												</span>
											</c:if>
											<c:if test="${specificDrug.PDnum > 50 && specificDrug.existClose2ExpiryPDbatch == false}">
												<span class="label label-sm label-info arrowed-in-right arrowed">
													<i class="ace-icon fa fa-lightbulb-o bigger-110"></i>
													正常状态
												</span>
											</c:if>
										</div>
									</div>
								</form>
								<h3 class="header smaller lighter blue">
									查看${specificDrug.PDname}的所有批次
									<small>
										<i class="ace-icon fa fa-angle-double-right"></i>
										包括库存批次和已销毁批次
									</small>
								</h3>
								<a href="../admin/specific-storage-form?PDno=${specificDrug.PDno}" role="button" class="green" data-toggle="modal">
									<button class="btn btn-sm btn-primary">
										<i class="ace-icon fa fa-pencil-square-o bigger-110"></i>
										添加${specificDrug.PDname}的批次入库记录
										<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
									</button>
								</a>
								<div class="row">
									<div class="col-xs-12">
										<div class="clearfix">
											<div class="pull-right tableTools-container"></div>
										</div>
										<div class="table-header">
											查询结果
										</div>
										<!-- div.table-responsive -->
										<!-- div.dataTables_borderWrap -->
										<div>
											<table id="dynamic-table" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>药品批次 (生产日期)</th>
														<th>药品数量</th>
														<th>药品供应商</th>
														<th>入库管理员</th>
														<th>入库时间</th>
														<th>销毁管理员</th>
														<th>销毁时间</th>
														<th class="hidden-480">药品状态</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${specificDrug.allPDbatches}" var="pdbatch">
														<tr>
															<td>
																<fmt:formatDate value="${pdbatch.PDbatch}" pattern="yyyy 年 MM 月 dd 日"/>
															</td>
															<td>${pdbatch.PDnum}</td>
															<td>
																<a href="../admin/query-specific-supplier?Sno=${pdbatch.sno}" title="查看该供应商的供货明细">${pdbatch.sno}</a>
															</td>
															<td>
																<a href="../admin/query-specific-admin?Ano=${pdbatch.SAno}" title="查看该库存管理员的管理明细">${pdbatch.SAno}</a>
															</td>
															<td>
																<fmt:formatDate value="${pdbatch.stime}" pattern="yyyy 年 MM 月 dd 日 HH:mm"/>
															</td>
															<td>
																<a href="../admin/query-specific-admin?Ano=${pdbatch.DAno}" title="查看该库存管理员的管理明细">${pdbatch.DAno}</a>
															</td>
															<td>
																<fmt:formatDate value="${pdbatch.dtime}" pattern="yyyy 年 MM 月 dd 日 HH:mm"/>
															</td>
															<td class="hidden-480">
																<c:choose>
																	<c:when test="${pdbatch.DAno == null}">
																		<c:choose>
																			<c:when test="${pdbatch.rdays <= (specificDrug.PDlife / 10)}">
																				<span class="label label-sm label-danger arrowed-in-right arrowed">
																					<i class="ace-icon fa fa-bolt bigger-110"></i>
																					临期状态
																				</span>
																			</c:when>
																			<c:otherwise>
																				<span class="label label-sm label-info arrowed-in-right arrowed">
																					<i class="ace-icon fa fa-flag bigger-110"></i>
																					正常状态
																				</span>
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<span class="label label-sm label-inverse arrowed-in-right arrowed">
																			<i class="ace-icon fa fa-exclamation-triangle bigger-110"></i>
																			已销毁状态
																		</span>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:if test="${pdbatch.DAno == null}">
																	<div class="hidden-sm hidden-xs action-buttons">
																		<a class="green" href="../admin/edit-storage-form?PDno=${pdbatch.PDno}&tempPDbatch=<fmt:formatDate value="${pdbatch.PDbatch}" pattern="yyyy+年+MM+月+dd+日"/>" title="编辑该批次药品的信息">
																			<i class="ace-icon fa fa-pencil bigger-130"></i>
																		</a>
																		<a class="red" href="../admin/destroy-form?PDno=${pdbatch.PDno}&tempPDbatch=<fmt:formatDate value="${pdbatch.PDbatch}" pattern="yyyy+年+MM+月+dd+日"/>" title="销毁删除该批次药品">
																			<i class="ace-icon fa fa-trash-o bigger-130"></i>
																		</a>
																	</div>
																	<div class="hidden-md hidden-lg">
																		<div class="inline pos-rel">
																			<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
																				<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
																			</button>
																			<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																				<li>
																					<a href="../admin/edit-storage-form?PDno=${pdbatch.PDno}&tempPDbatch=<fmt:formatDate value="${pdbatch.PDbatch}" pattern="yyyy+年+MM+月+dd+日"/>" class="tooltip-success" data-rel="tooltip" title="编辑该批次药品的信息">
																						<span class="green">
																							<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																						</span>
																					</a>
																				</li>
																				<li>
																					<a href="../admin/destroy-form?PDno=${pdbatch.PDno}&tempPDbatch=<fmt:formatDate value="${pdbatch.PDbatch}" pattern="yyyy+年+MM+月+dd+日"/>" class="tooltip-error" data-rel="tooltip" title="销毁删除该批次药品">
																						<span class="red">
																							<i class="ace-icon fa fa-trash-o bigger-120"></i>
																						</span>
																					</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</c:if>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">基于SSM的药店销售管理系统</span>
							DIMS &copy;
						</span>
					</div>
				</div>
			</div>
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		<!-- basic scripts -->
		<!--[if !IE]> -->
			<script src="../assets/js/jquery-2.1.4.min.js"></script>
		<!-- <![endif]-->
		<!--[if IE]>
			<script src="../assets/js/jquery-1.11.3.min.js"></script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="../assets/js/jquery.dataTables.min.js"></script>
		<script src="../assets/js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="../assets/js/dataTables.buttons.min.js"></script>
		<script src="../assets/js/buttons.flash.min.js"></script>
		<script src="../assets/js/buttons.html5.min.js"></script>
		<script src="../assets/js/buttons.print.min.js"></script>
		<script src="../assets/js/buttons.colVis.min.js"></script>
		<script src="../assets/js/dataTables.select.min.js"></script>
		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				//initiate dataTables plugin
				var myTable =
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />") //if you are applying horizontal scrolling (sScrollX)
				.DataTable( {
					bAutoWidth: false,
					"aoColumns": [
						null, null, null, null, null, null, null, null, { "bSortable": false }
					],
					"aaSorting": [],
					"iDisplayLength": 5,
					"aLengthMenu": [
						[5, 10, 15, 20, 25, 30, 35, 40, 45, 50, -1],
						["5 条", "10 条", "15 条", "20 条", "25 条", "30 条", "35 条", "40 条", "45 条", "50 条", "全部"]
					],
					"oLanguage": { // 自定义提示信息
						"sLengthMenu": "每页显示 _MENU_ 记录",
						"sZeroRecords": "抱歉，没有找到",
						"sInfo": "从 _START_ 到 _END_ / 共 _TOTAL_ 条数据 ",
						"sInfoEmpty": "没有数据",
						"sInfoFiltered": "(从 _MAX_ 条数据中检索) ",
						"sSearch": "检索",
						"oPaginate": {
							"sFirst": "首页",
							"sPrevious": "前一页",
							"sNext": "后一页",
							"sLast": "尾页"
						}
					}
					//"bProcessing": true,
					//"bServerSide": true,
					//"sAjaxSource": "http://127.0.0.1/table.php"	,
					//,
					//"sScrollY": "200px",
					//"bPaginate": false,
					//"sScrollX": "100%",
					//"sScrollXInner": "120%",
					//"bScrollCollapse": true,
					//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
					//you may want to wrap the table inside a "div.dataTables_borderWrap" element
					//"iDisplayLength": 50
				} );
				$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
				new $.fn.dataTable.Buttons( myTable, {
					buttons: [
						{
							"extend": "colvis",
							"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>显示/隐藏列</span>",
							"className": "btn btn-white btn-primary btn-bold",
							columns: ':not(:first):not(:last)'
						},
						{
							"extend": "copy",
							"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>复制到剪贴板</span>",
							"className": "btn btn-white btn-primary btn-bold"
						},
						{
							"extend": "csv",
							"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>导出到 CSV 文件</span>",
							"className": "btn btn-white btn-primary btn-bold"
						},
						/* {
							"extend": "excel",
							"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>导出到 Excel 文件</span>",
							"className": "btn btn-white btn-primary btn-bold"
						},
						{
							"extend": "pdf",
							"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>导出到 PDF 文件</span>",
							"className": "btn btn-white btn-primary btn-bold"
						}, */
						{
							"extend": "print",
							"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>打印</span>",
							"className": "btn btn-white btn-primary btn-bold",
							autoPrint: false
						}
					]
				} );
				myTable.buttons().container().appendTo( $('.tableTools-container') );
				//style the message box
				var defaultCopyAction = myTable.button(1).action();
				myTable.button(1).action(function (e, dt, button, config) {
					defaultCopyAction(e, dt, button, config);
					$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
				});
				var defaultColvisAction = myTable.button(0).action();
				myTable.button(0).action(function (e, dt, button, config) {
					defaultColvisAction(e, dt, button, config);
					if($('.dt-button-collection > .dropdown-menu').length == 0) {
						$('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
					}
					$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
				});
				////
				setTimeout(function() {
					$($('.tableTools-container')).find('a.dt-button').each(function() {
						var div = $(this).find(' > div').first();
						if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
						else $(this).tooltip({container: 'body', title: $(this).text()});
					});
				}, 500);
				myTable.on( 'select', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
					}
				} );
				myTable.on( 'deselect', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
					}
				} );
				/////////////////////////////////
				//table checkboxes
				$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
				//select/deselect all rows according to table header checkbox
				$('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					$('#dynamic-table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) myTable.row(row).select();
						else myTable.row(row).deselect();
					});
				});
				//select/deselect a row when the checkbox is checked/unchecked
				$('#dynamic-table').on('click', 'td input[type=checkbox]', function(){
					var row = $(this).closest('tr').get(0);
					if(this.checked) myTable.row(row).deselect();
					else myTable.row(row).select();
				});
				$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
					e.stopImmediatePropagation();
					e.stopPropagation();
					e.preventDefault();
				});
				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]', function(){
					var $row = $(this).closest('tr');
					if($row.is('.detail-row ')) return;
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
					var off2 = $source.offset();
					//var w2 = $source.width();
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				/***************/
				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});
				/***************/
				/**
				//add horizontal scrollbars to a simple table
				$('#simple-table').css({'width':'2000px', 'max-width': 'none'}).wrap('<div style="width: 1000px;" />').parent().ace_scroll(
					{
						horizontal: true,
						styleClass: 'scroll-top scroll-dark scroll-visible',//show the scrollbars on top(default is bottom)
						size: 2000,
						mouseWheelLock: true
					}
				).css('padding-top', '12px');
				*/
			})
		</script>
	</body>
</html>
