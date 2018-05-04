<%@page import="java.io.*, java.util.*, javax.servlet.*, java.text.*, java.sql.*, javax.servlet.http.*, org.apache.commons.io.output.*" %>

<% 
    /*--CODE WRITTEN BY SIDDHARTH DHARM. 
        LAST MODIFIED ON 19/02/2018.
        BITS PILANI HYDERABAD CAMPUS.--*/

    session.invalidate();
    response.sendRedirect("/BITS_Connect/BITS-Connect/login.html"); 

%>