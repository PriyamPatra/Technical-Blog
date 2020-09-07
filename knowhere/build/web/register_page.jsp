
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
        <!--form-->
        <main class="d-flex align-items-center secondary-background" style="padding: 80px 0">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header secondary-background text-white text-center">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <h3>Sign up here</h3>
                        </div>
                        <div class="card-body">
                            <form id="reg-form"action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <div class="form-group">
                                        <label for="user_name">UserName</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" placeholder=" Enter username">
                                    </div>
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder=" Enter your email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder=" Enter password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender:  </label>
                                    <input type="radio"  id="gender" name="gender" value="male">Male
                                    <input type="radio"  id="gender" name="gender" value="female">Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" rows="4" placeholder="Enter something about yourself"></textarea>
                                </div>

                                
                                <div class="form-group form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1"> I agree to Terms and Conditions</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h3>Please Wait....</h3>
                                    <br>
                                </div>
                                <button id="subm-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        
        
        
        
        
        
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/js.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script>
                $(document).ready(function(){
                    console.log("loaded...");
                    
                    $('#reg-form').on('submit', function (event){
                        event.preventDefault();
                        
                        let form=new FormData(this);
                        $("#subm-btn").hide();
                        $("#loader").show();
                        
                        $.ajax({
                           url:"RegisterServlet",
                           type:'POST',
                           data:form,
                           success:function (data,textStatus,jqXHR){
                               console.log(data)
                                $("#subm-btn").show();
                                $("#loader").hide();
                                
                                if(data.trim()==='Updated'){
                                  swal("Registered Successfully....We are redirecting you to Login page")
                                    .then((value) => {
                                       window.location="login_page.jsp"
                                        });  
                                }else{
                                    swal(data);
                                }
                                
                           },
                           error: function (jqXHR, textStatus, errorThrown) {
                               $("#subm-btn").show();
                               $("#loader").hide();
                               swal("Something went wrong......try again")
                          },
                          processData: false,
                          contentType:false
                        });
                    });
                });    
                    
        </script>     
    </body>
</html>
