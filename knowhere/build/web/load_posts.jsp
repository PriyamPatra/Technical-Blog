<%@page import="com.knowhere.entity.User"%>
<%@page import="com.knowhere.dao.LikeDao"%>
<%@page import="com.knowhere.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.knowhere.helper.ConnectionProvider"%>
<%@page import="com.knowhere.dao.PostDao"%>
<div class="row">
    <%
        User ur=(User)session.getAttribute("currentUser");
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getPosts();
        } else {
            posts = d.getPostBycatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center text-white'>No Posts Available for Now.</h3>");
        }
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card" >
            <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            <div class="card-body" >
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>
                
            </div>
            <div class="card-footer secondary-background">
                <% 
                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                %>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more</a>
                <a href="#@" onclick="doLike(<%= p.getPid() %>,<%= ur.getId() %>)" 
                   class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
                <a href="#@" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o">20</i></a>
            </div>

        </div>
    </div>

    <%
        }
    %>
</div>