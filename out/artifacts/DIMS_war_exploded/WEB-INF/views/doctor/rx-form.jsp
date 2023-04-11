<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>${type ? '新增' : '修改'}处方表单 - 基于SSM的药店销售管理系统</title>
		<meta name="description" content="${type ? '新增' : '修改'}处方表单 - 基于SSM的药店销售管理系统" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" />
		<link rel="stylesheet" href="../assets/css/chosen.min.css" />
		<link rel="stylesheet" href="../assets/css/bootstrap-datepicker3.min.css" />
		<link rel="stylesheet" href="../assets/css/bootstrap-timepicker.min.css" />
		<link rel="stylesheet" href="../assets/css/daterangepicker.min.css" />
		<link rel="stylesheet" href="../assets/css/bootstrap-datetimepicker.min.css" />
		<link rel="stylesheet" href="../assets/css/bootstrap-colorpicker.min.css" />
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
					<a href="index.html" class="navbar-brand">
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
											<a href="../doctor/query-solved-rx-list">
												<div class="clearfix">
													<span class="pull-left">已处理处方数目占比</span>
													<span class="pull-right">
														<fmt:formatNumber value="${solvedRxsNum / (solvedRxsNum + unsolvedRxsNum) * 100}" pattern="#.00"/>
														%
													</span>
												</div>
												<div class="progress progress-mini progress-striped active">
													<div style="width:${solvedRxsNum / (solvedRxsNum + unsolvedRxsNum) * 100}%" class="progress-bar"></div>
												</div>
											</a>
										</li>
										<li>
											<a href="../doctor/query-unsolved-rx-list">
												<div class="clearfix">
													<span class="pull-left">未处理处方数目占比</span>
													<span class="pull-right">
														<fmt:formatNumber value="${unsolvedRxsNum / (solvedRxsNum + unsolvedRxsNum) * 100}" pattern="#.00"/>
														%
													</span>
												</div>
												<div class="progress progress-mini progress-striped active">
													<div style="width:${unsolvedRxsNum / (solvedRxsNum + unsolvedRxsNum) * 100}%" class="progress-bar progress-bar-warning"></div>
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">由我开出的处方数目占比</span>
													<span class="pull-right">
														<fmt:formatNumber value="${myPrescribeRxsNum / (solvedRxsNum + unsolvedRxsNum) * 100}" pattern="#.00"/>
														%
													</span>
												</div>
												<div class="progress progress-mini progress-striped active">
													<div style="width:${myPrescribeRxsNum / (solvedRxsNum + unsolvedRxsNum) * 100}%" class="progress-bar progress-bar-success"></div>
												</div>
											</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="../assets/images/avatars/${currentDoctor.dsex ? 'Male' : 'Female'}Doctor.png" alt="头像" />
								<span class="user-info">
									<small>欢迎，</small>
									${currentDoctor.dname}
								</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>
							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="../doctor/profile">
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
						<a href="../doctor/welcome">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> 欢迎页面 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="../doctor/profile">
							<i class="menu-icon fa fa-tag"></i>
							<span class="menu-text"> 个人信息页面 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="../doctor/query-drug-list">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> 查看库存药品列表 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="${type ? 'active' : ''}">
						<a href="../doctor/add-rx-form">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> 填写新建处方表单 </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list-alt"></i>
							<span class="menu-text"> 查看处方列表 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="../doctor/query-unsolved-rx-list">
									<i class="menu-icon fa fa-caret-right"></i>
									查看未处理处方列表
								</a>
								<b class="arrow"></b>
							</li>
							<li class="">
								<a href="../doctor/query-solved-rx-list">
									<i class="menu-icon fa fa-caret-right"></i>
									查看已处理处方列表
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
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
							<li class="active">
								<c:choose>
									<c:when test="${type}">新建</c:when>
									<c:otherwise>修改 ${rx.pno} 号处方的</c:otherwise>
								</c:choose>
								处方表单
							</li>
						</ul><!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								<c:choose>
									<c:when test="${type}">新建</c:when>
									<c:otherwise>修改 ${rx.pno} 号处方的</c:otherwise>
								</c:choose>
								处方表单
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									处方表单
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
								<form class="form-horizontal" role="form" method="post" action="../doctor/submit-rx-form">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 处方编号 (${type ? '由系统给定' : '不可修改'}) </label>
										<div class="col-sm-4">
											<input class="form-control" id="form-field-1" type="text" readonly="readonly" placeholder="处方编号 (${type ? '由系统给定' : '不可修改'})" ${type ? '' : 'name="Pno"'} value="${rx.pno}" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 病人身份证号码 </label>
										<div class="col-sm-4">
											<input class="form-control" id="form-field-2" type="text" placeholder="病人身份证号码" name="Pid" value="${rx.pid}" required="required" maxlength=20 onKeyUp="value=value.replace(/[\W]/g,'')" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-3"> 开出处方的医生 </label>
										<div class="col-sm-4">
											<select class="chosen-select form-control" id="form-field-3" name="Dno" data-placeholder="选择开出处方的医生..." required="required">
												<option value=""></option>
												<c:forEach items="${doctors}" var="doctor">
													<option value="${doctor.dno}" ${doctor.dno == rx.dno ? 'selected="selected"' : ''}>${doctor.dname}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="id-date-picker-1"> 处方开出日期 </label>
										<div class="col-sm-4">
											<div class="input-group">
												<input class="form-control date-picker" id="id-date-picker-1" name="tempPdate" value="<fmt:formatDate value="${rx.ptime}" pattern="yyyy 年 MM 月 dd 日"/>" type="text" placeholder="处方开出日期" data-date-format="yyyy 年 mm 月 dd 日" required="required" />
												<span class="input-group-addon">
													<i class="fa fa-calendar bigger-110"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="timepicker1"> 处方开出时间 </label>
										<div class="col-sm-4">
											<div class="input-group">
												<input class="form-control" id="timepicker1" type="text" placeholder="处方开出时间" name="tempPtime" value="<fmt:formatDate value="${rx.ptime}" pattern="HH:mm:ss"/>" required="required" />
												<span class="input-group-addon">
													<i class="fa fa-clock-o bigger-110"></i>
												</span>
											</div>
										</div>
									</div>
									<c:if test="${type == false}">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-6"> 处方包含的药品列表 </label>
											<div class="col-sm-4">
												<h5 class="pink">
													<i class="ace-icon fa fa-hand-o-right green"></i>
													<a href="#modal-form" role="button" class="green" data-toggle="modal"> 为该处方添加一种药品 </a>
												</h5>
												<h5 class="pink">
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													<a href="#modal-form" role="button" class="blue" data-toggle="modal"> 修改某一种药品的数量 </a>
												</h5>
												<table id="simple-table" class="table table-bordered table-hover">
													<thead>
														<tr>
															<th>药品编号</th>
															<th>药品名称</th>
															<th>药品数量</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${rx.drugs}" var="drug">
															<tr>
																<td>${drug.PDno}</td>
																<td>${drug.PDname}</td>
																<td>${drug.PDnum}</td>
																<td>
																	<div class="hidden-sm hidden-xs action-buttons">
																		<a class="red" href="../doctor/delete-rx-drug?Pno=${rx.pno}&PDno=${drug.PDno}" title="删除该药品">
																			<i class="ace-icon fa fa-trash-o bigger-130"></i>
																		</a>
																	</div>
																	<div class="hidden-md hidden-lg">
																		<div class="inline pos-rel">
																			<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
																				<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																			</button>
																			<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																				<li>
																					<a href="../doctor/delete-rx-drug?Pno=${rx.pno}&PDno=${drug.PDno}" class="tooltip-error" data-rel="tooltip" title="删除该药品">
																						<span class="red">
																							<i class="ace-icon fa fa-trash-o bigger-120"></i>
																						</span>
																					</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</c:if>
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i>
												提交
											</button>
											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												重置
											</button>
										</div>
									</div>
								</form>
								<!-- PAGE CONTENT ENDS -->
								<div id="modal-form" class="modal" tabindex="-1">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="blue bigger">为该处方添加一种药品 / 修改某一种药品的数量</h4>
											</div>
											<form class="form-horizontal" role="form" method="post" action="../doctor/submit-rx-drug-form">
												<input type="hidden" name="Pno" value="${rx.pno}">
												<div class="modal-body">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-7"> 药品名称 </label>
														<div class="col-sm-4">
															<select class="chosen-select form-control" id="form-field-7" name="PDno" data-placeholder="选择一种药品..." required="required">
																<option value=""></option>
																<c:forEach items="${drugs}" var="drug">
																	<option value="${drug.PDno}">${drug.PDname}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="spinner1"> 药品数量 </label>
														<div class="col-sm-4">
															<input class="form-control" id="spinner1" type="text" placeholder="药品数量" name="PDnum" value="${pdbatch.PDnum}" required="required" />
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button class="btn btn-sm btn-primary" type="submit">
														<i class="ace-icon fa fa-check bigger-110"></i>
														提交
													</button>
													<button class="btn btn-sm btn-warning" type="reset">
														<i class="ace-icon fa fa-undo bigger-110"></i>
														重置
													</button>
													<button class="btn btn-sm" data-dismiss="modal">
														<i class="ace-icon fa fa-times bigger-110"></i>
														取消
													</button>
												</div>
											</form>
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
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<!-- page specific plugin scripts -->
		<!--[if lte IE 8]>
			<script src="../assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../assets/js/chosen.jquery.min.js"></script>
		<script src="../assets/js/spinbox.min.js"></script>
		<script src="../assets/js/bootstrap-datepicker.min.js"></script>
		<script src="../assets/js/bootstrap-timepicker.min.js"></script>
		<script src="../assets/js/moment.min.js"></script>
		<script src="../assets/js/daterangepicker.min.js"></script>
		<script src="../assets/js/bootstrap-datetimepicker.min.js"></script>
		<script src="../assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="../assets/js/jquery.knob.min.js"></script>
		<script src="../assets/js/autosize.min.js"></script>
		<script src="../assets/js/jquery.inputlimiter.min.js"></script>
		<script src="../assets/js/jquery.maskedinput.min.js"></script>
		<script src="../assets/js/bootstrap-tag.min.js"></script>
		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				$('#id-disable-check').on('click', function() {
					var inp = $('#form-input-readonly').get(0);
					if(inp.hasAttribute('disabled')) {
						inp.setAttribute('readonly', 'true');
						inp.removeAttribute('disabled');
						inp.value="This text field is readonly!";
					}
					else {
						inp.setAttribute('disabled', 'disabled');
						inp.removeAttribute('readonly');
						inp.value="This text field is disabled!";
					}
				});
				if(!ace.vars['touch']) {
					$('.chosen-select').chosen({allow_single_deselect:true});
					//resize the chosen on window resize
					$(window)
					.off('resize.chosen')
					.on('resize.chosen', function() {
						$('.chosen-select').each(function() {
							 var $this = $(this);
							 $this.next().css({'width': $this.parent().width()});
						})
					}).trigger('resize.chosen');
					//resize chosen on sidebar collapse/expand
					$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
						if(event_name != 'sidebar_collapsed') return;
						$('.chosen-select').each(function() {
							 var $this = $(this);
							 $this.next().css({'width': $this.parent().width()});
						})
					});
					$('#chosen-multiple-style .btn').on('click', function(e){
						var target = $(this).find('input[type=radio]');
						var which = parseInt(target.val());
						if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
						 else $('#form-field-select-4').removeClass('tag-input-style');
					});
				}
				$('[data-rel=tooltip]').tooltip({container:'body'});
				$('[data-rel=popover]').popover({container:'body'});
				autosize($('textarea[class*=autosize]'));
				$('textarea.limited').inputlimiter({
					remText: '%n character%s remaining...',
					limitText: 'max allowed : %n.'
				});
				$.mask.definitions['~']='[+-]';
				$('.input-mask-date').mask('99/99/9999');
				$('.input-mask-phone').mask('(999) 999-9999');
				$('.input-mask-eyescript').mask('~9.99 ~9.99 999');
				$(".input-mask-product").mask("a*-999-a999",{placeholder:" ",completed:function(){alert("You typed the following: "+this.val());}});
				$( "#input-size-slider" ).css('width','200px').slider({
					value:1,
					range: "min",
					min: 1,
					max: 8,
					step: 1,
					slide: function( event, ui ) {
						var sizing = ['', 'input-sm', 'input-lg', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
						var val = parseInt(ui.value);
						$('#form-field-4').attr('class', sizing[val]).attr('placeholder', '.'+sizing[val]);
					}
				});
				$( "#input-span-slider" ).slider({
					value:1,
					range: "min",
					min: 1,
					max: 12,
					step: 1,
					slide: function( event, ui ) {
						var val = parseInt(ui.value);
						$('#form-field-5').attr('class', 'col-xs-'+val).val('.col-xs-'+val);
					}
				});
				//"jQuery UI Slider"
				//range slider tooltip example
				$( "#slider-range" ).css('height','200px').slider({
					orientation: "vertical",
					range: true,
					min: 0,
					max: 100,
					values: [ 17, 67 ],
					slide: function( event, ui ) {
						var val = ui.values[$(ui.handle).index()-1] + "";
						if( !ui.handle.firstChild ) {
							$("<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
							.prependTo(ui.handle);
						}
						$(ui.handle.firstChild).show().children().eq(1).text(val);
					}
				}).find('span.ui-slider-handle').on('blur', function(){
					$(this.firstChild).hide();
				});
				$( "#slider-range-max" ).slider({
					range: "max",
					min: 1,
					max: 10,
					value: 2
				});
				$( "#slider-eq > span" ).css({width:'90%', 'float':'left', margin:'15px'}).each(function() {
					// read initial values from markup and remove that
					var value = parseInt( $( this ).text(), 10 );
					$( this ).empty().slider({
						value: value,
						range: "min",
						animate: true
					});
				});
				$("#slider-eq > span.ui-slider-purple").slider('disable');//disable third item
				$('#id-input-file-1, #id-input-file-2').ace_file_input({
					no_file:'No File ...',
					btn_choose:'Choose',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
				//pre-show a file name, for example a previously selected file
				//$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])
				$('#id-input-file-3').ace_file_input({
					style: 'well',
					btn_choose: 'Drop files here or click to choose',
					btn_change: null,
					no_icon: 'ace-icon fa fa-cloud-upload',
					droppable: true,
					thumbnail: 'small'//large | fit
					//,icon_remove:null//set null, to hide remove/reset button
					/**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
					/**,before_remove : function() {
						return true;
					}*/
					,
					preview_error : function(filename, error_code) {
						//name of the file that failed
						//error_code values
						//1 = 'FILE_LOAD_FAILED',
						//2 = 'IMAGE_LOAD_FAILED',
						//3 = 'THUMBNAIL_FAILED'
						//alert(error_code);
					}
				}).on('change', function(){
					//console.log($(this).data('ace_input_files'));
					//console.log($(this).data('ace_input_method'));
				});
				//$('#id-input-file-3')
				//.ace_file_input('show_file_list', [
					//{type: 'image', name: 'name of image', path: 'http://path/to/image/for/preview'},
					//{type: 'file', name: 'hello.txt'}
				//]);
				//dynamically change allowed formats by changing allowExt && allowMime function
				$('#id-file-format').removeAttr('checked').on('change', function() {
					var whitelist_ext, whitelist_mime;
					var btn_choose
					var no_icon
					if(this.checked) {
						btn_choose = "Drop images here or click to choose";
						no_icon = "ace-icon fa fa-picture-o";
						whitelist_ext = ["jpeg", "jpg", "png", "gif", "bmp"];
						whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
					}
					else {
						btn_choose = "Drop files here or click to choose";
						no_icon = "ace-icon fa fa-cloud-upload";
						whitelist_ext = null;//all extensions are acceptable
						whitelist_mime = null;//all mimes are acceptable
					}
					var file_input = $('#id-input-file-3');
					file_input
					.ace_file_input('update_settings',
					{
						'btn_choose': btn_choose,
						'no_icon': no_icon,
						'allowExt': whitelist_ext,
						'allowMime': whitelist_mime
					})
					file_input.ace_file_input('reset_input');
					file_input
					.off('file.error.ace')
					.on('file.error.ace', function(e, info) {
						//console.log(info.file_count);//number of selected files
						//console.log(info.invalid_count);//number of invalid files
						//console.log(info.error_list);//a list of errors in the following format
						//info.error_count['ext']
						//info.error_count['mime']
						//info.error_count['size']
						//info.error_list['ext'] = [list of file names with invalid extension]
						//info.error_list['mime'] = [list of file names with invalid mimetype]
						//info.error_list['size'] = [list of file names with invalid size]
						/**
						if( !info.dropped ) {
							//perhapse reset file field if files have been selected, and there are invalid files among them
							//when files are dropped, only valid files will be added to our file array
							e.preventDefault();//it will rest input
						}
						*/
						//if files have been selected (not dropped), you can choose to reset input
						//because browser keeps all selected files anyway and this cannot be changed
						//we can only reset file field to become empty again
						//on any case you still should check files with your server side script
						//because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
					});
					/**
					file_input
					.off('file.preview.ace')
					.on('file.preview.ace', function(e, info) {
						console.log(info.file.width);
						console.log(info.file.height);
						e.preventDefault();//to prevent preview
					});
					*/
				});
				$('#spinner1').ace_spinner({value:1, min:1, max:10000, step:1, btn_up_class:'btn-info', btn_down_class:'btn-info'})
				.closest('.ace-spinner')
				.on('changed.fu.spinbox', function(){
					//console.log($('#spinner1').val())
				});
				$('#spinner2').ace_spinner({value:0, min:0, max:10000, step:100, touch_spinner: true, icon_up:'ace-icon fa fa-caret-up bigger-110', icon_down:'ace-icon fa fa-caret-down bigger-110'});
				$('#spinner3').ace_spinner({value:0, min:-100, max:100, step:10, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success', btn_down_class:'btn-danger'});
				$('#spinner4').ace_spinner({value:0, min:-100, max:100, step:10, on_sides: true, icon_up:'ace-icon fa fa-plus', icon_down:'ace-icon fa fa-minus', btn_up_class:'btn-purple', btn_down_class:'btn-purple'});
				//$('#spinner1').ace_spinner('disable').ace_spinner('value', 11);
				//or
				//$('#spinner1').closest('.ace-spinner').spinner('disable').spinner('enable').spinner('value', 11);//disable, enable or change value
				//$('#spinner1').closest('.ace-spinner').spinner('value', 0);//reset to 0
				//datepicker plugin
				//link
				$('.date-picker').datepicker({
					autoclose: true,
					todayHighlight: true
				})
				//show datepicker when clicking on the icon
				.next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				//or change it into a date range picker
				$('.input-daterange').datepicker({autoclose:true});
				//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
				$('input[name=date-range-picker]').daterangepicker({
					'applyClass' : 'btn-sm btn-success',
					'cancelClass' : 'btn-sm btn-default',
					locale: {
						applyLabel: 'Apply',
						cancelLabel: 'Cancel',
					}
				})
				.prev().on(ace.click_event, function(){
					$(this).next().focus();
				});
				$('#timepicker1').timepicker({
					minuteStep: 1,
					showSeconds: true,
					showMeridian: false,
					disableFocus: true,
					icons: {
						up: 'fa fa-chevron-up',
						down: 'fa fa-chevron-down'
					}
				}).on('focus', function() {
					$('#timepicker1').timepicker('showWidget');
				}).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				if(!ace.vars['old_ie']) $('#date-timepicker1').datetimepicker({
				 //format: 'MM/DD/YYYY h:mm:ss A',//use this option to display seconds
				 icons: {
					time: 'fa fa-clock-o',
					date: 'fa fa-calendar',
					up: 'fa fa-chevron-up',
					down: 'fa fa-chevron-down',
					previous: 'fa fa-chevron-left',
					next: 'fa fa-chevron-right',
					today: 'fa fa-arrows ',
					clear: 'fa fa-trash',
					close: 'fa fa-times'
				 }
				}).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				$('#colorpicker1').colorpicker();
				//$('.colorpicker').last().css('z-index', 2000);//if colorpicker is inside a modal, its z-index should be higher than modal'safe
				$('#simple-colorpicker-1').ace_colorpicker();
				//$('#simple-colorpicker-1').ace_colorpicker('pick', 2);//select 2nd color
				//$('#simple-colorpicker-1').ace_colorpicker('pick', '#fbe983');//select #fbe983 color
				//var picker = $('#simple-colorpicker-1').data('ace_colorpicker')
				//picker.pick('red', true);//insert the color if it doesn't exist
				$(".knob").knob();
				var tag_input = $('#form-field-tags');
				try{
					tag_input.tag(
						{
							placeholder:tag_input.attr('placeholder'),
							//enable typeahead by specifying the source array
							source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
							/**
							//or fetch data from database, fetch those that match "query"
							source: function(query, process) {
								$.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
								.done(function(result_items){
									process(result_items);
								});
							}
							*/
						}
					)
					//programmatically add/remove a tag
					var $tag_obj = $('#form-field-tags').data('tag');
					$tag_obj.add('Programmatically Added');
					var index = $tag_obj.inValues('some tag');
					$tag_obj.remove(index);
				}
				catch(e) {
					//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
					tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
					//autosize($('#form-field-tags'));
				}
				/////////
				$('#modal-form input[type=file]').ace_file_input({
					style:'well',
					btn_choose:'Drop files here or click to choose',
					btn_change:null,
					no_icon:'ace-icon fa fa-cloud-upload',
					droppable:true,
					thumbnail:'large'
				})
				//chosen plugin inside a modal will have a zero width because the select element is originally hidden
				//and its width cannot be determined.
				//so we set the width after modal is show
				$('#modal-form').on('shown.bs.modal', function () {
					if(!ace.vars['touch']) {
						$(this).find('.chosen-container').each(function(){
							$(this).find('a:first-child').css('width', '210px');
							$(this).find('.chosen-drop').css('width', '210px');
							$(this).find('.chosen-search input').css('width', '200px');
						});
					}
				})
				/**
				//or you can activate the chosen plugin after modal is shown
				//this way select element becomes visible with dimensions and chosen works as expected
				$('#modal-form').on('shown', function () {
					$(this).find('.modal-chosen').chosen();
				})
				*/
				$(document).one('ajaxloadstart.page', function(e) {
					autosize.destroy('textarea[class*=autosize]')
					$('.limiterBox,.autosizejs').remove();
					$('.daterangepicker.dropdown-menu,.colorpicker.dropdown-menu,.bootstrap-datetimepicker-widget.dropdown-menu').remove();
				});
			});
		</script>
	</body>
</html>
