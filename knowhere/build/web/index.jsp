
<%@page import="com.knowhere.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--css-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--fontawesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
              clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 71% 97%, 30% 100%, 0 97%, 0 0);
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar.jsp" %>

        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron secondary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to knowhere</h3>
                    <p>A place where tech-genious share their knowledge and can learn from other tech-genous also.</p>
                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-toggle-right  "></span> Start Exploring</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
                </div>
            </div>
        </div>
        
        <!--card-->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" >
                       
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">One of the most widely used programming languages, Java is used as the server-side language for most back-end development projects, including those involving big data and Android development.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                       
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Python is a general-purpose coding language—which means that, unlike HTML, CSS, and JavaScript, it can be used for other types of programming and software development besides web development.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                       
                        <div class="card-body">
                            <h5 class="card-title">UI Technology</h5>
                            <p class="card-text">User interface (UI) developers combine programming, psychology and creative design to craft intuitive controls for software and hardware. The UI developer's mission is to create an interface</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" >
                       
                        <div class="card-body">
                            <h5 class="card-title">Web Development</h5>
                            <p class="card-text">Here are the most common languages and how they are used: HTML. HTML makes up the layout and structure for your website. CSS. CSS is the language developers can use to style a website. Java.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                       
                        <div class="card-body">
                            <h5 class="card-title">Data Structure & Algorithms</h5>
                            <p class="card-text">An algorithm is a set of steps used for accomplishing a task, while a data structure is something used to store data, the manipulation of said data is done with algorithms.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
                       
                        <div class="card-body">
                            <h5 class="card-title">Interview Questions</h5>
                            <p class="card-text">public static void main(String args[]) in Java. Q3. Why Java is platform independent? Q4. Why Java is not 100% Object-oriented? Q5. What are wrapper classes in Java? Q6.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>





        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/js.js" type="text/javascript"></script>
    </body>
</html>
