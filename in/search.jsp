<!DOCTYPE html>
<html>
<head>
	 <title>Results</title>
	 <link rel="stylesheet" href="css/main.css">
	 <style type="text/css">
	 	body {
	 		background-color: rgb(41,42,42);
	 		color: white;
	 	}
	 </style>
</head>
<body>

	<nav>
        <ul class="topnav">
            <li><a class="active" href="#">BITS | Connect</a></li>
            <li class="right"><a href="logout.jsp">Logout</a></li>         
        </ul>
    </nav>
    <br><br>
    <h1><center>The following search results were returned : </center></h1><br><br>
    <center>
    	<h2>
    		<font style="color: rgb(224,168,14);">

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
	    String search = "";

	    try{

	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(DB_URL,USER,PASS);

	        if (session.getAttribute("bitsid") == null || session.getAttribute("bitsid").equals("")){
	            String site = new String("/BITS_Connect/BITS-Connect/expired.html");
	            response.setStatus(response.SC_MOVED_TEMPORARILY);
	            response.setHeader("Location", site);
	        }
	        else {

	            String bitsid = session.getAttribute("bitsid").toString();
	            search = request.getParameter("search");

	            String query = "SELECT * FROM `personal_details` WHERE (first_name = '"+search+"' OR last_name = '"+search+"' OR bitsid = '"+search+"');";
	            stmt = conn.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            while(rs.next()) {
	                String fn = rs.getString("first_name");
	                String ln = rs.getString("last_name");
	                out.println(fn);
	                out.println(ln);
	            }
	            stmt.close();
	        }

	        conn.close();
	    
	    }catch(SQLException se){
	        se.printStackTrace();            //Handles errors for JDBC   
	    }catch(Exception e){
	        e.printStackTrace();             //Handles errors for Class.forName
	    }
	    finally {                            //finally block used to close resources
	        try {
	            if(stmt != null)
	                stmt.close();
	        }catch(SQLException se1){
	                se1.printStackTrace();
	        }

	        try {
	            if(conn != null)
	                conn.close();
	        }catch(SQLException se2){
	            se2.printStackTrace();
	        }
	    }
	%>
			</font>
		</h2>
	</center>

</body>
</html>