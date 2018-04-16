<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Libre+Franklin:300,400,700&amp;subset=latin-ext">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700&amp;subset=latin-ext">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<title>Notifications</title>
	<noscript>
    <style>html{display:block;opacity:1}</style>
    </noscript>
</head>
<body>
	<main>
		<div class="jumbotron">
			<center><h1><font color="#d30320">BITS | Connect</font></h1></center>
		</div>


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
    int k = 0, l = 0;
    String ids[] = new String[1000];
    String fname[] = new String[1000];
    String lname[] = new String[1000];

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
        	k = 0;

        	String query = "SELECT * FROM `connections` WHERE second = '" + bitsid + "' AND request = '10';";
        	stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery(query);
	        while(rs.next()) {
	            String re = rs.getString("request");
	            String id = rs.getString("first");
	            ids[k++] = id;
	        }
	        stmt.close();

	        for(int i = 0; i < k; i++) {
		        query = "SELECT * FROM `personal_details` WHERE bitsid = '" + ids[i] + "';";
	        	stmt = conn.createStatement();
		        ResultSet rs1 = stmt.executeQuery(query);
		        while(rs1.next()) {
		            String fn = rs1.getString("first_name");
		            String ln = rs1.getString("last_name");
		            fname[i] = fn;
		            lname[i] = ln;
		        }
		        stmt.close();
		    }

	        for(int i = 0; i < k; i++) {
	        		out.println("<center><h2>" + (i+1) + ". " + "<a href=\"semi_profile.jsp?newid=" + ids[i] + "\">" + fname[i] + " " + lname[i] + "</a> wants to connect with you. </h2></center>");
	    	}


            /*String site = new String("/BITS_Connect/BITS-Connect/in/success.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);*/

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

		<div class="container">
			<br><br><br><br>
			<center>
				<h3>
					
				</h3>
					
			</center>
		</div>

	</main>
	<br><br><br><br><br><br><br><br><br><br><br>

	<footer>
		<center><font color="#d30320"><h4> &copy BITS Pilani - Hyderabad, 2018.</h4></font></center>
	</footer>

</body>
</html>