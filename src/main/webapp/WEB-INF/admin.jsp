<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<style>  
h3 {
  font-family: Calibri; 
  font-size: 25pt;         
  font-style: normal; 
  font-weight: bold; 
  color: SlateBlue;
  text-align: center; 
  text-decoration: underline;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: powderblue;
}

.container {
  margin: auto;
  width: 50%;
  border: 3px solid SlateBlue;
  padding: 10px;
  text-align: center;
}

a {
  text-decoration: none;
  color: SlateBlue;
  font-weight: bold;
  font-size: 16pt;
}

a:hover {
  color: DarkSlateBlue;
}
</style> 
</head>
<body>

	<div class="container">
		<h3>Welcome to the Admin Page</h3>
		<%
		
		 response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("/login");
		}
	
		%>
		<p>Welcome, ${sessionScope.username }</p>
		<a href="${pageContext.request.contextPath }/logout">Logout</a>
	</div>
	
</body>
</html>
