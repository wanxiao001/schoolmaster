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
				<div class="index-content-operation-search"><input id="search_username" placeholder="请输入用户名关键字" type="text" name="username" onKeyDown="webchat_chkkeysend(event);"/><button onclick="searchUser()">搜索</button></div>
			</div>
			<br>
			<table class="index-content-table">
				<tr class="index-content-table-th">
				<th>用户名</th>
				<th>密码</th>
				<th>年龄</th>
				<th>创建时间</th>
				<th>性别</th>
				<th>大师</th>
				<th>擅长</th>
				<th>操作</th>
				</tr>
				<c:forEach items="${list}" var="ul">
					<tr class="index-content-table-td">
					<td>${ul.userName}</td>
					<td>${ul.passWord}</td>
					<td>${ul.age}</td>
					<td>${ul.creatTime}</td>
					<td>
						<c:if test="${true==ul.sex}">男</c:if>
						<c:if test="${false==ul.sex}">女</c:if>
					</td>
					<td>
						<c:if test="${true==ul.master}">是</c:if>
						<c:if test="${false==ul.master}">否</c:if>
					</td>
					<td>${ul.skill}</td>
					<td><a class="index-content-table-td-edit" href='admin_look.action?id=${ul.id}'>查看</a>&nbsp; &nbsp; &nbsp;
						<a class="index-content-table-td-delete" onclick='return window.confirm("将要删除：${ul.userName}")' href='admin_delete.action?id=${ul.id}'>删除</a></td>
				    </tr>
				</c:forEach>
			</table>
			<table class="index-content-table-td-edit" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td align="right">
						<s:if test="nowPage == 0">
							<span>第<s:property value="1"/>/<s:property value="totalPage"/>页</span>&nbsp;&nbsp;
						</s:if>
						<s:if test="nowPage !=  0"><span>第<s:property value="nowPage"/>/<s:property value="totalPage"/>页</span>&nbsp;&nbsp;</s:if>
						<span>总记录数：<s:property value="totalCount"/>&nbsp;&nbsp;</span>
						<a class="index-content-table-td-edit" href="admin_index.action?nowPage=1">首页</a>
						<s:if test="nowPage != 1">
							<a class="index-content-table-td-edit" href="admin_index.action?nowPage=<s:property value="nowPage-1"/>">上一页</a>
						</s:if>
						<s:if test="nowPage == 1">上一页</s:if>
						<s:if test="nowPage != totalPage">
							<a class="index-content-table-td-edit" href="admin_index.action?nowPage=<s:property value="nowPage+1"/>">下一页</a>
						</s:if>
						<s:if test="nowPage == totalPage">下一页</s:if>
						<a class="index-content-table-td-edit" href="admin_index.action?nowPage=<s:property value="totalPage"/>">尾页</a>	
					</td>
				</tr>
			
			</table>
		</div>
	</body>
<script type="text/javascript">
function webchat_chkkeysend(event)
{
   if (event.keyCode==13) {searchUser();}
}
function searchUser(){
	var search_username = document.getElementById("search_username").value;
	window.location.href = "admin_find.action?username=" +  encodeURIComponent(search_username);
}
</script>
</html>
