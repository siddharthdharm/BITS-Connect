<%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%

   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";                 // JDBC Driver Name //
   final String DB_URL = "jdbc:mysql://localhost:3306/bits_connect";   // URL of your Database //
   final String USER = "root";                                         // Database credentials //
   final String PASS = "";
   Connection conn = null;
   Statement stmt = null;

   File file;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");
   String newPath;
   String fileName = "";


   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("/Users/siddharthdharm/tomcat/webapps/ROOT/BITS_Connect/BITS-Connect/in/"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );

      if (session.getAttribute("bitsid") == null || session.getAttribute("bitsid").equals("")){
            String site = new String("/BITS_Connect/BITS-Connect/expired.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
      }

      else {

         String bitsid = session.getAttribute("bitsid").toString();
         String ext = "";
      
         try { 
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            while (i.hasNext()) {
               FileItem fi = (FileItem)i.next();
               if (!fi.isFormField()) {
                  
                  String fieldName = fi.getFieldName();
                  fileName = fi.getName();
                  boolean isInMemory = fi.isInMemory();
                  long sizeInBytes = fi.getSize();
               
                  // Write the file

                  if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
                     ext = fileName.substring(fileName.lastIndexOf(".")+1);
                  else 
                     ext = "";
               
                  file = new File(filePath + bitsid + "." + ext);
                  
                  fi.write(file);
               }
            }

            // Uploading to database
            
            try{

               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection(DB_URL,USER,PASS);

               newPath = filePath + bitsid + "." + ext;
               String insert = "UPDATE `profile` SET dp = '"+newPath+"' WHERE bitsid = '"+bitsid+"';";

               stmt = conn.createStatement();
               stmt.executeUpdate(insert);
               stmt.close();

               String site = new String("/BITS_Connect/BITS-Connect/in/edit.html");
               response.setStatus(response.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site);

               conn.close();

            }catch(SQLException se){
               se.printStackTrace();           //Handles errors for JDBC
            }catch(Exception e){
               e.printStackTrace();            //Handles errors for Class.forName
            }

            finally{                           //finally block used to close resources
               try{
                  if(stmt != null)
                     stmt.close();
               }catch(SQLException se1){
                  se1.printStackTrace();
               }
       
               try{
                  if(conn != null)
                     conn.close();
               }catch(SQLException se2){
                  se2.printStackTrace();
               }
            }
         }catch(Exception ex) {
            System.out.println(ex);
         }
      }
   } else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>