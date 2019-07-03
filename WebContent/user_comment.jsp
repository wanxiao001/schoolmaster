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
			<button type="button" class="index-content-operation-add" onclick="javascript:history.back(-1);">返回</button>			
			<br>
			<table class="index-content-table-add">
					<tr>
						<td colspan="3" align="right">
							<a href="user_writeComment1.action?uId=${requestScope.uId}"><img border="0" src="img/dc.png" height="50px" width="100px"/></a>
						</td>
					</tr>
					<tr>
						<td width=120px height=20px><b>评论用户</b></td>
						<td width=600px height=20px><b>评论内容</b></td>
						<td width=100px height=20px><b>评论时间</b></td>
					</tr>
					<s:iterator id="comment">
					<tr class="index-content-table-td">
					<td width=100px height=100px ><s:property value="#comment.commentName"/>:</td>
					<td width=600px height=100px ><s:property value="#comment.commentt"/></td>
					<td width=100px height=100px ><s:property value="#comment.commentTime"/></td>
					</tr>
					</s:iterator>
				</table>
		</div>

	</body>
</html>
