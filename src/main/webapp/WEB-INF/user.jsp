
//This page is rendered to accept the house number from the user.


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
s
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
    <form action="/display" method="post">
  <label for="name">Enter your house number:</label>
  <input type="text" id="name" name="name">
  <br>
  <br>
  	
  <button type="submit">Submit</button>
</form>

    


</body>
</html>
