
package com.knowhere.dao;
import com.knowhere.entity.Category;
import com.knowhere.entity.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
     
    public ArrayList<Category> getCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try {
            String query="select * from Categories";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next()){
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean savePost(Post p){
        boolean b=false;
        try {
            String query="insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setString(1, p.getpTitle());
            pst.setString(2, p.getpContent());
            pst.setString(3, p.getpCode());
            pst.setString(4, p.getpPic());
            pst.setInt(5, p.getCatId());
            pst.setInt(6, p.getUserId());
            pst.executeUpdate();
            b=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    } 
    
    public List<Post> getPosts(){
        List<Post> list=new ArrayList<>();
        try {
            String query="select * from post order by pid desc";
            PreparedStatement pst=con.prepareStatement(query);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pDate=rs.getTimestamp("pDate");
                int catId=rs.getInt("catId");
                int userId=rs.getInt("userId");
                Post p1=new Post(pid,pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(p1);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
     public List<Post> getPostBycatId(int catId){
        List<Post> list=new ArrayList<>();
        try {
            String query="select * from post where catId=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setInt(1, catId);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pDate=rs.getTimestamp("pDate");
                int userId=rs.getInt("userId");
                Post p1=new Post(pid,pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(p1);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     
     
     public Post getPostbyPostId(int postId){
         Post post=null;
         try {
             String query="select * from post where pid=?";
             PreparedStatement pst=con.prepareStatement(query);
             pst.setInt(1, postId);
             ResultSet rs=pst.executeQuery();
             while(rs.next()){
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pDate=rs.getTimestamp("pDate");
                int catId=rs.getInt("catId");
                int userId=rs.getInt("userId");
                post=new Post(pid,pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
                
            }
         } catch (Exception e) {
             e.printStackTrace();
         }
         return post;
     }
}
