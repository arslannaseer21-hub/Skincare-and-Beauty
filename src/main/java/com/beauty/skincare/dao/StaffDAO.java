/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beauty.skincare.dao;

import com.beauty.skincare.helper.DBResponse;
import com.beauty.skincare.model.User;
import com.beauty.skincare.model.UserRole;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 120123
 */
public class StaffDAO {
    EntityManager em;
    
    public StaffDAO()
    {
        em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
    }
    
    public DBResponse insertStaff(String name, String userName, String password, String email, String phone)
    {
         List<User> users=new ArrayList<>();
          users=em.createQuery("SELECT u FROM User u WHERE u.username=:usrNm",User.class)
                .setParameter("usrNm",userName)
                .getResultList();
         
        if(users!=null && !users.isEmpty())
             return new DBResponse(false, "Error: "+userName+"UserName Already Exist!");
         
        try
        {
        User user=new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setUsername(userName);
        user.setContactNumber(phone);
        user.setRole(UserRole.STAFF);
        
        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();
        
       users=em.createQuery("SELECT u FROM User u WHERE u.username=:usrNm and u.password =:pswd",User.class)
                .setParameter("usrNm",userName)
                .setParameter("pswd",password)
                .getResultList();
        if(users!=null && !users.isEmpty())
            return new DBResponse(true, "Staff Inserted");
        
        else
            return new DBResponse(false, "Error: Staff not Inserted");
        }
        catch(Exception e)
        {
             return new DBResponse(false, e.getMessage());
        }
        
        
    }
    
    public List<User> getAllStaff()
    {
        try
        {
        return em.createQuery("SELECT s from User s where s.role=:role",User.class)
                .setParameter("role",UserRole.STAFF).getResultList();
        }
        catch(Exception e)
        {
            return null;
        }
        
        
    }
}
