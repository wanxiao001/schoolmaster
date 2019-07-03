<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>主页</title>
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
			<br>
			<table class="index-content-table-add">
					<tr>
						<td width=100px>昵称：</td>
						<td width=700px>${requestScope.con.contacter}</td>
					</tr>
					<tr>
						<td>QQ：</td>
						<td>${requestScope.con.QQ}</td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td>${requestScope.con.email}</td>
					</tr>
					<tr>
						<td height=50px>预约时间：</td>
						<td height=50px>${requestScope.con.contactTime}</td>
					</tr>
					<tr>
						<td height=100px>留言：</td>
						<td height=100px>${requestScope.con.message}</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
						<button type="button" class="index-content-operation-add" onclick="javascript:history.back(-1);">返回</button>
					</tr>
				</table>
		</div>
	</body>
</html>
