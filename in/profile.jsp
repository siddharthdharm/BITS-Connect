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
    String internships = "";
    String skills = "";
    String projects = "";

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
                    fname = fn;
                    lname = ln;
                    email = em;
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
                    String pro = rs.getString("projects");
                    String inter = rs.getString("internships");
                    String ski = rs.getString("skills");
                    String br = rs.getString("branch");
                    path = pt;
                    branch = br;
                    location = lo;
                    contact = ct;
                    campus = cm;
                    gradyear = gy;
                    bio = bi;
                    interests = in;
                    skills = ski;
                    projects = pro;
                    internships = inter;
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
                    fname = fn;
                    lname = ln;
                    email = em;
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
                    String pro = rs.getString("projects");
                    String inter = rs.getString("internships");
                    String ski = rs.getString("skills");
                    String br = rs.getString("branch");
                    path = pt;
                    branch = br;
                    location = lo;
                    contact = ct;
                    campus = cm;
                    gradyear = gy;
                    bio = bi;
                    interests = in;
                    skills = ski;
                    projects = pro;
                    internships = inter;
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
                <div class="search-container">
                    <form action="search.jsp">
                        <input type="text" placeholder="Search.." name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
                <li class="right"><a href="logout.jsp">Logout</a></li>
                <li class="right"><a href="edit.html">Edit Profile</a></li>
                <li class="right"><a href="notifications.jsp">Notifications</a></li>
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

            <footer>
                <center><h4> &copy BITS Pilani - Hyderabad, 2018.</h4></center><br>
            </footer>


        </div><!-- /c-main-container -->
        
    </body>

</html>