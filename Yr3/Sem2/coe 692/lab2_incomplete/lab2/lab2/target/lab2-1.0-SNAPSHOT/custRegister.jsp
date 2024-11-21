<%-- 
    Document   : custRegister
    Created on : Feb 4, 2024, 10:45:05 PM
    Author     : student
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get ready to shop!</title>
    </head>
    <body> <%-- issues here, not grabbing session data --%>
        <h1>Welcome <%=session.getAttribute("fName")%> <%=session.getAttribute("fName") %>!</h1>
        <p> Thank you for signing up with Sini's Convenience. </p>
        <a href="/lab2/index.html"> Return to login</a> 
    
    </body>
</html>
