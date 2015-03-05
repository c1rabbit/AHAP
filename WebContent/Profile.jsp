<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="cb" class="core.ConfigBean" />

<%-- set data source --%>
<sql:setDataSource
    driver="com.mysql.jdbc.Driver"
    url="${cb.url}"
    user="${cb.username}"
    password="${cb.password}" />

<c:set var="usersession" value="${sessionScope.user}"/>

<sql:query var="users">
	select username, firstname, lastname, date_format(birthday, '%d/%m/%Y') as birthday, gender, 
	blood_type, height, weight from users where username = '${usersession}'
</sql:query>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Profile of ${users.rows[0].firstname} ${users.rows[0].lastname}</title>
	
	<!-- Styles -->
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/main.css" />
	<link rel="stylesheet" href="css/customize.css" />
	<style>
		#header {
			font-weight: bold;
		}
		#mainbody {
			margin-left: auto;
			margin-right: auto;
			width: 1000px;
		}
	</style>
</head>
<body>
	<nav>
		<ul class="list-unstyled main-menu">
			<!--Include your navigation here-->
			<li class="text-right"><a href="#" id="nav-close"><i class="glyphicon glyphicon-menu-right"></i></a></li>
			<li><a href="Main.html">Home <span class="icon"><i class="glyphicon glyphicon-home"></i></span></a></li>
			<li><a href="Profile.jsp">Profile <span class="icon"><i class="glyphicon glyphicon-user"></i></span></a></li>
			<li><a href="Chart?type=1">Body Temperature<span class="icon"><i class="glyphicon glyphicon-fire"></i></span></span></a></li>
			<li><a href="Chart?type=2">Heart Rate <span class="icon"><i class="glyphicon glyphicon-heart"></i></span></a></li>
			<li><a href="Chart?type=3">Respiratory Rate <span class="icon"><i class="glyphicon glyphicon-random"></i></span></a></li>
			<li><a href="Chart?type=4">Blood Pressure <span class="icon"><i class="glyphicon glyphicon-tint"></i></span></a></li>
			<li><a href="Logout">Log Out <span class="icon"><i class="glyphicon glyphicon-off"></i></span></a></li>
	    </ul>
	</nav>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<!--Include your brand here-->
		<!-- <a class="navbar-brand" href="Main.html">Advanced Health Assessment Program</a> -->
		<table border="0" id="pageheader">
			<tr>
				<td><a href="Main.html"><img src="images/logo_small.png" alt="Advance Health Assessment Program Logo" /></a></td>
			</tr>
		</table>
		<div class="navbar-header pull-right">
			<a id="nav-expander" class="nav-expander fixed"> MENU &nbsp;
				<i class="glyphicon glyphicon-align-justify"></i>
			</a>
		</div>
	</div>
	
	<div id="mainbody">
		<h3>Profile of ${users.rows[0].firstname} ${users.rows[0].lastname}</h3>
		<table border="0">
			<tr><td id="header">Username</td><td>&nbsp;&nbsp;</td><td>${users.rows[0].username}</td></tr>
			<tr><td id="header">Name</td><td>&nbsp;&nbsp;</td><td>${users.rows[0].firstname} ${users.rows[0].lastname}</td></tr>
			<tr><td id="header">Gender</td><td>&nbsp;&nbsp;</td><td>${users.rows[0].gender}</td></tr>
			<tr><td id="header">Birthday</td><td>&nbsp;&nbsp;</td><td>${users.rows[0].birthday}</td></tr>
			<tr><td id="header">Blood Type</td><td>&nbsp;&nbsp;</td><td>${users.rows[0].blood_type}</td></tr>
			<fmt:formatNumber var="feet" value="${(users.rows[0].height - (users.rows[0].height mod 12)) div 12}" maxFractionDigits="0" />
			<c:set var="inches" value="${users.rows[0].height mod 12}" />
			<tr><td id="header">Height</td><td>&nbsp;&nbsp;</td><td>${feet}'${inches}"</td></tr>
			<tr><td id="header">Weight</td><td>&nbsp;&nbsp;</td><td>${users.rows[0].weight} LB</td></tr>
		</table><br /><br /><br /><br />
		<table border="0" style="width: 100%; text-align: center;">
			<tr><td><a href="Main.html">Home</a> | <b><a href="Profile.jsp">Profile</a></b> | <a href="Logout">Logout</a></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>Copyright &copy; 2015 AHAP</td></tr>
		</table>
		<br /><br /><br />
	</div>
	
	<!-- Javascript ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.navgoco.js"></script>
    <script src="js/main.js"></script>
    
    <script>
	    $(document).ready(function(){
	       //Navigation Menu Slider
	        $('#nav-expander').on('click',function(e){
	      		e.preventDefault();
	      		$('body').toggleClass('nav-expanded');
	      	});
	      	$('#nav-close').on('click',function(e){
	      		e.preventDefault();
	      		$('body').removeClass('nav-expanded');
	      	});
	      	
	      	// Initialize navgoco with default options
	        $(".main-menu").navgoco({
	            caret: '<span class="caret"></span>',
	            accordion: false,
	            openClass: 'open',
	            save: true,
	            cookie: {
	                name: 'navgoco',
	                expires: false,
	                path: '/'
	            },
	            slide: {
	                duration: 300,
	                easing: 'swing'
	            }
	        });
		});
	</script>
</body>
</html>