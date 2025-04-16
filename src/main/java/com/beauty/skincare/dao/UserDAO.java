/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beauty.skincare.dao;

import com.beauty.skincare.model.User;
import com.beauty.skincare.model.UserRole;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import java.util.List;

/**
 *
 * @author 120123
 */
public class UserDAO {
    
    EntityManager em;

    public UserDAO() {
        em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
    }
    
    public User authenticateUser(String username,String password,String role)
    {
        
        List<User> users=em.createQuery("SELECT u from User u where u.username=:userName AND u.password=:pswd AND u.role=:role",User.class)
                .setParameter("userName", username)
                .setParameter("pswd",password)
                .setParameter("role",UserRole.valueOf(role)).getResultList();
        em.close();
        
        if(users!=null && users.size()>0)
            
            return users.get(0);
        else
            return null;
        
        
    }

    public User createCustomer(String name, String username, String email, String phone, String password) {
          em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
        User user=new User();
        user.setName(name);
        user.setUsername(username);
        user.setContactNumber(phone);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(UserRole.CUSTOMER);
        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();
        
        em.close();
        
            em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
         List<User> list=  em.createQuery("SELECT u from User u where u.username=:usrNm",User.class).setParameter("usrNm", username).getResultList();
            
         if(!list.isEmpty())
             return list.get(0);
         else
             return null;
       
        
    }
    
       
    
    
    
}
