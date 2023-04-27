<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%@ page import="java.util.*" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="io.rohan.model.Route" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Details Page</title>
    <style>  
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: powderblue;
        }
        
        #title{
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
            text-decoration: underline;
        }

        h2 {
            font-size: 14pt;
            text-decoration: underline;
        }
        
        h3{
        font-size: 12pt;
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
        
        
        button.logout {
        background-color: SlateBlue;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-family: Arial, Helvetica, sans-serif;
        font-weight: bold;
        font-size: 14pt;
        margin-top: 20px;
    }

    button.logout:hover {
        background-color: DarkSlateBlue;
    }
        
        
    </style> 
</head>
<body>
    <h3 id="title" >User Dashboard</h3>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        
        if(session.getAttribute("username")==null) {
            response.sendRedirect("/login");
        }
    %>
    
    <h1>Welcome, ${sessionScope.username }</h1>    
   
  

    <h1>Here's your details:</h1>
    <h2>Driver Details:</h2>
    <h3 id="name"></h3>
    <h3 id="ph_no"></h3>
    <h3 id="typeOfWaste"></h3>
    <h2>Dumpyard Details:</h2>
    <h3 id="distances"></h3>
    
    
    <a href="${pageContext.request.contextPath }/logout">
        <button class="logout">Logout</button>
    </a>
    
    <script>  
    
    <%
    
    		String name = (String) request.getAttribute("name");      
            Route route = new Route();
            route.getRoute();
            int house= Integer.parseInt(name);
            int[] distances = Route.distances; // Get the distances array from the Route class
            int[] nearestSources = Route.nearestSources;
            for (int i = 1; i < distances.length; i++) {
                
                 if(i == house)
                 {
                    out.println("document.getElementById('distances').innerHTML += '<p>Distance from dumpyard to house " + i + " is " + distances[i] +" and the nearest dumpyard is "+nearestSources[i]+ "</p>';");
                }
     
                
                
            }
            if(nearestSources[house]==5){
             out.println("document.getElementById('name').innerHTML += '<h3>Ramu</h3>';");
             out.println("document.getElementById('ph_no').innerHTML += '<h3>123456</h3>';");
             out.println("document.getElementById('typeOfWaste').innerHTML += '<h3>Type of Waste=WET </h3>';");
             
            }
            else if(nearestSources[house]==1)
            {
             out.println("document.getElementById('name').innerHTML += '<h3>Sham</h3>';");
             out.println("document.getElementById('ph_no').innerHTML += '<h3>1234567</h3>';");
             out.println("document.getElementById('typeOfWaste').innerHTML += '<h3>Type of Waste=DRY </h3>';");
             
            }
            
        %>
</script>



</body>
</html>
