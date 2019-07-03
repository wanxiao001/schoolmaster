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
					<s:property value="#session.user.userName"/>
					<div class="index-nav-frame-line2-center">
						<div class="index-nav-frame-line2-li">
							<a style="background:#ebebeb;color: #1E90FF" href="user_self.action?id=<s:property value="#session.user.id"/>">我的资料</a><br>
							<a style="background:#ebebeb;color: #1E90FF" href="user_myContact.action?usId=<s:property value="#session.user.id"/>">预约我的</a><br>
                            <%--<a style="background:#ebebeb;color: #1E90FF" href="user_myyContact.action?uuId=<s:property value="#session.user.id"/>">我预约的</a>--%>
                        </div>	
					</div>
					<div class="index-nav-frame-line2-focus" tabindex="-1"></div>
				</div>			
				<a href="logout.action" class="index-nav-frame-line-logout" tabindex="-1">退出</a>
			</div>
		</div>
		<div class="index-content">
			<div class="index-content-operation">
				<div class="index-content-operation-usersearch"><input id="search_username" placeholder="请输入服务关键字  如：PS、摄影" type="text" name="fskill" onKeyDown="webchat_chkkeysend(event);"/><button onclick="searchUser()">搜索</button></div>
			</div>
			<br><br><br><br>
			<table class="index-content-table">
				<tr class="index-content-table-th">
					<td width=200px height=50px >昵称</td>
					<td width=400px height=50px >擅长</td>
					<td width=100px height=50px >获赞数</td>
					<td width=100px height=50px >操作</td>
				</tr>
				<s:iterator id="user">
					<tr class="index-content-table-td">
					<td width=200px height=50px ><s:property value="#user.userName"/></td>
					<td width=400px height=50px ><s:property value="#user.skill"/></td>
					<td width=100px height=50px ><s:property value="#user.star"/></td>
					<td><a class="index-content-table-td-edit" href='user_look.action?id=<s:property value="#user.id"/>'>查看</a></td>
					</tr>
				</s:iterator>		
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
	window.location.href = "user_find.action?fskill=" +  encodeURIComponent(search_username);
}
</script>
</html>
