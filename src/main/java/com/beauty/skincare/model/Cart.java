package com.beauty.skincare.model;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.*;

@Entity
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Cart  {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CartItem> items = new ArrayList<>();

    public double getTotalAmount() {
        return items.stream().mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity()).sum();
    }

    public void addItem(Product product, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        CartItem newItem = new CartItem();
        newItem.setProduct(product);
        newItem.setQuantity(quantity);
        newItem.setCart(this);
        items.add(newItem);
    }

    public void removeItem(Product product) {
        items.removeIf(item -> item.getProduct().getId() == product.getId());
    }

    public void clear() {
        items.clear();
    }

    public List<CartItem> getItems() {
        return items;
    }
}
