<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="cb" class="core.ConfigBean" />

<%-- set data source --%>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="${cb.url}" user="${cb.username}" password="${cb.password}" />
<c:set var="usersession" value="${sessionScope.user}" />

<c:if test="${param.type == 1}">
	<c:set var="vitalstring" scope="session" value="Body Temperature" />
	<c:set var="vitalunit" scope="session" value="Degrees Farenheit" />
	<c:set var="tablename" scope="session" value="vital_body_temp" />
</c:if>
<c:if test="${param.type == 2}">
	<c:set var="vitalstring" scope="session" value="Heart Rate" />
	<c:set var="vitalunit" scope="session" value="Beats/Min" />
	<c:set var="tablename" scope="session" value="vital_heart_rate" />
</c:if>
<c:if test="${param.type == 3}">
	<c:set var="vitalstring" scope="session" value="Respiratory Rate" />
	<c:set var="vitalunit" scope="session" value="Breaths/Min" />
	<c:set var="tablename" scope="session" value="vital_respiratory_rate" />
</c:if>
<c:if test="${param.type == 4}">
	<c:set var="vitalstring" scope="session" value="Blood Pressure" />
	<c:set var="vitalunit" scope="session" value="Sys mm Hg" />
	<c:set var="tablename" scope="session" value="vital_blood_pressure" />
</c:if>
<c:if test="${param.type == 5}">
	<c:set var="vitalstring" scope="session" value="Cholesterol" />
	<c:set var="vitalunit" scope="session" value="Mg/dl" />
	<c:set var="tablename" scope="session" value="vital_ldl_cholesterol" />
</c:if>

<sql:query var="results">
	select 
	<c:if test="${param.type == 3}">
		age_lower, age_upper, 
	</c:if>
	tol_lower, tol_upper, result, search from ${tablename}
</sql:query>

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
	<style>
		th, td { padding: 5px; }
	</style>
</head>
<body>
	<nav>
		<ul class="list-unstyled main-menu">
			<!--Include your navigation here-->
			<li class="text-right"><a href="#" id="nav-close"><i class="glyphicon glyphicon-menu-right"></i></a></li>
			<li><a href="Main">Home <span class="icon"><i class="glyphicon glyphicon-home"></i></span></a></li>
			<li><a href="Profile">Profile <span class="icon"><i class="glyphicon glyphicon-user"></i></span></a></li>
			<li><a href="Chart?type=1">Body Temperature<span class="icon"><i class="glyphicon glyphicon-fire"></i></span></span></a></li>
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
		<!-- <a class="navbar-brand" href="Main.html">Advanced Health Assessment Program</a> -->
		<table border="0" id="pageheader">
			<tr>
				<td><a href="Main"><img src="images/logo_small.png" alt="Advance Health Assessment Program Logo" /></a></td>
			</tr>
		</table>
		<div class="navbar-header pull-right">
			<a id="nav-expander" class="nav-expander fixed"><i class="glyphicon glyphicon-align-justify"></i>
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
			<c:if test="${param.type == 5}">
				<p><b>Total blood (or serum) cholesterol</b><br />
				Your total cholesterol score is calculated using the following equation: HDL + LDL + 20 percent of your triglyceride level. 
				A total cholesterol score of less than 180 mg/dL is considered optimal.</p>
				<p><b>HDL (good) cholesterol</b><br />
				With HDL cholesterol, higher levels are better. Low HDL cholesterol puts you at higher risk for heart disease. People with 
				high blood triglycerides usually also have lower HDL cholesterol. Genetic factors, type 2 diabetes, and certain drugs, such 
				as beta-blockers and anabolic steroids, also lower HDL cholesterol levels. Smoking, being overweight and being sedentary can 
				all result in lower HDL cholesterol.</p>
				<p><b>LDL (bad) cholesterol</b><br />
				A low LDL cholesterol level is considered good for your heart health. However, your LDL number should no longer be the main 
				factor in guiding treatment to prevent heart attack and stroke, according to new guidelines from the American Heart Association. 
				For patients taking statins, the guidelines say they no longer need to get LDL cholesterol levels down to a specific target 
				number. A diet high in saturated and trans fats raises LDL cholesterol.</p>
				<p><b>Triglycerides</b><br />
				Triglyceride is the most common type of fat in the body. Normal triglyceride levels vary by age and sex. A high triglyceride 
				level combined with low HDL cholesterol or high LDL cholesterol is associated with atherosclerosis, the buildup of fatty deposits 
				in artery walls that increases the risk for heart attack and stroke.</p>
			</c:if>
		</div>
    </div>
    
    <br />
    
    <div class="container">
		<div class="row">
			<h4>Evaluation Standards</h4>
			<c:if test="${param.type == 2}">
				<b>Heart Rate</b>
				<p>This table shows estimated target heart rates for different ages. Your maximum heart rate is about 220 minus your age.</p>
				<p>Heart rate during moderately intense activities is about 50 - 69% of your maximum heart rate, whereas heart rate during 
				hard physical activity is about 70% to less than 90% of the maximum heart rate.</p>
				<p>If your heart rate is too high, you're straining. So slow down. If it's too low, and the intensity feels "light" or 
				"moderate/brisk," you may want to push yourself to exercise a little harder.</p>
				<p>During the first few weeks of working out, aim for the lower ranger of your target zone (50 percent) and gradually 
				build up to the higher range (85 percent). After six months or more, you may be able to exercise comfortably at up to 
				85% of your maximum heart rate.</p>
				<p>Source: <a href="http://www.heart.org/HEARTORG/GettingHealthy/PhysicalActivity/FitnessBasics/Target-Heart-Rates_UCM_434341_Article.jsp">
				www.heart.org</a></p>
			</c:if>
		    <table border="1" cellspacing="0" cellpadding="3" style="border-collapse:collapse;">
		    	<tr>
		    	<c:if test="${param.type == 3}">
		    		<th>Age Lower Bound</th><th>Age Upper Bound</th>
		    	</c:if>
		    	<th>Lower Bound</th><th>Upper Bound</th><th>Result</th><th>More...</th></tr>
			    <c:forEach items="${results.rows}" var="result">
			    	<tr>
			    	<c:if test="${param.type == 3}">
			    		<td>${result.age_lower}</td><td>${result.age_upper}</td>
			    	</c:if>
			    	<td>${result.tol_lower}</td><td>${result.tol_upper}</td><td>${result.result}</td><td><a href="Search.jsp?q=${result.search}" target="_blank">Search</a></td></tr>
			    </c:forEach>
    		</table>
		</div>
	</div>
    
    <br /><br /><br />
    
    <table border="0" style="width: 100%; text-align: center;">
		<tr><td><a href="Main">Home</a> | <a href="Profile">Profile</a> | <a href="Logout">Logout</a></td></tr>
		<tr><td>Copyright &copy; 2015 Advanced Health Assessment Program</td></tr>
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
											url: 'Chart?type=BT',
										</c:if>
										<c:if test="${param.type == 2}">
											url: 'Chart?type=HR',
										</c:if>
										<c:if test="${param.type == 3}">
											url: 'Chart?type=RR',
										</c:if>
										<c:if test="${param.type == 4}">
											url: 'Chart?type=BP',
										</c:if>
										<c:if test="${param.type == 5}">
											url: 'Chart?type=LDL',
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