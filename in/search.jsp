<!DOCTYPE html>
<html>
<head>
	 <title>Results</title>
	 <link rel="stylesheet" href="css/main.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Google Font: Lato -->
        <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
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
            <li><a class="active" href="profile.jsp">BITS | Connect</a></li>
            <div class="search-container">
                    <form action="search.jsp">
                        <input type="text" placeholder="Search.." name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
            </div>
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
	    String newid[] = new String[1000];
	    String fname[] = new String[1000];
	    String lname[] = new String[1000];
	    int k = 0;
	    String bitsid = "";
	    //String search[] = new String[1000];

	    try{

	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(DB_URL,USER,PASS);

	        if (session.getAttribute("bitsid") == null || session.getAttribute("bitsid").equals("")){
	            String site = new String("/BITS_Connect/BITS-Connect/expired.html");
	            response.setStatus(response.SC_MOVED_TEMPORARILY);
	            response.setHeader("Location", site);
	        }
	        else {

	            bitsid = session.getAttribute("bitsid").toString();
	            search = request.getParameter("search");
	            //search = se.split(" ");

	            k = 0;
	            String query = "SELECT * FROM `personal_details` WHERE (first_name = '"+search+"' OR last_name = '"+search+"' OR bitsid = '"+search+"');";
	            stmt = conn.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            while(rs.next()) {
	                String fn = rs.getString("first_name");
	                String ln = rs.getString("last_name");
	                String id = rs.getString("bitsid");
	                newid[k] = id;
	                fname[k] = fn;
	                lname[k++] = ln;
	            }
	            stmt.close();
	        }

	        // Printing links

	        for(int i = 1; i <= k; i++) {
	        	String query = "SELECT * FROM `connections` WHERE (first = '" + bitsid + "' AND second = '" + newid[i-1] + "') OR (first = '" + newid[i-1] + "' AND second = '" + bitsid + "');";
	            stmt = conn.createStatement();
	            ResultSet rs = stmt.executeQuery(query);
	            if(bitsid.equals(newid[i-1])){
	        		out.println(i + ". <a href=\"profile.jsp\">" + fname[i-1] + " " + lname[i-1] + "</a>");
	       		}
	       		else{
	       			if(rs.next()) {
		            	String req = rs.getString("request");
		            	if(req.equals("10"))
		            		out.println(i + ". <a href=\"semi_profile.jsp?newid=" + newid[i-1] + "&accept=199\">" + fname[i-1] + " " + lname[i-1] + "</a>");
		            	if(req.equals("20"))
		            		out.println(i + ". <a href=\"profile.jsp?newid=" + newid[i-1] + "\">" + fname[i-1] + " " + lname[i-1] + "</a>");
		        	}
		        	else {
		        		out.println(i + ". <a href=\"semi_profile.jsp?newid=" + newid[i-1] + "&accept=199\">" + fname[i-1] + " " + lname[i-1] + "</a>");
		        	}
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
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<footer>
        <center><h4> &copy BITS Pilani - Hyderabad, 2018.</h4></center><br>
    </footer>

</body>
</html>