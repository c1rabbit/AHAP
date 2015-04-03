<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print</title>
<script src="js/jquery.js"></script>

<script>
	function getData() {
		$.ajax({
			url : 'Analyze',
			datatype : 'json',
			type : 'get',
			success : function(response) {
				$('#BT').html(response.BT[1]);
				$('#HR').html(response.HR[1]);
				$('#RR').html(response.RR[1]);
				$('#BP').html(response.BP[1] + "/" + response.BP2[1]);
				$('#CH').html(response.HDL[1] + "/" + response.LDL[1] + "/" + response.TRI[1]);
				
				$('#BTL').html(response.BT[2]);
				$('#HRL').html(response.HR[2]);
				$('#RRL').html(response.RR[2]);
				$('#BPL').html(response.BP[2] + "/" + response.BP2[2]);
				$('#CHL').html(response.HDL[2] + "/" + response.LDL[2] + "/" + response.TRI[2]);
				
				$('#BTanalysis').html(response.BT[3]);
				$('#HRanalysis').html(response.HR[3]);
				$('#RRanalysis').html(response.RR[3]);
				$('#BPanalysis').html(response.BP[3]);
				$('#HDLanalysis').html(response.HDL[3]);
				$('#LDLanalysis').html(response.LDL[3]);
				$('#TRIanalysis').html(response.TRI[3]);
				
				window.print();
			},

			error : function(xhr, status) {
				setTimeout(getData, 1000);
			}
		});
	}

	getData();
</script>

<style type="text/css">
	div {
		margin: 1em;
	}
</style>

</head>
<body>
	<script>
		document.write(new Date());
	</script>
	<div id="mainbody">
		<table border="0">
			<tr>
				<td id="header">Name</td>
				<td>${users.rows[0].firstname}&nbsp;${users.rows[0].lastname}</td>
			</tr>
			<tr>
				<td id="header">Gender</td>
				<td>${users.rows[0].gender}</td>
			</tr>
			<tr>
				<td id="header">Birthday</td>
				<td>${users.rows[0].birthday}</td>
			</tr>
			<tr>
				<td id="header">Blood Type</td>
				<td>${users.rows[0].blood_type}</td>
			</tr>
			<fmt:formatNumber var="feet" value="${(users.rows[0].height - (users.rows[0].height mod 12)) div 12}" maxFractionDigits="0" />
			<c:set var="inches" value="${users.rows[0].height mod 12}" />
			<tr>
				<td id="header">Height</td>
				<td>${feet}'&nbsp;${inches}"</td>
			</tr>
			<tr>
				<td id="header">Weight</td>
				<td>${users.rows[0].weight}&nbsp;lbs</td>
			</tr>
		</table>
	</div>

	<div>
		Body Temperature (°F): <span id="BTL"></span><br />
		Average: <span id="BT"></span>
	</div>
	<div>
		Heart Rate (beats/min): <span id="HRL"></span><br />
		Average: <span id="HR"></span>
	</div>
	<div>
		Respiratory Rate (breaths/min): <span id="RRL"></span><br />
		Average: <span id="RR"></span>
	</div>
	<div>
		Blood Pressure (Sys/Dias)(mm Hg): <span id="BPL"></span><br />
		Average: <span id="BP"></span>
	</div>
	<div>
		Cholesterol (HDL/LDL/TRI mg/dl): <span id="CHL"></span><br />
		Average: <span id="CH"></span>
	</div>
	<hr />

	<h4>Analysis:</h4>
	<table border="0" id="analysis">
		<tr id="odd">
			<td><b>Body Temperature</b></td>
			<td id="BTanalysis"></td>
		</tr>
		<tr id="even">
			<td><b>Heart Rate</b></td>
			<td id="HRanalysis"></td>
		</tr>
		<tr id="odd">
			<td><b>Respiratory Rate</b></td>
			<td id="RRanalysis"></td>
		</tr>
		<tr id="even">
			<td><b>Blood Pressure</b></td>
			<td id="BPanalysis"></td>
		</tr>
		<tr id="even">
			<td><b>High-density lipoprotein</b></td>
			<td id="HDLanalysis"></td>
		</tr>
		<tr id="even">
			<td><b>Low-density lipoprotein</b></td>
			<td id="LDLanalysis"></td>
		</tr>
		<tr id="even">
			<td><b>Triglyceride</b></td>
			<td id="TRIanalysis"></td>
		</tr>
	</table>
</body>
</html>