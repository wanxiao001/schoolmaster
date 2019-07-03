<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>我要预约</title>
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
							<a style="background:#ebebeb;color: #1E90FF" href="user_self.action?id=<s:property value="#session.user.id"/>">我的资料</a><br>
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
				我要预约
				<br>
				<br>
				<br>
				<br>	
			</div>
			<br>
			<form action="user_contact" method="post" onsubmit="return check()">
				<input type="hidden" id="userId" name="userId" value="${requestScope.usId}"/>
				<input type="hidden" id="uuerId" name="uuerId" value="<s:property value="#session.user.id" />"/>
				<input type="hidden" id="contacter" name="contacter" value="<s:property value="#session.user.userName" />"/>
				<table class="index-content-table-add">
					<tr>
						<td>QQ：<input class="index-content-table-td-add" type="text" id="QQ" name="QQ" value="<s:property value="#session.user.QQ"/>"/></td>
					</tr>
					<tr>
						<td>email：<input class="index-content-table-td-add" type="text" id="email" name="email" value="<s:property value="#session.user.email"/>"/></td>
					</tr>
					<tr>
						<td>留言：<input class="index-content-table-td-add" type="text" id="message" name="message" value=""/></td>
					</tr>
				</table>
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
	function check(){
		var message=document.getElementById("message").value;
		var email=document.getElementById("email").value;
		var QQ=document.getElementById("QQ").value;
		if(message==""){
			alert("为了您能得到更好、更快的服务，建议填写留言！");
			return false;
		}
		if(QQ=="" || email==""){
			alert("联系方式不能为空");
			return false;
		}
		var myRegExp = /[^\d{5,13}]/;
		var flag = !myRegExp.test(QQ);
		if(flag){
			
		}else{
			alert("QQ号码不合法！");
			return false;
		}
		return true;
	}
</script>
</html>
