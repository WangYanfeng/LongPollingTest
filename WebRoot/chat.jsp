<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//判断是否已经登陆
Object userName=session.getAttribute("userName");
if(userName==null){
	response.sendRedirect("../");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="./js/jquery.js"></script>
	<script src="./js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<script>
  	$(function(){
  		//getTime();
  		
  		getChatMessage();
  	});
  	function getTime(){
  		$.ajax({
  			url:"./servlet/TimePolling",
  			dataType:"html",
  			type:"POST",
  			data:{
  				id:1
  			},
  			success:function(data){
  				$("#time").html(data);
  				getTime();
  			}
  		});
  	}
  	function getChatMessage(){
  		$.ajax({
  			url:"./servlet/Chat",
  			dataType:"html",
  			type:"POST",
  			data:{
  				id:1
  			},
  			success:function(data){
  				$("#chatHistory").append(data+"<br/>");
  				getChatMessage();
  			}
  		});
  	}
  	//
  	function sendMsg(){
  		var msg=$("#chatInput").val();
		$.ajax({
			url:"./servlet/SendMsg",
  			dataType:"html",
  			type:"POST",
  			data:{
  				message:msg
  			},
  			success:function(data){
  				$("#chatHistory").append(data);
  				//
  			}
		});
  	}
  	</script>
	<div class="page-header" style="margin-left:20px;">
		<h1>LongPolling</h1><small id="time">10:10:10</small>
	</div>
	<div class="container">
	  	<div class="container-fluid">
	  		<div class="row-fluid">
	  			<div class="span10">
	  				<div style="height:600px">
	  					<div class="well" style="height:300px;overflow-y:auto;"id="chatHistory"></div>
	  					<div style="height:150px;overflow-y:auto;"id="chatBox">
  							<textarea style="width:100%" id="chatInput"></textarea>
  							<br/>
  							<button type="submit" class="btn" onclick="sendMsg()">
  								Send
  							</button>
	  					</div>
	  				</div>
	  			</div>
	  			<div class="span2">
	  				<div style="background:#abcdef;height:400px;">
	  				<ul id="userList">
	  					<li>User:<%=session.getAttribute("userName") %></li>
	  					<br/>
	  				</ul>
	  				</div>
	  			</div>
	  		</div>
	  	</div>
	</div>
  	<div class="footer">
  		<a href="./servlet/TimePolling">LongingPollingTest</a>
  	</div>
  </body>
</html>
