
package com.knowhere.dao;
import java.sql.*;
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid,int uid){
        boolean b=false;
        try {
            String query="insert into liked(pid,uid) values(?,?)";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            b=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    
    public int countLikeOnPost(int pid){
        int count=0;
        try {
            String query="select count(*) from liked where pid=?";
            PreparedStatement pst=con.prepareStatement(query);
            pst.setInt(1, pid);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                count=rs.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
        
    }
    
    public boolean isLikedByUser(int pid,int uid){
        boolean b=false;
        try {
            PreparedStatement pst=con.prepareStatement("select * from liked where pid=? and uid=?");
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                b=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    
    
    public boolean deleteLike(int pid,int uid){
        boolean b=false;
        try {
            PreparedStatement pst=con.prepareStatement("delete from liked where pid=? and uid=?");
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            b=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
     
}
