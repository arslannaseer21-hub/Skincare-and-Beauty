package com.beauty.skincare.model;

import jakarta.persistence.*;
import java.util.*;

import lombok.*;

@Entity
@Table(name="orders")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Order {
    @Id @GeneratedValue@Column(name="order_id")
    private int id;
    
    @ManyToOne
    @JoinColumn(name="user_id")
    private User customer;

    private Date orderDate;
    private double totalAmount;
    
    private String shippingAddress;
    
    @Enumerated(EnumType.STRING)
    private OrderStatus status; // packaging, shipping, delivery
    
    @Enumerated(EnumType.STRING)
    private PaymentMethod paymentMethod;
    
    @OneToMany(mappedBy="order", cascade=CascadeType.PERSIST)
    private List<OrderItem> items;
}
