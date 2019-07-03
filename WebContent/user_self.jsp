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
				我的资料
				<br>
				<br>
				<br>
				<br>	
			</div>
			<br>
			<form action="user_update" method="post" onsubmit="return check()">
				<table class="index-content-table-add">
					
					<input type="hidden" id="id" name="id" value="${requestScope.user.id}"/>
					<input type="hidden" id="admin" name="admin" value="${requestScope.user.admin}"/>
					<tr>
						<td>账户：<input class="index-content-table-td-add" type="text" id="userName" name="userName" value="${requestScope.user.userName}"/></td>
					</tr>
					<tr>
						<td>密码：<input class="index-content-table-td-add" type="password" id="passWord"  name="passWord" value="${requestScope.user.passWord}"/></td>
					</tr>
					<tr>
						<td>创建时间：<input class="index-content-table-td-add" readOnly="true" type="text" id="creatTime"  name="creatTime" value="${requestScope.user.creatTime}"></td>
					</tr>
					<tr>
						<td>年龄：<input class="index-content-table-td-add" type="text" id="age" name="age" value="${requestScope.user.age}"/></td>
					</tr>
					<tr>
						<td>性别：&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="sex" name="sex" ${user.sex==true?'checked':''} value="true">&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="sex" name="sex" ${user.sex==false?'checked':''} value="false">女						
					</tr>
					<tr>
						<td>学校：<input class="index-content-table-td-add" type="text" id="school" name="school" value="${requestScope.user.school}"/></td>
					</tr>
					<tr>
						<td>QQ：<input class="index-content-table-td-add" type="text" id="QQ" name="QQ" value="${requestScope.user.QQ}"/></td>
					</tr>
					<tr>
						<td>email：<input class="index-content-table-td-add" type="text" id="email" name="email" value="${requestScope.user.email}"/></td>
					</tr>
					<tr>
						<td>是否为大师：&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="master" name="master" ${user.master==true?'checked':''} value="true">&nbsp;&nbsp;&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="master" name="master" ${user.master==false?'checked':''} value="false">否
					</tr>
					<tr>
						<td>个性签名：<input class="index-content-table-td-add" type="text" id="description" name="description" value="${requestScope.user.description}"/></td>
					</tr>
					<tr>
						<td>擅长：<input class="index-content-table-td-add" type="text" id="skill" name="skill" value="${requestScope.user.skill}"/></td>
					</tr>
					<tr>
						<td>简介：<input class="index-content-table-td-add" type="text" id="introduction" name="introduction" value="${requestScope.user.introduction}"/></td>
					</tr>
					<tr>
						<td>获赞数：<input class="index-content-table-td-add" readOnly="true" type="text" id="star" name="star" value="${requestScope.user.star}"></td>
					</tr>
					<tr>
						<td>评论数：<input class="index-content-table-td-add" readOnly="true" type="text" id="comments" name="comments" value="${requestScope.user.comments}"></td>
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
		var userName=document.getElementById("userName").value;
		var passWord=document.getElementById("passWord").value;
		var age=document.getElementById("age").value;
		var QQ=document.getElementById("QQ").value;
		if(userName==""){
			alert("用户名不能为空");
			return false;
		}
		if(passWord==""){
			alert("密码不能为空");
			return false;
		}
		var myRegExp = /[^\d ]/;
		var flag = !myRegExp.test(age);
		if(flag){
			
		}else{
			alert("年龄不合法！");
			return false;
		}
		var myRegExp = /[^\d{5,13}]/;
		var flag = !myRegExp.test(QQ);
		if(flag){
			
		}else{
			alert("QQ不合法！");
			return false;
		}
		return true;
	}
</script>
</html>
