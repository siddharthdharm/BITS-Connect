<!DOCTYPE html>
<html>
<head>
    <title>SIGN OUT</title>
</head>
<body>

<%@page import="java.io.*, java.util.*, javax.servlet.*, java.text.*, java.sql.*, javax.servlet.http.*, org.apache.commons.io.output.*" %>
<% 
    /*--CODE WRITTEN BY SIDDHARTH DHARM.
        LAST MODIFIED ON 19/02/2018.
        BITS PILANI HYDERABAD CAMPUS.--*/

        session.invalidate();
        String site = new String("/BITS_Connect/BITS-Connect/login.html");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    
%>

</body>
</html>