<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%@ page import="java.util.*" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="io.rohan.model.Route" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Dummy Page</title>
    <style>  
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: powderblue;
        }
        
        h3 {
            font-family: Calibri; 
            font-size: 25pt;         
            font-style: normal; 
            font-weight: bold; 
            color: SlateBlue;
            text-align: center; 
            text-decoration: underline;
        }

        h1 {
            font-size: 18pt;
            font-weight: bold;
        }

        h2 {
            font-size: 14pt;
        }

        button {
            background-color: SlateBlue;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        a {
            color: SlateBlue;
            text-decoration: none;
            font-weight: bold;
            margin-left: 20px;
        }

        p {
            font-size: 14pt;
        }

        #distances {
            margin-top: 20px;
        }
    </style> 
</head>
<body>
    <h3>User Dashboard</h3>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        
        if(session.getAttribute("username")==null) {
            response.sendRedirect("/login");
        }
    %>
    
    <p>Welcome, ${sessionScope.username }</p>
    <button onclick="createObject()">Get details</button>
    <a href="${pageContext.request.contextPath }/logout">Logout</a>
  
    
    
       
    <p>Here's your details:</p>
    <h1>Driver Details:</h1>
    <h2 id="name"></h2>
    <h2 id="ph_no"></h2>
    <h2 id="typeOfWaste"></h1>
    <h1>Dumpyard Details:</h1>
    <p id="distances"></p>
    
    
  <script>
   var isDetailsDisplayed =False;
  
    function createObject() {
        if (isDetailsDisplayed) {
            return;
        }
       

        <% 
            Route route = new Route();
            route.getRoute();
          int house =1;
            int[] distances = Route.distances; // Get the distances array from the Route class
            int[] nearestSources = Route.nearestSources;
            for (int i = 1; i < distances.length; i++) {
                 // use the parsed user ID in the for loop
                    out.println("document.getElementById('distances').innerHTML += '<p>Distance from dumpyard to house " + i + " is " + distances[i] +" and the nearest dumpyard is "+nearestSources[i]+ "</p>';");
                
            }
            if(nearestSources[house]==5){
             out.println("document.getElementById('name').innerHTML += '<h2>Ramu</h2>';");
             out.println("document.getElementById('ph_no').innerHTML += '<h2>123456</h2>';");
             out.println("document.getElementById('typeOfWaste').innerHTML += '<h2>Type of Waste=WET </h2>';");
             
            }
            else if(nearestSources[house]==1)
            {
             out.println("document.getElementById('name').innerHTML += '<h2>Sham</h2>';");
             out.println("document.getElementById('ph_no').innerHTML += '<h2>1234567</h2>';");
             out.println("document.getElementById('typeOfWaste').innerHTML += '<h2>Type of Waste=DRY </h2>';");
             
            }
            
        %>

        isDetailsDisplayed = true;
    }
</script>



</body>
</html>
