<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="cb" class="core.ConfigBean" />

<%-- set data source --%>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="${cb.url}" user="${cb.username}" password="${cb.password}" />
<c:set var="usersession" value="${sessionScope.user}" />

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
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

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);

	function drawChart() {
		// create Blood Type Pie Chart
		var data = google.visualization.arrayToDataTable([
		// Blood Type Demographics data taken from: http://en.wikipedia.org/wiki/Blood_type_distribution_by_country
		[ 'Bloodtype', 'Percentage' ], [ 'O', 37.4 ], [ 'A', 35.7 ],
				[ 'B', 8.5 ], [ 'AB', 3.4 ], [ 'O-', 6.6 ], [ 'A-', 6.3 ],
				[ 'B-', 1.5 ], [ 'AB-', 0.6 ] ]);

		// create Height Pie Chart
		var data2 = google.visualization.arrayToDataTable([
		// Height Demographics (20-29 yrs of age) data taken from: https://www.census.gov/compendia/statab/2012/tables/12s0209.pdf
		[ 'Height', 'Percentage' ], [ '5\'4"', 3.7 ], [ '5\'5"', 3.5 ],
				[ '5\'6"', 4.4 ], [ '5\'7"', 9.0 ], [ '5\'8"', 12.5 ],
				[ '5\'9"', 9.1 ], [ '5\'10"', 16.4 ], [ '5\'11"', 12.1 ],
				[ '6\'0"', 9.2 ], [ '6\'1"', 9.1 ], [ '6\'2"', 5.1 ],
				[ '6\'3"', 4.2 ], [ '6\'4"', 1.7 ] ]);

		// create Weight Pie Chart
		var data3 = google.visualization.arrayToDataTable([

		// Weight Demographics (20-29 yrs of age) data taken from: https://www.census.gov/compendia/statab/2012/tables/12s0209.pdf
		[ 'Weight', 'Percentage' ], [ '130', 4.3 ], [ '140', 6.8 ],
				[ '150', 9.8 ], [ '160', 10.4 ], [ '170', 12.3 ],
				[ '180', 12.1 ], [ '190', 9.3 ], [ '200', 8.5 ],
				[ '210', 5.9 ], [ '220', 4.4 ], [ '230', 2.7 ], [ '240', 3.2 ],
				[ '250', 3.5 ], [ '260', 1.5 ], [ '270', 0.4 ], [ '280', 1.0 ],
				[ '290', 0.7 ], [ '300', 0.7 ], [ '320', 0.6 ], [ '340', 1.4 ],
				[ '360', 0.0 ], [ '380', 0.2 ], [ '400', 0.0 ], [ '420', 0.0 ],
				[ '440', 9.8 ]
		]);

		// Create BMI Histogram taken from: http://win.niddk.nih.gov/statistics/
		var data4 = google.visualization.arrayToDataTable([

		// BMI Demographics taken from:                                                  
		[ 'BMI', 'Percentage', {
			role : 'style'
		} ], [ 'Normal or underweight (under 24.9)', 31.2, '#339933' ],
				[ 'Overweight (25 to 29.9)', 33.1, '#D65C33' ],
				[ 'Obesity (30+)', 35.7, '#822100' ],
				[ 'Extreme obesity (40+)', 6.3, '#521400' ] ]);

		// identify where user falls in the bloodtype piechart
		for (var i = 0, maxrows = data.getNumberOfRows(); i < maxrows; i++) {
			if (data.getValue(i, 0) == '${users.rows[0].blood_type}') {
				data.setValue(i, 0, ' YOU (${users.rows[0].firstname}) ');
			}
		}

		// identify where user falls in the height piechart
		var feet = ${
			(users.rows[0].height - (users.rows[0].height % 12)) / 12
		};
		
		var inches = ${
			users.rows[0].height % 12
		};
		
		var totalHeight = feet + '\'' + inches + '\"';

		for (var i = 0, maxrows = data2.getNumberOfRows(); i < maxrows; i++) {
			if (data2.getValue(i, 0) == totalHeight) {
				data2.setValue(i, 0, 'YOU (${users.rows[0].firstname})');
			}
		}

		// identify where user falls in the weight piechart
		var weight = ${
			users.rows[0].weight
		};

		// round up to the nearest ten
		var newWeight = Math.ceil(weight / 10) * 10;

		for (var i = 0, maxrows = data3.getNumberOfRows(); i < maxrows; i++) {
			if (data3.getValue(i, 0) == newWeight) {
				data3.setValue(i, 0, 'YOU (${users.rows[0].firstname})');
			}
		}

		// for blood type pie chart
		var options = {
			title : ' ${users.rows[0].firstname}\'s Bloodtype (${users.rows[0].blood_type}) ',
			is3D : true,
		};

		// height pie chart
		var options2 = {
			title : ' ${users.rows[0].firstname}\'s Height (' + totalHeight + ')',
			is3D : true,
		};

		// weight pie chart
		var options3 = {
			title : ' ${users.rows[0].firstname}\'s Weight (${users.rows[0].weight} lbs)  ',
			is3D : true,
		};

		// bmi histogram
		var options4 = {
			title : 'Overweight and Obesity among Adults Age 20 and Older, United States',
			width : 1000,
			height : 563,
			legend : {
				position : "none"
			},
			hAxis : {
				title : 'Percentage',
				minValue : 0
			},
			vAxis : {
				title : 'BMI'
			}
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		chart.draw(data, options);

		var chart2 = new google.visualization.PieChart(document.getElementById('piechart2_3d'));
		chart2.draw(data2, options2);

		var chart3 = new google.visualization.PieChart(document.getElementById('piechart3_3d'));
		chart3.draw(data3, options3);

		var chart4 = new google.visualization.BarChart(document.getElementById('barchart_2d'));
		chart4.draw(data4, options4);

		function selectHandler() {
			var selectedItem = chart.getSelection()[0];

			if (selectedItem) {
				var bloodtype = data.getValue(selectedItem.row, 0);
				var percentage = data.getValue(selectedItem.row, 1)
				alert(percentage + ' % hold the bloodtype of ' + bloodtype + ' in the United States');
			}
		}

		google.visualization.events.addListener(chart, 'select', selectHandler);
		chart.draw(data, options);
	}
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

	<div id="mainbody">
		<br /><br /><br />
		<h4>Profile of <b><i>${users.rows[0].firstname} ${users.rows[0].lastname}</i></b></h4>
		<hr />
		<table border="0">
			<tr>
				<td id="header">Username</td>
				<td>&nbsp;&nbsp;</td>
				<td>${users.rows[0].username}</td>
			</tr>
			<tr>
				<td id="header">Name</td>
				<td>&nbsp;&nbsp;</td>
				<td>${users.rows[0].firstname} ${users.rows[0].lastname}</td>
			</tr>
			<tr>
				<td id="header">Gender</td>
				<td>&nbsp;&nbsp;</td>
				<td>${users.rows[0].gender}</td>
			</tr>
			<tr>
				<td id="header">Birthday</td>
				<td>&nbsp;&nbsp;</td>
				<td>${users.rows[0].birthday}</td>
			</tr>
			<tr>
				<td id="header">Blood Type</td>
				<td>&nbsp;&nbsp;</td>
				<td>${users.rows[0].blood_type}</td>
			</tr>
			<fmt:formatNumber var="feet" value="${(users.rows[0].height - (users.rows[0].height mod 12)) div 12}" maxFractionDigits="0" />
			<c:set var="inches" value="${users.rows[0].height mod 12}" />
			<tr>
				<td id="header">Height</td>
				<td>&nbsp;&nbsp;</td>
				<td>${feet}'${inches}"</td>
			</tr>
			<tr>
				<td id="header">Weight</td>
				<td>&nbsp;&nbsp;</td>
				<td>${users.rows[0].weight}LB</td>
			</tr>
		</table>
		
		<br /><br />
		
		<h4>How <b><i>${users.rows[0].firstname} ${users.rows[0].lastname}</i></b> is compared to the rest of the United States</h4>
		<hr />
		<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
		<div id="piechart2_3d" style="width: 900px; height: 500px;"></div>
		<div id="piechart3_3d" style="width: 900px; height: 500px;"></div>
		<div id="barchart_2d" style="width: 500px; height: 500px;"></div>
		
		<br/><br/><br/><br/><br/>
		
		<script>
			// height in inches
			var heightinches = ${users.rows[0].height}
	        
	       	// BMI = ( Weight in Pounds / ( Height in inches x Height in inches ) ) x 703
	       	var weight = ${users.rows[0].weight};
			var bmi = Math.round(( weight / ( heightinches * heightinches ) ) * 703);
			
			document.write("Your weight is: " + weight + " lbs <br /> Your height is: " + ${feet} + "\'" + ${inches} + "\"" + "<br /> Your BMI is: " + bmi + "<br />"); 
			
			// if bmi less than 18.5
			if (bmi <= 18.5) {
				document.write("You are underweight!".fontcolor("red"));
			} else if (bmi >= 25.0) { // if bmi greater than 25.0
				document.write("You are overweight!".fontcolor("red"));
			} else { // else, you're on the healthy weight range (Normal weight range: 18.5–24.9)
				document.write("You are at a healthy weight!".fontcolor("green"));
			}
		</script>
		
		<br /><br /><br /><br />
		
		<table border="0" style="width: 100%; text-align: center;">
			<tr><td><a href="Main">Home</a> | <a href="Profile">Profile</a> | <a href="Logout">Logout</a></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>Copyright &copy; 2015 Advanced Health Assessment Program</td></tr>
		</table>
		<br /><br /><br />
	</div>

	<!-- Javascript ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
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