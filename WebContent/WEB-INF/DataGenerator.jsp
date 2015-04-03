<%@ include file="Header.jsp" %>

<sql:query var="users">
	select id, username from users
</sql:query>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Data Generator</title>
</head>
<body>
	<b>Data Generation</b><br />
	<p>* All information except "# of Data Entry Sets" and "Time Interval" must be filled in for all vital data to be generated at the same time.<br />
	   * If "# of Data Entry Sets" is blank, 200 data sets will be generated. This is for safety measures to prevent the DB from swarmed with data.<br />
	   * If "Time Interval" is blank, data will be generated without a time interval.<br />
	</p>
	<form action="DataGenerator" method="post">
		Generate data for user <select name="userid">
			<c:forEach items="${users.rows}" var="user">
				<option value="${user.id}">${user.username}</option>
			</c:forEach>
		</select><br /><br />
		<table border="0">
			<tr><th>Vital Signs (healthy range)</th><th>&nbsp;&nbsp;</th><th>Min</th><th>Max</th></tr>
			<tr><td>Body Temperature (97.6 ~ 98.69F)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="body_min" size="10" value="97.6" /></td><td><input type="text" name="body_max" size="10" value="98.69" /></td></tr>
			<tr><td>Heart Rate (51 ~ 70/min)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="pulse_min" size="10" value="100" /></td><td><input type="text" name="pulse_max" size="10" value="110" /></td></tr>
			<tr><td>Respiration Rate (12 ~ 18/min)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="respiration_min" size="10" value="12" /></td><td><input type="text" name="respiration_max" size="10" value="18" /></td></tr>
			<tr><td>Systolic Pressure (90 ~ 119 mm Hg)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="systolic_min" size="10" value="90" /></td><td><input type="text" name="systolic_max" size="10" value="119" /></td></tr>
			<tr><td>Diastolic Pressure (&lt; 80 mm Hg)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="diastolic_min" size="10" value="70" /></td><td><input type="text" name="diastolic_max" size="10" value="80" /></td></tr>
			<tr><td>HDL (60 ~ 300 mL)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="hdl_min" size="10" value="60" /></td><td><input type="text" name="hdl_max" size="10" value="300" /></td></tr>
			<tr><td>LDL (51 ~ 129 mL)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="ldl_min" size="10" value="51" /></td><td><input type="text" name="ldl_max" size="10" value="129" /></td></tr>
			<tr><td>Triglycerides (51 ~ 150 mL)</td><td>&nbsp;&nbsp;</td><td><input type="text" name="triglycerides_min" size="10" value="51" /></td><td><input type="text" name="triglycerides_max" size="10" value="150" /></td></tr>
			<tr><td># of Data Entry Sets</td><td>&nbsp;&nbsp;</td><td colspan="2"><input type="text" name="datacount" size="10" value="20" /></td></tr>
			<tr><td>Time Interval</td><td>&nbsp;&nbsp;</td><td colspan="2"><input type="text" name="interval" size="10" value="2" /> seconds</td></tr>
		</table>
		<input type="submit" name="generate" value="Generate" />&nbsp;
		<input type="submit" name="stop" value="Stop" /><br /><br />
		
		<b>Data Removal</b><br />
		Remove data for user <select name="useridremove">
			<option value="0">All</option>
			<c:forEach items="${users.rows}" var="user">
				<option value="${user.id}">${user.username}</option>
			</c:forEach>
		</select>&nbsp;
		<input type="submit" name="remove" value="Remove" /><br /><br />
		
		<c:if test="${param.good == 0}">
			<font color="red">Error generating data.</font>
		</c:if>
		<c:if test="${param.good == 1}">
			<font color="green">Data successfully generated!</font>
		</c:if>
		<c:if test="${param.good == 2}">
			<font color="red">Data generation stopped!</font>
		</c:if>
		<c:if test="${param.good == 3}">
			<font color="green">Data successfully removed!</font>
		</c:if>
	</form>
</body>
</html>