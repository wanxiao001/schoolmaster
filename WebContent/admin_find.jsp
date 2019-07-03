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
			<div class="index-content-operation">
				<div class="index-content-operation-search"><input id="search_username" placeholder="请输入用户名关键字" type="text" name="userName"/><button onclick="searchUser()">搜索</button></div>
			</div>
			<br>
			<table class="index-content-table">
				<tr class="index-content-table-th">
				<th>用户名</th>
				<th>密码</th>
				<th>年龄</th>
				<th>创建时间</th>
				<th>性别</th> 
				<th>学校</th>
				<th>QQ</th>
				<th>操作</th>
				</tr>
				<s:iterator id="user">
					<tr class="index-content-table-td">
					<td><s:property value="#user.userName"/></td>
					<td><s:property value="#user.passWord"/></td>
					<td><s:property value="#user.age"/></td>
					<td><s:property value="#user.creatTime"/></td>
					<td>
						<s:if test="%{#user.sex}">男</s:if>
						<s:else>女</s:else>
					</td>
					<td><s:property value="#user.school"/></td>
					<td><s:property value="#user.QQ"/></td>
					<td><a class="index-content-table-td-edit" href='admin_look.action?id=<s:property value="#user.id"/>'>查看</a>&nbsp; &nbsp; &nbsp;
						<a class="index-content-table-td-delete" onclick='return window.confirm("将要删除：<s:property value="#user.userName"/>")' href='admin_delete.action?id=<s:property value="#user.id"/>'>删除</a></td>
				    </tr>
				    </s:iterator>
			</table>
		</div>
	</body>
<script>
function searchUser(){
	var search_username = document.getElementById("search_username").value;
	window.location.href = "admin_find.action?username=" + encodeURIComponent(search_username);
}
</script>
</html>