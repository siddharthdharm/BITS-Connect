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
        
        String fname = request.getParameter("fname").trim();
        String lname = request.getParameter("lname").trim();
        String email = request.getParameter("email").trim();
        String bitsid = request.getParameter("bitsid").trim();
        String branch = request.getParameter("branch").trim();
        String pwd = request.getParameter("password").trim();
        int count = 0;
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

        String check = "SELECT * FROM `personal_details` WHERE email = '"+email+"' OR bitsid = '"+bitsid+"';";
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(check);
        while(rs.next()) {
            count++;
        }
        stmt.close();

        if(count > 0)
            out.println("<b>A user with the specified Email/BITSID already exists!!</b>");

        else{

            String insert = "INSERT INTO `personal_details` VALUES ('"+fname+"', '"+lname+"', '"+email+"', '"+bitsid+"', '"+branch+"', '"+pwd+"', '"+timeStamp+"');";
            String insert1 = "INSERT INTO `profile` VALUES ('"+bitsid+"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');";
            stmt = conn.createStatement();
            stmt.executeUpdate(insert);
            stmt.executeUpdate(insert1);
            stmt.close();

            String site = new String("in/initialize.html");
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
            if(conn!=null)
                conn.close();
            }
        catch(SQLException se2){
            se2.printStackTrace();
        }
    }
%>
