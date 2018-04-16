<!doctype html>

<html lang="en">

    <head>

        <title>Profile</title>
        <meta name="description" content="">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Google Font: Lato -->
        <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

        <!-- FontAwesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Nivo Lightbox-->
        <link rel="stylesheet" href="css/nivo-lightbox.css" />
        <link rel="stylesheet" href="css/default.css" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="css/semi_main.css">
        
        <!-- Themes -->
        <!--<link rel="stylesheet" href="assets/css/themes.light.css">-->
        <link rel="stylesheet" href="css/themes.dark.css">
        
        <!-- Custom CSS -->
        <!--<link rel="stylesheet" href="assets/css/custom.css">-->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- dense.js (Retina plugin) -->
        <script src="js/dense.js"></script>

        <!-- Nivo Lightbox -->
        <script src="js/nivo-lightbox.min.js"></script>

        <!-- ScrollReveal -->
        <script src="js/scrollreveal.min.js"></script>

        <!-- Main JS -->
        <script src="js/main.js"></script>

    </head>
<body>

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
    String newid = "";
    String bitsid = "";
    String fname = "";
    String lname = "";

    try{

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);

        if (session.getAttribute("bitsid") == null || session.getAttribute("bitsid").equals("")){
            String site = new String("/BITS_Connect/BITS-Connect/expired.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }
        else {

            newid = request.getParameter("connectee");
            bitsid = session.getAttribute("bitsid").toString();

            String accept = "UPDATE `connections` SET request = '20' WHERE (first = '"+newid+"' AND second = '"+bitsid+"') OR (first = '"+bitsid+"' AND second = '"+newid+"');";
            stmt = conn.createStatement();
            stmt.executeUpdate(accept);
            stmt.close();

            String query = "SELECT * FROM `personal_details` WHERE bitsid = '" + newid + "';";
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                String fn = rs.getString("first_name");
                String ln = rs.getString("last_name");
                fname = fn;
                lname = ln;
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


        <div class="c-preloader  js-preloader">
            <div class="c-preloader__spinner  t-preloader__spinner"></div>
        </div>

        <div class="c-main-container  js-main-container">

            <!-- ################################ -->
            <!-- ############ HEADER ############ -->
            <!-- ################################ -->

        <!--Edited Code Starts-->
        <nav>
            <ul class="topnav">
                <li><a class="active" href="profile.jsp">BITS | Connect</a></li>
                <!-- <li><a href="#contact">Search</a></li> -->
                <div class="search-container">
                    <form action="search.jsp">
                        <input type="text" placeholder="Search.." name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
                <li class="right"><a href="logout.jsp">Logout</a></li>
                <li class="right"><a href="notifications.jsp">Notifications</a></li> 
            </ul>
        </nav>
        <!--Edited code ends-->

        <% 
            out.println("<br><br><br><h1><center>You have successfully connected with " + fname + " " + lname + "!</center></h1>");
            out.println("<h1><center><a href=\"profile.jsp?newid=" + newid + "\">Click here</a> to view " + fname + "'s complete profile!</center></h1>");
            out.println("<h1><center><a href=\"profile.jsp\">Click here</a> to go back to your profile.</center></h1>");
        %>


        </div><!-- /c-main-container -->
        <br><br><br><br><br><br><br><br><br><br>
        <footer>
            <center><h4> &copy BITS Pilani - Hyderabad, 2018.</h4></center><br>
        </footer>
        
    </body>

</html>