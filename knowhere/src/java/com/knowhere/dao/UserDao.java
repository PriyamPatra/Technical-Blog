package com.knowhere.dao;

import com.knowhere.entity.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

//    insert user
    public boolean saveUser(User user) {
        boolean b = false;
        try {
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAbout());
            pst.executeUpdate();
            b = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
//    get users

    public User getUserByEmailandPassword(String email, String password) {
        User user = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String query = "select * from user where email=? and password=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

//    update user details
    public boolean updateUser(User user) {
        boolean b = false;
        try {
            String query = "update user set email=?,about=?,password=?,profile=? where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getEmail());
            pst.setString(2, user.getAbout());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getProfile());
            pst.setInt(5, user.getId());
            pst.executeUpdate();
            b = true;
        } catch (Exception e) {
        }
        return b;
    }

    public User getUserbyuserId(int userId) {
        User user = null;
        try {
            String query = "select * from user where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
