<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="js/jquery.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Advance Health Assessment Program Login</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/date.css" />
	<link rel="stylesheet" href="css/customize.css" />
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/date.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript">
		// When the document is ready
		$(document).ready(function () {
			$('#birthday').datepicker({
				format: "mm/dd/yyyy"
			});
		});
	</script>
</head>
<body>
	<%@ include file="TopBar.jsp" %>
	<br />
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<!-- LOGIN -->
				<div id="login_panel" class="panel panel-info"
					<c:if test="${not empty param.username}">
						style="display: none;"
					</c:if>
				>
					<div class="panel-heading"><h3>Sign In</h3></div>
					<div class="panel-body">
						<form id="login" action="Login" method="post">
							<input type="text" class="form-control" id="user" name="username" placeholder="Username" /><br />
							<input type="password" class="form-control" id="password" name="password" placeholder="Password" /><br />
							<input type="submit" class="btn btn-default navbar-btn" name="login" value="Sign In" />
							<h5>- or -</h5>
							<button type="button" class="btn btn-default navbar-btn" onClick="signUpBtn();">Sign Up</button>
						</form>
						<c:if test="${param.error==0}">
							<div class="alert alert-danger">Incorrect username or password!</div>
						</c:if>
						<c:if test="${param.register==1}">
							<div class="alert alert-success">Registration successful! Please sign in with username and password.</div>
						</c:if>
					</div>
				</div>
				<!-- REGISTRATION -->
				<div id="register_panel" class="panel panel-info" 
					<c:if test="${empty param.username}">
						style="display: none;"
					</c:if>
				>
					<div class="panel-heading"><h3>Account Registration</h3></div>
					<div class="panel-body">
						<form name="register" id="login" action="Register" onsubmit="return validateForm()" method="post">
							<h4>Personal Information</h4>
							<input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name" /><br />
							<input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name" /><br />
							<table border="0">
								<tr><td>&nbsp;Date of Birth</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
									<input type="text" class="form-control" placeholder="dd/mm/yyyy" id="birthday" name="birthday" style="width: 154px; display: inline;" />&nbsp;<i>i.e. 12/31/1980</i>
								</td></tr>
								<tr><td colspan="3">&nbsp;</td></tr>
								<tr><td>&nbsp;Gender</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
									<select name="gender" class="form-control" style="width: 154px;">
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</td></tr>
								<tr><td colspan="3">&nbsp;</td></tr>
								<tr><td>&nbsp;Blood Type</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
									<select name="bloodtype" class="form-control" style="width: 154px;">
										<option value="O">O</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="AB">AB</option>
									</select>
								</td></tr>
								<tr><td colspan="3">&nbsp;</td></tr>
								<tr><td>&nbsp;Height</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
									<input type="text" class="form-control" name="feet" placeholder="Feet" style="width: 70px; display: inline;" />&nbsp;'&nbsp;
									<input type="text" class="form-control" name="inches" placeholder="Inches" style="width: 70px; display: inline;" />&nbsp;"
								</td></tr>
								<tr><td colspan="3">&nbsp;</td></tr>
								<tr><td>&nbsp;Weight</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text" class="form-control" name="weight" placeholder="Weight" style="width: 154px; display: inline;" />&nbsp;LB</td></tr>
							</table><br />
							<h4>Login Information</h4>
							<input type="text" class="form-control" id="username" name="username" placeholder="Username" /><br />
							<input type="password" class="form-control" id="pWord" name="password1" placeholder="Password" /><br />
							<input type="password" class="form-control" id="cWord" name="password2" placeholder="Confirm Password" /><br />
							<input type="submit" class="btn btn-default navbar-btn" name="register" value="Register" />
							<button type="button" class="btn btn-default navbar-btn" onClick="goBackBtn();">Back</button>
						</form>
						<div class="alert alert-danger" id="invalidinputwarning" role="alert" style="display:none">
							Field(s) missing valid input.
						</div>
						<div class="alert alert-danger" id="invaliddatewarning" role="alert" style="display:none">
							Birthday format is incorrect.
						</div>
						<div class="alert alert-danger" id="invalidnumberwarning" role="alert" style="display:none">
							"Height" and "weight" require positive integer inputs.
						</div>
						<div class="alert alert-danger" id="passwordmismatchwarning" role="alert" style="display:none">
							Passwords do not match.
						</div>
						<div class="alert alert-danger" id="duplicatedusernamewarning" role="alert" 
							<c:if test="${empty param.username}">
								style="display: none;"
							</c:if>
						>
							The username '${param.username}' is already in use.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>