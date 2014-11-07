<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="./js/jquery.js"></script>
	<script src="./js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">

  </head>
  
  <body>
    <div class="container">
    	<div class="well" style="margin-top:30px;height:200px;">
    		<form class="form-horizontal" method="post" action="./servlet/Login">
    			<div class="control-group">
    				<label class="control-label">UserName:</label>
    				<div class="controls">
    					<input type="text" name="userName" style="height:30px;" required placeholder="Input UserName...">
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label"></label>
    				<div class="controls">
    					<button type="submit" class="btn">Login</button>
    				</div>
    			</div>
    		</form>
    	</div>
    </div>
  </body>
</html>
