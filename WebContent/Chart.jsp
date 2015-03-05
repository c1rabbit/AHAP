<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.type == 1}">
	<c:set var="vitalstring" scope="session" value="Body Temperature" />
	<c:set var="vitalunit" scope="session" value="Degrees Farenheit" />
	<c:set var="upperbound" scope="session" value="99" />
	<c:set var="lowerbound" scope="session" value="97.8" />
</c:if>
<c:if test="${param.type == 2}">
	<c:set var="vitalstring" scope="session" value="Heart Rate" />
	<c:set var="vitalunit" scope="session" value="Beats/Min" />
	<c:set var="upperbound" scope="session" value="99" />
	<c:set var="lowerbound" scope="session" value="97.8" />
</c:if>
<c:if test="${param.type == 3}">
	<c:set var="vitalstring" scope="session" value="Respiratory Rate" />
	<c:set var="vitalunit" scope="session" value="Breaths/Min" />
	<c:set var="upperbound" scope="session" value="99" />
	<c:set var="lowerbound" scope="session" value="97.8" />
</c:if>
<c:if test="${param.type == 4}">
	<c:set var="vitalstring" scope="session" value="Blood Pressure" />
	<c:set var="vitalunit" scope="session" value="Sys mm Hg" />
	<c:set var="upperbound" scope="session" value="99" />
	<c:set var="lowerbound" scope="session" value="97.8" />
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Advanced Health Assessment Program</title>
	
	<!-- Styles -->
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/main.css" />
	<link rel="stylesheet" href="css/customize.css" />
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
    
	<div class="container">
		<div class="row" style="display:inline"></div>
	</div><br /><br />
	
	<div class="container">
		<div class="row">
			<div class="page-header">
				<div id="error" class="alert alert-danger" style="display:none" role="alert"><b>Error:</b> Awaiting Data...</div>
			</div>
		</div>
	</div>

    <div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		</div>
    </div> <!-- /container -->
    
    <br /><br /><br />
    
    <div class="container">
		<div class="row">
			<c:if test="${param.type == 1}">
				<p><b>Normal human body temperature</b>, also known as <b>normothermia</b> or <b>euthermia</b>, depends upon the place in the body at which the measurement is 
				made, the time of day, as well as the activity level of the person.</p>
				<p>Oral (under the tongue): 36.8° ± 0.4 °C (98.2° ± 0.7 °F)</p>
				<p>Internal (rectal, vaginal): 37.0 °C (98.6 °F)</p>
				<p>Different parts of the body have different temperatures. Rectal and vaginal measurements taken directly inside the body cavity are typically slightly higher 
				than oral measurements, and oral measurements are somewhat higher than skin measurements. Other places, such as under the arm or in the ear, produce different 
				typical temperatures. Although some people think of these averages as representing the normal or ideal temperature, a wide range of temperatures has been 
				found in healthy people.</p>
				<p>The body temperature of a healthy person varies during the day by about 0.5 °C (0.9 °F) with lower temperatures in the morning and higher temperatures in the 
				late afternoon and evening, as the body's needs and activities change. Other circumstances also affect the body's temperature. The core body temperature of an 
				individual tends to have the lowest value in the second half of the sleep cycle; the lowest point, called the nadir, is one of the primary markers for circadian 
				rhythms. The body temperature also changes when a person is hungry, sleepy, or cold.</p>
			</c:if>
			<c:if test="${param.type == 2}">
				<p><b>Heart rate</b>, or <b>heart pulse</b>, is the speed of the heartbeat measured by the number of poundings of the heart per unit of time - typically beats per minute (bpm). 
				The heart rate can vary according to the body's physical needs, including the need to absorb oxygen and excrete carbon dioxide. Activities that can provoke change 
				include physical exercise, sleep, anxiety, stress, illness, ingesting, and drugs.</p>
				<p>The normal resting adult human heart rate ranges from 60 - 80 bpm. Bradycardia is a slow heart rate, defined as below 60 bpm. Tachycardia is a fast heart rate, 
				defined as above 100 bpm at rest. When the heart is not beating in a regular pattern, this is referred to as an arrhythmia. These abnormalities of heart rate 
				sometimes indicate disease.</p>
			</c:if>
			<c:if test="${param.type == 3}">
				<p>The <b>respiratory rate (RR)</b>, also known as the <b>respiration rate</b>, <b>ventilation rate</b>, <b>ventilatory rate</b>, <b>ventilation frequency (Vf)</b>, <b>respiration frequency (Rf)</b>, 
				<b>pulmonary ventilation rate</b>, or <b>breathing frequency</b>, is the rate (frequency) of ventilation, that is, the number of breaths (inhalation-exhalation cycles) taken 
				within a set amount of time (typically 60 seconds). A normal respiratory rate is termed eupnea, an increased respiratory rate is termed tachypnea and a lower 
				than normal respiratory rate is termed bradypnea.</p>
				<p>Breathing (which in organisms with lungs is called ventilation and includes inhalation and exhalation) is a part of respiration. Thus, in precise usage, the 
				words breathing and ventilation are hyponyms, not synonyms, of respiration; but this prescription is not consistently followed, even by most health care providers, 
				because the term respiratory rate (RR) is a well-established term in health care, even though it would need to be consistently replaced with ventilation rate if the 
				precise usage were to be followed.</p>
			</c:if>
			<c:if test="${param.type == 4}">
				<p><b>Blood pressure (BP)</b> is the pressure exerted by circulating blood upon the walls of blood vessels and is one of the principal vital signs. When used without further 
				specification, "blood pressure" usually refers to the arterial pressure of the systemic circulation, usually measured at a person's upper arm. A person's blood pressure 
				is usually expressed in terms of the systolic pressure over diastolic pressure and is measured in millimeters of mercury (mm Hg). Normal resting blood pressure for an adult 
				is approximately 120/80 mm Hg.</p>
				<p>Blood pressure varies depending on situation, activity, and disease states, and is regulated by the nervous and endocrine systems. Blood pressure that is pathologically 
				low is called hypotension, and pressure that is pathologically high is hypertension. Both have many causes and can range from mild to severe, with both acute and chronic 
				forms. Chronic hypertension is a risk factor for many complications, including peripheral vascular disease, heart attack, and stroke. Hypertension is generally more common, 
				also due to the demands of modern lifestyles. Hypertension and hypotension go often undetected because of infrequent monitoring.</p>
			</c:if>
		</div>
    </div>
    
    <br /><br /><br />
    
    <table border="0" style="width: 100%; text-align: center;">
		<tr><td><a href="Main.html">Home</a> | <a href="Profile.jsp">Profile</a> | <a href="Logout">Logout</a></td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>Copyright &copy; 2015 AHAP</td></tr>
	</table>
	<br /><br /><br />
    
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
      
	<script src="js/highcharts.js"></script>
	<script src="js/modules/exporting.js"></script>
	<style type="text/css">${demo.css}</style>
	<script type="text/javascript">
		$(function () {
			$(document).ready(function () {
				Highcharts.setOptions({
					global: {
						useUTC: false
					}
				});
	
				$('#container').highcharts({
					chart: {
						type: 'spline',
						animation: Highcharts.svg, // don't animate in old IE
						marginRight: 150,
						marginLeft: 150,
						events: {
							load: function () {
								var series = this.series[0];
								setInterval(function () {
									$.ajax({
										<c:if test="${param.type == 1}">
											url: 'http://localhost:8080/ahap/Chart?type=BT',
										</c:if>
										<c:if test="${param.type == 2}">
											url: 'http://localhost:8080/ahap/Chart?type=HR',
										</c:if>
										<c:if test="${param.type == 3}">
											url: 'http://localhost:8080/ahap/Chart?type=RR',
										</c:if>
										<c:if test="${param.type == 4}">
											url: 'http://localhost:8080/ahap/Chart?type=BP',
										</c:if>
										datatype:'json',
										type:'post',
										success: function(response) {
											var x = (new Date()).getTime();//response.time;
											var y = response.DATA;
											document.getElementById("error").style.display = "none";
											series.addPoint([x, y], true, true);
										},
										error: function(){
											var x = (new Date()).getTime();//response.time;
											var y = 0;
											document.getElementById("error").style.display = "inline";
											series.addPoint([x, y], true, true);
										}
									});
								}, 2000);
							}
						}
					},
					title: {
						text: '${vitalstring}'
					},
					xAxis: {
						type: 'datetime',
						tickPixelInterval: 100
					},
					yAxis: {
						title: {
							text: '${vitalunit}'
						},
						plotLines: [{
							value: 0,
							width: 1,
							color: '#808080'
						}]
					},
					tooltip: {
						formatter: function () {
							return '<b>' + this.series.name + '</b><br />' +
								Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br />' +
								Highcharts.numberFormat(this.y, 2);
						}
					},
					legend: {
						enabled: false
					},
					exporting: {
						enabled: false
					},
					// yAxis: {max: 111, min: 82},
					series: [{
						name: '${vitalstring}',
						data: (function () {
							// generate an array of random data
							var data = [],
								time = (new Date()).getTime(),
								i;
							for (i = 0; i < 30; i++) {
								data.push({
									x: (new Date()).getTime(),
									y: 0 // Starting point
								});
							}
							return data;
						}
						())
					}]
				});
			});
		});
	</script>
</body>
</html>