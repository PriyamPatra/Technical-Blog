<%@page import="java.util.ArrayList"%>
<%@page import="com.knowhere.entity.Category"%>
<%@page import="com.knowhere.helper.ConnectionProvider"%>
<%@page import="com.knowhere.dao.PostDao"%>
<%@page import="com.knowhere.entity.Message"%>
<%@page import="com.knowhere.entity.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
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
            body{
                background: url(img/profile-background.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-toggle-on"></span> knowhere</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="	fa fa-street-view"></span> Priyam <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-sort"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Projects </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">DSA</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="#"> <span class="fa fa-address-card-o" ></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-edit" ></span> Do Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span>  <%= user.getName()%>  </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--navbar end-->
        <!--message-->
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {

        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }

        %>
        <!--message end-->

        <!--main body of page-->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                Posts
                            </a>
                            <%       
                                PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = pd.getCategories();
                                for (Category c1 : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= c1.getCid()%>,this)" class="c-link list-group-item list-group-item-action"><%= c1.getName()%></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="container text-center" id="loader">
                            <span class="fa fa-refresh fa-4x fa-spin"></span>
                            <h3 class="mt-2">Loading..</h3>
                        </div>
                        <div class="container-fluid"  id="post-container" >

                        </div>

                    </div>
                </div>
            </div>
        </main>
        <!--main body of page end-->

        <!--profile modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">knowhere</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%;width: 150px">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                            <!--profile details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>   
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender().toUpperCase()%></td>   
                                        </tr>
                                        <tr>
                                            <th scope="row">About</th>
                                            <td><%= user.getAbout()%></td>   
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%= user.getDateTime().toString()%></td>   
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->         
                            <div id="profile-edit" style="display: none">
                                <h3 class="mt-2">Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID:</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td>About:</td>
                                            <td>
                                                <textarea rows="4" class="form-control" name="about" > <%= user.getAbout()%> </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td>Change profile:</td>
                                            <td><input type="file" name="profilepic" class="form-control" ></td>
                                        </tr>

                                    </table>
                                    <div  class="container">
                                        <button type="submit" class="btn btn-secondary text-white">Save</button>
                                    </div>

                                </form>

                            </div>

                        </div>
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--profile modal end-->

        <!--add post modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-primary" id="exampleModalLabel">Make your Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="addpostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select your category---</option>
                                    <%
                                        PostDao pdao = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = pdao.getCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <% }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter your post title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px" placeholder="Enter your program(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Choose your pic:</label>
                                <input name="pic" type="file" class="form-control">
                            </div>
                            <div class="form-group">

                            </div>
                            <div class="container text-center" >
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!--add post modal end-->





        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/js.js" type="text/javascript"></script>

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function () {
                                        if (editStatus == false) {
                                            $('#profile-details').hide()
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else {
                                            $('#profile-details').show()
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit")
                                        }
                                    })
                                });
        </script>

        <!--add-post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $.ajax({
                        url: "addpostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            if (data.trim() == "success") {
                                swal("Good job!", "saved successfully", "success");

                            } else {
                                swal("Error!", "data not saved", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "data not saved", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })

            })
        </script>
        <!--add post js end-->

        <!--load post ajax-->
        <script>

            function getPosts(catId,temp) {
                $("#loader").show();
                $('#post-container').hide();
                $(".c-link").removeClass('active')
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        $("#loader").hide();
                        $('#post-container').show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            }

            $(document).ready(function (e) {
                let allpostRef=$('.c-link')[0]
                getPosts(0,allpostRef)
            })
        </script>


        <!--load post ajax end-->



    </body>
</html>
