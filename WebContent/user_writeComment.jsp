<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>我的资料</title>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">		
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<style type="text/css">
			body{
				background:url(img/body1.png);
				background-size:100%;
			}
		</style>
	</head>
	<body>
		<div class="index-nav">
			<div class="index-nav-frame clearfix">
				<div class="nav-line">	
				</div>
				<div class="nav-small" tabindex="-1">
					<div class="nav-small-focus" tabindex="-1">	
					</div>
					<img src="img/icon.png"/>
				</div>
				<div class="index-nav-frame-line active" tabindex="-1">
					<a href="user_index.action">首页</a>
					<div class="index-nav-frame-line-focus" tabindex="-1"></div>
				</div>
				<div class="index-nav-frame-line2" tabindex="-1">
						<s:property value="#session.user.userName" />				
					<div class="index-nav-frame-line2-center">
						<div class="index-nav-frame-line2-li">
							<a style="background:#ebebeb;color: #1E90FF" href='user_self.action?id=<s:property value="#session.user.id" />'>我的资料</a><br>
							<a style="background:#ebebeb;color: #1E90FF" href="user_myContact.action?usId=<s:property value="#session.user.id"/>">预约我的</a><br>
							<%-- <a style="background:#ebebeb;color: #1E90FF" href="user_myyContact.action?uuId=<s:property value="#session.user.id"/>">我预约的</a> --%>	
						</div>
					</div>
					<div class="index-nav-frame-line2-focus" tabindex="-1"></div>
				</div>				
				<a href="logout.action" class="index-nav-frame-line-logout" tabindex="-1">退出</a>
			</div>
		</div>
		<div class="index-content">
			<div class="index-content-operation">
				我要评论：
				<br>
				<br>
				<br>	
			</div>
			<br>
			<form action="user_writeComment?uId=${requestScope.uId}" method="post" onsubmit="return check()">
					<input type="hidden" id="userId" name="userId" value="${requestScope.uId}"/>
					<input type="hidden" id="commentName" name="commentName" value="<s:property value="#session.user.userName" />"/>
					<input class="index-content-table-td-add" width="600px" type="text" id="commentt" name="commentt" placeholder="请输入评论..." value=""/>
				<br>
				<br>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="index-content-operation-add">提交</button>&nbsp;&nbsp;&nbsp;
				<button type="button" class="index-content-operation-add" onclick="javascript:history.back(-1);">取消</button>
			</form>
		</div>
	</body>
<script type="text/javascript">
//提交之前进行检查，如果return false，则不允许提交
function check(){
//根据ID获取值
var commentt=document.getElementById("commentt").value;

if(commentt==""){
alert("评论不能为空！");
return false;
}
if(commentt.length > 100){
	alert("内容超出限制！");
	return false;
	}

return true;
}
</script>
</html>
