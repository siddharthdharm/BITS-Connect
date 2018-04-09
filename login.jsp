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
        
        String bitsid = request.getParameter("bitsid").trim();
        String password = request.getParameter("password").trim();
        

        int count = 0;

        String query = "SELECT * FROM `personal_details` WHERE bitsid = '"+bitsid+"' AND password = '"+password+"';";
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()) {
            count++;
        }
        stmt.close();

        /*String update = "UPDATE `personal_details` SET online = '1' WHERE bitsid = '"+bitsid+"' AND password = '"+password+"';";
        stmt = conn.createStatement();
        stmt.executeUpdate(update);
        stmt.close();*/

        if(count > 0){
            session.setAttribute("bitsid",bitsid);
            String site = new String("in/profile.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }
        
        else {
            
            session.setAttribute("bitsid",bitsid);
            String site = new String("invalid.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

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
            if(conn != null)
                conn.close();
            }
        catch(SQLException se2){
            se2.printStackTrace();
        }
    }
%>
