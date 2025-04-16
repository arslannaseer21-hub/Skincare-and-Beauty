/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beauty.skincare.dao;

import com.beauty.skincare.model.Cart;
import com.beauty.skincare.model.CartItem;
import com.beauty.skincare.model.Order;
import com.beauty.skincare.model.OrderItem;
import com.beauty.skincare.model.OrderStatus;
import com.beauty.skincare.model.PaymentMethod;
import com.beauty.skincare.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author 120123
 */
public class OrderDAO {
    EntityManager em;

   

    public void createOrder(User customer, Cart cart, String payment,String address) {
        em=Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
          EntityTransaction tx = em.getTransaction();

      
            tx.begin();

            Order order = new Order();
            order.setCustomer(customer);
            order.setOrderDate(new Date());
            order.setStatus(OrderStatus.PACKAGING); // Default status
            order.setPaymentMethod(PaymentMethod.valueOf(payment)); 
            order.setShippingAddress(address); 
            order.setTotalAmount(cart.getTotalAmount());

            List<OrderItem> orderItems = new ArrayList<>();
            for (CartItem cartItem : cart.getItems()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrder(order);
                orderItem.setProduct(cartItem.getProduct());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(cartItem.getProduct().getPrice());
                orderItems.add(orderItem);
            }

            order.setItems(orderItems);

            em.persist(order);
            
            cart.clear();
            em.merge(cart);

            tx.commit();
        
       
      
            em.close();
        
   }
    
    
    
}
