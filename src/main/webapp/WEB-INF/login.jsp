<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

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

form {
  margin: 0 auto;
  max-width: 400px;
  padding: 20px;
  border: 1px solid #ddd;
  background-color: #fff;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input[type="text"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  box-sizing: border-box;
}

input[type="submit"] {
  display: block;
  margin-top: 20px;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: SlateBlue;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #4B0082;
}
</style> 
</head>
<body>

<h3>Login Page</h3>

${error}
<form method="post" action="${pageContext.request.contextPath }/login">
  <label for="username">Username (E-mail)</label>
  <input type="text" name="username" id="username" required>

  <label for="password">Password</label>
  <input type="password" name="password" id="password" required>

  <input type="submit" value="Login">
</form>

</body>
</html>
