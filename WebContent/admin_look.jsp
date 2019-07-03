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
	</head>
	<body style="background: #ebebeb;">
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
					<a href="admin_index.action">首页</a>
					<div class="index-nav-frame-line-focus" tabindex="-1"></div>
				</div>
				<div class="index-nav-frame-line active2" tabindex="-1">
					<s:property value="#session.user.userName" />
					<div class="index-nav-frame-line-focus" tabindex="-1"></div>
				</div>
				<a href="logout.action" class="index-nav-frame-line-logout" tabindex="-1">退出</a>
			</div>
		</div>
		<div class="index-content">
			<br>
			<table class="index-content-table-add">
					<tr>
						<td>账户：</td>
						<td>${requestScope.user.userName}</td>
					</tr>
					<tr>
						<td>密码：</td>
						<td>${requestScope.user.passWord}</td>
					</tr>
					<tr>
						<td>年龄：</td>
						<td>${requestScope.user.age}</td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
						<c:if test="${true==requestScope.user.sex}">男</c:if>
						<c:if test="${false==requestScope.user.sex}">女</c:if>
						</td>
					<tr>
						<td>是否为大师：</td>
						<td>
							<c:if test="${true==requestScope.user.master}">是</c:if>
							<c:if test="${false==requestScope.user.master}">否</c:if>
						</td>
					</tr>
					</tr>
					<tr>
						<td>学校：</td>
						<td>${requestScope.user.school}</td>
					</tr>
					<tr>
						<td>QQ：</td>
						<td>${requestScope.user.QQ}</td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td>${requestScope.user.email}</td>
					</tr>
					<tr>
						<td>擅长：</td>
						<td>${requestScope.user.skill}</td>
					</tr>
					<tr>
						<td>个性签名：</td>
						<td>${requestScope.user.description}</td>
					</tr>
					<tr>
						<td>简介：</td>
						<td>${requestScope.user.introduction}</td>
					</tr>
					<tr>
						<td>点赞：</td>
						<td>${requestScope.user.star}</td>
					</tr>
					<tr>
						<td>评论：</td>
						<td>${requestScope.user.comments}</td>
					</tr>
				</table>
		</div>
	</body>
</html>