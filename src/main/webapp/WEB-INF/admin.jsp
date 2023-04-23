<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ page import="io.rohan.model.Route" %>
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
 button {
    font-size: 16pt;
    font-weight: bold;
    background-color: SlateBlue;
    color: white;
    border: none;
    border-radius: 4px;
    padding: 8px 16px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
  }

  button:hover {
    background-color: DarkSlateBlue;
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
		 <button onclick="createObject()">Get details</button>
		<a href="${pageContext.request.contextPath }/logout">Logout</a>
		 <p id="distances"></p>
	</div>
	
	<script>
    
    var isDetailsDisplayed = false;
    function createObject() {
        if (isDetailsDisplayed) {
            return;
        }
       

        <% 
            Route route = new Route();
            route.getRoute();
           
            int[] distances = Route.distances; // Get the distances array from the Route class
            int[] nearestSources = Route.nearestSources;
            for (int i = 1; i < distances.length; i++) {
                 
                    out.println("document.getElementById('distances').innerHTML += '<p>Distance from dumpyard to house " + i + " is " + distances[i] +" and the nearest dumpyard is "+nearestSources[i]+ "</p>';");
                
            }
        %>

        isDetailsDisplayed = true;
    }
</script>
	
</body>
</html>
