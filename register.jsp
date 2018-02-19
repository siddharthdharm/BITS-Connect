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
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String bitsid = request.getParameter("bitsid");
        String branch = request.getParameter("branch");
        String pwd = request.getParameter("password");

        String insert = "INSERT INTO `personal_details` VALUES ('"+name+"', '"+email+"', '"+bitsid+"', '"+branch+"', '"+pwd+"');";
        stmt = conn.createStatement();
        stmt.executeUpdate(insert);
        stmt.close();

        /*String site = new String("/Mytrah/PCGT/index.html");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);*/
    
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
