/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beauty.skincare;
import com.beauty.skincare.model.User;
import com.beauty.skincare.model.UserRole;
import jakarta.persistence.*;

/**
 *
 * @author 120123
 */
public class Test {
    public static void main(String args[])
    {
        EntityManager em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
        em.getTransaction().begin();
        User user=new User();
        user.setUsername("abc");
        user.setRole(UserRole.CUSTOMER);
        em.persist(user);
        em.getTransaction().commit();
    }
}
