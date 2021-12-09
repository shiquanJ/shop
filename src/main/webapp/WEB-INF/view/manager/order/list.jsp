<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>订单管理</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
		
		<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		
		<script src="/assets/vendor/appear/jquery-3.5.1.min.js"></script>
		
		<!-- 引入 Bootstrap -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		
		<script type="text/javascript">
			
			$(function(){
				pageQuery(1);
			});
			
			function pageQuery(pageNo){
				
				var data =
					{
						"pageNo": pageNo
					};
				
				$.ajax({
					url: "/manager/order/data",
					type: "GET",
					data: data,
					success:function(result){
						
						if ( result.success ) {
							var tableContent = "";
							var pageContent = "";
	
							var userPage = result.data;
							var arrays = userPage.datas;
							
							if(arrays.length > 0){
								
								$.each(arrays, function(i, item){
									
									tableContent += '<tr>											';
									tableContent += '	<td><a>' + item.id + '</a></td>				';
									tableContent += '	<td>' + item.username + '</td>				';
									tableContent += '	<td>' + item.email + '</td>					';
									tableContent += '	<td>' + item.amount + '</td>				';
									tableContent += '	<td>' + item.status + '</td>				';
									tableContent += '	<td>' + item.create_time + '</td>			';
									tableContent += '</tr>											';
									
								});
								
								if(pageNo == 1){
									pageContent += '<li class="disabled"><a href="#"> << </a></li>';
									pageContent += '<li class="disabled"><a href="#"> < </a> </li>';
								} else {
									pageContent += '<li> <a href="#" onclick="pageQuery(1)"><<</a></li>';
									pageContent += '<li><a href="#" onclick="pageQuery('+ (pageNo-1) +')"><</a></li>';
								}
								
								for(var i = 1; i <= userPage.totalNo; i++){
									if ( i == pageNo ) {
										pageContent += '<li class="active"><a  href="#">'+i+'</a></li>';
									} else if(i >= pageNo - 5 && i <= pageNo + 5){
										pageContent += '<li><a href="#" onclick="pageQuery('+(i)+')">'+i+'</a></li>';
									}
								}
								
								if(pageNo < userPage.totalNo){
									pageContent += '<li><a href="#" onclick="pageQuery('+(pageNo+1)+')"> > </a> </li>';
									pageContent += '<li> <a href="#" onclick="pageQuery('+ userPage.totalNo +')"> >> </a> </li>';
								} else {
									pageContent += '<li class="disabled"><a href="#"> ></a></li>';
									pageContent += '<li class="disabled"><a href="#">>></a> </li>';
								}
								
							} else {
								tableContent += '<tr>';
								tableContent += '	<td colspan="6">没有订单信息.</td>';
								tableContent += '</tr>';
							}
							
							$("#list tbody").html(tableContent);
							$("#pagination").html(pageContent);
						} else {
							alert('查询中发生错误.');
							location.reload();
						}
						
					}
				});
			}
			
		</script>
	</head>
	
<body>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
			
				<div class="row clearfix">
					<div class="col-md-12 column">
						<h2 class="text-left">订单管理</h2>
					</div>
				</div>
				
				<div class="row clearfix text-right">
					<div class="col-md-12 column">
						<form role="form" class="form-inline">
							<div class="form-group">
								<label>订单查询： </label>
							</div>
							<div class="form-group">
								<input id="keyWord" type="text" class="form-control" />
							</div>
							<button type="button" class="btn btn-default" id="searchBtn">查询</button>
						</form>
					</div>
				</div>
				
				<p></p>
				
				<table id="list" class="table table-hover">
					<thead>
						<tr>
							<th>订单编号</th>
							<th>姓名</th>
							<th>邮箱</th>
							<th>支付金额</th>
							<th>支付状态</th>
							<th>结算金额</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				
				<div class="row clearfix text-center">
					<div class="col-md-12 column">
						<ul id="pagination" class="pagination pagination-sm">
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>