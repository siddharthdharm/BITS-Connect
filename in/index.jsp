<!DOCTYPE html>
<html>
<head>
    <title>BITS | Connect</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <button type="button" onclick="window.location.href='http://localhost:8080/BITS_Connect/BITS-Connect/in/signout.jsp'" class="w3-button w3-white w3-border w3-border-red w3-round-large">SIGN OUT</button>
    <button type="button" onclick="window.location.href='http://localhost:8080/BITS_Connect/BITS-Connect/in/edit.html'" class="w3-button w3-white w3-border w3-border-red w3-round-large">EDIT PROFILE</button>
    <!-- <div class="headerMenu">
        <div id="wrapper">
            <div class="logo"><img src=""></div>
            <div class="search_box">
                <form method="search.jsp" method="GET" id="search">
                    <input type="text" name="q" size="60" placeholder="Search ..">
                </form>
            </div>
            <div id="menu">
                <a href="#">Home</a>
                <a href="#">About</a>
                <a href="#">Sign Up</a>
                <a href="#">Sign In</a>
            </div>
        </div>
    </div> -->
<%@page import="java.io.*, java.util.*, javax.servlet.*, java.text.*, java.sql.*, javax.servlet.http.*, org.apache.commons.io.output.*" %>
<% 
    /*--CODE WRITTEN BY SIDDHARTH DHARM.
        LAST MODIFIED ON 19/02/2018.
        BITS PILANI HYDERABAD CAMPUS.--*/

    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";                 // JDBC Driver Name //
    final String DB_URL = "jdbc:mysql://localhost:3306/bits_connect";   // URL of your Database //
    final String USER = "root";                                         // Database credentials //
    final String PASS = "";
    Connection conn = null;
    Statement stmt = null;

    try{

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        
        int count = 0;

        if (session.getAttribute("bitsid") == null || session.getAttribute("bitsid").equals("")){

            /*if (session == null || session.getAttribute("bitsid") == null)
                request.getRequestDispatcher("/BITS_Connect/BITS-Connect/unauthorized.html").forward(request,response);*/
            String site = new String("/BITS_Connect/BITS-Connect/unauthorized.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }

        else {

            String bitsid = session.getAttribute("bitsid").toString();
            String query = "SELECT * FROM `personal_details` WHERE bitsid = '"+bitsid+"';";
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                out.println("<br><center><h1>Welcome to BITS | Connect, "+rs.getString("name")+" !!</h1></center>");
            }
            stmt.close();

        }

        conn.close();
    
    }
    catch(SQLException se){
        se.printStackTrace();           //Handles errors for JDBC
    }
    catch(Exception e){
        e.printStackTrace();            //Handles errors for Class.forName
    }

    finally{                            //finally block used to close resources
        try{
            if(stmt != null)
                stmt.close();
        }
        catch(SQLException se1){
            se1.printStackTrace();
        }
    
        try {
            if(conn!=null)
                conn.close();
            }
        catch(SQLException se2){
            se2.printStackTrace();
        }
    }
%>

</body>
</html>
