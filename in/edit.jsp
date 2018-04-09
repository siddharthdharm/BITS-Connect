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
            String site = new String("/BITS_Connect/BITS-Connect/expired.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }

        else {

            String bitsid = session.getAttribute("bitsid").toString();

            String branch = request.getParameter("branch").trim();
            String bio = request.getParameter("bio").trim();
            String interests = request.getParameter("interests").trim();
            String campus = request.getParameter("campus").trim();
            String gradyear = request.getParameter("gradyear").trim();
            String location = request.getParameter("location").trim();
            String contact = request.getParameter("contact").trim();
            String past_projects = request.getParameter("pastprojects").trim();
            String on_projects = request.getParameter("onprojects").trim();
            String internships = request.getParameter("internships").trim();
            String clubs = request.getParameter("clubs").trim(); 
            String linkedin = request.getParameter("linkedin").trim();

            String insert = "UPDATE `profile` SET branch = '"+branch+"', bio = '"+bio+"', on_projects = '"+on_projects+"', past_projects = '"+past_projects+"', gradyear = '"+gradyear+"', location = '"+location+"', internships = '"+internships+"', clubs = '"+clubs+"', linkedin = '"+linkedin+"', contact = '"+contact+"', interests = '"+interests+"', campus = '"+campus+"' WHERE bitsid = '"+bitsid+"';";

            stmt = conn.createStatement();
            stmt.executeUpdate(insert);
            stmt.close();


            String site = new String("/BITS_Connect/BITS-Connect/in/success.html");
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