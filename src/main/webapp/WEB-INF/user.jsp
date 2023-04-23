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
    <p>Enter User ID:</p>
     <input type="number" id="userIdInput" name="userId">
    <p>Here's your details:</p>
    <h1>Driver Details:</h1>
    <h2>Name: Ramu</h2>
    <h2>Ph.No: 12245</h2>
    <h1>Type of waste: WET</h1>
    <p id="distances"></p>
  <script>
    var userId = document.getElementById('userIdInput').innerHtml;
    var isDetailsDisplayed = false;
    function createObject() {
        if (isDetailsDisplayed) {
            return;
        }
        var param2 = 123;

        <% 
            Route route = new Route();
            route.getRoute();
            //int userIdInt = Integer.parseInt(request.getParameter("userId")); // parse the user ID from the JSP request
            int[] distances = Route.distances; // Get the distances array from the Route class
            int[] nearestSources = Route.nearestSources;
            for (int i = 1; i < distances.length; i++) {
                 // use the parsed user ID in the for loop
                    out.println("document.getElementById('distances').innerHTML += '<p>Distance from sources to " + i + " is " + distances[i] +" nearest source is "+nearestSources[i]+ "</p>';");
                
            }
        %>

        isDetailsDisplayed = true;
    }
</script>



</body>
</html>
