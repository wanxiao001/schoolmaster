<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>注册</title>
  <style type="text/css">
  	body{
		background: url(img/login.png);
		background-size:100%;
  	}
  	A{text-decoration: NONE}
  	.login{z-index: 2;position:absolute;width: 450px;border-radius: 0px;height: 500px;background: white;box-shadow: 0px 0px 0px #333333;top: 50%;left: 50%;margin-top: -250px;margin-left: -175px;transition: all 1s;-moz-transition: all 1s;	/* Firefox 4 */-webkit-transition: all 1s;	/* Safari å’Œ Chrome */-o-transition: all 1s;	/* Opera */}
	.login-top{font-size: 24px;margin-top: 80px;padding-left: 40px;box-sizing: border-box;color: #333333;margin-bottom: 50px;}
	.login-center{width: 100%;box-sizing: border-box;padding: 0 40px;margin-bottom: 30px;}
	.login-center-img{width: 80px;height: 30px;float: left;margin-top: 5px;}
	.login-center-img>img{width: 100%;}
	.login-center-input{float: left;width: 230px;margin-left: 15px;height: 30px;position: relative;}
	.login-center-input input{z-index: 2;transition: all 0.5s;padding-left: 10px;color: #333333;width: 100%;height: 30px;border: 0;border-bottom: 1px solid #cccccc;border-top: 1px solid #ffffff;border-left: 1px solid #ffffff;border-right: 1px solid #ffffff;box-sizing: border-box;outline: none;position: relative;}
	.login-center-input input:focus{border: 1px solid dodgerblue;}
	.login-center-input input:focus~
	.login-center-input-text{top: 0;z-index: 3;opacity: 1;margin-top: -15px;}
	.login-button{cursor: pointer;width: 250px;text-align: center;height: 40px;line-height: 40px;background-color: dodgerblue;border:none;margin: 0 auto;margin-top: 50px;color: white;display:block;margin:0 auto;}
	.login-error{margin-top: 30px;margin-left: 70px;color: red;}
	p{position:fixed; bottom:0px; left:40%;text-align:center;}
  </style>
</head>
<body>
	<form action="register" method="post" onsubmit="return check()">
		<div class="login">
			<div class="login-top">
				注册
			</div>
			<div class="login-error">
				<s:actionerror/>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img">账    号：</div>
				<div class="login-center-input">
					<input type="text" id="userName"  name="userName" value="" placeholder="请输入您的账号" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的账号'"/>
				</div>
			</div>
			<br><br><br>
			<div class="login-center clearfix">
				<div class="login-center-img">密    码：</div>
				<div class="login-center-input">
					<input type="password" id="passWord"  name="passWord"value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
				</div>
			</div>
			<br><br>
			<div class="login-center clearfix">
				<div class="login-center-img">确认密码：</div>
				<div class="login-center-input">
					<input type="password" id="passWord2"  name="passWord2"value="" placeholder="请确认您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请确认您的密码'"/>
				</div>
			</div>
			<br><br>
			<div ><button type="submit" class="login-button">提交</button></div>
			<br>
			<div><a href="user_login.jsp">>>返回登录</div>
		</div>
	</form>
	<p>CopyRight@copy 2018 校园大师网</p>
</body>
<script type="text/javascript">
	//提交之前进行检查，如果return false，则不允许提交
	function check(){
		//根据ID获取值
		var userName=document.getElementById("userName").value;
		var passWord=document.getElementById("passWord").value;
		var passWord2=document.getElementById("passWord2").value;
		if(userName==""){
			alert("用户名不能为空！");
			return false;
		}
		if(passWord != passWord2){
			alert("密码不一致！");
			return false;
		}
		if(userName.length > 15){
			alert("用户名15个字符以内");
			return false;
		}
		if(passWord.length > 10 ){
			alert("请设置密码在6~10个字符以内");
			return false;
		}
		if(passWord.length < 6 ){
			alert("请设置密码在6~10个字符以内");
			return false;
		}
		return true;
	}
</script>
</html>