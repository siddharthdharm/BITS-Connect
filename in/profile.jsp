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
        <link rel="stylesheet" href="css/main.css">
        
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
    String fname = "";
    String lname = "";
    String email = "";
    String branch = "";
    String campus = "";
    String location = "";
    String gradyear = "";
    String contact = "";
    String path = "";
    String bio = "";
    String interests = "";

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
            String newid = request.getParameter("newid");

            if(newid == null) {
                String query = "(SELECT * FROM `personal_details` WHERE bitsid = '"+bitsid+"');";
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()) {
                    String fn = rs.getString("first_name");
                    String ln = rs.getString("last_name");
                    String em = rs.getString("email");
                    String br = rs.getString("branch");
                    fname = fn;
                    lname = ln;
                    email = em;
                    branch = br;
                }
                stmt.close();

                query = "(SELECT * FROM `profile` WHERE bitsid = '"+bitsid+"');";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);
                while(rs.next()) {
                    String cm = rs.getString("campus");
                    String gy = rs.getString("gradyear");
                    String lo = rs.getString("location");
                    String ct = rs.getString("contact");
                    String pt = rs.getString("dp");
                    String bi = rs.getString("bio");
                    String in = rs.getString("interests");
                    /*String gy = rs.getString("gradyear");*/
                    path = pt;
                    location = lo;
                    contact = ct;
                    campus = cm;
                    gradyear = gy;
                    bio = bi;
                    interests = in;
                }
                stmt.close();
            }
            else {
                String query = "(SELECT * FROM `personal_details` WHERE bitsid = '"+newid+"');";
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()) {
                    String fn = rs.getString("first_name");
                    String ln = rs.getString("last_name");
                    String em = rs.getString("email");
                    String br = rs.getString("branch");
                    fname = fn;
                    lname = ln;
                    email = em;
                    branch = br;
                }
                stmt.close();

                query = "(SELECT * FROM `profile` WHERE bitsid = '"+newid+"');";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);
                while(rs.next()) {
                    String cm = rs.getString("campus");
                    String gy = rs.getString("gradyear");
                    String lo = rs.getString("location");
                    String ct = rs.getString("contact");
                    String pt = rs.getString("dp");
                    String bi = rs.getString("bio");
                    String in = rs.getString("interests");
                    /*String gy = rs.getString("gradyear");*/
                    path = pt;
                    location = lo;
                    contact = ct;
                    campus = cm;
                    gradyear = gy;
                    bio = bi;
                    interests = in;
                }
                stmt.close();
            }
                
        }
        
        path = path.substring(path.lastIndexOf("images"));

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
                <li class="right"><a href="edit.html">Edit Profile</a></li>                
            </ul>
        </nav>
        <!--Edited code ends-->

            <section class="o-section o-section--header  t-section  t-section--header">
                <div class="c-header">

                    <div class="o-section__header-bg  t-section__header"></div>
                    <div class="o-section__content-bg  t-section__content"></div>

                    <div class="o-container">
                        <div class="o-section__container">

                            <header class="o-section__header  c-header__header  t-section__header">
                                <div class="c-header__inner-header">

                                    <div class="c-header__avatar">
                                        <div class="a-header  c-avatar">
                                            <img class="c-avatar__img" src="<% out.println(path); %>" alt="">
                                        </div><!-- /c-avatar -->
                                    </div><!-- /c-header-avatar -->

                                </div><!-- /c-header__inner-header -->
                            </header><!-- /o-section__header -->

                            <div class="o-section__content  c-header__content  t-section__content">
                                <div class="c-header__inner-content">

                                    <div class="c-header__top">

                                        <div class="c-header__brand">

                                            <div class="c-brand">
                                                <h1 class="c-brand__title  t-title">
                                                    <span class="c-brand__sizer">
                                                        <span class="a-header  c-brand__first-word  t-title__second-word">
                                                            <% out.println(fname);%>
                                                        </span>
                                                        <span class="a-header  c-brand__second-word  t-title__second-word">
                                                            <% out.println(lname);%>
                                                        </span>
                                                    </span>
                                                </h1>
                                            </div>

                                        </div>

                                        <!-- <ul class="c-header__social-buttons  c-social-buttons">
                                            <li class="a-header">
                                                <a href="https://www.facebook.com/RuvenThemes/" target="_blank" class="c-social-button  t-social-button">
                                                    <i class="fa  fa-lg  fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="a-header">
                                                <a href="https://dribbble.com/" target="_blank" class="c-social-button  t-social-button">
                                                    <i class="fa  fa-lg  fa-dribbble"></i>
                                                </a>
                                            </li>
                                            <li class="a-header">
                                                <a href="https://twitter.com/_Ruven" target="_blank" class="c-social-button  t-social-button">
                                                    <i class="fa  fa-lg  fa-twitter"></i>
                                                </a>
                                            </li>
                                        </ul> --><!-- /c-header__social-buttons -->

                                    </div><!-- /c-header__top -->

                                    <div class="c-header__contact">

                                        <hr class="a-header  c-header__contact-divider" />

                                        <div class="o-grid">

                                            <div class="o-grid__col-md-3  o-grid__col-sm-6">
                                                <div class="a-header  o-content">
                                                    <div class="o-content__body">
                                                        <h4>Location</h4>
                                                        <address>
                                                            <% out.println(location); %>
                                                        </address>
                                                    </div>
                                                </div><!-- /o-content -->
                                            </div><!-- /o-grid__col -->

                                            <div class="o-grid__col-md-3  o-grid__col-sm-6">
                                                <div class="a-header  o-content">
                                                    <div class="o-content__body">
                                                        <h4>Phone</h4>
                                                        <p>
                                                            <% out.println(contact); %>
                                                        </p>
                                                    </div>
                                                </div><!-- /o-content -->
                                            </div><!-- /o-grid__col -->

                                            <!-- <div class="o-grid__col-md-3  o-grid__col-sm-6">
                                                <div class="a-header  o-content">
                                                    <div class="o-content__body">
                                                        <a href="#" target="_blank" class="t-link-container">
                                                            <h4>Web</h4>
                                                            <p>
                                                                <span class="t-link-container__item--blended">
                                                                    ruventhemes.com
                                                                </span>
                                                            </p>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div> -->

                                            <div class="o-grid__col-md-3  o-grid__col-sm-6">
                                                <div class="a-header  o-content">
                                                    <div class="o-content__body">
                                                        <a href="#" target="_blank" class="t-link-container">
                                                            <h4>Email</h4>
                                                            <p>
                                                                <span class="t-link-container__item--blended">
                                                                    <% out.println(email); %>
                                                                </span>
                                                            </p>
                                                        </a><!-- /o-link-container -->
                                                    </div>
                                                </div><!-- /o-content -->
                                            </div><!-- /o-grid__col -->

                                        </div><!-- /o-grid -->
                                    </div><!-- /c-header__contact -->

                                </div><!-- /c-header__inner-content -->
                            </div><!-- /o-section__content -->

                        </div><!-- /o-section__container -->

                    </div><!-- /o-container -->

                </div><!-- /c-header -->
            </section><!-- /o-section -->



            <!-- ################################ -->
            <!-- ############ INTRO ############# -->
            <!-- ################################ -->
            
            <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Bio
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    What I am all about.
                                </div>
                            </div>
                        </header><!-- /o-section__header -->

                        <div class="o-section__content  t-section__content  ">                        
                            <div class="o-content">
                                <div class="c-intro">
                                    <div class="o-content__body">
                                        <div class="o-media__figure">
                                            <div class="c-number  t-primary-color">
                                                <% out.println(bio); %>
                                            </div><br>
                                            <div class="c-number  t-primary-color">
                                                Campus : <% out.println(campus); %>
                                            </div><br>
                                            <div class="c-number  t-primary-color">
                                                Branch : <% out.println(branch); %> 
                                            </div><br>
                                            <div class="c-number  t-primary-color">
                                                Year of Graduation : <% out.println(gradyear); %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div><!-- /o-section__content -->

                    </div><!-- /o-section__container -->
                </div><!-- /o-container -->

            </section><!-- /o-section -->



            <!-- ################################ -->
            <!-- ########## INTERESTS ########### -->
            <!-- ################################ -->
            
            <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Interests
                                </h2>
                                <!-- <div class="o-content__body  o-section__description">
                                    Batman would be jealous.
                                </div> -->
                            </div>
                        </header><!-- /o-section__header -->

                        <div class="o-section__content  t-section__content  ">
                            
                            <div class="o-grid">

                                <% out.println(interests); %>

                                <!-- <div class="o-grid__col-sm-6">
                                    <div class="o-media  o-media--block  o-content">
                                        <div class="o-media__body  o-content__body">
                                            <h3>Advanced CSS</h3>
                                        </div>
                                    </div>
                                </div>

                                

                                <div class="o-grid__col-sm-6">
                                    <div class="o-media  o-media--block  o-content">
                                        <div class="o-media__body  o-content__body">
                                            <font ><h3>Object-oriented PHP</h3></font>
                                        </div>
                                    </div>
                                </div> -->

                            </div><!-- /o-grid -->

                        </div><!-- /o-section__content -->

                    </div><!-- /o-section__container -->
                </div><!-- /o-container -->

            </section><!-- /o-section -->



            <!-- ################################ -->
            <!-- ############ SKILLS ############ -->
            <!-- ################################ -->
            
            <!-- <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Skills
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Progress bars, anyone?
                                </div>
                            </div>
                        </header>

                        <div class="o-section__content  t-section__content  ">
                            
                            <div class="o-grid">

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    80<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>Photoshop</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="80"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    75<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>Illustrator</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="75"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    70<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>Git</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="70"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    65<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>After Effects</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="65"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    90<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>Sketch</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="90"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    50<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>CSS3 Animation</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="50"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    85<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>PageSpeed Insights</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="85"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <div class="o-content">
                                        <div class="o-media  o-media--block">
                                            <div class="o-media__figure">
                                                <div class="c-number  t-primary-color">
                                                    95<small>%</small>
                                                </div>
                                            </div>
                                            <div class="o-media__body">
                                                <h3>SEO</h3>
                                            </div>
                                        </div>
                                        <div class="c-progress-bar  o-content__body  t-border-color-bg  u-mt-text">
                                            <div class="a-progress-bar  c-progress-bar__filler  t-primary-bg" data-percent="95"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </section> -->



            <!-- ################################ -->
            <!-- ########## EXPERIENCE ########## -->
            <!-- ################################ -->
            
            <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Experience
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Yes. I&#39;ve been around.
                                </div>
                            </div>
                        </header>

                        <div class="o-section__content  t-section__content  u-pb-0">
                            
                            <div class="a-experience-timeline  c-timeline  t-border-color">

                                <div class="c-timeline__item">
                                    <div class="c-timeline__point  t-timeline__point  t-primary-bg"></div>
                                    <div class="o-content">
                                        <div class="o-grid">
                                            <div class="o-grid__col-md-5">
                                                <div class="c-work__timeframe">
                                                    2015 &ndash; Present
                                                </div>
                                                <h3 class="c-work__heading">
                                                    Unicorn Incubator Inc.
                                                </h3>
                                                <h4 class="c-work__title">
                                                    Senior Interface Designer
                                                </h4>
                                                <div class="c-work__location">
                                                    Portland, OR
                                                </div>
                                            </div>
                                            <div class="o-grid__col-md-7">
                                                <p>
                                                    Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aaliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="c-timeline__item">
                                    <div class="c-timeline__point  t-timeline__point  t-primary-bg"></div>
                                    <div class="o-content">
                                        <div class="o-grid">
                                            <div class="o-grid__col-md-5">
                                                <div class="c-work__timeframe">
                                                    2013 &ndash; 2015
                                                </div>
                                                <h3 class="c-work__heading">
                                                    California Design Bureau
                                                </h3>
                                                <h4 class="c-work__title">
                                                    Creative Director
                                                </h4>
                                                <div class="c-work__location">
                                                    Cupertino, CA
                                                </div>
                                            </div>
                                            <div class="o-grid__col-md-7">
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aaliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="c-timeline__item">
                                    <div class="c-timeline__point  t-timeline__point  t-primary-bg"></div>
                                    <div class="o-content">
                                        <div class="o-grid">
                                            <div class="o-grid__col-md-5">
                                                <div class="c-work__timeframe">
                                                    2010 &ndash; 2013
                                                </div>
                                                <h3 class="c-work__heading">
                                                    Dreamland Creative
                                                </h3>
                                                <h4 class="c-work__title">
                                                    Front-end Designer
                                                </h4>
                                                <div class="c-work__location">
                                                    New York, NY
                                                </div>
                                            </div>
                                            <div class="o-grid__col-md-7">
                                                <p>
                                                    Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Phasellus hendrerit. Pellentesque aaliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </section>



            <!-- ################################ -->
            <!-- ########### EDUCATION ########## -->
            <!-- ################################ -->
            
            <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Education
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Lazy isn&#39;t in my vocabulary.
                                </div>
                            </div>
                        </header><!-- /o-section__header -->

                        <div class="o-section__content  t-section__content  u-pt-0">
                            
                            <div class="o-content">
                                <div class="a-education-timeline  c-timeline  t-border-color  o-section__full-top-space">
                                    <div class="c-timeline__end  t-border-color"></div>

                                    <div class="c-timeline__item">
                                        <div class="c-timeline__point  t-timeline__point  t-primary-bg"></div>
                                        <div class="o-content">
                                            <div class="o-grid">
                                                <div class="o-grid__col-md-5">
                                                    <div class="c-work__timeframe">
                                                        2008 &ndash; 2010
                                                    </div>
                                                    <h3 class="c-work__heading">
                                                        Webster Tech University
                                                    </h3>
                                                    <h4 class="c-work__title">
                                                        Master of Computer Science
                                                    </h4>
                                                    <div class="c-work__location">
                                                        Miami, FL
                                                    </div>
                                                </div>
                                                <div class="o-grid__col-md-7">
                                                    <p>
                                                        Consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aaliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh.
                                                    </p>
                                                </div>
                                            </div><!-- /o-grid -->
                                        </div><!-- /o-content -->
                                    </div><!-- /c-timeline__item -->

                                    <div class="c-timeline__item">
                                        <div class="c-timeline__point  t-timeline__point  t-primary-bg"></div>
                                        <div class="o-content">
                                            <div class="o-grid">
                                                <div class="o-grid__col-md-5">
                                                    <div class="c-work__timeframe">
                                                        2003 &ndash; 2008
                                                    </div>
                                                    <h3 class="c-work__heading">
                                                        Ninsei University
                                                    </h3>
                                                    <h4 class="c-work__title">
                                                        Bachelor of Computer Science
                                                    </h4>
                                                    <div class="c-work__location">
                                                        Tokyo, Japan
                                                    </div>
                                                </div>
                                                <div class="o-grid__col-md-7">
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aaliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero.
                                                    </p>
                                                </div>
                                            </div><!-- /o-grid -->
                                        </div><!-- /o-content -->
                                    </div><!-- /c-timeline__item -->

                                    <div class="c-timeline__item">
                                        <div class="c-timeline__point  t-timeline__point  t-primary-bg"></div>
                                        <div class="o-content">
                                            <div class="o-grid">
                                                <div class="o-grid__col-md-5">
                                                    <div class="c-work__timeframe">
                                                        2000 &ndash; 2003
                                                    </div>
                                                    <h3 class="c-work__heading">
                                                        Academy of Fine Arts
                                                    </h3>
                                                    <h4 class="c-work__title">
                                                        Master of Arts
                                                    </h4>
                                                    <div class="c-work__location">
                                                        Berlin, Germany
                                                    </div>
                                                </div>
                                                <div class="o-grid__col-md-7">
                                                    <p>
                                                        Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Phasellus hendrerit. Pellentesque aaliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales.
                                                    </p>
                                                </div>
                                            </div><!-- /o-grid -->
                                        </div><!-- /o-content -->
                                    </div><!-- /c-timeline__item -->

                                </div><!-- /c-timeline -->
                            </div><!-- /o-content -->

                        </div><!-- /o-section__content -->

                    </div><!-- /o-section__container -->
                </div><!-- /o-container -->

            </section><!-- /o-section -->



            <!-- ################################ -->
            <!-- ########### PROFILES ########### -->
            <!-- ################################ -->
            
            <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Profiles
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Busy as usual.
                                </div>
                            </div>
                        </header><!-- /o-section__header -->

                        <div class="o-section__content  t-section__content  ">
                            
                            <div class="o-grid">

                                <div class="o-grid__col-xl-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <a href="http://themeforest.net/user/ruventhemes/portfolio" target="_blank" class="t-link-container">
                                            <div class="o-media  o-media--block">
                                                <div class="o-media__figure">
                                                    <div class="c-profile__icon">
                                                        <i class="fa  fa-lg  fa-envira"></i>
                                                    </div>
                                                </div>
                                                <div class="o-media__body  o-content__body">
                                                    <h3 class="t-link-container__item">
                                                        Themeforest
                                                    </h3>
                                                    <p>
                                                        An overview of the themes and templates that I sell.
                                                    </p>
                                                </div>
                                            </div><!-- /o-media -->
                                        </a><!-- /t-link-container -->
                                    </div><!-- /o-content -->
                                </div><!-- /o-grid__col -->

                                <div class="o-grid__col-xl-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <a href="https://github.com/hatra-e/" target="_blank" class="t-link-container">
                                            <div class="o-media  o-media--block">
                                                <div class="o-media__figure">
                                                    <div class="c-profile__icon">
                                                        <i class="fa  fa-lg  fa-github-alt"></i>
                                                    </div>
                                                </div>
                                                <div class="o-media__body  o-content__body">
                                                    <h3 class="t-link-container__item">
                                                        GitHub
                                                    </h3>
                                                    <p>
                                                        All my open source projects for you analyze.
                                                    </p>
                                                </div>
                                            </div><!-- /o-media -->
                                        </a><!-- /t-link-container -->
                                    </div><!-- /o-content -->
                                </div><!-- /o-grid__col -->

                                <div class="o-grid__col-xl-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <a href="http://wordpress.com" target="_blank" class="t-link-container">
                                            <div class="o-media  o-media--block">
                                                <div class="o-media__figure">
                                                    <div class="c-profile__icon">
                                                        <i class="fa  fa-lg  fa-medium"></i>
                                                    </div>
                                                </div>
                                                <div class="o-media__body  o-content__body">
                                                    <h3 class="t-link-container__item">
                                                        Medium
                                                    </h3>
                                                    <p>
                                                        Yes. I'm also a blogger and here you find my writings.
                                                    </p>
                                                </div>
                                            </div><!-- /o-media -->
                                        </a><!-- /t-link-container -->
                                    </div><!-- /o-content -->
                                </div><!-- /o-grid__col -->

                                <div class="o-grid__col-xl-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <a href="https://dribbble.com" target="_blank" class="t-link-container">
                                            <div class="o-media  o-media--block">
                                                <div class="o-media__figure">
                                                    <div class="c-profile__icon">
                                                        <i class="fa  fa-lg  fa-dribbble"></i>
                                                    </div>
                                                </div>
                                                <div class="o-media__body  o-content__body">
                                                    <h3 class="t-link-container__item">
                                                        Dribbble
                                                    </h3>
                                                    <p>
                                                        Whenever a design is finalized, it lands right here.
                                                    </p>
                                                </div>
                                            </div><!-- /o-media -->
                                        </a><!-- /t-link-container -->
                                    </div><!-- /o-content -->
                                </div><!-- /o-grid__col -->

                                <div class="o-grid__col-xl-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <a href="https://www.flickr.com" target="_blank" class="t-link-container">
                                            <div class="o-media  o-media--block">
                                                <div class="o-media__figure">
                                                    <div class="c-profile__icon">
                                                        <i class="fa  fa-lg  fa-flickr"></i>
                                                    </div>
                                                </div>
                                                <div class="o-media__body  o-content__body">
                                                    <h3 class="t-link-container__item">
                                                        Flickr
                                                    </h3>
                                                    <p>
                                                        A selection of photos I shot throughout the years.
                                                    </p>
                                                </div>
                                            </div><!-- /o-media -->
                                        </a><!-- /t-link-container -->
                                    </div><!-- /o-content -->
                                </div><!-- /o-grid__col -->

                                <div class="o-grid__col-xl-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <a href="http://www.deviantart.com" target="_blank" class="t-link-container">
                                            <div class="o-media  o-media--block">
                                                <div class="o-media__figure">
                                                    <div class="c-profile__icon">
                                                        <i class="fa  fa-lg  fa-deviantart"></i>
                                                    </div>
                                                </div>
                                                <div class="o-media__body  o-content__body">
                                                    <h3 class="t-link-container__item">
                                                        DeviantArt
                                                    </h3>
                                                    <p>
                                                        A place for my sketches and drawings.
                                                    </p>
                                                </div>
                                            </div><!-- /o-media -->
                                        </a><!-- /t-link-container -->
                                    </div><!-- /o-content -->
                                </div><!-- /o-grid__col -->

                            </div><!-- /o-grid -->

                        </div><!-- /o-section__content -->

                    </div><!-- /o-section__container -->
                </div><!-- /o-container -->

            </section><!-- /o-section -->



            <!-- ################################ -->
            <!-- ############ HEADER ############ -->
            <!-- ################################ -->
            
            <!-- <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Awards
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Happy times!
                                </div>
                            </div>
                        </header>

                        <div class="o-section__content  t-section__content  ">
                            
                            <div class="o-grid">

                                <div class="o-grid__col-md-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <hr class="c-deco-line  t-primary-color-line" />
                                        <div class="o-content__body">
                                            <h3>Unicorn Developer Award 2016</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet, justo eget porttitor mauris sit amet felis. Neque id cursus faucibus.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-md-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <hr class="c-deco-line  t-primary-color-line" />
                                        <div class="o-content__body">
                                            <h3>Website of the Year Award 2015</h3>
                                            <p>
                                                Praesent dapibus dolor sit amet, justo eget porttitor mauris sit amet. Neque id cursus faucibus.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="o-grid__col-md-4  o-grid__col-sm-6">
                                    <div class="o-content">
                                        <hr class="c-deco-line  t-primary-color-line" />
                                        <div class="o-content__body">
                                            <h3>1st Place at CSShacker Conference</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet, justo eget porttitor mauris sit amet felis. Neque id cursus faucibus.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </section> -->



            <!-- ################################ -->
            <!-- ########### PORTFOLIO ########## -->
            <!-- ################################ -->
            
            <!-- <section class="o-section  t-section  ">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Portfolio
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Here it gets interesting.
                                </div>
                            </div>
                        </header>

                        <div class="o-section__content  t-section__content  o-section__full-bottom-space">
                            
                            <div class="o-grid  o-grid--gallery">

                                <div class="o-grid__col-sm-6">
                                    <a class="c-image-overlay  t-image-overlay  js-lightbox" href="assets/images/portfolio/1_full.jpg" data-lightbox-hidpi="" title="Musée du Louvre" data-lightbox-gallery="portfolio">
                                        <img src="assets/images/portfolio/1_thumb.jpg" alt="">
                                        <div class="c-image-overlay__content">
                                            <h3>
                                                Musée du Louvre
                                            </h3>
                                            <hr class="c-image-overlay__deco-line  t-image-overlay__deco-line" />
                                            <p>
                                                Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                            </p>
                                        </div>
                                    </a>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <a class="c-image-overlay  t-image-overlay  js-lightbox" href="assets/images/portfolio/2_full.jpg" data-lightbox-hidpi="" title="Tunnel Effect" data-lightbox-gallery="portfolio">
                                        <img src="assets/images/portfolio/2_thumb.jpg" alt="">
                                        <div class="c-image-overlay__content">
                                            <h3>
                                                Tunnel Effect
                                            </h3>
                                            <hr class="c-image-overlay__deco-line  t-image-overlay__deco-line" />
                                            <p>
                                                Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                            </p>
                                        </div>
                                    </a>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <a class="c-image-overlay  t-image-overlay  js-lightbox" href="assets/images/portfolio/3_full.jpg" data-lightbox-hidpi="" title="New York, New York" data-lightbox-gallery="portfolio">
                                        <img src="assets/images/portfolio/3_thumb.jpg" alt="">
                                        <div class="c-image-overlay__content">
                                            <h3>
                                                New York, New York
                                            </h3>
                                            <hr class="c-image-overlay__deco-line  t-image-overlay__deco-line" />
                                            <p>
                                                Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                            </p>
                                        </div>
                                    </a>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <a class="c-image-overlay  t-image-overlay  js-lightbox" href="assets/images/portfolio/4_full.jpg" data-lightbox-hidpi="" title="Sky High" data-lightbox-gallery="portfolio">
                                        <img src="assets/images/portfolio/4_thumb.jpg" alt="">
                                        <div class="c-image-overlay__content">
                                            <h3>
                                                Sky High
                                            </h3>
                                            <hr class="c-image-overlay__deco-line  t-image-overlay__deco-line" />
                                            <p>
                                                Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                            </p>
                                        </div>
                                    </a>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <a class="c-image-overlay  t-image-overlay  js-lightbox" href="assets/images/portfolio/5_full.jpg" data-lightbox-hidpi="" title="The Eiffel Tower" data-lightbox-gallery="portfolio">
                                        <img src="assets/images/portfolio/5_thumb.jpg" alt="">
                                        <div class="c-image-overlay__content">
                                            <h3>
                                                The Eiffel Tower
                                            </h3>
                                            <hr class="c-image-overlay__deco-line  t-image-overlay__deco-line" />
                                            <p>
                                                Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                            </p>
                                        </div>
                                    </a>
                                </div>

                                <div class="o-grid__col-sm-6">
                                    <a class="c-image-overlay  t-image-overlay  js-lightbox" href="assets/images/portfolio/6_full.jpg" data-lightbox-hidpi="" title="Reaching the Clouds" data-lightbox-gallery="portfolio">
                                        <img src="assets/images/portfolio/6_thumb.jpg" alt="">
                                        <div class="c-image-overlay__content">
                                            <h3>
                                                Reaching the Clouds
                                            </h3>
                                            <hr class="c-image-overlay__deco-line  t-image-overlay__deco-line" />
                                            <p>
                                                Fusce lacinia arcu et nulla. Nulla vitae mauris non felis mollis faucibus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                                            </p>
                                        </div>
                                    </a>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </section> -->



            <!-- ################################ -->
            <!-- ############ CLIENTS ########### -->
            <!-- ################################ -->
            
            <!-- <section class="o-section  t-section">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Clients
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Happy people.
                                </div>
                            </div>
                        </header>

                        <div class="o-section__content  t-section__content  ">
                            
                            <ul class="c-clients  o-content">
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/bbc.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/disney.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/github.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/google.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/html5.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/kickstarter.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/youtube.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="http://example.com" target="_blank">
                                        <img src="assets/images/clients/vimeo.png" alt="">
                                    </a>
                                </li>
                            </ul>

                        </div>

                    </div>
                </div>

            </section> -->



            <!-- ################################ -->
            <!-- ############ FOOTER ############ -->
            <!-- ################################ -->
            
            <section class="o-section  t-section  o-section--footer">

                <div class="o-section__header-bg  t-section__header"></div>
                <div class="o-section__content-bg  t-section__content"></div>

                <div class="o-container">
                    <div class="o-section__container">

                        <header class="o-section__header  t-section__header">
                            <div class="o-content">
                                <h2 class="o-section__heading">
                                    Contact
                                </h2>
                                <div class="o-content__body  o-section__description">
                                    Call me, maybe.
                                </div>
                            </div>
                        </header><!-- /o-section__header -->

                        <div class="o-section__content  t-section__content  ">
                            
                                <div class="c-footer__contact">
                                    <div class="o-grid">

                                    <div class="o-grid__col-md-3  o-grid__col-sm-6">
                                        <div class="o-content">
                                            <div class="o-content__body">
                                                <h4>Location</h4>
                                                <address>
                                                    <% out.println(location); %>
                                                </address>
                                            </div>
                                        </div><!-- /o-content -->
                                    </div><!-- /o-grid__col -->

                                    <div class="o-grid__col-md-3  o-grid__col-sm-6">
                                        <div class="o-content">
                                            <div class="o-content__body">
                                                <h4>Phone</h4>
                                                <p>
                                                    <% out.println(contact); %>
                                                </p>
                                            </div>
                                        </div><!-- /o-content -->
                                    </div><!-- /o-grid__col -->

                                    <div class="o-grid__col-md-3  o-grid__col-sm-6">
                                        <div class="o-content">
                                            <div class="o-content__body">
                                                <a href="#" target="_blank" class="t-link-container">
                                                    <h4>Email</h4>
                                                    <p>
                                                        <span class="t-link-container__item--blended">
                                                            <% out.println(email); %>
                                                        </span>
                                                    </p>
                                                </a><!-- /o-link-container -->
                                            </div>
                                        </div><!-- /o-content -->
                                    </div><!-- /o-grid__col -->

                                </div><!-- /o-grid -->
                                </div><!-- /c-footer__contact -->

                                <hr class="c-footer__contact-divider" />

                                <div class="o-content">
                                    <div class="c-footer__bottom">
                                        <div class="c-footer__brand">

                                            <div class="c-brand">
                                                <div class="o-content__body">
                                                    <h1 class="c-brand__title  t-title">
                                                        <span class="c-brand__sizer  c-brand__sizer--sm">
                                                            <span class="a-header  c-brand__first-word  t-title__second-word">
                                                            <% out.println(fname);%>
                                                        </span>
                                                        <span class="a-header  c-brand__second-word  t-title__second-word">
                                                            <% out.println(lname);%>
                                                        </span>
                                                        </span>
                                                    </h1>
                                                </div><!-- /o-content__body -->
                                            </div><!-- /c-brand -->

                                        </div><!-- /c-footer__brand -->

                                        <!-- <ul class="c-footer__social-buttons  c-social-buttons  o-content__body">
                                            <li class="a-footer">
                                                <a href="https://www.facebook.com/RuvenThemes/" target="_blank" class="c-social-button  t-social-button">
                                                    <i class="fa  fa-lg  fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="a-footer">
                                                <a href="https://dribbble.com/" target="_blank" class="c-social-button  t-social-button">
                                                    <i class="fa  fa-lg  fa-dribbble"></i>
                                                </a>
                                            </li>
                                            <li class="a-footer">
                                                <a href="https://twitter.com/_Ruven" target="_blank" class="c-social-button  t-social-button">
                                                    <i class="fa  fa-lg  fa-twitter"></i>
                                                </a>
                                            </li>
                                        </ul> --><!-- /c-footer__social-buttons -->

                                    </div><!-- /c-footer__bottom -->
                                </div><!-- /o-content -->

                        </div><!-- /o-section__content -->

                    </div><!-- /o-section__container -->
                </div><!-- /o-container -->

            </section><!-- /o-section -->



        </div><!-- /c-main-container -->
        
    </body>

</html>