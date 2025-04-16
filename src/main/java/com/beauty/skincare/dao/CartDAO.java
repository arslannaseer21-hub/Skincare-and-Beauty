/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beauty.skincare.dao;

import com.beauty.skincare.model.Cart;
import com.beauty.skincare.model.CartItem;
import com.beauty.skincare.model.Product;
import com.beauty.skincare.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import java.util.List;

/**
 *
 * @author 120123
 */
public class CartDAO {
    
    EntityManager em;
    
    public Cart createUserCart(User u)
    {
        em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
        User user=em.find(User.class,u.getId() );
        Cart cart=new Cart();
        cart.setUser(user);
        em.getTransaction().begin();
        em.persist(cart);
        em.getTransaction().commit();
        em.close();
        return cart;
    }

    public void addItemToCart(Product p, Cart cart,int quantity) {
               em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
               em.getTransaction().begin();
              cart= em.find(Cart.class, cart.getId());
              cart.addItem(p, quantity);
              em.getTransaction().commit();
              em.close();
    }

    public Cart getUserCart(User user) {
        
          em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
          List<Cart> list=em.createQuery("SELECT c from Cart c where c.user.id=:uid",Cart.class).setParameter("uid", user.getId()).getResultList();
          em.close();
          if(!list.isEmpty())
              return list.get(0);
          else
          return createUserCart(user);
              
     
              
     }

    public void updateCart(Cart cart) {
    em = Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
    em.getTransaction().begin();
    cart = em.merge(cart);
    em.getTransaction().commit();
    em.close();
}

    
    
    
}
