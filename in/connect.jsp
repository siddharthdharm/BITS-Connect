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
        
        int flag = 0;

        if (session.getAttribute("bitsid") == null || session.getAttribute("bitsid").equals("")){
            String site = new String("/BITS_Connect/BITS-Connect/expired.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }

        else {

            String bitsid = session.getAttribute("bitsid").toString();
            String connectee = request.getParameter("connectee").trim();

            String check = "SELECT * FROM `connections` WHERE first = '" + bitsid + "' AND second = '" + connectee + "';";
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(check);
            while(rs.next()) {
                flag = 10;
            }
                
            stmt.close();

            if(flag != 10){
                String request_connect = "INSERT INTO `connections` VALUES ('"+bitsid+"', '"+connectee+"', '10');";
                stmt = conn.createStatement();
                stmt.executeUpdate(request_connect);
                stmt.close();

                String site = new String("/BITS_Connect/BITS-Connect/in/request_sent.html");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
            else {
                String site = new String("/BITS_Connect/BITS-Connect/in/request_sent.html");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }

                

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