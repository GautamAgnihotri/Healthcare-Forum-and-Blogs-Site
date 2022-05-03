/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to get information of all users
    
    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();

        try {

            String q = "select * from user where uLevel = 'user'";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int id = set.getInt("id");
                String name = set.getString("name");
                String email = set.getString("email");
                String mobileNo = set.getString("mobileNo");
                String gender = set.getString("gender");
                String dob = set.getString("dob");
                User user = new User();
                
                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setMobileNo(mobileNo);
                user.setGender(gender);
                user.setDob(dob);
                list.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //method to insert user to data base:
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into user(name,email,password,mobileNo,gender,dob) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getMobileNo());
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getDob());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by useremail and userpassword:
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from user where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDob(set.getString("dob"));
                user.setMobileNo(set.getString("mobileNo"));
                user.setUserLevel(set.getString("uLevel"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update user set name=? , email=? , password=? ,mobileNo=? ,gender=? ,dob=?  where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getMobileNo());
            p.setString(5, user.getGender());
            p.setString(6, user.getDob());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setMobileNo(set.getString("mobileNo"));
                user.setGender(set.getString("gender"));
                user.setDob(set.getString("dob"));
                user.setUserLevel(set.getString("uLevel"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
