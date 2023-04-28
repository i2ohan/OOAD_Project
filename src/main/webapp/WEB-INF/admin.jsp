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

h2{
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
		<a href="${pageContext.request.contextPath }/logout"><button>Logout</button></a>
		  <h2 id="driver_details"></h2>
    		<h4 id="name"></h4>
    		<h4 id="ph_no"></h4>
    		<h4 id="typeOfWaste"></h4>
    		 
    	<br>
    	
    		<h4 id="name1"></h4>
    		<h4 id="ph_no1"></h4>
    		<h4 id="typeOfWaste1"></h4>
    	<br>
    	
    		<h4 id="name2"></h4>
    		<h4 id="ph_no2"></h4>
    		<h4 id="typeOfWaste2"></h4>	
    	
    		
    		<h2 id="route_details"></h2>
		 <p id="distances"></p>
	</div>
	
	<script>
    
    var isDetailsDisplayed = false;
    function createObject() {
        if (isDetailsDisplayed) {
            return;
        }
       

        <% 
            Route route = Route.getInstance();
            route.getRoute();
           
            int[] distances = route.getDistances(); // Get the distances array from the Route class
            int[] nearestSources = route.getNearestSource();
            
            out.println("document.getElementById('driver_details').innerHTML += '<h4>Driver Details</h4>';");
             out.println("document.getElementById('name').innerHTML += '<h4>Name: Ramu</h4>';");
             out.println("document.getElementById('ph_no').innerHTML += '<h4>+91 9568712560</h4>';");
             out.println("document.getElementById('typeOfWaste').innerHTML += '<h4>Type of Waste=WET </h4>';");
             
              out.println("document.getElementById('name1').innerHTML += '<h4>Name: Sham</h4>';");
             out.println("document.getElementById('ph_no1').innerHTML += '<h4>+91 7895412430</h4>';");
             out.println("document.getElementById('typeOfWaste1').innerHTML += '<h4>Type of Waste=DRY </h4>';");
             
             out.println("document.getElementById('name2').innerHTML += '<h4>Name: Hari</h4>';");
             out.println("document.getElementById('ph_no2').innerHTML += '<h4>+91 9031649632</h4>';");
             out.println("document.getElementById('typeOfWaste2').innerHTML += '<h4>Type of Waste=E-waste </h4>';");
            out.println("document.getElementById('route_details').innerHTML += '<h4>Route Details</h4>';");
            for (int i = 1; i < distances.length; i++) {
                 
                    out.println("document.getElementById('distances').innerHTML += '<p>Distance from dumpyard to house " + i + " is " + distances[i] +" and the nearest dumpyard is "+nearestSources[i]+ "</p>';");
                
            }
            
            
        %>

        isDetailsDisplayed = true;
    }
</script>
	
</body>
</html>
