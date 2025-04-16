package com.beauty.skincare.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.*;

@Entity
@Table(name="product")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Product {
    @Id @GeneratedValue@Column(name="product_id")
    private int id;
    private String name;
    private String description;
    private double price;
    private int stock;
    private String category;
    
      @Lob
    @Column(name = "image", columnDefinition = "LONGBLOB")
    private byte[] image;
    
    @OneToMany(mappedBy="product", cascade=CascadeType.PERSIST)
    List<OrderItem> items;
    
}
