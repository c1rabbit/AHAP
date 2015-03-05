<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<script>
	//google search script
	(function() {
		var cx = '003632577179248732866:wnyn1pl6zr0';
		var gcse = document.createElement('script');
		gcse.type = 'text/javascript';
		gcse.async = true;
		gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:')
				+ '//www.google.com/cse/cse.js?cx=' + cx;
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(gcse, s);
	})();
</script>

</head>
<body>

	<h2>
		Search results for <em>${param["q"] }</em>
	</h2>

	<gcse:searchresults-only></gcse:searchresults-only>

	<p>Source(s): www.cdc.gov www.heart.org www.webmd.com</p>
	<button onclick="history.back();">Back</button>
</body>

</html>
