<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Advanced Health Assessment Program</title>
<script src="js/jquery.js"></script>

<!-- Styles -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/customize.css" />

<script>
	function tempAlert(msg, duration) {
		var el = document.createElement("div");
		el.setAttribute("style",
				"position:absolute;top:40%;left:20%;background-color:white;");
		el.innerHTML = msg;
		setTimeout(function() {
			el.parentNode.removeChild(el);
		}, duration);
		document.body.appendChild(el);
	}

	function panelClass(n) {
		var a = "";
		if (n == 0) {
			a = 'panel panel-success';
		}
		if (n == 1) {
			a = 'panel panel-warning';
		}
		if (n == 2) {
			a = 'panel panel-danger';
		}

		return a;
	}
	
	function analysisClass(n) {
		var a = "";
		if (n == 0) {
			a = 'normal';
		}
		if (n == 1) {
			a = 'warning';
		}
		if (n == 2) {
			a = 'danger';
		}

		return a;
	}
	
	function panelClass(n) {
		var a = "";
		if (n == 0) {
			a = 'panel panel-success';
		}
		if (n == 1) {
			a = 'panel panel-warning';
		}
		if (n == 2) {
			a = 'panel panel-danger';
		}

		return a;
	}

	function getData() {
		$.ajax({
			url : 'Analyze',
			datatype : 'json',
			type : 'get',
			success : function(response) {
				$('#BP').html(response.BP[1] + "/" + response.BP2[1]);
				$('#RR').html(response.RR[1]);
				$('#BT').html(response.BT[1]);
				$('#HR').html(response.HR[1]);
				$('#CH').html(response.HDL[1] + "/" + response.LDL[1] + "/" + response.TRI[1]);
				$('#BPL').html(response.BP[2] + "/" + response.BP2[2]);
				$('#RRL').html(response.RR[2]);
				$('#BTL').html(response.BT[2]);
				$('#HRL').html(response.HR[2]);
				$('#CHL').html(response.HDL[2] + "/" + response.LDL[2] + "/" + response.TRI[2]);
				$('#BPpanel').removeClass().addClass(panelClass(response.BP[4]));
				$('#RRpanel').removeClass().addClass(panelClass(response.RR[4]));
				$('#BTpanel').removeClass().addClass(panelClass(response.BT[4]));
				$('#HRpanel').removeClass().addClass(panelClass(response.HR[4]));
				$('#CHpanel').removeClass().addClass(panelClass(response.LDL[4]));
				$('#BPanalysispanel').removeClass().addClass(analysisClass(response.BP[4]));
				$('#RRanalysispanel').removeClass().addClass(analysisClass(response.RR[4]));
				$('#HRanalysispanel').removeClass().addClass(analysisClass(response.HR[4]));
				$('#BTanalysispanel').removeClass().addClass(analysisClass(response.BT[4]));
				$('#HDLanalysispanel').removeClass().addClass(analysisClass(response.HDL[4]));
				$('#LDLanalysispanel').removeClass().addClass(analysisClass(response.LDL[4]));
				$('#TRIanalysispanel').removeClass().addClass(analysisClass(response.TRI[4]));
				$('#BPanalysis').html(response.BP[3]);
				$('#RRanalysis').html(response.RR[3]);
				$('#BTanalysis').html(response.BT[3]);
				$('#HRanalysis').html(response.HR[3]);
				$('#HDLanalysis').html(response.HDL[3]);
				$('#LDLanalysis').html(response.LDL[3]);
				$('#TRIanalysis').html(response.TRI[3]);

				$('#BTSearchLink').attr("href", function() {
					return "Search.jsp?q=" + response.BT[5]
				});
				$('#BPSearchLink').attr("href", function() {
					return "Search.jsp?q=" + response.BP[5]
				});
				$('#RRSearchLink').attr("href", function() {
					return "Search.jsp?q=" + response.RR[5]
				});
				$('#HRSearchLink').attr("href", function() {
					return "Search.jsp?q=" + response.HR[5]
				});
				$('#HDLSearchLink').attr("href", function() {
					return "Search.jsp?q=" + response.HDL[5]
				});
				$('#LDLSearchLink').attr("href", function() {
					return "Search.jsp?q=" + response.LDL[5]
				});
				$('#TRISearchLink').attr("href", function() {
					return "Search.jsp?q=" + response.TRI[5]
				});

				setTimeout(getData, 2000);
			},

			error : function(xhr, status) {
				$('#BP').html("Awaiting Data");
				$('#RR').html("Awaiting Data");
				$('#BT').html("Awaiting Data");
				$('#HR').html("Awaiting Data");
				$('#CH').html("Awaiting Data");
				$('#BPL').html("Awaiting Data");
				$('#RRL').html("Awaiting Data");
				$('#BTL').html("Awaiting Data");
				$('#HRL').html("Awaiting Data");
				$('#CHL').html("Awaiting Data");
				
				setTimeout(getData, 2000);
			}
		});
	}

	getData();
</script>
</head>
<body>
	<nav>
		<ul class="list-unstyled main-menu">
			<!--Include your navigation here-->
			<li class="text-right"><a href="#" id="nav-close"><i class="glyphicon glyphicon-menu-right"></i></a></li>
			<li><a href="Main">Home <span class="icon"><i class="glyphicon glyphicon-home"></i></span></a></li>
			<li><a href="Profile">Profile <span class="icon"><i class="glyphicon glyphicon-user"></i></span></a></li>
			<li><a href="Chart?type=1">Body Temperature<span class="icon"><i class="glyphicon glyphicon-fire"></i></span></a></li>
			<li><a href="Chart?type=2">Heart Rate <span class="icon"><i class="glyphicon glyphicon-heart"></i></span></a></li>
			<li><a href="Chart?type=3">Respiratory Rate <span class="icon"><i class="glyphicon glyphicon-random"></i></span></a></li>
			<li><a href="Chart?type=4">Blood Pressure <span class="icon"><i class="glyphicon glyphicon-tint"></i></span></a></li>
			<li><a href="Chart?type=5">Cholesterol <span class="icon"><i class="glyphicon glyphicon-cutlery"></i></span></a></li>
			<li><a href="Print">Print <span class="icon"><i class="glyphicon glyphicon-print"></i></span></a></li>
			<li><a href="Logout">Log Out <span class="icon"><i class="glyphicon glyphicon-off"></i></span></a></li>
	    </ul>
	</nav>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<!--Include your brand here-->
		<table border="0" id="pageheader">
			<tr><td><a href="Main"><img src="images/logo_small.png" alt="Advance Health Assessment Program" /></a></td></tr>
		</table>
		<div class="navbar-header pull-right">
			<a id="nav-expander" class="nav-expander fixed"><i class="glyphicon glyphicon-align-justify"></i></a>
		</div>
	</div>

	<div class="container">
		<div class="row"></div>
	</div>

	<br /><br /><br /><br /><br /><br />

	<!-- The Squares -->
	<div class="container">
		<div class="row">
			<div class="col-xs-6">
				<div id="BTpanel" class="panel panel-success">
					<div class="panel-heading">
						<h5>Body Temperature (°F)</h5>
					</div>
					<div class="panel-body">
						<h2>
							<a href="Chart?type=1"><span id="BTL"></span></a>
						</h2>
						Average: <span id="BT"></span>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div id="HRpanel" class="panel panel-success">
					<div class="panel-heading">
						<h5>Heart Rate (beats/min)</h5>
					</div>
					<div class="panel-body">
						<h2>
							<a href="Chart?type=2"><span id="HRL"></span></a>
						</h2>
						Average: <span id="HR"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-6">
				<div id="RRpanel" class="panel panel-success">
					<div class="panel-heading">
						<h5>Respiratory Rate (breaths/min)</h5>
					</div>
					<div class="panel-body">
						<h2>
							<a href="Chart?type=3"><span id="RRL"></span></a>
						</h2>
						Average: <span id="RR"></span>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div id="BPpanel" class="panel panel-success">
					<div class="panel-heading">
						<h5>Blood Pressure (Sys/Dias mm Hg)</h5>
					</div>
					<div class="panel-body">
						<h2>
							<a href="Chart?type=4"><span id="BPL"></span></a>
						</h2>
						Average: <span id="BP"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-6">
				<div id="CHpanel" class="panel panel-success">
					<div class="panel-heading">
						<h5>Cholesterol (HDL/LDL/TRI mg/dl)</h5>
					</div>
					<div class="panel-body">
						<h2>
							<a href="Chart?type=5"><span id="CHL"></span></a>
						</h2>
						Average: <span id="CH"></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br /><br /><br />
	
	<!-- Analysis Chart -->
	<div class="container">
		<div class="row">
			<table border="0" id="analysis">
				<tr id="BTanalysispanel" class="normal">
					<td><b>Body Temperature</b></td>
					<td id="BTanalysis"></td>
					<td><a href="" id="BTSearchLink" target="_blank">Search</a></td>
				</tr>
				<tr id="HRanalysispanel" class="normal">
					<td><b>Heart Rate</b></td>
					<td id="HRanalysis"></td>
					<td><a href="" id="HRSearchLink" target="_blank">Search</a></td>
				</tr>
				<tr id="RRanalysispanel" class="normal">
					<td><b>Respiratory Rate</b></td>
					<td id="RRanalysis"></td>
					<td><a href="" id="RRSearchLink" target="_blank">Search</a></td>
				</tr>
				<tr id="BPanalysispanel" class="normal">
					<td><b>Blood Pressure</b></td>
					<td id="BPanalysis"></td>
					<td><a href="" id="BPSearchLink" target="_blank">Search</a></td>
				</tr>
				<tr id="HDLanalysispanel" class="normal">
					<td><b>High-density lipoprotein</b></td>
					<td id="HDLanalysis"></td>
					<td><a href="" id="HDLSearchLink" target="_blank">Search</a></td>
				</tr>
				<tr id="LDLanalysispanel" class="normal">
					<td><b>Low-density lipoprotein</b></td>
					<td id="LDLanalysis"></td>
					<td><a href="" id="LDLSearchLink" target="_blank">Search</a></td>
				</tr>
				<tr id="TRIanalysispanel" class="normal">
					<td><b>Triglyceride</b></td>
					<td id="TRIanalysis"></td>
					<td><a href="" id="TRISearchLink" target="_blank">Search</a></td>
				</tr>
			</table>
		</div>
	</div>
	
	<br /><br /><br />
	
	<table border="0" style="width: 100%; text-align: center;">
		<tr><td><a href="Main">Home</a> | <a href="Profile">Profile</a> | <a href="Logout">Logout</a></td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>Copyright &copy; 2015 Advanced Health Assessment Program</td></tr>
	</table>
	<br /><br /><br />

	<!-- /container -->
	<!-- Javascript ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script>
		window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.navgoco.js"></script>
	<script src="js/main.js"></script>

	<script>
		$(document).ready(function() {
			//Navigation Menu Slider
			$('#nav-expander').on('click', function(e) {
				e.preventDefault();
				$('body').toggleClass('nav-expanded');
			});
			$('#nav-close').on('click', function(e) {
				e.preventDefault();
				$('body').removeClass('nav-expanded');
			});

			// Initialize navgoco with default options
			$(".main-menu").navgoco({
				caret : '<span class="caret"></span>',
				accordion : false,
				openClass : 'open',
				save : true,
				cookie : {
					name : 'navgoco',
					expires : false,
					path : '/'
				},
				slide : {
					duration : 300,
					easing : 'swing'
				}
			});
		});
	</script>
</body>
</html>